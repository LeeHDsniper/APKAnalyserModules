package com.adobe.creativesdk.foundation.internal.cache;

import android.os.Handler;
import com.adobe.creativesdk.foundation.internal.utils.Util;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.ReadLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.WriteLock;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.TrueFileFilter;

public class AdobeCommonCacheInstance
{
  private final int AdobeCommonCacheCriticalCount = 10;
  private final int AdobeCommonCacheNormalCount = 3;
  private String cacheAdobeId;
  private String cacheDir;
  private boolean cacheFrozen;
  private int cacheMisses;
  private String cacheName;
  private long currentDiskCacheSize = 0L;
  private final Comparator<Date> dateComparator = new Comparator()
  {
    public int compare(Date paramAnonymousDate1, Date paramAnonymousDate2)
    {
      return (int)(paramAnonymousDate1.getTime() - paramAnonymousDate2.getTime());
    }
  };
  private final Map<String, Long> diskCacheAccessTimes = new ConcurrentHashMap();
  private final Map<String, Long> diskCacheCreateTimes = new ConcurrentHashMap();
  private int diskCacheHits;
  private final Map<String, Long> diskCacheObjectSizes = new ConcurrentHashMap();
  private double diskCacheSize;
  private final ReentrantReadWriteLock diskReadWriteLock = new ReentrantReadWriteLock();
  private AdobeCommonCachePolicies evictionPolicy;
  private final ExecutorService executorService;
  private final Comparator<Map.Entry<String, Long>> lruComparator = new Comparator()
  {
    public int compare(Map.Entry<String, Long> paramAnonymousEntry1, Map.Entry<String, Long> paramAnonymousEntry2)
    {
      return ((Long)paramAnonymousEntry1.getValue()).compareTo((Long)paramAnonymousEntry2.getValue());
    }
  };
  private AdobeMemCache memCache;
  private int memCacheHits;
  private double memCacheSize;
  private final Comparator<Map.Entry<String, Long>> numberComparator = new Comparator()
  {
    public int compare(Map.Entry<String, Long> paramAnonymousEntry1, Map.Entry<String, Long> paramAnonymousEntry2)
    {
      return ((Long)paramAnonymousEntry2.getValue()).compareTo((Long)paramAnonymousEntry1.getValue());
    }
  };
  private ScheduledFuture<?> repeatingTimer;
  private final ScheduledExecutorService scheduledExecutorService = Executors.newSingleThreadScheduledExecutor();
  private boolean useDiskCaching = true;
  private final boolean verboseDebugging = true;
  
  static
  {
    if (!AdobeCommonCacheInstance.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  AdobeCommonCacheInstance(ExecutorService paramExecutorService)
  {
    executorService = paramExecutorService;
  }
  
  private void addEntryToCacheMetadata(File paramFile, String paramString)
  {
    long l1 = paramFile.lastModified();
    long l2 = paramFile.lastModified();
    long l3 = paramFile.length();
    if (!diskCacheObjectSizes.containsKey(paramString)) {
      currentDiskCacheSize += l3;
    }
    diskCacheAccessTimes.put(paramString, Long.valueOf(l2));
    diskCacheCreateTimes.put(paramString, Long.valueOf(l1));
    diskCacheObjectSizes.put(paramString, Long.valueOf(l3));
    if ((!cacheFrozen) && (currentDiskCacheSize > getNormalEvictionThreshold()))
    {
      cacheLog("Sync eviction event at " + SimpleDateFormat.getInstance().format(new Date()));
      cacheEviction();
      if (repeatingTimer == null) {
        startRepeatingTimer();
      }
    }
  }
  
  private void cacheEviction()
  {
    Integer localInteger;
    label98:
    long l;
    if (currentDiskCacheSize > getCriticalEvictionThreshold())
    {
      localObject = AdobeCommonCacheEvictionType.AdobeCommonCacheCriticalEviction;
      localInteger = Integer.valueOf(getCriticalEvictionThreshold());
      cacheLog(String.format("%s eviction: %d > %d", new Object[] { ((AdobeCommonCacheEvictionType)localObject).toString(), Long.valueOf(currentDiskCacheSize), localInteger }));
      switch (11.$SwitchMap$com$adobe$creativesdk$foundation$internal$cache$AdobeCommonCachePolicies[evictionPolicy.ordinal()])
      {
      default: 
        lruEviction((AdobeCommonCacheEvictionType)localObject);
        currentDiskCacheSize = getCurrentDiskCacheSize();
        l = currentDiskCacheSize;
        if (currentDiskCacheSize <= localInteger.intValue()) {
          break;
        }
      }
    }
    for (Object localObject = "UNORDERED";; localObject = "in order")
    {
      cacheLog(String.format("After eviction: %d - %d are %s", new Object[] { Long.valueOf(l), localInteger, localObject }));
      return;
      localObject = AdobeCommonCacheEvictionType.AdobeCommonCacheNormalEviction;
      localInteger = Integer.valueOf(getNormalEvictionThreshold());
      break;
      largeObjectFirstEviction((AdobeCommonCacheEvictionType)localObject);
      break label98;
    }
  }
  
  private void cacheLog(String paramString)
  {
    AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), paramString);
  }
  
  private <T> void callHitHandler(final AdobeCommonCacheHandler<T> paramAdobeCommonCacheHandler, Handler paramHandler, final T paramT, final AdobeCommonCacheHitLocation paramAdobeCommonCacheHitLocation)
  {
    if (paramHandler != null)
    {
      paramHandler.post(new Runnable()
      {
        public void run()
        {
          paramAdobeCommonCacheHandler.onHit(paramT, paramAdobeCommonCacheHitLocation);
        }
      });
      return;
    }
    new Thread(new Runnable()
    {
      public void run()
      {
        paramAdobeCommonCacheHandler.onHit(paramT, paramAdobeCommonCacheHitLocation);
      }
    }).start();
  }
  
  private void callMissHandler(final AdobeCommonCacheHandler paramAdobeCommonCacheHandler, Handler paramHandler)
  {
    cacheMisses += 1;
    paramAdobeCommonCacheHandler = new Runnable()
    {
      public void run()
      {
        if (paramAdobeCommonCacheHandler != null) {
          paramAdobeCommonCacheHandler.onMiss();
        }
      }
    };
    if (paramHandler != null)
    {
      paramHandler.post(paramAdobeCommonCacheHandler);
      return;
    }
    new Thread(paramAdobeCommonCacheHandler).start();
  }
  
  private void clearMemCache()
  {
    memCache.evictAll();
  }
  
  private File getCacheDirectoryForGuid(String paramString)
  {
    paramString = new File(cacheDir, paramString);
    if ((!paramString.exists()) && (!paramString.mkdirs())) {
      AdobeLogger.log(Level.ERROR, AdobeCommonCacheInstance.class.getName(), "Folder creation not successful for path " + paramString.getAbsolutePath());
    }
    return paramString;
  }
  
  private String getCacheKey(String paramString1, String paramString2)
  {
    if (paramString2 == null) {
      return paramString1;
    }
    return paramString1 + File.separator + paramString2;
  }
  
  private int getCriticalEvictionThreshold()
  {
    return (int)(0.95D * diskCacheSize);
  }
  
  private long getCurrentDiskCacheSize()
  {
    long l = 0L;
    Iterator localIterator = diskCacheObjectSizes.entrySet().iterator();
    while (localIterator.hasNext()) {
      l += ((Long)((Map.Entry)localIterator.next()).getValue()).longValue();
    }
    return l;
  }
  
  private List<Map.Entry<String, Long>> getEntrySetsSortedByValue(Map<String, Long> paramMap, Comparator<Map.Entry<String, Long>> paramComparator)
  {
    paramMap = new ArrayList(paramMap.entrySet());
    Collections.sort(paramMap, paramComparator);
    return paramMap;
  }
  
  private int getNormalEvictionThreshold()
  {
    return (int)(0.85D * diskCacheSize);
  }
  
