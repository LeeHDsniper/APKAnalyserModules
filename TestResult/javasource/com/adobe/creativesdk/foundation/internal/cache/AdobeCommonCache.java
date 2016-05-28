package com.adobe.creativesdk.foundation.internal.cache;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Handler;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.notification.AdobeInternalNotificationID;
import com.adobe.creativesdk.foundation.internal.notification.AdobeLocalNotificationCenter;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Observable;
import java.util.Observer;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.io.FileUtils;

public class AdobeCommonCache
{
  private static final Integer CACHE_VERSION = Integer.valueOf(8);
  private static Context context;
  private static volatile AdobeCommonCache instance;
  private Pattern cacheDirPattern = Pattern.compile("^[a-zA-Z0-9]{33}$");
  HashMap<String, AdobeCommonCacheInstance> cacheInstances = new HashMap();
  private int currentCacheVerion;
  private ExecutorService executorService;
  private final String rootCacheDir;
  private int scrubAge;
  private int scrubPeriod;
  private ScheduledFuture<?> scrubbingFuture;
  private ScheduledExecutorService scrubbingTimer;
  private SharedPreferences sharedPreferences;
  private boolean verboseLogging;
  
  private AdobeCommonCache()
  {
    context = AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext();
    rootCacheDir = context.getCacheDir().getAbsolutePath();
    sharedPreferences = context.getSharedPreferences("Foundation", 0);
    currentCacheVerion = sharedPreferences.getInt("CCCache.version", -1);
    if (currentCacheVerion != CACHE_VERSION.intValue())
    {
      removeAllCaches();
      SharedPreferences.Editor localEditor = sharedPreferences.edit();
      localEditor.putInt("CCCache.version", CACHE_VERSION.intValue());
      localEditor.commit();
    }
    scrubAge = 86400000;
    scrubPeriod = 1800000;
    removeDiskCachesOlderThan(scrubAge);
    startScrubbingTimer();
    executorService = Executors.newCachedThreadPool();
    AdobeLocalNotificationCenter.getDefaultNotificationCenter().addObserver(AdobeInternalNotificationID.AdobeAuthLogoutNotification, new Observer()
    {
      public void update(Observable paramAnonymousObservable, Object paramAnonymousObject)
      {
        clearAllCaches();
      }
    });
  }
  
  private boolean getAvailabilityMode(EnumSet<AdobeCommonCachePolicies> paramEnumSet)
  {
    return paramEnumSet.contains(AdobeCommonCachePolicies.AdobeCommonCacheAllowOfflineUse);
  }
  
  private AdobeCommonCachePolicies getEvictionPolicy(EnumSet<AdobeCommonCachePolicies> paramEnumSet)
  {
    if (paramEnumSet.contains(AdobeCommonCachePolicies.AdobeCommonCacheEvictionLSF)) {
      return AdobeCommonCachePolicies.AdobeCommonCacheEvictionLSF;
    }
    if (paramEnumSet.contains(AdobeCommonCachePolicies.AdobeCommonCacheEvictionLRU)) {
      return AdobeCommonCachePolicies.AdobeCommonCacheEvictionLRU;
    }
    if (paramEnumSet.contains(AdobeCommonCachePolicies.AdobeCommonCacheEvictionFIFO)) {
      return AdobeCommonCachePolicies.AdobeCommonCacheEvictionFIFO;
    }
    return AdobeCommonCachePolicies.AdobeCommonCachePolicyUnset;
  }
  
  private <T> boolean getFromGUID(String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet, String paramString3, AdobeCommonCacheHandler<T> paramAdobeCommonCacheHandler, Handler paramHandler)
  {
    paramString3 = (AdobeCommonCacheInstance)cacheInstances.get(paramString3);
    if (paramString3 != null)
    {
      paramString3.getObjectFromGUID(paramString1, paramString2, paramEnumSet, paramAdobeCommonCacheHandler, paramHandler);
      return true;
    }
    return false;
  }
  
