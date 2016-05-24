package com.adobe.creativesdk.aviary.internal.cds;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.AdobeImageIntent;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser;
import com.adobe.creativesdk.aviary.internal.cds.util.KillException;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageIntentService;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool;
import com.adobe.creativesdk.aviary.internal.utils.BatteryUtils;
import com.adobe.creativesdk.aviary.internal.utils.ConnectionUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.utils.SharedPreferencesUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import org.json.JSONException;

abstract class CdsServiceAbstract
  extends AdobeImageIntentService
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("CdsService");
  private static long mLastUpdateDateTime = 0L;
  private static int mRetryCount = 1;
  private IntentExtra mIntentExtra;
  private ThreadPool mThreadPoolExecutor;
  
  public CdsServiceAbstract(String paramString)
  {
    super(paramString);
  }
  
  private void addAlarm(Context paramContext, long paramLong, Intent paramIntent)
  {
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.setTime(new Date(paramLong));
    paramIntent = PendingIntent.getService(paramContext, 0, paramIntent, 134217728);
    ((AlarmManager)paramContext.getSystemService("alarm")).set(0, localCalendar.getTimeInMillis(), paramIntent);
  }
  
  private boolean consumeManifestPacks(Context paramContext, CdsManifestParser paramCdsManifestParser, HashSet<String> paramHashSet, Operations paramOperations)
    throws Throwable
  {
    logger.log("consumeManifestPacks");
    paramContext = new CdsManifestPacksConsumer.Builder(paramContext).withThreadPool(mThreadPoolExecutor).withWifiOnly(mIntentExtra.wifiOnly).withOperations(paramOperations).withParser(paramCdsManifestParser).build();
    paramContext.consume();
    if (paramHashSet != null) {
      paramHashSet.addAll(paramContext.getAddedOrUpdatedPackTypes());
    }
    return paramContext.getExceptions().size() < 1;
  }
  
  private boolean consumeManifestPacksToBeRemoved(Context paramContext, CdsManifestParser paramCdsManifestParser, HashSet<String> paramHashSet, Operations paramOperations)
    throws Throwable
  {
    logger.log("consumeManifestPacksToBeRemoved");
    paramContext = new CdsManifestPackRemoverConsumer.Builder(paramContext).withParser(paramCdsManifestParser).withOperations(paramOperations).build();
    paramContext.consume();
    if (paramHashSet != null) {
      paramHashSet.addAll(paramContext.getRemovedPacksType());
    }
    return paramContext.getExceptions().size() < 1;
  }
  
  private void consumeManifestPermissions(Context paramContext, CdsManifestParser paramCdsManifestParser)
    throws KillException
  {
    logger.log("consumeManifestPermissions");
    new CdsManifestPermissionConsumer(paramContext, paramCdsManifestParser).consume();
  }
  
  private boolean consumeMessagesToBeRemoved(Context paramContext, CdsManifestParser paramCdsManifestParser)
  {
    logger.log("consumeMessagesToBeRemoved");
    new CdsManifestMessagesRemoverConsumer.Builder(paramContext).withParser(paramCdsManifestParser).build().consume();
    return true;
  }
  
  private boolean consumeNewMessages(Context paramContext, CdsManifestParser paramCdsManifestParser)
    throws Throwable
  {
    logger.log("consumeNewMessages");
    paramContext = new CdsManifestMessagesConsumer.Builder(paramContext).withParser(paramCdsManifestParser).withThreadPool(mThreadPoolExecutor).withWifiOnly(mIntentExtra.wifiOnly).build();
    paramContext.consume();
    return paramContext.getExceptions().size() < 1;
  }
  
  private void downloadAndProcessManifest(long paramLong)
    throws Throwable
  {
    int m = 1;
    logger.log("downloadAndProcessManifest");
    if (paramLong - mLastUpdateDateTime < 5000L)
    {
      logger.warn("wait at least 5 secs before start downloading again");
      return;
    }
    Context localContext = getBaseContext();
    SystemUtils.throwIfUiThread();
    CdsManifestParser localCdsManifestParser = downloadManifest(localContext);
    consumeManifestPermissions(localContext, localCdsManifestParser);
    Object localObject = new HashSet();
    Operations localOperations = new Operations();
    int i;
    if (!consumeManifestPacks(localContext, localCdsManifestParser, (HashSet)localObject, localOperations))
    {
      i = 1;
      if (consumeManifestPacksToBeRemoved(localContext, localCdsManifestParser, (HashSet)localObject, localOperations)) {
        break label154;
      }
    }
    label154:
    for (int j = 1;; j = 0)
    {
      localObject = ((HashSet)localObject).iterator();
      while (((Iterator)localObject).hasNext()) {
        CdsUtils.notifyPackTypeContentUpdated(localContext, (String)((Iterator)localObject).next());
      }
      i = 0;
      break;
    }
    int k;
    if (!consumeNewMessages(localContext, localCdsManifestParser))
    {
      k = 1;
      if (consumeMessagesToBeRemoved(localContext, localCdsManifestParser)) {
        break label236;
      }
      label185:
      if ((i | j | k | m) != 0) {
        break label242;
      }
      updateVersionKey(localContext, localCdsManifestParser);
      mLastUpdateDateTime = System.currentTimeMillis();
    }
    for (;;)
    {
      restorePacksIcons(localContext, localCdsManifestParser);
      CdsUtils.notifyCdsServiceFinished(localContext, localOperations);
      return;
      k = 0;
      break;
      label236:
      m = 0;
      break label185;
      label242:
      logger.error("An error occurred, don't update the version key");
    }
  }
  
  private CdsManifestParser downloadManifest(Context paramContext)
    throws IOException, JSONException
  {
    logger.log("downloadManifest");
    return new CdsManifestDownloader().download(paramContext, getLatestManifestVersion(paramContext), mIntentExtra.wifiOnly);
  }
  
  private void handleCdsDownload(Intent paramIntent)
  {
    logger.log("handleCdsDownload");
    int j = 0;
    int i = 0;
    try
    {
      downloadAndProcessManifest(System.currentTimeMillis());
      if (i != 0) {
        CdsServiceParamsUtils.getInstance().getPreferences(getBaseContext()).setCdsLastExecutionTime(0L);
      }
      if (j != 0)
      {
        clearServiceQueue();
        retrySameIntent(paramIntent, 15000L);
      }
      return;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        logger.warn("exception handled");
        if (!"403:Forbidden".equals(localIOException.getMessage())) {
          break;
        }
        sendDeveloperError(403);
        j = 0;
        i = 1;
        localIOException.printStackTrace();
      }
      if (!mIntentExtra.isLazy) {}
      for (j = 1;; j = 0) {
        break;
      }
    }
    catch (KillException localKillException)
    {
      for (;;)
      {
        localKillException.printStackTrace();
        sendKillSignal();
        i = 1;
      }
    }
    catch (AssertionError localAssertionError)
    {
      if (!mIntentExtra.isLazy) {}
      for (j = 1;; j = 0)
      {
        localAssertionError.printStackTrace();
        i = 1;
        break;
      }
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        logger.error("exception not handled");
        localThrowable.printStackTrace();
        i = 1;
      }
    }
  }
  
  private void handleCdsDownloadExtraAssets()
  {
    logger.log("handleCdsDownloadExtraAssets");
    if (mIntentExtra.downloadExtraAssets) {
      if ((mIntentExtra.wifiOnly) && (!ConnectionUtils.isWifiConnected(this))) {
        break label56;
      }
    }
    label56:
    for (int i = 1; i == 0; i = 0)
    {
      logger.warn("Skipping extra assets download b/c there's no wifi mConnection");
      return;
    }
    Intent localIntent = AdobeImageIntent.createCommonIntent(this, "aviary.intent.action.CDS_DOWNLOAD_EXTRA_ASSETS", CdsAssetsDownloaderService.class);
    localIntent.putExtra("extra-execute-wifi-only", mIntentExtra.wifiOnly);
    localIntent.putExtra("extra-max-items", mIntentExtra.downloadExtraAssetsCount);
    startService(localIntent);
  }
  
  private void handleRestoreOwnedPacks()
  {
    int k = 1;
    logger.log("handleRestoreOwnedPacks");
    if (TextUtils.isEmpty(mIntentExtra.packType)) {
      throw new IllegalArgumentException("PackType cannot be null");
    }
    Context localContext = getBaseContext();
    SystemUtils.throwIfUiThread();
    for (;;)
    {
      try
      {
        localObject = downloadManifest(localContext);
        if (restoreOwnedPacks(localContext, (CdsManifestParser)localObject, mIntentExtra.wifiOnly, null, new String[] { mIntentExtra.packType }).size() <= 0) {
          continue;
        }
        i = 1;
        boolean bool = restorePacksIcons(localContext, (CdsManifestParser)localObject);
        if (bool) {
          continue;
        }
        j = 1;
        i |= j;
      }
      catch (Throwable localThrowable)
      {
        Object localObject;
        int j;
        localThrowable.printStackTrace();
        int i = 1;
        continue;
        i = 0;
        continue;
      }
      localContext = getBaseContext();
      localObject = mIntentExtra.packType;
      if (i == 0) {
        continue;
      }
      i = k;
      CdsUtils.notifyDownloadMissingPacksCompleted(localContext, (String)localObject, i);
      return;
      i = 0;
      continue;
      j = 0;
    }
  }
  
  private void handleRestorePurchases()
  {
    logger.log("handleRestorePurchases");
    SystemUtils.throwIfUiThread();
    Object localObject = null;
    if (TextUtils.isEmpty(mIntentExtra.packType)) {
      localObject = Cds.PackType.fromString(mIntentExtra.packType);
    }
    localObject = new RestoreAllHelper(this, (Cds.PackType)localObject, mIntentExtra.wifiOnly);
    ((RestoreAllHelper)localObject).restoreAll();
    ((RestoreAllHelper)localObject).dispose();
  }
  
  private void removeAlarms(Context paramContext, String paramString)
  {
    AlarmManager localAlarmManager = (AlarmManager)getBaseContext().getSystemService("alarm");
    Intent localIntent = new Intent(paramContext, CdsService.class);
    localIntent.setAction(paramString);
    localAlarmManager.cancel(PendingIntent.getBroadcast(paramContext, 0, localIntent, 134217728));
    localAlarmManager.cancel(PendingIntent.getBroadcast(paramContext, 0, new Intent(paramContext, CdsReceiver.class), 134217728));
  }
  
  private List<Exception> restoreMissingPacks(Context paramContext, CdsManifestParser paramCdsManifestParser, Iterator<String> paramIterator, boolean paramBoolean)
  {
    logger.log("restoreMissingPacks");
    paramContext = new CdsManifestResorePacksConsumer.Builder(paramContext).withThreadPool(mThreadPoolExecutor).withParser(paramCdsManifestParser).withWifiOnly(paramBoolean).withIterator(paramIterator).build();
    paramContext.consume();
    return paramContext.getExceptions();
  }
  
  private boolean restorePacksIcons(Context paramContext, CdsManifestParser paramCdsManifestParser)
    throws Throwable
  {
    logger.log("restorePacksIcons");
    paramContext = new CdsManifestPacksIconsConsumer.Builder(paramContext).withParser(paramCdsManifestParser).withThreadPool(mThreadPoolExecutor).wifiOnly(mIntentExtra.wifiOnly).build();
    paramContext.consume();
    return paramContext.getExceptions().size() < 1;
  }
  
  private void retrySameIntent(Intent paramIntent, long paramLong)
  {
    paramIntent = new Intent(paramIntent);
    logger.log("retrySameIntent");
    int i = mRetryCount;
    mRetryCount = i - 1;
    if (i > 0)
    {
      addAlarm(getBaseContext(), System.currentTimeMillis() + paramLong, paramIntent);
      return;
    }
    mRetryCount = 1;
  }
  
  private void sendKillSignal()
  {
    logger.log("sendKillSignal");
    Intent localIntent = new Intent("aviary.intent.action.KILL");
    localIntent.setPackage(getBaseContext().getPackageName());
    getBaseContext().sendBroadcast(localIntent);
  }
  
  private boolean updateVersionKey(Context paramContext, CdsManifestParser paramCdsManifestParser)
  {
    
    if (paramCdsManifestParser.hasContent())
    {
      if ((paramCdsManifestParser.getVersionKey() != null) && (paramCdsManifestParser.getVersionKey().length() > 0) && (paramCdsManifestParser.getAssetsBaseURL() != null) && (paramCdsManifestParser.getAssetsBaseURL().length() > 0))
      {
        logger.log("** adding the new versionKey: %s", new Object[] { paramCdsManifestParser.getVersionKey() });
        paramContext = new ContentValues();
        paramContext.put("version_versionKey", paramCdsManifestParser.getVersionKey());
        paramContext.put("version_assetsBaseURL", paramCdsManifestParser.getAssetsBaseURL());
        paramContext = getContentResolver().insert(PackageManagerUtils.getCDSProviderContentUri(getBaseContext(), "manifestVersion/insert"), paramContext);
        logger.log("updated manifest version: %s", new Object[] { paramContext });
      }
    }
    else {
      return paramContext != null;
    }
    logger.error("versionKey or assetsBaseUrl is null");
    return false;
  }
  
  String getLatestManifestVersion(Context paramContext)
  {
    paramContext = CdsUtils.getManifestVersion(paramContext);
    if ((paramContext == null) || (TextUtils.isEmpty(paramContext.getVersionKey()))) {
      return null;
    }
    return paramContext.getVersionKey();
  }
  
  public ThreadPool getThreadPool()
  {
    return mThreadPoolExecutor;
  }
  
  public void onCreate()
  {
    super.onCreate();
    mThreadPoolExecutor = new ThreadPool(5, 10);
  }
  
  protected void onHandleIntent(Intent paramIntent)
  {
    int i = 0;
    if (paramIntent == null)
    {
      logger.error("intent cannot be null");
      return;
    }
    String str = paramIntent.getAction();
    mIntentExtra = new IntentExtra(paramIntent);
    logger.info("action: %s", new Object[] { str });
    logger.info("extras: %s", new Object[] { mIntentExtra.toString() });
    if (mIntentExtra.wifiOnly)
    {
      if (!ConnectionUtils.isWifiConnected(getBaseContext())) {
        logger.warn("Not Connected. Stopping..");
      }
    }
    else {
      logger.verbose("Skipping phone mConnection check", new Object[0]);
    }
    if (mIntentExtra.pluggedOnly)
    {
      if (!BatteryUtils.isCharging(getBaseContext(), paramIntent)) {
        logger.error("Phone not Charging. Stopping..");
      }
    }
    else {
      logger.verbose("Skiping phone charging check", new Object[0]);
    }
    if (mIntentExtra.isLazy)
    {
      SharedPreferencesUtils localSharedPreferencesUtils = CdsServiceParamsUtils.getInstance().getPreferences(getBaseContext());
      long l = System.currentTimeMillis();
      if (Math.abs(l - localSharedPreferencesUtils.getCdsLastExecutionTime()) < 28800000L)
      {
        logger.verbose("Service already started. Stopping..", new Object[0]);
        return;
      }
      localSharedPreferencesUtils.setCdsLastExecutionTime(l);
    }
    removeAlarms(getBaseContext(), str);
    switch (str.hashCode())
    {
    default: 
      label292:
      i = -1;
    }
    for (;;)
    {
      switch (i)
      {
      default: 
        return;
      case 0: 
        handleCdsDownload(paramIntent);
        handleCdsDownloadExtraAssets();
        return;
        if (!str.equals("aviary.intent.action.CDS_DOWNLOAD_START")) {
          break label292;
        }
        continue;
        if (!str.equals("aviary.intent.action.CDS_RESTORE_USER_ITEMS")) {
          break label292;
        }
        i = 1;
        continue;
        if (!str.equals("aviary.intent.action.CDS_RESTORE_OWNED_PACKS")) {
          break label292;
        }
        i = 2;
      }
    }
    handleRestorePurchases();
    return;
    handleRestoreOwnedPacks();
  }
  
  List<Exception> restoreOwnedPacks(Context paramContext, CdsManifestParser paramCdsManifestParser, boolean paramBoolean, List<String> paramList, String... paramVarArgs)
  {
    logger.log("restoreOwnedPacks");
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    CdsStorePurchasesConsumer localCdsStorePurchasesConsumer = new CdsStorePurchasesConsumer.Builder(paramContext).build();
    HashSet localHashSet = localCdsStorePurchasesConsumer.consume();
    if (localHashSet != null)
    {
      localArrayList2.addAll(localHashSet);
      if (paramList != null) {
        paramList.addAll(localHashSet);
      }
    }
    localArrayList1.addAll(localCdsStorePurchasesConsumer.getExceptions());
    logger.verbose("purchased list size: %s", new Object[] { localArrayList2 });
    if (localArrayList2.size() > 0)
    {
      paramList = new ArrayList();
      int j = paramVarArgs.length;
      int i = 0;
      while (i < j)
      {
        paramList.addAll(CdsUtils.extractSkuByPackType(localArrayList2, paramVarArgs[i]));
        i += 1;
      }
      localArrayList1.addAll(restoreMissingPacks(paramContext, paramCdsManifestParser, paramList.iterator(), paramBoolean));
    }
    return localArrayList1;
  }
  
  protected abstract void sendDeveloperError(int paramInt);
  
  private final class IntentExtra
  {
    private final boolean downloadExtraAssets;
    private final int downloadExtraAssetsCount;
    private final boolean isLazy;
    private final String packType;
    private final boolean pluggedOnly;
    private final String reason;
    private final boolean wifiOnly;
    
    IntentExtra(Intent paramIntent)
    {
      downloadExtraAssets = paramIntent.getBooleanExtra("extra-download-extra-assets", false);
      downloadExtraAssetsCount = paramIntent.getIntExtra("extra-max-items", -1);
      isLazy = paramIntent.getBooleanExtra("extra-lazy-execution", false);
      wifiOnly = paramIntent.getBooleanExtra("extra-execute-wifi-only", false);
      pluggedOnly = paramIntent.getBooleanExtra("extra-execute-plugged-only", false);
      packType = paramIntent.getStringExtra("extra-pack-type");
      reason = paramIntent.getStringExtra("extra-reason");
    }
    
    public String toString()
    {
      return String.format(Locale.ROOT, "{downloadExtraAssets: %b, downloadExtraAssetsCount: %d, isLazy: %b, wifiOnly: %b, pluggedOnly: %b, reason: %s}", new Object[] { Boolean.valueOf(downloadExtraAssets), Integer.valueOf(downloadExtraAssetsCount), Boolean.valueOf(isLazy), Boolean.valueOf(wifiOnly), Boolean.valueOf(pluggedOnly), reason });
    }
  }
}