  /* Error */
  private <T> T getObjectFromDiskWithGUID(String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet)
  {
    // Byte code:
    //   0: new 238	java/util/Date
    //   3: dup
    //   4: invokespecial 239	java/util/Date:<init>	()V
    //   7: astore 16
    //   9: aconst_null
    //   10: astore 9
    //   12: aconst_null
    //   13: astore 11
    //   15: aconst_null
    //   16: astore 12
    //   18: aconst_null
    //   19: astore 8
    //   21: aload_0
    //   22: getfield 97	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:useDiskCaching	Z
    //   25: ifeq +151 -> 176
    //   28: aload_0
    //   29: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   32: invokevirtual 434	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
    //   35: invokevirtual 439	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:lock	()V
    //   38: getstatic 315	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   41: ldc 2
    //   43: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   46: new 223	java/lang/StringBuilder
    //   49: dup
    //   50: invokespecial 224	java/lang/StringBuilder:<init>	()V
    //   53: ldc_w 441
    //   56: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   59: aload_0
    //   60: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   63: invokevirtual 444	java/util/concurrent/locks/ReentrantReadWriteLock:getReadLockCount	()I
    //   66: invokevirtual 447	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   69: invokevirtual 249	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   72: invokestatic 324	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    //   75: new 196	java/io/File
    //   78: dup
    //   79: aload_0
    //   80: aload_1
    //   81: invokespecial 134	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:getCacheDirectoryForGuid	(Ljava/lang/String;)Ljava/io/File;
    //   84: aload_2
    //   85: invokespecial 449	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   88: astore 17
    //   90: aload 17
    //   92: invokevirtual 363	java/io/File:exists	()Z
    //   95: ifne +83 -> 178
    //   98: getstatic 315	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   101: ldc 2
    //   103: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   106: new 223	java/lang/StringBuilder
    //   109: dup
    //   110: invokespecial 224	java/lang/StringBuilder:<init>	()V
    //   113: ldc_w 451
    //   116: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   119: aload_2
    //   120: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   123: invokevirtual 249	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   126: invokestatic 324	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    //   129: aload_0
    //   130: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   133: invokevirtual 434	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
    //   136: invokevirtual 454	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
    //   139: getstatic 315	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   142: ldc 2
    //   144: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   147: new 223	java/lang/StringBuilder
    //   150: dup
    //   151: invokespecial 224	java/lang/StringBuilder:<init>	()V
    //   154: ldc_w 456
    //   157: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   160: aload_0
    //   161: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   164: invokevirtual 444	java/util/concurrent/locks/ReentrantReadWriteLock:getReadLockCount	()I
    //   167: invokevirtual 447	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   170: invokevirtual 249	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   173: invokestatic 324	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    //   176: aconst_null
    //   177: areturn
    //   178: aconst_null
    //   179: astore 15
    //   181: aconst_null
    //   182: astore 5
    //   184: aconst_null
    //   185: astore 14
    //   187: aconst_null
    //   188: astore 10
    //   190: aconst_null
    //   191: astore 6
    //   193: aconst_null
    //   194: astore 13
    //   196: aconst_null
    //   197: astore 7
    //   199: new 458	java/io/FileInputStream
    //   202: dup
    //   203: aload 17
    //   205: invokespecial 461	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   208: astore 4
    //   210: new 463	java/io/ObjectInputStream
    //   213: dup
    //   214: aload 4
    //   216: invokespecial 466	java/io/ObjectInputStream:<init>	(Ljava/io/InputStream;)V
    //   219: astore 6
    //   221: aload 11
    //   223: astore 7
    //   225: aload 12
    //   227: astore 8
    //   229: aload 6
    //   231: invokevirtual 469	java/io/ObjectInputStream:readObject	()Ljava/lang/Object;
    //   234: astore 9
    //   236: aload 11
    //   238: astore 7
    //   240: aload 12
    //   242: astore 8
    //   244: aload_0
    //   245: aload_1
    //   246: aload_2
    //   247: new 238	java/util/Date
    //   250: dup
    //   251: invokespecial 239	java/util/Date:<init>	()V
    //   254: invokevirtual 472	java/util/Date:getTime	()J
    //   257: aload 16
    //   259: invokevirtual 472	java/util/Date:getTime	()J
    //   262: lsub
    //   263: invokespecial 162	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:logDiskCacheHit	(Ljava/lang/String;Ljava/lang/String;J)V
    //   266: aload 11
    //   268: astore 7
    //   270: aload 12
    //   272: astore 8
    //   274: aload_0
    //   275: aload 17
    //   277: aload_0
    //   278: aload_1
    //   279: aload_2
    //   280: invokespecial 168	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:getCacheKey	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   283: invokespecial 174	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:addEntryToCacheMetadata	(Ljava/io/File;Ljava/lang/String;)V
    //   286: aload 9
    //   288: astore 5
    //   290: aload 5
    //   292: astore 7
    //   294: aload 5
    //   296: astore 8
    //   298: aload_3
    //   299: getstatic 478	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions:AdobeCommonCacheKeepInMemoryCache	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;
    //   302: invokevirtual 483	java/util/EnumSet:contains	(Ljava/lang/Object;)Z
    //   305: ifeq +44 -> 349
    //   308: aload 5
    //   310: astore 7
    //   312: aload 5
    //   314: astore 8
    //   316: aload_0
    //   317: getfield 184	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:memCacheSize	D
    //   320: dconst_0
    //   321: dcmpl
    //   322: ifle +27 -> 349
    //   325: aload 5
    //   327: astore 7
    //   329: aload 5
    //   331: astore 8
    //   333: aload_0
    //   334: getfield 188	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:memCache	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;
    //   337: aload_0
    //   338: aload_1
    //   339: aload_2
    //   340: invokespecial 168	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:getCacheKey	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   343: aload 9
    //   345: invokevirtual 484	com/adobe/creativesdk/foundation/internal/cache/AdobeMemCache:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   348: pop
    //   349: aload 4
    //   351: ifnull +8 -> 359
    //   354: aload 4
    //   356: invokevirtual 487	java/io/FileInputStream:close	()V
    //   359: aload 6
    //   361: ifnull +8 -> 369
    //   364: aload 6
    //   366: invokevirtual 488	java/io/ObjectInputStream:close	()V
    //   369: aload_0
    //   370: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   373: invokevirtual 434	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
    //   376: invokevirtual 454	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
    //   379: getstatic 315	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   382: ldc 2
    //   384: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   387: new 223	java/lang/StringBuilder
    //   390: dup
    //   391: invokespecial 224	java/lang/StringBuilder:<init>	()V
    //   394: ldc_w 456
    //   397: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   400: aload_0
    //   401: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   404: invokevirtual 444	java/util/concurrent/locks/ReentrantReadWriteLock:getReadLockCount	()I
    //   407: invokevirtual 447	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   410: invokevirtual 249	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   413: invokestatic 324	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    //   416: aload 5
    //   418: areturn
    //   419: astore_1
    //   420: aload_1
    //   421: invokevirtual 491	java/io/IOException:printStackTrace	()V
    //   424: goto -55 -> 369
    //   427: astore_2
    //   428: aload 7
    //   430: astore_3
    //   431: aload 14
    //   433: astore_1
    //   434: aload_1
    //   435: astore 5
    //   437: aload_3
    //   438: astore 6
    //   440: getstatic 369	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   443: ldc 2
    //   445: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   448: ldc_w 493
    //   451: aload_2
    //   452: invokestatic 496	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   455: aload_1
    //   456: ifnull +7 -> 463
    //   459: aload_1
    //   460: invokevirtual 487	java/io/FileInputStream:close	()V
    //   463: aload 8
    //   465: astore 5
    //   467: aload_3
    //   468: ifnull -99 -> 369
    //   471: aload_3
    //   472: invokevirtual 488	java/io/ObjectInputStream:close	()V
    //   475: aload 8
    //   477: astore 5
    //   479: goto -110 -> 369
    //   482: astore_1
    //   483: aload_1
    //   484: invokevirtual 491	java/io/IOException:printStackTrace	()V
    //   487: aload 8
    //   489: astore 5
    //   491: goto -122 -> 369
    //   494: astore_1
    //   495: aload_0
    //   496: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   499: invokevirtual 434	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
    //   502: invokevirtual 454	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
    //   505: getstatic 315	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   508: ldc 2
    //   510: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   513: new 223	java/lang/StringBuilder
    //   516: dup
    //   517: invokespecial 224	java/lang/StringBuilder:<init>	()V
    //   520: ldc_w 456
    //   523: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   526: aload_0
    //   527: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   530: invokevirtual 444	java/util/concurrent/locks/ReentrantReadWriteLock:getReadLockCount	()I
    //   533: invokevirtual 447	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   536: invokevirtual 249	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   539: invokestatic 324	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    //   542: aload_1
    //   543: athrow
    //   544: astore_2
    //   545: aload 10
    //   547: astore_3
    //   548: aload 15
    //   550: astore_1
    //   551: aload 9
    //   553: astore 7
    //   555: aload_1
    //   556: astore 5
    //   558: aload_3
    //   559: astore 6
    //   561: getstatic 369	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   564: ldc 2
    //   566: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   569: ldc_w 493
    //   572: aload_2
    //   573: invokestatic 496	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   576: aload_1
    //   577: ifnull +7 -> 584
    //   580: aload_1
    //   581: invokevirtual 487	java/io/FileInputStream:close	()V
    //   584: aload 7
    //   586: astore 5
    //   588: aload_3
    //   589: ifnull -220 -> 369
    //   592: aload_3
    //   593: invokevirtual 488	java/io/ObjectInputStream:close	()V
    //   596: aload 7
    //   598: astore 5
    //   600: goto -231 -> 369
    //   603: astore_1
    //   604: aload_1
    //   605: invokevirtual 491	java/io/IOException:printStackTrace	()V
    //   608: aload 7
    //   610: astore 5
    //   612: goto -243 -> 369
    //   615: astore_1
    //   616: aload 5
    //   618: ifnull +8 -> 626
    //   621: aload 5
    //   623: invokevirtual 487	java/io/FileInputStream:close	()V
    //   626: aload 6
    //   628: ifnull +8 -> 636
    //   631: aload 6
    //   633: invokevirtual 488	java/io/ObjectInputStream:close	()V
    //   636: aload_1
    //   637: athrow
    //   638: astore_2
    //   639: aload_2
    //   640: invokevirtual 491	java/io/IOException:printStackTrace	()V
    //   643: goto -7 -> 636
    //   646: astore_1
    //   647: aload 4
    //   649: astore 5
    //   651: aload 13
    //   653: astore 6
    //   655: goto -39 -> 616
    //   658: astore_1
    //   659: aload 4
    //   661: astore 5
    //   663: goto -47 -> 616
    //   666: astore_2
    //   667: aload 4
    //   669: astore_1
    //   670: aload 9
    //   672: astore 7
    //   674: aload 10
    //   676: astore_3
    //   677: goto -122 -> 555
    //   680: astore_2
    //   681: aload 6
    //   683: astore_3
    //   684: aload 4
    //   686: astore_1
    //   687: goto -132 -> 555
    //   690: astore_2
    //   691: aload 4
    //   693: astore_1
    //   694: aload 7
    //   696: astore_3
    //   697: goto -263 -> 434
    //   700: astore_2
    //   701: aload 6
    //   703: astore_3
    //   704: aload 4
    //   706: astore_1
    //   707: goto -273 -> 434
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	710	0	this	AdobeCommonCacheInstance
    //   0	710	1	paramString1	String
    //   0	710	2	paramString2	String
    //   0	710	3	paramEnumSet	EnumSet<AdobeCommonCacheOptions>
    //   208	497	4	localFileInputStream	java.io.FileInputStream
    //   182	480	5	localObject1	Object
    //   191	511	6	localObject2	Object
    //   197	498	7	localObject3	Object
    //   19	469	8	localObject4	Object
    //   10	661	9	localObject5	Object
    //   188	487	10	localObject6	Object
    //   13	254	11	localObject7	Object
    //   16	255	12	localObject8	Object
    //   194	458	13	localObject9	Object
    //   185	247	14	localObject10	Object
    //   179	370	15	localObject11	Object
    //   7	251	16	localDate	Date
    //   88	188	17	localFile	File
    // Exception table:
    //   from	to	target	type
    //   354	359	419	java/io/IOException
    //   364	369	419	java/io/IOException
    //   199	210	427	java/io/IOException
    //   459	463	482	java/io/IOException
    //   471	475	482	java/io/IOException
    //   28	129	494	finally
    //   354	359	494	finally
    //   364	369	494	finally
    //   420	424	494	finally
    //   459	463	494	finally
    //   471	475	494	finally
    //   483	487	494	finally
    //   580	584	494	finally
    //   592	596	494	finally
    //   604	608	494	finally
    //   621	626	494	finally
    //   631	636	494	finally
    //   636	638	494	finally
    //   639	643	494	finally
    //   199	210	544	java/lang/ClassNotFoundException
    //   580	584	603	java/io/IOException
    //   592	596	603	java/io/IOException
    //   199	210	615	finally
    //   440	455	615	finally
    //   561	576	615	finally
    //   621	626	638	java/io/IOException
    //   631	636	638	java/io/IOException
    //   210	221	646	finally
    //   229	236	658	finally
    //   244	266	658	finally
    //   274	286	658	finally
    //   298	308	658	finally
    //   316	325	658	finally
    //   333	349	658	finally
    //   210	221	666	java/lang/ClassNotFoundException
    //   229	236	680	java/lang/ClassNotFoundException
    //   244	266	680	java/lang/ClassNotFoundException
    //   274	286	680	java/lang/ClassNotFoundException
    //   298	308	680	java/lang/ClassNotFoundException
    //   316	325	680	java/lang/ClassNotFoundException
    //   333	349	680	java/lang/ClassNotFoundException
    //   210	221	690	java/io/IOException
    //   229	236	700	java/io/IOException
    //   244	266	700	java/io/IOException
    //   274	286	700	java/io/IOException
    //   298	308	700	java/io/IOException
    //   316	325	700	java/io/IOException
    //   333	349	700	java/io/IOException
  }
  