  public static AdobeCommonCache getSharedInstance()
    throws AdobeInvalidCacheSettingsException
  {
    if (instance == null) {}
    try
    {
      if (instance == null) {
        instance = new AdobeCommonCache();
      }
      return instance;
    }
    finally {}
  }
  
  private void removeDiskCachesOlderThan(int paramInt)
  {
    Object localObject = new File(rootCacheDir);
    if (((File)localObject).exists())
    {
      localObject = ((File)localObject).listFiles(new FileFilter()
      {
        public boolean accept(File paramAnonymousFile)
        {
          return !paramAnonymousFile.isHidden();
        }
      });
      if (localObject == null) {
        AdobeLogger.log(Level.ERROR, AdobeCommonCache.class.getName(), "Failed to access disk cache root directory at " + rootCacheDir);
      }
    }
    else
    {
      return;
    }
    if ((localObject.length == 0) && (verboseLogging)) {
      AdobeLogger.log(Level.INFO, AdobeCommonCache.class.getName(), "Cache is Empty. Nothing to scrub");
    }
    freezeAllCaches(true);
    int j = localObject.length;
    int i = 0;
    for (;;)
    {
      if (i < j)
      {
        File localFile = localObject[i];
        String str = localFile.getName().toLowerCase();
        if ((cacheDirPattern.matcher(str).matches()) && (str.charAt(32) == '7') && (new Date().getTime() - localFile.lastModified() > paramInt)) {}
        try
        {
          FileUtils.deleteDirectory(localFile);
          if (verboseLogging) {
            AdobeLogger.log(Level.INFO, AdobeCommonCache.class.getName(), "Deleting disk cache at " + localFile.getAbsolutePath());
          }
          i += 1;
        }
        catch (IOException localIOException)
        {
          for (;;)
          {
            AdobeLogger.log(Level.ERROR, AdobeCommonCache.class.getName(), "Error delecting disk cache during scrubbing : " + localFile.getAbsolutePath(), localIOException);
          }
        }
      }
    }
    freezeAllCaches(false);
  }
  
  private void startScrubbingTimer()
  {
    stopScrubbingTimer();
    if (scrubbingTimer == null) {
      scrubbingTimer = Executors.newSingleThreadScheduledExecutor();
    }
    Runnable local1 = new Runnable()
    {
      public void run()
      {
        if (verboseLogging) {
          AdobeLogger.log(Level.INFO, AdobeCommonCache.class.getName(), "***** Async cache scrubbing event at " + SimpleDateFormat.getInstance().format(new Date()));
        }
        AdobeCommonCache.this.removeDiskCachesOlderThan(scrubAge);
      }
    };
    scrubbingFuture = scrubbingTimer.scheduleAtFixedRate(local1, 0L, scrubPeriod, TimeUnit.MILLISECONDS);
  }
  
  private void stopScrubbingTimer()
  {
    stopScrubbingTimer(false);
  }
  
  private void stopScrubbingTimer(boolean paramBoolean)
  {
    if (scrubbingFuture != null) {
      scrubbingFuture.cancel(paramBoolean);
    }
  }
  
  public boolean addData(byte[] paramArrayOfByte, String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet, String paramString3)
  {
    return addObject(paramArrayOfByte, paramString1, paramString2, paramEnumSet, paramString3);
  }
  
  public boolean addDictionary(Map paramMap, String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet, String paramString3)
  {
    return addObject(paramMap, paramString1, paramString2, paramEnumSet, paramString3);
  }
  
  public boolean addObject(Object paramObject, String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet, String paramString3)
  {
    if (!(paramObject instanceof Serializable)) {
      AdobeLogger.log(Level.INFO, AdobeCommonCache.class.getName(), "Object is not serializable. Not adding " + paramString2 + " to cache.");
    }
    do
    {
      return false;
      paramString3 = (AdobeCommonCacheInstance)cacheInstances.get(paramString3);
    } while (paramString3 == null);
    paramString3.addObject(paramObject, paramString1, paramString2, paramEnumSet);
    return true;
  }
  
