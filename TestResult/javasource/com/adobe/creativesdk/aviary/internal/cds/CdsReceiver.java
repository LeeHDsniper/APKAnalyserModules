package com.adobe.creativesdk.aviary.internal.cds;

import android.annotation.SuppressLint;
import android.app.AlarmManager;
import android.app.DownloadManager;
import android.app.DownloadManager.Query;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.NetworkInfo;
import android.net.NetworkInfo.DetailedState;
import android.net.NetworkInfo.State;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.SystemClock;
import com.adobe.creativesdk.aviary.AdobeImageIntent;
import com.adobe.creativesdk.aviary.internal.receipt.IReceiptManager;
import com.adobe.creativesdk.aviary.internal.receipt.ReceiptFactory;
import com.adobe.creativesdk.aviary.internal.utils.AviaryNotificationManager;
import com.adobe.creativesdk.aviary.internal.utils.ConnectionUtils;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import com.adobe.creativesdk.aviary.utils.SharedPreferencesUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import junit.framework.Assert;

public final class CdsReceiver
  extends BroadcastReceiver
{
  static final LoggerFactory.Logger LOGGER = LoggerFactory.getLogger("AdobeImageCdsReceiver", LoggerFactory.LoggerType.ConsoleLoggerType);
  
  public CdsReceiver() {}
  
  private PendingIntent getDeleteDownloadAlarmPendingIntent(Context paramContext, long paramLong)
  {
    Intent localIntent = new Intent(paramContext, CdsReceiver.class);
    localIntent.setAction("aviary.android.cds.intent.action.ACTION_REMOVE_DOWNLOAD_CONTENT");
    localIntent.setData(Uri.parse("content://" + paramContext.getPackageName() + ".AdobeImageCdsReceiver/removeDownloadedPack/" + paramLong));
    localIntent.putExtra("entryId", paramLong);
    return PendingIntent.getBroadcast(paramContext, 0, localIntent, 134217728);
  }
  
  private long getPackIdFromDownload(Cursor paramCursor)
  {
    if ((paramCursor != null) && (paramCursor.moveToFirst()))
    {
      int i = paramCursor.getColumnIndex("download_packId");
      if (i > -1) {
        return paramCursor.getLong(i);
      }
    }
    return -1L;
  }
  
  private SharedPreferencesUtils getPreferences(Context paramContext)
  {
    return SharedPreferencesUtils.getInstance(paramContext);
  }
  
  @SuppressLint({"InlinedApi"})
  private void handleActionDownloadComplete(Context paramContext, long paramLong)
  {
    DownloadManager localDownloadManager = (DownloadManager)paramContext.getSystemService("download");
    Object localObject2 = paramContext.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(paramContext, "downloadPackId/" + paramLong), new String[] { "download_packId" }, null, null, null);
    long l = getPackIdFromDownload((Cursor)localObject2);
    IOUtils.closeSilently((Cursor)localObject2);
    if (l == -1L) {
      return;
    }
    localObject2 = new DownloadManager.Query();
    ((DownloadManager.Query)localObject2).setFilterById(new long[] { paramLong });
    localObject2 = localDownloadManager.query((DownloadManager.Query)localObject2);
    if (localObject2 != null) {}
    for (;;)
    {
      int i;
      try
      {
        if (!((Cursor)localObject2).moveToFirst()) {
          break label704;
        }
        i = ((Cursor)localObject2).getColumnIndex("status");
        PacksColumns.PackCursorWrapper localPackCursorWrapper = CdsUtils.getPackContentById(paramContext, l, new String[] { "pack_id", "pack_type", "pack_identifier", "content_id", "content_packId", "content_iconPath", "content_displayName", "content_displayDescription", "content_purchased" });
        if ((localPackCursorWrapper == null) || (localPackCursorWrapper.getContent() == null)) {
          throw new AviaryPackageNeedsRedownloadException("Pack information not found...fatal database error");
        }
      }
      catch (AviaryPackageNeedsRedownloadException localAviaryPackageNeedsRedownloadException)
      {
        LOGGER.warn("Package needs redownload");
        localDownloadManager.remove(new long[] { paramLong });
        setNotificationForRedownloadPackage(paramContext, l, localAviaryPackageNeedsRedownloadException.getMessage());
        return;
        i = ((Cursor)localObject2).getInt(i);
        LOGGER.verbose("downloadStatus: " + i, new Object[0]);
        if (paramContext.getContentResolver().update(PackageManagerUtils.getCDSProviderContentUri(paramContext, "download/id/" + paramLong + "/updateStatus/" + i), new ContentValues(), null, null) <= 0) {
          break label779;
        }
        CdsUtils.notifyDownloadStatusChange(paramContext, l, localAviaryPackageNeedsRedownloadException.getPackType(), i);
        break label779;
        LOGGER.warn("not handled: " + i);
        return;
        Object localObject3 = ((Cursor)localObject2).getString(((Cursor)localObject2).getColumnIndex("local_uri"));
        LOGGER.log("uriString: " + (String)localObject3);
        if (localObject3 == null) {
          break label595;
        }
        localObject3 = Uri.parse((String)localObject3).getPath();
        LOGGER.log("path: %s", new Object[] { localObject3 });
        if (localObject3 != null)
        {
          localObject3 = new File((String)localObject3);
          handleDownloadSuccessful(paramContext, localAviaryPackageNeedsRedownloadException, localAviaryPackageNeedsRedownloadException.getContent(), (File)localObject3);
          continue;
        }
      }
      finally
      {
        IOUtils.closeSilently((Cursor)localObject2);
        setDeleteDownloadAlarm(paramContext, paramLong);
      }
      throw new AviaryPackageNeedsRedownloadException("Download failed for " + localAviaryPackageNeedsRedownloadException.getContent().getDisplayName() + ". Path is null");
      label595:
      throw new AviaryPackageNeedsRedownloadException("Download failed for " + localAviaryPackageNeedsRedownloadException.getContent().getDisplayName() + ". Uri string is null");
      throw new AviaryPackageNeedsRedownloadException("Download failed for " + localAviaryPackageNeedsRedownloadException.getContent().getDisplayName() + ". " + CdsUtils.getReasonText(16, ((Cursor)localObject2).getInt(((Cursor)localObject2).getColumnIndex("reason"))));
      label704:
      LOGGER.warn("Download cursor for downloadId " + paramLong + " not valid.");
      LOGGER.log("throw the exception");
      throw new AviaryPackageNeedsRedownloadException("Try to download again item id " + l);
      label779:
      switch (i)
      {
      }
    }
  }
  
  private void handleActionDownloadPacksContent(Context paramContext, Intent paramIntent)
  {
    long l = paramIntent.getLongExtra("entryId", -1L);
    paramIntent = CdsDownloaderFactory.create(Cds.ContentType.CONTENT);
    try
    {
      paramIntent = paramIntent.download(paramContext, l);
      LOGGER.log("result: " + paramIntent);
      return;
    }
    catch (Exception paramIntent)
    {
      setNotificationForRedownloadPackage(paramContext, l, paramIntent.getMessage());
    }
  }
  
  private void handleConnectivityChange(Context paramContext, Intent paramIntent)
  {
    boolean bool1;
    boolean bool2;
    if ("android.net.wifi.STATE_CHANGE".equals(paramIntent.getAction()))
    {
      paramIntent = (NetworkInfo)paramIntent.getParcelableExtra("networkInfo");
      if (NetworkInfo.State.CONNECTED != paramIntent.getState()) {
        break label209;
      }
      bool1 = true;
      LOGGER.verbose("connected: %b", new Object[] { Boolean.valueOf(bool1) });
      if ((paramIntent.getType() != 1) && (paramIntent.getType() != 6) && (paramIntent.getType() != 9)) {
        break label215;
      }
      bool2 = true;
      label89:
      LOGGER.verbose("isWifi: %b", new Object[] { Boolean.valueOf(bool2) });
      if ((!bool1) || (!bool2) || (NetworkInfo.DetailedState.CONNECTED != paramIntent.getDetailedState())) {
        break label221;
      }
    }
    label209:
    label215:
    label221:
    for (int i = 1;; i = 0)
    {
      if (i == 0) {
        break label226;
      }
      LOGGER.warn("CONNECTED");
      paramIntent = AdobeImageIntent.createCdsInitIntent(paramContext, "wifi-connected");
      paramIntent.putExtra("extra-lazy-execution", true);
      paramIntent.putExtra("extra-execute-wifi-only", true);
      paramIntent.putExtra("extra-execute-plugged-only", true);
      paramIntent.putExtra("extra-download-extra-assets", true);
      paramIntent.putExtra("extra-max-items", 3);
      paramContext.startService(paramIntent);
      return;
      bool1 = false;
      break;
      bool2 = false;
      break label89;
    }
    label226:
    LOGGER.verbose("not connected", new Object[0]);
  }
  
  private void handleDeleteDownloadEntry(Context paramContext, Intent paramIntent)
  {
    if (paramIntent != null)
    {
      long l = paramIntent.getLongExtra("entryId", -1L);
      paramContext = (DownloadManager)paramContext.getSystemService("download");
      if (paramContext != null)
      {
        if (Build.VERSION.SDK_INT < 11) {
          tryDeleteDownloadedFile(paramContext, l);
        }
        paramContext.remove(new long[] { l });
      }
    }
  }
  
  /* Error */
  private void handleDownloadSuccessful(Context paramContext, PacksColumns.PackCursorWrapper paramPackCursorWrapper, PacksContentColumns.ContentCursorWrapper paramContentCursorWrapper, File paramFile)
    throws CdsReceiver.AviaryPackageNeedsRedownloadException
  {
    // Byte code:
    //   0: aload_2
    //   1: invokevirtual 443	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getId	()J
    //   4: lstore 5
    //   6: aload_0
    //   7: aload_1
    //   8: aload_3
    //   9: invokevirtual 446	com/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper:getPackId	()J
    //   12: aload_2
    //   13: invokevirtual 256	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getPackType	()Ljava/lang/String;
    //   16: aload 4
    //   18: invokespecial 450	com/adobe/creativesdk/aviary/internal/cds/CdsReceiver:validatePackContentZip	(Landroid/content/Context;JLjava/lang/String;Ljava/io/File;)Z
    //   21: istore 7
    //   23: getstatic 27	com/adobe/creativesdk/aviary/internal/cds/CdsReceiver:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   26: ldc_w 452
    //   29: iconst_1
    //   30: anewarray 238	java/lang/Object
    //   33: dup
    //   34: iconst_0
    //   35: iload 7
    //   37: invokestatic 380	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   40: aastore
    //   41: invokeinterface 280 3 0
    //   46: iload 7
    //   48: ifeq +233 -> 281
    //   51: aload_0
    //   52: aload 4
    //   54: aload_1
    //   55: aload_2
    //   56: invokevirtual 455	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getIdentifier	()Ljava/lang/String;
    //   59: invokespecial 459	com/adobe/creativesdk/aviary/internal/cds/CdsReceiver:unpackZipFile	(Ljava/io/File;Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    //   62: astore 8
    //   64: getstatic 27	com/adobe/creativesdk/aviary/internal/cds/CdsReceiver:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   67: ldc_w 461
    //   70: invokeinterface 273 2 0
    //   75: aload 4
    //   77: invokestatic 465	com/adobe/creativesdk/aviary/internal/utils/IOUtils:deleteQuietly	(Ljava/io/File;)Z
    //   80: pop
    //   81: new 248	android/content/ContentValues
    //   84: dup
    //   85: invokespecial 249	android/content/ContentValues:<init>	()V
    //   88: astore 4
    //   90: aload 4
    //   92: ldc_w 467
    //   95: aload 8
    //   97: invokevirtual 470	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   100: invokevirtual 474	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   103: aload_1
    //   104: invokevirtual 134	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   107: aload_1
    //   108: new 46	java/lang/StringBuilder
    //   111: dup
    //   112: invokespecial 47	java/lang/StringBuilder:<init>	()V
    //   115: ldc_w 476
    //   118: invokevirtual 53	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   121: aload_2
    //   122: invokevirtual 443	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getId	()J
    //   125: invokevirtual 64	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   128: ldc_w 478
    //   131: invokevirtual 53	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   134: aload_3
    //   135: invokevirtual 479	com/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper:getId	()J
    //   138: invokevirtual 64	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   141: ldc_w 481
    //   144: invokevirtual 53	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   147: invokevirtual 67	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   150: invokestatic 142	com/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils:getCDSProviderContentUri	(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    //   153: aload 4
    //   155: aconst_null
    //   156: aconst_null
    //   157: invokevirtual 253	android/content/ContentResolver:update	(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    //   160: ifle +107 -> 267
    //   163: aload_1
    //   164: aload_2
    //   165: invokevirtual 256	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getPackType	()Ljava/lang/String;
    //   168: invokestatic 485	com/adobe/creativesdk/aviary/internal/cds/CdsUtils:notifyPackTypeContentUpdated	(Landroid/content/Context;Ljava/lang/String;)V
    //   171: aload_1
    //   172: lload 5
    //   174: invokestatic 488	com/adobe/creativesdk/aviary/internal/cds/CdsUtils:notifyPackContentUpdate	(Landroid/content/Context;J)V
    //   177: aload_1
    //   178: lload 5
    //   180: aload_2
    //   181: invokevirtual 256	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getPackType	()Ljava/lang/String;
    //   184: iconst_1
    //   185: invokestatic 491	com/adobe/creativesdk/aviary/internal/cds/CdsUtils:notifyPackInstalled	(Landroid/content/Context;JLjava/lang/String;I)V
    //   188: invokestatic 496	com/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager:getInstance	()Lcom/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager;
    //   191: aload_1
    //   192: aload_3
    //   193: invokevirtual 499	com/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper:getIconPath	()Ljava/lang/String;
    //   196: aload_3
    //   197: invokevirtual 295	com/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper:getDisplayName	()Ljava/lang/String;
    //   200: invokevirtual 502	com/adobe/creativesdk/aviary/internal/utils/AviaryNotificationManager:notifyPackInstalled	(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    //   203: return
    //   204: astore_1
    //   205: aload_1
    //   206: invokevirtual 505	java/lang/Throwable:printStackTrace	()V
    //   209: new 282	java/io/File
    //   212: dup
    //   213: aload_2
    //   214: invokevirtual 455	com/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper:getIdentifier	()Ljava/lang/String;
    //   217: invokestatic 509	com/adobe/creativesdk/aviary/internal/cds/CdsUtils:getPackItemsContentPath	(Ljava/lang/String;)Ljava/lang/String;
    //   220: invokespecial 284	java/io/File:<init>	(Ljava/lang/String;)V
    //   223: invokestatic 465	com/adobe/creativesdk/aviary/internal/utils/IOUtils:deleteQuietly	(Ljava/io/File;)Z
    //   226: pop
    //   227: new 6	com/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException
    //   230: dup
    //   231: aload_0
    //   232: ldc_w 511
    //   235: invokespecial 205	com/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException:<init>	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;Ljava/lang/String;)V
    //   238: athrow
    //   239: astore_1
    //   240: getstatic 27	com/adobe/creativesdk/aviary/internal/cds/CdsReceiver:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   243: ldc_w 461
    //   246: invokeinterface 273 2 0
    //   251: aload 4
    //   253: invokestatic 465	com/adobe/creativesdk/aviary/internal/utils/IOUtils:deleteQuietly	(Ljava/io/File;)Z
    //   256: pop
    //   257: aload_1
    //   258: athrow
    //   259: astore_1
    //   260: aload_1
    //   261: invokevirtual 512	java/lang/Exception:printStackTrace	()V
    //   264: goto -37 -> 227
    //   267: getstatic 27	com/adobe/creativesdk/aviary/internal/cds/CdsReceiver:LOGGER	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   270: ldc_w 514
    //   273: invokeinterface 517 2 0
    //   278: goto -90 -> 188
    //   281: new 6	com/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException
    //   284: dup
    //   285: aload_0
    //   286: ldc_w 519
    //   289: invokespecial 205	com/adobe/creativesdk/aviary/internal/cds/CdsReceiver$AviaryPackageNeedsRedownloadException:<init>	(Lcom/adobe/creativesdk/aviary/internal/cds/CdsReceiver;Ljava/lang/String;)V
    //   292: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	293	0	this	CdsReceiver
    //   0	293	1	paramContext	Context
    //   0	293	2	paramPackCursorWrapper	PacksColumns.PackCursorWrapper
    //   0	293	3	paramContentCursorWrapper	PacksContentColumns.ContentCursorWrapper
    //   0	293	4	paramFile	File
    //   4	175	5	l	long
    //   21	26	7	bool	boolean
    //   62	34	8	localFile	File
    // Exception table:
    //   from	to	target	type
    //   51	64	204	java/lang/Throwable
    //   51	64	239	finally
    //   205	209	239	finally
    //   209	227	239	finally
    //   227	239	239	finally
    //   260	264	239	finally
    //   209	227	259	java/lang/Exception
  }
  
  private void handleNotificationDismiss(Context paramContext)
  {
    AviaryNotificationManager.getInstance().cancelPackInstalledNotification(paramContext);
    handleNotificationDismissed(paramContext);
  }
  
  private void handleNotificationDismissed(Context paramContext)
  {
    paramContext = getPreferences(paramContext);
    paramContext.remove("aviary.notifications.packs_installed_count");
    paramContext.remove("aviary.notifications.packs_installed_list");
  }
  
  private void handlePackageReplaced(Context paramContext)
  {
    if (ConnectionUtils.isWifiConnected(paramContext))
    {
      Intent localIntent = AdobeImageIntent.createCdsInitIntent(paramContext, "package-replaced");
      localIntent.putExtra("extra-lazy-execution", true);
      localIntent.putExtra("extra-execute-wifi-only", true);
      localIntent.putExtra("extra-execute-plugged-only", false);
      localIntent.putExtra("extra-download-extra-assets", true);
      localIntent.putExtra("extra-max-items", 3);
      paramContext.startService(localIntent);
      return;
    }
    LOGGER.verbose("not connected", new Object[0]);
  }
  
  private void handlePowerConnected(Context paramContext, Intent paramIntent)
  {
    if (ConnectionUtils.isWifiConnected(paramContext))
    {
      Intent localIntent = AdobeImageIntent.createCdsInitIntent(paramContext, "power-connected");
      localIntent.putExtra("extra-lazy-execution", true);
      localIntent.putExtra("extra-execute-wifi-only", true);
      localIntent.putExtra("extra-execute-plugged-only", true);
      localIntent.putExtra("extra-download-extra-assets", true);
      localIntent.putExtra("extra-max-items", 3);
      paramContext.startService(localIntent);
      if (paramIntent.getIntExtra("plugged", -1) == 1)
      {
        paramContext = ReceiptFactory.getReceiptManager(paramContext);
        if (paramContext != null)
        {
          paramContext.open();
          paramContext.upload();
          paramContext.close();
        }
      }
      return;
    }
    LOGGER.verbose("not connected", new Object[0]);
  }
  
  private void setDeleteDownloadAlarm(Context paramContext, long paramLong)
  {
    long l = SystemClock.elapsedRealtime();
    PendingIntent localPendingIntent = getDeleteDownloadAlarmPendingIntent(paramContext, paramLong);
    ((AlarmManager)paramContext.getSystemService("alarm")).set(3, l + 1000L, localPendingIntent);
  }
  
  private void setNotificationForRedownloadPackage(Context paramContext, long paramLong, String paramString)
  {
    String str = null;
    PacksColumns.PackCursorWrapper localPackCursorWrapper = CdsUtils.getPackContentById(paramContext, paramLong, new String[] { "pack_id", "pack_type", "content_id", "content_packId", "content_contentURL", "content_displayName" });
    int i = paramContext.getContentResolver().delete(PackageManagerUtils.getCDSProviderContentUri(paramContext, "pack/" + paramLong + "/delete_download_entry"), null, null);
    LOGGER.info(i + " entries deleted in download_packs_table for packId " + paramLong);
    AviaryNotificationManager localAviaryNotificationManager = AviaryNotificationManager.getInstance();
    if (localPackCursorWrapper.getContent() != null) {
      str = localPackCursorWrapper.getContent().getDisplayName();
    }
    localAviaryNotificationManager.notifyPackDownloadFailed(paramContext, paramLong, paramString, str);
    CdsUtils.notifyDownloadStatusChange(paramContext, paramLong, localPackCursorWrapper.getPackType(), 16);
  }
  
  private void tryDeleteDownloadedFile(DownloadManager paramDownloadManager, long paramLong)
  {
    Object localObject1 = new DownloadManager.Query();
    ((DownloadManager.Query)localObject1).setFilterById(new long[] { paramLong });
    paramDownloadManager = paramDownloadManager.query((DownloadManager.Query)localObject1);
    if (paramDownloadManager != null) {}
    try
    {
      paramDownloadManager.moveToFirst();
      int i = paramDownloadManager.getColumnIndex("local_uri");
      if (i > -1)
      {
        localObject1 = paramDownloadManager.getString(i);
        LOGGER.log("filename: %s", new Object[] { localObject1 });
        if (localObject1 != null)
        {
          boolean bool = new File((String)localObject1).delete();
          LOGGER.log("deleted: %b", new Object[] { Boolean.valueOf(bool) });
        }
      }
      return;
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
      return;
    }
    finally
    {
      IOUtils.closeSilently(paramDownloadManager);
    }
  }
  
  private File unpackZipFile(File paramFile, Context paramContext, String paramString)
    throws IOException, AssertionError
  {
    return unpackZipFile(new FileInputStream(paramFile), paramContext, paramString);
  }
  
  private File unpackZipFile(InputStream paramInputStream, Context paramContext, String paramString)
    throws IOException, AssertionError
  {
    paramString = CdsUtils.getPackItemsContentPath(paramString);
    paramContext = new File(paramContext.getFilesDir(), paramString);
    paramContext.mkdirs();
    Assert.assertTrue(paramContext.isDirectory());
    paramContext.setReadable(true, false);
    IOUtils.unzip(paramInputStream, paramContext);
    return paramContext;
  }
  
  private boolean validatePackContentZip(Context paramContext, long paramLong, String paramString, File paramFile)
  {
    Cds.PackType localPackType = convertPackType(paramString);
    if (localPackType == null)
    {
      LOGGER.error("unrecognized packtype: " + paramString);
      return false;
    }
    paramString = CdsValidatorFactory.create(Cds.ContentType.CONTENT, localPackType);
    try
    {
      boolean bool = paramString.validate(paramContext, paramLong, paramFile, true);
      return bool;
    }
    catch (AssertionError paramContext)
    {
      paramContext.printStackTrace();
      LOGGER.error("failed to validate package, " + paramContext.getMessage());
    }
    return false;
  }
  
  Cds.PackType convertPackType(String paramString)
  {
    try
    {
      paramString = Cds.PackType.valueOf(paramString.toUpperCase(Locale.US));
      return paramString;
    }
    catch (Exception paramString) {}
    return null;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    int i = 0;
    LOGGER.info("onReceive: %s", new Object[] { paramIntent });
    String str = paramIntent.getAction();
    switch (str.hashCode())
    {
    default: 
      label116:
      i = -1;
    }
    for (;;)
    {
      switch (i)
      {
      default: 
        return;
        if (!str.equals("android.intent.action.DOWNLOAD_COMPLETE")) {
          break label116;
        }
        continue;
        if (!str.equals("aviary.android.cds.intent.action.ACTION_DOWNLOAD_PACKS_CONTENT")) {
          break label116;
        }
        i = 1;
        continue;
        if (!str.equals("aviary.android.cds.intent.action.ACTION_REMOVE_DOWNLOAD_CONTENT")) {
          break label116;
        }
        i = 2;
        continue;
        if (!str.equals("aviary.android.cds.intent.action.ACTION_NOTIFICATION_DISMISSED")) {
          break label116;
        }
        i = 3;
        continue;
        if (!str.equals("android.net.wifi.supplicant.CONNECTION_CHANGE")) {
          break label116;
        }
        i = 4;
        continue;
        if (!str.equals("android.net.wifi.STATE_CHANGE")) {
          break label116;
        }
        i = 5;
        continue;
        if (!str.equals("android.intent.action.ACTION_POWER_CONNECTED")) {
          break label116;
        }
        i = 6;
        continue;
        if (!str.equals("android.intent.action.MY_PACKAGE_REPLACED")) {
          break label116;
        }
        i = 7;
        continue;
        if (!str.equals("aviary.android.cds.intent.action.ACTION_NOTIFICATION_DISMISS")) {
          break label116;
        }
        i = 8;
      }
    }
    handleActionDownloadComplete(paramContext, paramIntent.getLongExtra("extra_download_id", 0L));
    return;
    handleActionDownloadPacksContent(paramContext, paramIntent);
    return;
    handleDeleteDownloadEntry(paramContext, paramIntent);
    return;
    handleNotificationDismissed(paramContext);
    return;
    handleConnectivityChange(paramContext, paramIntent);
    return;
    handleConnectivityChange(paramContext, paramIntent);
    return;
    handlePowerConnected(paramContext, paramIntent);
    return;
    handlePackageReplaced(paramContext);
    return;
    handleNotificationDismiss(paramContext);
  }
  
  private class AviaryPackageNeedsRedownloadException
    extends Exception
  {
    private static final long serialVersionUID = 1L;
    
    AviaryPackageNeedsRedownloadException(String paramString)
    {
      super();
    }
  }
}