  private <T> void getObjectFromDiskWithGUID(final String paramString1, final String paramString2, final EnumSet<AdobeCommonCacheOptions> paramEnumSet, final AdobeCommonCacheHandler<T> paramAdobeCommonCacheHandler, final Handler paramHandler)
  {
    final Date localDate = new Date();
    if (useDiskCaching)
    {
      paramString1 = new Runnable()
      {
        /* Error */
        public void run()
        {
          // Byte code:
          //   0: aload_0
          //   1: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   4: invokestatic 53	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$000	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
          //   7: invokevirtual 59	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
          //   10: invokevirtual 64	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:lock	()V
          //   13: getstatic 70	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
          //   16: ldc 8
          //   18: invokevirtual 76	java/lang/Class:getName	()Ljava/lang/String;
          //   21: new 78	java/lang/StringBuilder
          //   24: dup
          //   25: invokespecial 79	java/lang/StringBuilder:<init>	()V
          //   28: ldc 81
          //   30: invokevirtual 85	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
          //   33: aload_0
          //   34: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   37: invokestatic 53	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$000	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
          //   40: invokevirtual 89	java/util/concurrent/locks/ReentrantReadWriteLock:getReadLockCount	()I
          //   43: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
          //   46: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
          //   49: invokestatic 101	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
          //   52: new 103	java/io/File
          //   55: dup
          //   56: aload_0
          //   57: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   60: aload_0
          //   61: getfield 30	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$guid	Ljava/lang/String;
          //   64: invokestatic 107	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$100	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;)Ljava/io/File;
          //   67: aload_0
          //   68: getfield 32	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$key	Ljava/lang/String;
          //   71: invokespecial 110	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
          //   74: astore 9
          //   76: aload 9
          //   78: invokevirtual 114	java/io/File:exists	()Z
          //   81: ifne +104 -> 185
          //   84: getstatic 70	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
          //   87: ldc 8
          //   89: invokevirtual 76	java/lang/Class:getName	()Ljava/lang/String;
          //   92: new 78	java/lang/StringBuilder
          //   95: dup
          //   96: invokespecial 79	java/lang/StringBuilder:<init>	()V
          //   99: ldc 116
          //   101: invokevirtual 85	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
          //   104: aload_0
          //   105: getfield 32	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$key	Ljava/lang/String;
          //   108: invokevirtual 85	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
          //   111: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
          //   114: invokestatic 101	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
          //   117: aload_0
          //   118: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   121: aload_0
          //   122: getfield 34	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$callback	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;
          //   125: aload_0
          //   126: getfield 36	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$handler	Landroid/os/Handler;
          //   129: invokestatic 120	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$200	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
          //   132: aload_0
          //   133: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   136: invokestatic 53	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$000	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
          //   139: invokevirtual 59	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
          //   142: invokevirtual 123	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
          //   145: getstatic 70	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
          //   148: ldc 8
          //   150: invokevirtual 76	java/lang/Class:getName	()Ljava/lang/String;
          //   153: new 78	java/lang/StringBuilder
          //   156: dup
          //   157: invokespecial 79	java/lang/StringBuilder:<init>	()V
          //   160: ldc 125
          //   162: invokevirtual 85	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
          //   165: aload_0
          //   166: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   169: invokestatic 53	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$000	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
          //   172: invokevirtual 89	java/util/concurrent/locks/ReentrantReadWriteLock:getReadLockCount	()I
          //   175: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
          //   178: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
          //   181: invokestatic 101	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
          //   184: return
          //   185: aconst_null
          //   186: astore 8
          //   188: aconst_null
          //   189: astore_2
          //   190: aconst_null
          //   191: astore 7
          //   193: aconst_null
          //   194: astore 6
          //   196: aconst_null
          //   197: astore_3
          //   198: aconst_null
          //   199: astore 4
          //   201: aconst_null
          //   202: astore 5
          //   204: new 127	java/io/FileInputStream
          //   207: dup
          //   208: aload 9
          //   210: invokespecial 130	java/io/FileInputStream:<init>	(Ljava/io/File;)V
          //   213: astore_1
          //   214: new 132	java/io/ObjectInputStream
          //   217: dup
          //   218: aload_1
          //   219: invokespecial 135	java/io/ObjectInputStream:<init>	(Ljava/io/InputStream;)V
          //   222: astore_2
          //   223: aload_2
          //   224: invokevirtual 139	java/io/ObjectInputStream:readObject	()Ljava/lang/Object;
          //   227: astore_3
          //   228: new 141	java/util/Date
          //   231: dup
          //   232: invokespecial 142	java/util/Date:<init>	()V
          //   235: astore 4
          //   237: aload_0
          //   238: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   241: aload_0
          //   242: getfield 30	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$guid	Ljava/lang/String;
          //   245: aload_0
          //   246: getfield 32	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$key	Ljava/lang/String;
          //   249: aload 4
          //   251: invokevirtual 146	java/util/Date:getTime	()J
          //   254: aload_0
          //   255: getfield 38	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$startTime	Ljava/util/Date;
          //   258: invokevirtual 146	java/util/Date:getTime	()J
          //   261: lsub
          //   262: invokestatic 150	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$300	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;Ljava/lang/String;J)V
          //   265: aload_0
          //   266: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   269: aload 9
          //   271: aload_0
          //   272: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   275: aload_0
          //   276: getfield 30	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$guid	Ljava/lang/String;
          //   279: aload_0
          //   280: getfield 32	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$key	Ljava/lang/String;
          //   283: invokestatic 154	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$400	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
          //   286: invokestatic 158	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$500	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/io/File;Ljava/lang/String;)V
          //   289: aload_0
          //   290: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   293: aload_0
          //   294: getfield 34	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$callback	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;
          //   297: aload_0
          //   298: getfield 36	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$handler	Landroid/os/Handler;
          //   301: aload_3
          //   302: getstatic 164	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation:AdobeCommonCacheHitLocationDisk	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;
          //   305: invokestatic 168	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$600	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
          //   308: aload_0
          //   309: getfield 40	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$options	Ljava/util/EnumSet;
          //   312: getstatic 174	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions:AdobeCommonCacheKeepInMemoryCache	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;
          //   315: invokevirtual 180	java/util/EnumSet:contains	(Ljava/lang/Object;)Z
          //   318: ifeq +42 -> 360
          //   321: aload_0
          //   322: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   325: invokestatic 184	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$700	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)D
          //   328: dconst_0
          //   329: dcmpl
          //   330: ifle +30 -> 360
          //   333: aload_0
          //   334: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   337: invokestatic 188	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$800	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Lcom/adobe/creativesdk/foundation/internal/cache/AdobeMemCache;
          //   340: aload_0
          //   341: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   344: aload_0
          //   345: getfield 30	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$guid	Ljava/lang/String;
          //   348: aload_0
          //   349: getfield 32	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$key	Ljava/lang/String;
          //   352: invokestatic 154	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$400	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
          //   355: aload_3
          //   356: invokevirtual 194	com/adobe/creativesdk/foundation/internal/cache/AdobeMemCache:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
          //   359: pop
          //   360: aload_1
          //   361: ifnull +7 -> 368
          //   364: aload_1
          //   365: invokevirtual 197	java/io/FileInputStream:close	()V
          //   368: aload_2
          //   369: ifnull +7 -> 376
          //   372: aload_2
          //   373: invokevirtual 198	java/io/ObjectInputStream:close	()V
          //   376: aload_0
          //   377: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   380: invokestatic 53	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$000	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
          //   383: invokevirtual 59	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
          //   386: invokevirtual 123	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
          //   389: getstatic 70	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
          //   392: ldc 8
          //   394: invokevirtual 76	java/lang/Class:getName	()Ljava/lang/String;
          //   397: new 78	java/lang/StringBuilder
          //   400: dup
          //   401: invokespecial 79	java/lang/StringBuilder:<init>	()V
          //   404: ldc 125
          //   406: invokevirtual 85	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
          //   409: aload_0
          //   410: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   413: invokestatic 53	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$000	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
          //   416: invokevirtual 89	java/util/concurrent/locks/ReentrantReadWriteLock:getReadLockCount	()I
          //   419: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
          //   422: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
          //   425: invokestatic 101	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
          //   428: return
          //   429: astore_1
          //   430: aload_1
          //   431: invokevirtual 201	java/io/IOException:printStackTrace	()V
          //   434: goto -58 -> 376
          //   437: astore 4
          //   439: aload 7
          //   441: astore_1
          //   442: aload_1
          //   443: astore_2
          //   444: aload 5
          //   446: astore_3
          //   447: getstatic 204	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
          //   450: ldc 8
          //   452: invokevirtual 76	java/lang/Class:getName	()Ljava/lang/String;
          //   455: ldc -50
          //   457: aload 4
          //   459: invokestatic 209	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
          //   462: aload_1
          //   463: astore_2
          //   464: aload 5
          //   466: astore_3
          //   467: aload_0
          //   468: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   471: aload_0
          //   472: getfield 34	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$callback	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;
          //   475: aload_0
          //   476: getfield 36	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$handler	Landroid/os/Handler;
          //   479: invokestatic 120	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$200	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
          //   482: aload_1
          //   483: ifnull +7 -> 490
          //   486: aload_1
          //   487: invokevirtual 197	java/io/FileInputStream:close	()V
          //   490: aload 5
          //   492: ifnull -116 -> 376
          //   495: aload 5
          //   497: invokevirtual 198	java/io/ObjectInputStream:close	()V
          //   500: goto -124 -> 376
          //   503: astore_1
          //   504: aload_1
          //   505: invokevirtual 201	java/io/IOException:printStackTrace	()V
          //   508: goto -132 -> 376
          //   511: astore_1
          //   512: aload_0
          //   513: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   516: invokestatic 53	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$000	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
          //   519: invokevirtual 59	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
          //   522: invokevirtual 123	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
          //   525: getstatic 70	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
          //   528: ldc 8
          //   530: invokevirtual 76	java/lang/Class:getName	()Ljava/lang/String;
          //   533: new 78	java/lang/StringBuilder
          //   536: dup
          //   537: invokespecial 79	java/lang/StringBuilder:<init>	()V
          //   540: ldc 125
          //   542: invokevirtual 85	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
          //   545: aload_0
          //   546: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   549: invokestatic 53	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$000	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;
          //   552: invokevirtual 89	java/util/concurrent/locks/ReentrantReadWriteLock:getReadLockCount	()I
          //   555: invokevirtual 92	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
          //   558: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
          //   561: invokestatic 101	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
          //   564: aload_1
          //   565: athrow
          //   566: astore 4
          //   568: aload 6
          //   570: astore 5
          //   572: aload 8
          //   574: astore_1
          //   575: aload_1
          //   576: astore_2
          //   577: aload 5
          //   579: astore_3
          //   580: getstatic 204	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
          //   583: ldc 8
          //   585: invokevirtual 76	java/lang/Class:getName	()Ljava/lang/String;
          //   588: ldc -50
          //   590: aload 4
          //   592: invokestatic 209	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
          //   595: aload_1
          //   596: astore_2
          //   597: aload 5
          //   599: astore_3
          //   600: aload_0
          //   601: getfield 28	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:this$0	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;
          //   604: aload_0
          //   605: getfield 34	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$callback	Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;
          //   608: aload_0
          //   609: getfield 36	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$4:val$handler	Landroid/os/Handler;
          //   612: invokestatic 120	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:access$200	(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;Landroid/os/Handler;)V
          //   615: aload_1
          //   616: ifnull +7 -> 623
          //   619: aload_1
          //   620: invokevirtual 197	java/io/FileInputStream:close	()V
          //   623: aload 5
          //   625: ifnull -249 -> 376
          //   628: aload 5
          //   630: invokevirtual 198	java/io/ObjectInputStream:close	()V
          //   633: goto -257 -> 376
          //   636: astore_1
          //   637: aload_1
          //   638: invokevirtual 201	java/io/IOException:printStackTrace	()V
          //   641: goto -265 -> 376
          //   644: astore_1
          //   645: aload_2
          //   646: ifnull +7 -> 653
          //   649: aload_2
          //   650: invokevirtual 197	java/io/FileInputStream:close	()V
          //   653: aload_3
          //   654: ifnull +7 -> 661
          //   657: aload_3
          //   658: invokevirtual 198	java/io/ObjectInputStream:close	()V
          //   661: aload_1
          //   662: athrow
          //   663: astore_2
          //   664: aload_2
          //   665: invokevirtual 201	java/io/IOException:printStackTrace	()V
          //   668: goto -7 -> 661
          //   671: astore 5
          //   673: aload_1
          //   674: astore_2
          //   675: aload 4
          //   677: astore_3
          //   678: aload 5
          //   680: astore_1
          //   681: goto -36 -> 645
          //   684: astore 4
          //   686: aload_2
          //   687: astore_3
          //   688: aload_1
          //   689: astore_2
          //   690: aload 4
          //   692: astore_1
          //   693: goto -48 -> 645
          //   696: astore 4
          //   698: aload 6
          //   700: astore 5
          //   702: goto -127 -> 575
          //   705: astore 4
          //   707: aload_2
          //   708: astore 5
          //   710: goto -135 -> 575
          //   713: astore 4
          //   715: goto -273 -> 442
          //   718: astore 4
          //   720: aload_2
          //   721: astore 5
          //   723: goto -281 -> 442
          // Local variable table:
          //   start	length	slot	name	signature
          //   0	726	0	this	4
          //   213	152	1	localFileInputStream	java.io.FileInputStream
          //   429	2	1	localIOException1	IOException
          //   441	46	1	localObject1	Object
          //   503	2	1	localIOException2	IOException
          //   511	54	1	localObject2	Object
          //   574	46	1	localObject3	Object
          //   636	2	1	localIOException3	IOException
          //   644	30	1	localObject4	Object
          //   680	13	1	localObject5	Object
          //   189	461	2	localObject6	Object
          //   663	2	2	localIOException4	IOException
          //   674	47	2	localObject7	Object
          //   197	491	3	localObject8	Object
          //   199	51	4	localDate	Date
          //   437	21	4	localIOException5	IOException
          //   566	110	4	localClassNotFoundException1	ClassNotFoundException
          //   684	7	4	localObject9	Object
          //   696	1	4	localClassNotFoundException2	ClassNotFoundException
          //   705	1	4	localClassNotFoundException3	ClassNotFoundException
          //   713	1	4	localIOException6	IOException
          //   718	1	4	localIOException7	IOException
          //   202	427	5	localObject10	Object
          //   671	8	5	localObject11	Object
          //   700	22	5	localObject12	Object
          //   194	505	6	localObject13	Object
          //   191	249	7	localObject14	Object
          //   186	387	8	localObject15	Object
          //   74	196	9	localFile	File
          // Exception table:
          //   from	to	target	type
          //   364	368	429	java/io/IOException
          //   372	376	429	java/io/IOException
          //   204	214	437	java/io/IOException
          //   486	490	503	java/io/IOException
          //   495	500	503	java/io/IOException
          //   0	132	511	finally
          //   364	368	511	finally
          //   372	376	511	finally
          //   430	434	511	finally
          //   486	490	511	finally
          //   495	500	511	finally
          //   504	508	511	finally
          //   619	623	511	finally
          //   628	633	511	finally
          //   637	641	511	finally
          //   649	653	511	finally
          //   657	661	511	finally
          //   661	663	511	finally
          //   664	668	511	finally
          //   204	214	566	java/lang/ClassNotFoundException
          //   619	623	636	java/io/IOException
          //   628	633	636	java/io/IOException
          //   204	214	644	finally
          //   447	462	644	finally
          //   467	482	644	finally
          //   580	595	644	finally
          //   600	615	644	finally
          //   649	653	663	java/io/IOException
          //   657	661	663	java/io/IOException
          //   214	223	671	finally
          //   223	360	684	finally
          //   214	223	696	java/lang/ClassNotFoundException
          //   223	360	705	java/lang/ClassNotFoundException
          //   214	223	713	java/io/IOException
          //   223	360	718	java/io/IOException
        }
      };
      executorService.execute(paramString1);
      return;
    }
    callMissHandler(paramAdobeCommonCacheHandler, paramHandler);
  }
  