  public void clearAllCaches()
  {
    Iterator localIterator = cacheInstances.entrySet().iterator();
    while (localIterator.hasNext()) {
      ((AdobeCommonCacheInstance)((Map.Entry)localIterator.next()).getValue()).clear();
    }
  }
  
  public void configureCache(String paramString, int paramInt, double paramDouble, EnumSet<AdobeCommonCachePolicies> paramEnumSet)
    throws AdobeInvalidCacheSettingsException
  {
    if ((paramString == null) || (paramString.isEmpty())) {
      throw new AdobeInvalidCacheSettingsException("Invalid cache name.");
    }
    if ((paramEnumSet.contains(AdobeCommonCachePolicies.AdobeCommonCachePolicyUnset)) && (paramEnumSet.size() == 1)) {
      throw new AdobeInvalidCacheSettingsException("Invalid cache policy.");
    }
    AdobeCommonCachePolicies localAdobeCommonCachePolicies = getEvictionPolicy(paramEnumSet);
    boolean bool = getAvailabilityMode(paramEnumSet);
    Object localObject;
    if (!bool)
    {
      localObject = AdobeAuthIdentityManagementService.getSharedInstance().getAdobeID();
      if (localObject != null)
      {
        paramEnumSet = (EnumSet<AdobeCommonCachePolicies>)localObject;
        if (!((String)localObject).isEmpty()) {}
      }
      else
      {
        throw new AdobeInvalidCacheSettingsException("Cannot configure cache before logging in");
      }
    }
    else
    {
      paramEnumSet = "000000000000000000000000@AdobeID";
    }
    if (paramInt < 0) {
      throw new AdobeInvalidCacheSettingsException("Illegal memCacheSize value " + paramInt);
    }
    int i = paramInt;
    if (paramInt > 200)
    {
      AdobeLogger.log(Level.WARN, AdobeCommonCache.class.getName(), "memCacheSize: %" + paramInt / 1048576 + " MB exceeds maximum value.  Setting to " + 0 + " MB.");
      i = 200;
    }
    if (paramDouble < 0.0D) {
      throw new AdobeInvalidCacheSettingsException("Illegal diskCacheSize value: " + paramDouble);
    }
    double d = paramDouble;
    if (paramDouble > 2.68435456E8D)
    {
      AdobeLogger.log(Level.WARN, AdobeCommonCache.class.getName(), "diskCacheSize: " + paramDouble / 1048576.0D + "MB exceeds maximum value.  Setting to " + 256.0D + "MB.");
      d = 2.68435456E8D;
    }
    AdobeCommonCacheInstance localAdobeCommonCacheInstance = (AdobeCommonCacheInstance)cacheInstances.get(paramString);
    if (localAdobeCommonCacheInstance == null)
    {
      localObject = new AdobeCommonCacheInstance(executorService);
      cacheInstances.put(paramString, localObject);
    }
    do
    {
      ((AdobeCommonCacheInstance)localObject).configureCache(paramString, paramEnumSet, rootCacheDir, i, d, localAdobeCommonCachePolicies, bool);
      return;
      localObject = localAdobeCommonCacheInstance;
    } while (paramEnumSet.equals(localAdobeCommonCacheInstance.getCacheAdobeId()));
    throw new AdobeInvalidCacheSettingsException("Attempt to reconfigure cache " + paramString + " with different AdobeID: " + paramEnumSet + " vs " + localAdobeCommonCacheInstance.getCacheAdobeId());
  }
  
  public boolean containsItem(String paramString1, String paramString2, String paramString3)
  {
    paramString3 = (AdobeCommonCacheInstance)cacheInstances.get(paramString3);
    if (paramString3 != null) {
      return paramString3.containsItemWithGUID(paramString1, paramString2);
    }
    return false;
  }
  
  public boolean doesCacheExist(String paramString)
  {
    return cacheInstances.containsKey(paramString);
  }
  
