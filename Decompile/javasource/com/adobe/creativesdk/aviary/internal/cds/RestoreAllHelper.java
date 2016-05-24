package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.MergeCursor;
import com.adobe.creativesdk.aviary.internal.cds.json.CdsManifestParser;
import com.adobe.creativesdk.aviary.internal.utils.AviaryNotificationManager;
import com.adobe.creativesdk.aviary.internal.utils.AviaryNotificationManager.RestoreNotification;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;

public final class RestoreAllHelper
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("RestoreAllHelper");
  Context context;
  Cds.PackType packType;
  AviaryNotificationManager.RestoreNotification progressNotification;
  CdsServiceAbstract service;
  boolean wifiOnly;
  
  RestoreAllHelper(CdsServiceAbstract paramCdsServiceAbstract, Cds.PackType paramPackType, boolean paramBoolean)
  {
    service = paramCdsServiceAbstract;
    context = paramCdsServiceAbstract.getBaseContext();
    packType = paramPackType;
    wifiOnly = paramBoolean;
  }
  
  private ArrayList<PacksColumns.PackCursorWrapper> acquireRestoreList(List<String> paramList)
    throws Exception
  {
    int i = 0;
    logger.log("acquireRestoreList");
    ArrayList localArrayList = new ArrayList();
    Object localObject1;
    if (packType != null) {
      localObject1 = acquireRestoreListCursor(packType);
    }
    while (localObject1 != null)
    {
      try
      {
        logger.log("cursor.size: %d", new Object[] { Integer.valueOf(((Cursor)localObject1).getCount()) });
        while (((Cursor)localObject1).moveToNext())
        {
          localObject2 = PacksColumns.PackCursorWrapper.create((Cursor)localObject1);
          ((PacksColumns.PackCursorWrapper)localObject2).setContent(PacksContentColumns.ContentCursorWrapper.create((Cursor)localObject1));
          if (paramList.contains(((PacksColumns.PackCursorWrapper)localObject2).getIdentifier())) {
            localArrayList.add(localObject2);
          }
        }
        localObject1 = new Cursor[Cds.PackType.values().length];
      }
      finally
      {
        IOUtils.closeSilently((Cursor)localObject1);
      }
      int j = 0;
      Object localObject2 = Cds.PackType.values();
      int k = localObject2.length;
      while (i < k)
      {
        localObject1[j] = acquireRestoreListCursor(localObject2[i]);
        j += 1;
        i += 1;
      }
      localObject1 = new MergeCursor((Cursor[])localObject1);
      continue;
      IOUtils.closeSilently((Cursor)localObject1);
      return localArrayList;
    }
    throw new Exception("Restore list is empty");
  }
  
  private Cursor acquireRestoreListCursor(Cds.PackType paramPackType)
  {
    logger.log("acquireRestoreListCursor");
    return context.getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(context, "pack/type/" + paramPackType.toCdsString() + "/content/restore/list"), new String[] { "pack_id as _id", "pack_id", "pack_type", "pack_identifier", "content_id", "content_contentPath", "content_contentURL", "content_displayName", "content_iconPath", "content_iconUrl", "content_isFree", "content_purchased", "content_packId", "content_numItems" }, null, null, "pack_id ASC");
  }
  
  private void dismissCdsReceiverNotification()
  {
    Intent localIntent = new Intent(context, CdsReceiver.class);
    localIntent.setAction("aviary.android.cds.intent.action.ACTION_NOTIFICATION_DISMISS");
    context.sendBroadcast(localIntent);
  }
  
  private CdsManifestParser downloadManifest()
    throws IOException, JSONException
  {
    logger.log("downloadManifest");
    return new CdsManifestDownloader().download(context, service.getLatestManifestVersion(context), wifiOnly);
  }
  
  private List<Exception> downloadMissingIcons(ArrayList<PacksColumns.PackCursorWrapper> paramArrayList, CdsManifestParser paramCdsManifestParser)
  {
    logger.log("downloadMissingIcons");
    ArrayList localArrayList = new ArrayList();
    paramArrayList = new CdsManifestPacksIconsConsumer.Builder(context).withParser(paramCdsManifestParser).withDefinedList(paramArrayList).withThreadPool(service.getThreadPool()).wifiOnly(wifiOnly).build();
    paramArrayList.consume();
    localArrayList.addAll(paramArrayList.getExceptions());
    return localArrayList;
  }
  
  private List<Exception> downloadPacks(List<PacksColumns.PackCursorWrapper> paramList, int paramInt1, int paramInt2)
  {
    int i = paramList.size();
    double d1 = 0.0D;
    double d2 = paramInt2 - paramInt1;
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramList.iterator();
    PacksColumns.PackCursorWrapper localPackCursorWrapper;
    Object localObject;
    String str2;
    for (;;)
    {
      if (!localIterator.hasNext()) {
        break label293;
      }
      localPackCursorWrapper = (PacksColumns.PackCursorWrapper)localIterator.next();
      long l = localPackCursorWrapper.getId();
      localObject = null;
      str2 = localPackCursorWrapper.getIdentifier();
      paramList = null;
      try
      {
        String str1 = CdsUtils.requestPackDownload(context, l, true);
        localObject = str1;
      }
      catch (Throwable paramList)
      {
        for (;;)
        {
          continue;
          localArrayList.add(new Exception("Download failed for " + str2));
          continue;
          logger.log("started download request for %s (result:%s)", new Object[] { localPackCursorWrapper.getIdentifier(), localObject });
        }
      }
      if (localObject != null) {
        break label262;
      }
      logger.error("failed to start download for " + str2);
      if (paramList == null) {
        break;
      }
      localArrayList.add(new Exception("Failed to download " + str2 + ". " + paramList.toString()));
      localIterator.remove();
      updateProgressNotification(100, paramInt1 + (int)(d1 / i * d2), false);
      SystemUtils.trySleep(1000L);
      d1 += 1.0D;
    }
    label262:
    label293:
    return localArrayList;
  }
  
  private void notifyComplete(Context paramContext, ArrayList<PacksColumns.PackCursorWrapper> paramArrayList)
  {
    if ((paramArrayList == null) || (paramArrayList.size() == 0)) {
      progressNotification.alertNothingToRestore();
    }
  }
  
  private void onComplete(Context paramContext, ArrayList<PacksColumns.PackCursorWrapper> paramArrayList, List<Exception> paramList)
  {
    logger.log("onComplete");
    progressNotification.cancel();
    if (paramList.size() == 0)
    {
      notifyComplete(paramContext, paramArrayList);
      return;
    }
    AviaryNotificationManager.getInstance().notifyRestoreCompleteWithErrors(paramContext, paramList);
  }
  
  private void restoreAllInternal()
  {
    localArrayList = new ArrayList();
    try
    {
      localCdsManifestParser = downloadManifest();
      updateProgressNotification(100, 5, false);
      localObject2 = restorePurchases(localArrayList, localCdsManifestParser);
      updateProgressNotification(100, 35, false);
      localObject1 = null;
    }
    catch (Exception localException1)
    {
      CdsManifestParser localCdsManifestParser;
      Object localObject2;
      Object localObject1;
      label49:
      logger.error("failed to download the manifest");
      localArrayList.add(new Exception("Failed to download the latest cds manifest"));
      onComplete(context, null, localArrayList);
      return;
    }
    try
    {
      localObject2 = acquireRestoreList((List)localObject2);
      localObject1 = localObject2;
    }
    catch (Exception localException2)
    {
      localArrayList.add(localException2);
      break label49;
    }
    if (localObject1 != null)
    {
      updateProgressNotification(100, 40, false);
      localArrayList.addAll(downloadMissingIcons(localObject1, localCdsManifestParser));
      updateProgressNotification(100, 70, false);
      localArrayList.addAll(downloadPacks(localObject1, 70, 100));
    }
    onComplete(context, localObject1, localArrayList);
  }
  
  private List<String> restorePurchases(List<Exception> paramList, CdsManifestParser paramCdsManifestParser)
  {
    logger.log("restorePurchases");
    ArrayList localArrayList = new ArrayList();
    if (packType == null)
    {
      Cds.PackType[] arrayOfPackType = Cds.PackType.values();
      String[] arrayOfString2 = new String[arrayOfPackType.length];
      int i = 0;
      for (;;)
      {
        arrayOfString1 = arrayOfString2;
        if (i >= arrayOfPackType.length) {
          break;
        }
        arrayOfString2[i] = arrayOfPackType[i].toCdsString();
        i += 1;
      }
    }
    String[] arrayOfString1 = new String[1];
    arrayOfString1[0] = packType.toCdsString();
    paramList.addAll(service.restoreOwnedPacks(context, paramCdsManifestParser, wifiOnly, localArrayList, arrayOfString1));
    return localArrayList;
  }
  
  private void updateProgressNotification(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    progressNotification.setProgress(paramInt1, paramInt2, paramBoolean);
  }
  
  public void dispose()
  {
    progressNotification = null;
  }
  
  void restoreAll()
  {
    logger.info("restoreAll. packType: %s", new Object[] { packType });
    AviaryNotificationManager.getInstance().cancelRestoreOngoingNotification(context);
    dismissCdsReceiverNotification();
    progressNotification = AviaryNotificationManager.getInstance().createRestoreOngoingNotification(context);
    updateProgressNotification(100, 0, true);
    restoreAllInternal();
  }
}