  /* Error */
  private void initDiskCacheMetadata()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 357	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:cacheDir	Ljava/lang/String;
    //   4: ifnull +13 -> 17
    //   7: aload_0
    //   8: getfield 357	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:cacheDir	Ljava/lang/String;
    //   11: invokevirtual 513	java/lang/String:isEmpty	()Z
    //   14: ifeq +10 -> 24
    //   17: aload_0
    //   18: ldc_w 515
    //   21: invokespecial 194	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:cacheLog	(Ljava/lang/String;)V
    //   24: aload_0
    //   25: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   28: invokevirtual 434	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
    //   31: invokevirtual 439	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:lock	()V
    //   34: aload_0
    //   35: iconst_1
    //   36: putfield 221	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:cacheFrozen	Z
    //   39: getstatic 315	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   42: ldc 2
    //   44: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   47: new 223	java/lang/StringBuilder
    //   50: dup
    //   51: invokespecial 224	java/lang/StringBuilder:<init>	()V
    //   54: ldc_w 517
    //   57: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   60: aload_0
    //   61: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   64: invokevirtual 444	java/util/concurrent/locks/ReentrantReadWriteLock:getReadLockCount	()I
    //   67: invokevirtual 447	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   70: invokevirtual 249	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   73: invokestatic 324	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    //   76: new 196	java/io/File
    //   79: dup
    //   80: aload_0
    //   81: getfield 357	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:cacheDir	Ljava/lang/String;
    //   84: invokespecial 519	java/io/File:<init>	(Ljava/lang/String;)V
    //   87: astore_2
    //   88: aload_2
    //   89: invokevirtual 363	java/io/File:exists	()Z
    //   92: ifne +24 -> 116
    //   95: aload_2
    //   96: invokevirtual 366	java/io/File:mkdirs	()Z
    //   99: ifne +17 -> 116
    //   102: getstatic 369	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   105: ldc 2
    //   107: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   110: ldc_w 521
    //   113: invokestatic 324	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    //   116: aload_2
    //   117: getstatic 527	org/apache/commons/io/filefilter/TrueFileFilter:INSTANCE	Lorg/apache/commons/io/filefilter/IOFileFilter;
    //   120: getstatic 527	org/apache/commons/io/filefilter/TrueFileFilter:INSTANCE	Lorg/apache/commons/io/filefilter/IOFileFilter;
    //   123: invokestatic 533	org/apache/commons/io/FileUtils:listFiles	(Ljava/io/File;Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Ljava/util/Collection;
    //   126: checkcast 535	java/util/List
    //   129: invokeinterface 536 1 0
    //   134: astore_2
    //   135: aload_2
    //   136: invokeinterface 396 1 0
    //   141: ifeq +81 -> 222
    //   144: aload_2
    //   145: invokeinterface 400 1 0
    //   150: checkcast 196	java/io/File
    //   153: astore_3
    //   154: aload_3
    //   155: invokevirtual 539	java/io/File:isDirectory	()Z
    //   158: ifne -23 -> 135
    //   161: aload_3
    //   162: invokevirtual 542	java/io/File:isHidden	()Z
    //   165: ifne -30 -> 135
    //   168: aload_3
    //   169: invokevirtual 374	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   172: aload_0
    //   173: getfield 544	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:cacheName	Ljava/lang/String;
    //   176: invokevirtual 548	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   179: istore_1
    //   180: aload_0
    //   181: aload_3
    //   182: aload_3
    //   183: invokevirtual 374	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   186: aload_0
    //   187: getfield 544	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:cacheName	Ljava/lang/String;
    //   190: invokevirtual 550	java/lang/String:length	()I
    //   193: iload_1
    //   194: iadd
    //   195: iconst_1
    //   196: iadd
    //   197: invokevirtual 554	java/lang/String:substring	(I)Ljava/lang/String;
    //   200: invokespecial 174	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:addEntryToCacheMetadata	(Ljava/io/File;Ljava/lang/String;)V
    //   203: goto -68 -> 135
    //   206: astore_2
    //   207: getstatic 369	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   210: ldc 2
    //   212: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   215: ldc_w 556
    //   218: aload_2
    //   219: invokestatic 496	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   222: aload_0
    //   223: iconst_0
    //   224: putfield 221	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:cacheFrozen	Z
    //   227: aload_0
    //   228: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   231: invokevirtual 434	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
    //   234: invokevirtual 454	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
    //   237: getstatic 315	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   240: ldc 2
    //   242: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   245: new 223	java/lang/StringBuilder
    //   248: dup
    //   249: invokespecial 224	java/lang/StringBuilder:<init>	()V
    //   252: ldc_w 558
    //   255: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   258: aload_0
    //   259: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   262: invokevirtual 444	java/util/concurrent/locks/ReentrantReadWriteLock:getReadLockCount	()I
    //   265: invokevirtual 447	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   268: invokevirtual 249	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   271: invokestatic 324	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    //   274: return
    //   275: astore_2
    //   276: aload_0
    //   277: iconst_0
    //   278: putfield 221	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:cacheFrozen	Z
    //   281: aload_0
    //   282: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   285: invokevirtual 434	java/util/concurrent/locks/ReentrantReadWriteLock:readLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;
    //   288: invokevirtual 454	java/util/concurrent/locks/ReentrantReadWriteLock$ReadLock:unlock	()V
    //   291: getstatic 315	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   294: ldc 2
    //   296: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   299: new 223	java/lang/StringBuilder
    //   302: dup
    //   303: invokespecial 224	java/lang/StringBuilder:<init>	()V
    //   306: ldc_w 558
    //   309: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   312: aload_0
    //   313: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   316: invokevirtual 444	java/util/concurrent/locks/ReentrantReadWriteLock:getReadLockCount	()I
    //   319: invokevirtual 447	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   322: invokevirtual 249	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   325: invokestatic 324	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    //   328: aload_2
    //   329: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	330	0	this	AdobeCommonCacheInstance
    //   179	16	1	i	int
    //   87	58	2	localObject1	Object
    //   206	13	2	localRuntimeException	RuntimeException
    //   275	54	2	localObject2	Object
    //   153	30	3	localFile	File
    // Exception table:
    //   from	to	target	type
    //   116	135	206	java/lang/RuntimeException
    //   135	203	206	java/lang/RuntimeException
    //   24	116	275	finally
    //   116	135	275	finally
    //   135	203	275	finally
    //   207	222	275	finally
  }
  
  private void largeObjectFirstEviction(AdobeCommonCacheEvictionType paramAdobeCommonCacheEvictionType)
  {
    int i;
    if (paramAdobeCommonCacheEvictionType == AdobeCommonCacheEvictionType.AdobeCommonCacheCriticalEviction) {
      i = 10;
    }
    for (;;)
    {
      int k = diskCacheObjectSizes.size();
      paramAdobeCommonCacheEvictionType = getEntrySetsSortedByValue(diskCacheObjectSizes, numberComparator);
      try
      {
        diskReadWriteLock.writeLock().lock();
        int j = 0;
        for (;;)
        {
          if ((j < Integer.valueOf(i).intValue()) && (j < Integer.valueOf(k).intValue()))
          {
            String str = (String)((Map.Entry)paramAdobeCommonCacheEvictionType.get(j)).getKey();
            Object localObject = cacheDir + str;
            try
            {
              localObject = new File((String)localObject);
              if (((File)localObject).exists())
              {
                FileUtils.deleteDirectory((File)localObject);
                notifyDiskCacheEviction(str, "LSF");
              }
              removeEntryFromCacheMetadata(str);
            }
            catch (IOException localIOException)
            {
              for (;;)
              {
                AdobeLogger.log(Level.ERROR, AdobeCommonCacheInstance.class.getName(), "Could not remove cached file", localIOException);
              }
            }
            j += 1;
            continue;
            i = 3;
            break;
          }
        }
      }
      finally
      {
        diskReadWriteLock.writeLock().unlock();
      }
    }
    diskReadWriteLock.writeLock().unlock();
  }
  
  private void logDiskCacheHit(String paramString1, String paramString2, long paramLong)
  {
    diskCacheHits += 1;
    AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "Disk cache hit for key:" + paramString2 + " with guid " + paramString1 + " and latency " + paramLong);
  }
  
  private void logMemCacheHit(String paramString1, String paramString2, long paramLong)
  {
    memCacheHits += 1;
    AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "Mem cache hit for key:" + paramString2 + " with guid " + paramString1 + " and latency " + paramLong);
  }
  
  private void lruEviction(AdobeCommonCacheEvictionType paramAdobeCommonCacheEvictionType)
  {
    if (paramAdobeCommonCacheEvictionType == AdobeCommonCacheEvictionType.AdobeCommonCacheCriticalEviction) {}
    for (int i = 10;; i = 3)
    {
      int k = diskCacheAccessTimes.size();
      paramAdobeCommonCacheEvictionType = getEntrySetsSortedByValue(diskCacheAccessTimes, lruComparator);
      try
      {
        diskReadWriteLock.writeLock().lock();
        int j = 0;
        if ((j < Integer.valueOf(i).intValue()) && (j < Integer.valueOf(k).intValue()))
        {
          String str = (String)((Map.Entry)paramAdobeCommonCacheEvictionType.get(j)).getKey();
          File localFile = new File(cacheDir, str);
          if (localFile.exists())
          {
            boolean bool = localFile.delete();
            notifyDiskCacheEviction(str, "LRU");
            if (!bool) {
              AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "Could not remove cached file in disk" + localFile.getAbsolutePath());
            }
          }
          for (;;)
          {
            removeEntryFromCacheMetadata(str);
            AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "Removing file in cache : " + localFile.getAbsolutePath());
            j += 1;
            break;
            AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "File doesn't exist in disk: " + localFile.getAbsolutePath());
          }
        }
      }
      finally
      {
        diskReadWriteLock.writeLock().unlock();
      }
      return;
    }
  }
  
  private void notifyDiskCacheEviction(String paramString1, String paramString2)
  {
    AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "Disk cache eviction for key:" + paramString1 + ".Type: " + paramString2);
  }
  
  private void printDiskCacheMetadata()
  {
    Map.Entry localEntry;
    try
    {
      diskReadWriteLock.readLock().lock();
      AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "Got Read lock in printDiskCacheMetadata.Current lock count " + diskReadWriteLock.getReadLockCount());
      cacheLog("============================================");
      cacheLog("Disk Cache Size:" + currentDiskCacheSize);
      cacheLog("Disk Cache Location: " + cacheDir);
      if (evictionPolicy == AdobeCommonCachePolicies.AdobeCommonCacheEvictionLSF)
      {
        Object localObject1 = getEntrySetsSortedByValue(diskCacheObjectSizes, numberComparator);
        cacheLog("============================================");
        cacheLog("Eviction Policy: Large Size First");
        cacheLog("Sorted Object Size Dictionary");
        localObject1 = ((List)localObject1).iterator();
        while (((Iterator)localObject1).hasNext())
        {
          localEntry = (Map.Entry)((Iterator)localObject1).next();
          cacheLog((String)localEntry.getKey() + " : " + localEntry.getValue() + "bytes");
        }
      }
      if (evictionPolicy != AdobeCommonCachePolicies.AdobeCommonCacheEvictionLRU) {
        break label411;
      }
    }
    finally
    {
      diskReadWriteLock.readLock().unlock();
      AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "Read lock released in printDiskCacheMetadata.Holding " + diskReadWriteLock.getReadLockCount());
    }
    Object localObject3 = getEntrySetsSortedByValue(diskCacheAccessTimes, numberComparator);
    cacheLog("============================================");
    cacheLog("Eviction Policy: Least Recently Used");
    cacheLog("Sorted Access Times Dictionary");
    localObject3 = ((List)localObject3).iterator();
    while (((Iterator)localObject3).hasNext())
    {
      localEntry = (Map.Entry)((Iterator)localObject3).next();
      cacheLog((String)localEntry.getKey() + " : " + DateFormat.getInstance().format(new Date(((Long)localEntry.getValue()).longValue())));
    }
    label411:
    cacheLog("");
    diskReadWriteLock.readLock().unlock();
    AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "Read lock released in printDiskCacheMetadata.Holding " + diskReadWriteLock.getReadLockCount());
  }
  
  private void removeEntryFromCacheMetadata(String paramString)
  {
    long l1 = ((Long)diskCacheObjectSizes.get(paramString)).longValue();
    long l2 = ((Long)diskCacheCreateTimes.get(paramString)).longValue();
    long l3 = ((Long)diskCacheAccessTimes.get(paramString)).longValue();
    cacheLog(String.format("( %d ): Deleted metadata from %s: (AT: %s) (CT: %s) (Sz: %d)", new Object[] { Long.valueOf(currentDiskCacheSize), paramString, Long.valueOf(l3), Long.valueOf(l2), Long.valueOf(l1) }));
    currentDiskCacheSize -= ((Long)diskCacheObjectSizes.get(paramString)).longValue();
    diskCacheAccessTimes.remove(paramString);
    diskCacheCreateTimes.remove(paramString);
    diskCacheObjectSizes.remove(paramString);
    if ((currentDiskCacheSize < getNormalEvictionThreshold()) && (repeatingTimer != null))
    {
      cacheLog("===== Sync stop timer at " + SimpleDateFormat.getInstance().format(new Date()));
      cacheLog(String.format("Stopping eviction timer: %d < %d", new Object[] { Long.valueOf(currentDiskCacheSize), Integer.valueOf(getNormalEvictionThreshold()) }));
      stopRepeatingTimer();
    }
  }
  
  /* Error */
  private <T> void setObjectToDisk(T paramT, String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 221	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:cacheFrozen	Z
    //   4: ifne +10 -> 14
    //   7: aload_1
    //   8: instanceof 676
    //   11: ifne +4 -> 15
    //   14: return
    //   15: aload_0
    //   16: getfield 97	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:useDiskCaching	Z
    //   19: ifeq -5 -> 14
    //   22: aconst_null
    //   23: astore 4
    //   25: aconst_null
    //   26: astore 9
    //   28: aconst_null
    //   29: astore 10
    //   31: aconst_null
    //   32: astore 8
    //   34: aconst_null
    //   35: astore 7
    //   37: aload 4
    //   39: astore 5
    //   41: aload 10
    //   43: astore 6
    //   45: aload_0
    //   46: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   49: invokevirtual 567	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   52: invokevirtual 570	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:lock	()V
    //   55: aload 4
    //   57: astore 5
    //   59: aload 10
    //   61: astore 6
    //   63: new 196	java/io/File
    //   66: dup
    //   67: aload_0
    //   68: aload_2
    //   69: invokespecial 134	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:getCacheDirectoryForGuid	(Ljava/lang/String;)Ljava/io/File;
    //   72: aload_3
    //   73: invokespecial 449	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   76: astore 11
    //   78: aload 4
    //   80: astore 5
    //   82: aload 10
    //   84: astore 6
    //   86: new 678	java/io/FileOutputStream
    //   89: dup
    //   90: aload 11
    //   92: invokespecial 679	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   95: astore 4
    //   97: new 681	java/io/ObjectOutputStream
    //   100: dup
    //   101: aload 4
    //   103: invokespecial 684	java/io/ObjectOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   106: astore 5
    //   108: getstatic 315	com/adobe/creativesdk/foundation/internal/utils/logging/Level:INFO	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   111: ldc 2
    //   113: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   116: new 223	java/lang/StringBuilder
    //   119: dup
    //   120: invokespecial 224	java/lang/StringBuilder:<init>	()V
    //   123: ldc_w 686
    //   126: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   129: aload_3
    //   130: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   133: ldc_w 688
    //   136: invokevirtual 230	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   139: invokevirtual 249	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   142: invokestatic 324	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V
    //   145: aload 5
    //   147: aload_1
    //   148: invokevirtual 692	java/io/ObjectOutputStream:writeObject	(Ljava/lang/Object;)V
    //   151: aload_0
    //   152: aload 11
    //   154: aload_0
    //   155: aload_2
    //   156: aload_3
    //   157: invokespecial 168	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:getCacheKey	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   160: invokespecial 174	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:addEntryToCacheMetadata	(Ljava/io/File;Ljava/lang/String;)V
    //   163: aload 5
    //   165: ifnull +8 -> 173
    //   168: aload 5
    //   170: invokevirtual 693	java/io/ObjectOutputStream:close	()V
    //   173: aload 4
    //   175: ifnull +8 -> 183
    //   178: aload 4
    //   180: invokevirtual 694	java/io/FileOutputStream:close	()V
    //   183: aload_0
    //   184: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   187: invokevirtual 567	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   190: invokevirtual 591	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   193: return
    //   194: astore_1
    //   195: getstatic 369	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   198: ldc 2
    //   200: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   203: ldc_w 696
    //   206: aload_1
    //   207: invokestatic 496	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   210: aload_0
    //   211: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   214: invokevirtual 567	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   217: invokevirtual 591	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   220: return
    //   221: astore_1
    //   222: aload_0
    //   223: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   226: invokevirtual 567	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   229: invokevirtual 591	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   232: aload_1
    //   233: athrow
    //   234: astore_2
    //   235: aload 7
    //   237: astore_3
    //   238: aload 9
    //   240: astore_1
    //   241: aload_1
    //   242: astore 5
    //   244: aload_3
    //   245: astore 6
    //   247: getstatic 369	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   250: ldc 2
    //   252: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   255: ldc_w 698
    //   258: aload_2
    //   259: invokestatic 496	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   262: aload_3
    //   263: ifnull +7 -> 270
    //   266: aload_3
    //   267: invokevirtual 693	java/io/ObjectOutputStream:close	()V
    //   270: aload_1
    //   271: ifnull +7 -> 278
    //   274: aload_1
    //   275: invokevirtual 694	java/io/FileOutputStream:close	()V
    //   278: aload_0
    //   279: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   282: invokevirtual 567	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   285: invokevirtual 591	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   288: return
    //   289: astore_1
    //   290: getstatic 369	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   293: ldc 2
    //   295: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   298: ldc_w 696
    //   301: aload_1
    //   302: invokestatic 496	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   305: aload_0
    //   306: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   309: invokevirtual 567	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   312: invokevirtual 591	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   315: return
    //   316: astore_1
    //   317: aload_0
    //   318: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   321: invokevirtual 567	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   324: invokevirtual 591	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   327: aload_1
    //   328: athrow
    //   329: astore_1
    //   330: aload 6
    //   332: ifnull +8 -> 340
    //   335: aload 6
    //   337: invokevirtual 693	java/io/ObjectOutputStream:close	()V
    //   340: aload 5
    //   342: ifnull +8 -> 350
    //   345: aload 5
    //   347: invokevirtual 694	java/io/FileOutputStream:close	()V
    //   350: aload_0
    //   351: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   354: invokevirtual 567	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   357: invokevirtual 591	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   360: aload_1
    //   361: athrow
    //   362: astore_2
    //   363: getstatic 369	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   366: ldc 2
    //   368: invokevirtual 318	java/lang/Class:getName	()Ljava/lang/String;
    //   371: ldc_w 696
    //   374: aload_2
    //   375: invokestatic 496	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   378: aload_0
    //   379: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   382: invokevirtual 567	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   385: invokevirtual 591	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   388: goto -28 -> 360
    //   391: astore_1
    //   392: aload_0
    //   393: getfield 124	com/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance:diskReadWriteLock	Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    //   396: invokevirtual 567	java/util/concurrent/locks/ReentrantReadWriteLock:writeLock	()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;
    //   399: invokevirtual 591	java/util/concurrent/locks/ReentrantReadWriteLock$WriteLock:unlock	()V
    //   402: aload_1
    //   403: athrow
    //   404: astore_1
    //   405: aload 4
    //   407: astore 5
    //   409: aload 8
    //   411: astore 6
    //   413: goto -83 -> 330
    //   416: astore_1
    //   417: aload 5
    //   419: astore 6
    //   421: aload 4
    //   423: astore 5
    //   425: goto -95 -> 330
    //   428: astore_2
    //   429: aload 4
    //   431: astore_1
    //   432: aload 7
    //   434: astore_3
    //   435: goto -194 -> 241
    //   438: astore_2
    //   439: aload 5
    //   441: astore_3
    //   442: aload 4
    //   444: astore_1
    //   445: goto -204 -> 241
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	448	0	this	AdobeCommonCacheInstance
    //   0	448	1	paramT	T
    //   0	448	2	paramString1	String
    //   0	448	3	paramString2	String
    //   23	420	4	localFileOutputStream	java.io.FileOutputStream
    //   39	401	5	localObject1	Object
    //   43	377	6	localObject2	Object
    //   35	398	7	localObject3	Object
    //   32	378	8	localObject4	Object
    //   26	213	9	localObject5	Object
    //   29	54	10	localObject6	Object
    //   76	77	11	localFile	File
    // Exception table:
    //   from	to	target	type
    //   168	173	194	java/io/IOException
    //   178	183	194	java/io/IOException
    //   168	173	221	finally
    //   178	183	221	finally
    //   195	210	221	finally
    //   45	55	234	java/io/IOException
    //   63	78	234	java/io/IOException
    //   86	97	234	java/io/IOException
    //   266	270	289	java/io/IOException
    //   274	278	289	java/io/IOException
    //   266	270	316	finally
    //   274	278	316	finally
    //   290	305	316	finally
    //   45	55	329	finally
    //   63	78	329	finally
    //   86	97	329	finally
    //   247	262	329	finally
    //   335	340	362	java/io/IOException
    //   345	350	362	java/io/IOException
    //   335	340	391	finally
    //   345	350	391	finally
    //   363	378	391	finally
    //   97	108	404	finally
    //   108	163	416	finally
    //   97	108	428	java/io/IOException
    //   108	163	438	java/io/IOException
  }
  
  private void startRepeatingTimer()
  {
    if (repeatingTimer != null) {
      repeatingTimer.cancel(false);
    }
    repeatingTimer = scheduledExecutorService.scheduleAtFixedRate(new Runnable()
    {
      public void run()
      {
        AdobeCommonCacheInstance.this.cacheLog("***** Async eviction event at " + SimpleDateFormat.getDateInstance().format(new Date()));
        if (currentDiskCacheSize > AdobeCommonCacheInstance.this.getNormalEvictionThreshold())
        {
          AdobeCommonCacheInstance.this.cacheEviction();
          return;
        }
        AdobeCommonCacheInstance.this.cacheLog(String.format("Stopping eviction timer: %d < %d", new Object[] { Long.valueOf(currentDiskCacheSize), Integer.valueOf(AdobeCommonCacheInstance.this.getNormalEvictionThreshold()) }));
        AdobeCommonCacheInstance.this.stopRepeatingTimer();
      }
    }, 0L, 60000L, TimeUnit.MILLISECONDS);
  }
  
  private void stopRepeatingTimer()
  {
    if (repeatingTimer != null) {
      repeatingTimer.cancel(false);
    }
    repeatingTimer = null;
  }
  
  public void addObject(Object paramObject, String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet)
  {
    if (cacheFrozen) {}
    do
    {
      return;
      if ((paramEnumSet.contains(AdobeCommonCacheOptions.AdobeCommonCacheKeepInMemoryCache)) && (memCacheSize > 0.0D)) {
        memCache.put(getCacheKey(paramString1, paramString2), paramObject);
      }
    } while ((!paramEnumSet.contains(AdobeCommonCacheOptions.AdobeCommonCacheKeepOnDiskCache)) || (diskCacheSize <= 0.0D));
    setObjectToDisk(paramObject, paramString1, paramString2);
  }
  
  public void clear()
  {
    clearMemCache();
    if (repeatingTimer != null) {
      stopRepeatingTimer();
    }
    try
    {
      diskReadWriteLock.writeLock().lock();
      FileUtils.deleteDirectory(new File(cacheDir));
      cacheLog("Cache with cache name " + cacheName + " deleted from location " + cacheDir);
      return;
    }
    catch (IOException localIOException)
    {
      AdobeLogger.log(Level.ERROR, AdobeCommonCacheInstance.class.getName(), "Error deleting cache directory", localIOException);
      cacheLog("Unable to delete cache " + cacheName + " from location " + cacheDir);
      return;
    }
    finally
    {
      diskReadWriteLock.writeLock().unlock();
    }
  }
  
  public void configureCache(String paramString1, String paramString2, String paramString3, int paramInt, double paramDouble, AdobeCommonCachePolicies paramAdobeCommonCachePolicies, boolean paramBoolean)
  {
    if (paramString2 == null)
    {
      cacheLog("Cannot configure a cache without an adobeID");
      return;
    }
    cacheName = paramString1;
    cacheAdobeId = paramString2;
    evictionPolicy = paramAdobeCommonCachePolicies;
    memCache = new AdobeMemCache(paramInt);
    paramString1 = paramString1 + paramString2;
    for (;;)
    {
      try
      {
        paramString2 = MessageDigest.getInstance("SHA-1");
      }
      catch (NoSuchAlgorithmException paramString1)
      {
        AdobeLogger.log(Level.WARN, AdobeCommonCacheInstance.class.getName(), "MD5 Hash not available. Using unencrypted string");
        continue;
        paramString1 = paramString1 + '8';
        continue;
        double d = 200.0D;
        continue;
        paramDouble = 2.68435456E8D;
        continue;
        if (currentDiskCacheSize <= getNormalEvictionThreshold()) {
          continue;
        }
        cacheEviction();
        printDiskCacheMetadata();
      }
      try
      {
        paramString2.update(paramString1.getBytes("UTF-8"));
        paramString1 = Util.bytesToHexString(paramString2.digest());
        if (paramBoolean)
        {
          paramString1 = paramString1 + '7';
          cacheDir = (paramString3 + File.separator + paramString1 + File.separator + cacheName);
          if (paramInt > 200) {
            continue;
          }
          d = paramInt;
          memCacheSize = d;
          if (paramDouble > 2.68435456E8D) {
            continue;
          }
          diskCacheSize = paramDouble;
          clearMemCache();
          initDiskCacheMetadata();
          if (($assertionsDisabled) || (!cacheFrozen)) {
            continue;
          }
          throw new AssertionError();
        }
      }
      catch (UnsupportedEncodingException paramAdobeCommonCachePolicies)
      {
        paramString2.update(paramString1.getBytes());
      }
    }
  }
  
  public boolean containsItemWithGUID(String paramString1, String paramString2)
  {
    if (memCache.get(getCacheKey(paramString1, paramString2)) != null) {
      return true;
    }
    paramString1 = cacheDir + File.separator + getCacheKey(paramString1, paramString2);
    try
    {
      diskReadWriteLock.readLock().lock();
      AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "Got Read lock in containsItemWithGUID.Current lock count " + diskReadWriteLock.getReadLockCount());
      boolean bool = new File(paramString1).exists();
      return bool;
    }
    finally
    {
      diskReadWriteLock.readLock().unlock();
      AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "Released read lock in containsItemWithGUID.Current lock count " + diskReadWriteLock.getReadLockCount());
    }
  }
  
  protected void finalize()
    throws Throwable
  {
    super.finalize();
    clearMemCache();
  }
  
  public void freezeCache(boolean paramBoolean)
  {
    cacheFrozen = paramBoolean;
    if (!paramBoolean) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      useDiskCaching = paramBoolean;
      return;
    }
  }
  
  public String getCacheAdobeId()
  {
    return cacheAdobeId;
  }
  
  public <T> T getObjectFromGUID(String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet)
  {
    Object localObject1;
    if ((paramString1 == null) || (paramString2 == null)) {
      localObject1 = null;
    }
    Object localObject2;
    do
    {
      return localObject1;
      localObject2 = memCache.get(getCacheKey(paramString1, paramString2));
      localObject1 = localObject2;
    } while (localObject2 != null);
    return getObjectFromDiskWithGUID(paramString1, paramString2, paramEnumSet);
  }
  
  public <T> void getObjectFromGUID(String paramString1, String paramString2, EnumSet<AdobeCommonCacheOptions> paramEnumSet, AdobeCommonCacheHandler<T> paramAdobeCommonCacheHandler, Handler paramHandler)
  {
    if ((paramString1 == null) || (paramString2 == null))
    {
      callHitHandler(paramAdobeCommonCacheHandler, paramHandler, null, AdobeCommonCacheHitLocation.AdobeCommonCacheHitLocationMemory);
      return;
    }
    Date localDate = new Date();
    Object localObject = memCache.get(getCacheKey(paramString1, paramString2));
    if (localObject != null)
    {
      logMemCacheHit(paramString1, paramString2, new Date().getTime() - localDate.getTime());
      callHitHandler(paramAdobeCommonCacheHandler, paramHandler, localObject, AdobeCommonCacheHitLocation.AdobeCommonCacheHitLocationMemory);
      return;
    }
    getObjectFromDiskWithGUID(paramString1, paramString2, paramEnumSet, paramAdobeCommonCacheHandler, paramHandler);
  }
  
  public Date getTimestampForGUID(String paramString1, String paramString2)
  {
    Object localObject = null;
    paramString2 = new File(getCacheDirectoryForGuid(paramString1), paramString2);
    paramString1 = localObject;
    if (paramString2.exists()) {
      paramString1 = new Date(paramString2.lastModified());
    }
    return paramString1;
  }
  
  protected void printStatistics()
  {
    cacheLog("=====================================================");
    cacheLog("Cache Stats:");
    cacheLog("");
    int i = memCacheHits + diskCacheHits + cacheMisses;
    double d3 = 0.0D;
    double d2 = 0.0D;
    double d1 = 0.0D;
    if (i != 0)
    {
      d3 = 100.0D * memCacheHits / i;
      d2 = 100.0D * diskCacheHits / i;
      d1 = 100.0D * cacheMisses / i;
    }
    cacheLog(String.format("%s %6.2f%% %6d", new Object[] { "Memory cache hit rate:", Double.valueOf(d3), Integer.valueOf(memCacheHits) }));
    cacheLog(String.format("%s %6.2f%% %6d", new Object[] { "Disk cache hit rate:", Double.valueOf(d2), Integer.valueOf(diskCacheHits) }));
    cacheLog(String.format("%s %6.2f%% %6d", new Object[] { "Cache miss rate:", Double.valueOf(d1), Integer.valueOf(cacheMisses) }));
    cacheLog(String.format("%s %6.2f%% %6d", new Object[] { "Total:", Double.valueOf(d3 + d2 + d1), Integer.valueOf(i) }));
    cacheLog("");
    cacheLog("");
    cacheLog(String.format("Disk Cache Usage: %6.2f%% %d bytes", new Object[] { Double.valueOf(100.0D * currentDiskCacheSize / diskCacheSize), Long.valueOf(currentDiskCacheSize) }));
    cacheLog("");
    cacheLog("=====================================================");
    cacheLog("");
  }
  
  public void removeItemWithGUID(String paramString1, String paramString2)
  {
    if (cacheFrozen) {
      return;
    }
    File localFile = null;
    if (paramString2 != null)
    {
      memCache.remove(getCacheKey(paramString1, paramString2));
      localFile = new File(getCacheDirectoryForGuid(paramString1), paramString2);
    }
    for (;;)
    {
      try
      {
        diskReadWriteLock.writeLock().lock();
        if ((localFile != null) && (localFile.exists()))
        {
          AdobeLogger.log(Level.INFO, AdobeCommonCacheInstance.class.getName(), "Removing " + paramString2 + " from disk cache");
          if (!localFile.delete()) {
            AdobeLogger.log(Level.ERROR, AdobeCommonCacheInstance.class.getName(), "Cannot delete file " + localFile.getAbsolutePath());
          }
          removeEntryFromCacheMetadata(getCacheKey(paramString1, paramString2));
        }
        return;
      }
      finally
      {
        diskReadWriteLock.writeLock().unlock();
      }
      clearMemCache();
    }
  }
  
  public void removeSetWithGUID(String paramString)
  {
    if (cacheFrozen) {
      return;
    }
    try
    {
      diskReadWriteLock.writeLock().lock();
      File localFile1 = getCacheDirectoryForGuid(paramString);
      clearMemCache();
      if ((localFile1.exists()) && (localFile1.isDirectory()))
      {
        Iterator localIterator = ((List)FileUtils.listFiles(localFile1, TrueFileFilter.INSTANCE, TrueFileFilter.INSTANCE)).iterator();
        while (localIterator.hasNext())
        {
          File localFile2 = (File)localIterator.next();
          String str = localFile2.getName();
          if ((!localFile2.isDirectory()) && (!str.equalsIgnoreCase("modified-data"))) {
            removeEntryFromCacheMetadata(getCacheKey(paramString, str));
          }
        }
      }
      try
      {
        FileUtils.deleteDirectory(localFile1);
        return;
      }
      catch (IOException paramString)
      {
        for (;;)
        {
          AdobeLogger.log(Level.ERROR, AdobeCommonCacheInstance.class.getName(), "Error deleting directory from cache", paramString);
        }
      }
    }
    finally
    {
      diskReadWriteLock.writeLock().unlock();
    }
  }
}