  public void freezeAllCaches(boolean paramBoolean)
  {
    Iterator localIterator = cacheInstances.entrySet().iterator();
    while (localIterator.hasNext()) {
      ((AdobeCommonCacheInstance)((Map.Entry)localIterator.next()).getValue()).freezeCache(paramBoolean);
    }
  }
  
  public <T> T getDataFromGUID(String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet, String paramString3)
  {
    paramString3 = (AdobeCommonCacheInstance)cacheInstances.get(paramString3);
    if (paramString3 != null) {
      return paramString3.getObjectFromGUID(paramString1, paramString2, paramEnumSet);
    }
    return null;
  }
  
  public boolean getDataFromGUID(String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet, String paramString3, AdobeCommonCacheHandler<byte[]> paramAdobeCommonCacheHandler, Handler paramHandler)
  {
    return getFromGUID(paramString1, paramString2, paramEnumSet, paramString3, paramAdobeCommonCacheHandler, paramHandler);
  }
  
  public boolean getDictionaryFromGUID(String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet, String paramString3, AdobeCommonCacheHandler<Map<String, Object>> paramAdobeCommonCacheHandler, Handler paramHandler)
  {
    return getFromGUID(paramString1, paramString2, paramEnumSet, paramString3, paramAdobeCommonCacheHandler, paramHandler);
  }
  
  public boolean getObjectFromGUID(String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet, String paramString3, AdobeCommonCacheHandler<Object> paramAdobeCommonCacheHandler, Handler paramHandler)
  {
    return getFromGUID(paramString1, paramString2, paramEnumSet, paramString3, paramAdobeCommonCacheHandler, paramHandler);
  }
  
  public Date getTimestampForGUID(String paramString1, String paramString2, String paramString3)
  {
    Object localObject = null;
    if (cacheInstances != null) {
      synchronized (cacheInstances)
      {
        AdobeCommonCacheInstance localAdobeCommonCacheInstance = (AdobeCommonCacheInstance)cacheInstances.get(paramString3);
        paramString3 = localObject;
        if (localAdobeCommonCacheInstance != null) {
          paramString3 = localAdobeCommonCacheInstance.getTimestampForGUID(paramString1, paramString2);
        }
        return paramString3;
      }
    }
    return null;
  }
  
  public void printStatistics(String paramString)
  {
    paramString = (AdobeCommonCacheInstance)cacheInstances.get(paramString);
    if (paramString != null) {
      paramString.printStatistics();
    }
  }
  
  public void removeAllCaches()
  {
    Object localObject = new File(rootCacheDir);
    if (((File)localObject).exists()) {
      try
      {
        FileUtils.deleteDirectory((File)localObject);
        localObject = cacheInstances.keySet().iterator();
        while (((Iterator)localObject).hasNext())
        {
          String str = (String)((Iterator)localObject).next();
          ((AdobeCommonCacheInstance)cacheInstances.get(str)).clear();
        }
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          AdobeLogger.log(Level.ERROR, AdobeCommonCache.class.getName(), "Error removing cache", localIOException);
        }
        cacheInstances.clear();
      }
    }
  }
  
  public boolean removeCache(String paramString)
  {
    AdobeCommonCacheInstance localAdobeCommonCacheInstance = (AdobeCommonCacheInstance)cacheInstances.get(paramString);
    if (localAdobeCommonCacheInstance != null)
    {
      localAdobeCommonCacheInstance.clear();
      cacheInstances.remove(paramString);
      return true;
    }
    return false;
  }
  
  public boolean removeItemWithGUID(String paramString1, String paramString2, String paramString3)
  {
    paramString3 = (AdobeCommonCacheInstance)cacheInstances.get(paramString3);
    if (paramString3 != null)
    {
      paramString3.removeItemWithGUID(paramString1, paramString2);
      return true;
    }
    return false;
  }
  
  public boolean removeSetWithGUID(String paramString1, String paramString2)
  {
    paramString2 = (AdobeCommonCacheInstance)cacheInstances.get(paramString2);
    if (paramString2 != null)
    {
      paramString2.removeSetWithGUID(paramString1);
      return true;
    }
    return false;
  }
}
