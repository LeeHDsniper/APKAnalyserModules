package com.adobe.creativesdk.aviary.internal.cds;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageIntentService;
import com.adobe.creativesdk.aviary.internal.utils.ConnectionUtils;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.io.File;
import java.io.IOException;
import java.util.Locale;

public class CdsAssetsDownloaderService
  extends AdobeImageIntentService
{
  private static final LoggerFactory.Logger LOGGER = LoggerFactory.getLogger("AdobeImageCdsAssetsDownloaderService");
  
  public CdsAssetsDownloaderService()
  {
    super("AdobeImageCdsAssetsDownloaderService");
  }
  
  private void downloadExtraAssets(boolean paramBoolean, int paramInt)
    throws IOException
  {
    LOGGER.log("downloadExtraAssets");
    SystemUtils.throwIfUiThread();
    if (paramBoolean) {
      throwIfNotConnected(getBaseContext());
    }
    processDetails(paramBoolean, paramInt);
    if (paramBoolean) {
      throwIfNotConnected(getBaseContext());
    }
    processFutureMessages(paramBoolean);
    if (paramBoolean) {
      throwIfNotConnected(getBaseContext());
    }
    processFeaturedItems(paramBoolean, paramInt);
    if (paramBoolean) {
      throwIfNotConnected(getBaseContext());
    }
    processPreviews(paramBoolean, paramInt);
  }
  
  private boolean processDetail(Context paramContext, long paramLong, String paramString, boolean paramBoolean)
    throws IOException
  {
    if (paramContext == null) {
      throw new IllegalStateException("Invalid Context");
    }
    if (paramBoolean) {
      throwIfNotConnected(paramContext);
    }
    if ((!TextUtils.isEmpty(paramString)) && (new File(paramString).exists()))
    {
      LOGGER.verbose("detail image for packid %d already downloaded..", new Object[] { Long.valueOf(paramLong) });
      return false;
    }
    LOGGER.verbose("download detail image for pack %d", new Object[] { Long.valueOf(paramLong) });
    try
    {
      CdsDownloaderFactory.create(Cds.ContentType.DETAIL_IMAGE).download(paramContext, paramLong);
      return true;
    }
    catch (IOException paramContext)
    {
      paramContext.printStackTrace();
    }
    return false;
  }
  
  private void processDetails(boolean paramBoolean, int paramInt)
    throws IOException, IllegalStateException
  {
    LOGGER.log("processDetails");
    if (getBaseContext() == null) {
      throw new IllegalStateException("Invalid Context");
    }
    Cds.PackType[] arrayOfPackType = Cds.PackType.values();
    int m = arrayOfPackType.length;
    int i = 0;
    while (i < m)
    {
      Object localObject2 = arrayOfPackType[i];
      LOGGER.verbose("processing %s", new Object[] { localObject2 });
      localObject2 = ((Cds.PackType)localObject2).toCdsString();
      localObject2 = getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(getBaseContext(), "pack/content/list"), new String[] { "content_packId", "content_detailImageLocalPath" }, "pack_type=? AND content_purchased=? AND pack_visible=? AND pack_markedForDeletion=? AND ifnull(length(content_featureImageURL), 0) > 0", new String[] { localObject2, "0", "1", "0" }, "content_purchased ASC, pack_displayOrder ASC");
      if (localObject2 == null) {
        throw new IllegalStateException("Cursor is null");
      }
      try
      {
        LOGGER.verbose("cursor.size: %d", new Object[] { Integer.valueOf(((Cursor)localObject2).getCount()) });
        int k;
        for (int j = 0;; j = k)
        {
          if (((Cursor)localObject2).moveToNext())
          {
            if ((paramInt > -1) && (j >= paramInt)) {
              LOGGER.verbose("Processed %d items. Stop", new Object[] { Integer.valueOf(j) });
            }
          }
          else
          {
            IOUtils.closeSilently((Cursor)localObject2);
            i += 1;
            break;
          }
          long l = ((Cursor)localObject2).getLong(0);
          String str = ((Cursor)localObject2).getString(1);
          k = j;
          if (processDetail(getBaseContext(), l, str, paramBoolean)) {
            k = j + 1;
          }
          SystemUtils.trySleep(5L);
        }
        return;
      }
      finally
      {
        IOUtils.closeSilently((Cursor)localObject2);
      }
    }
  }
  
  private boolean processFeaturedItem(Context paramContext, Cursor paramCursor, boolean paramBoolean)
    throws IllegalStateException, IOException
  {
    if (paramContext == null) {
      throw new IllegalStateException("Invalid Context");
    }
    if (paramBoolean) {
      throwIfNotConnected(paramContext);
    }
    paramCursor = FeaturedColumns.CursorWrapper.create(paramCursor);
    if (paramCursor == null) {
      throw new IllegalStateException("feailed to create wrapper");
    }
    if ((!TextUtils.isEmpty(paramCursor.getFeatureImageLocalPath())) && (new File(paramCursor.getFeatureImageLocalPath()).exists()))
    {
      LOGGER.verbose("featured image already downloaded..", new Object[0]);
      return false;
    }
    LOGGER.verbose("download featured image for pack %d", new Object[] { Long.valueOf(paramCursor.getId()) });
    try
    {
      CdsDownloaderFactory.create(Cds.ContentType.FEATURED_IMAGE).download(paramContext, paramCursor.getId());
      return true;
    }
    catch (IOException paramContext)
    {
      paramContext.printStackTrace();
    }
    return false;
  }
  
  private void processFeaturedItems(boolean paramBoolean, int paramInt)
    throws IOException
  {
    LOGGER.log("processFeaturedItems");
    if (getBaseContext() == null) {
      throw new IllegalStateException("Invalid Context");
    }
    Object localObject1 = new StringBuilder().append("storeFeatured/banners/");
    if (paramInt < 0) {}
    for (int i = 3;; i = paramInt)
    {
      localObject1 = i;
      localObject1 = getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(getBaseContext(), (String)localObject1), null, null, null, null);
      if (localObject1 != null) {
        break;
      }
      throw new IllegalStateException("Cursor is null");
    }
    try
    {
      LOGGER.verbose("cursor.size: %d", new Object[] { Integer.valueOf(((Cursor)localObject1).getCount()) });
      int j;
      for (i = 0; ((Cursor)localObject1).moveToNext(); i = j)
      {
        if ((paramInt > 0) && (i >= paramInt))
        {
          LOGGER.verbose("Processed %d items. Stop", new Object[] { Integer.valueOf(i) });
          return;
        }
        j = i;
        if (processFeaturedItem(getBaseContext(), (Cursor)localObject1, paramBoolean)) {
          j = i + 1;
        }
        SystemUtils.trySleep(5L);
      }
    }
    finally
    {
      IOUtils.closeSilently((Cursor)localObject1);
    }
  }
  
  private boolean processFutureMessage(Context paramContext, MessageContentColumn.MessageContentCursorWrapper paramMessageContentCursorWrapper, boolean paramBoolean)
    throws IOException, IllegalStateException
  {
    if (paramContext == null) {
      throw new IllegalStateException("Invalid Context");
    }
    if (paramBoolean) {
      throwIfNotConnected(paramContext);
    }
    String str = paramMessageContentCursorWrapper.getContentPath();
    if (!TextUtils.isEmpty(str))
    {
      if (new File(str).exists())
      {
        LOGGER.verbose("file exists. Skipping..", new Object[0]);
        return false;
      }
      LOGGER.verbose("file doesn't exist!", new Object[0]);
    }
    LOGGER.verbose("processing: %s", new Object[] { paramMessageContentCursorWrapper.getContentIdentifier() });
    LOGGER.verbose("beginDate: %s, endDate: %s", new Object[] { paramMessageContentCursorWrapper.getBeginDate(), paramMessageContentCursorWrapper.getEndDate() });
    CdsDownloaderFactory.create(Cds.ContentType.MESSAGE).download(paramContext, paramMessageContentCursorWrapper.getMessageId());
    return true;
  }
  
  private void processFutureMessages(boolean paramBoolean)
    throws IOException, IllegalStateException
  {
    LOGGER.log("processFutureMessages");
    if (getBaseContext() == null) {
      throw new IllegalStateException("Invalid Context");
    }
    Cursor localCursor = getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(getBaseContext(), "message/future/" + Cds.MessageType.LAUNCH.toString().toLowerCase(Locale.US)), null, null, null, null);
    if (localCursor == null) {
      throw new IllegalStateException("Cursor is null");
    }
    int i = 1;
    try
    {
      LOGGER.verbose("cursor.size: %d", new Object[] { Integer.valueOf(localCursor.getCount()) });
      int j;
      do
      {
        MessageContentColumn.MessageContentCursorWrapper localMessageContentCursorWrapper;
        do
        {
          if (!localCursor.moveToNext()) {
            break;
          }
          localMessageContentCursorWrapper = MessageContentColumn.MessageContentCursorWrapper.create(localCursor);
        } while (localMessageContentCursorWrapper == null);
        processFutureMessage(getBaseContext(), localMessageContentCursorWrapper, paramBoolean);
        j = i - 1;
        i = j;
      } while (j > 0);
      return;
    }
    finally
    {
      IOUtils.closeSilently(localCursor);
    }
  }
  
  private boolean processPreview(Context paramContext, long paramLong1, long paramLong2, String paramString1, String paramString2, boolean paramBoolean)
    throws IOException
  {
    if (paramContext == null) {
      throw new IllegalStateException("Invalid Context");
    }
    if (paramBoolean) {
      throwIfNotConnected(paramContext);
    }
    if (!TextUtils.isEmpty(paramString1))
    {
      paramString1 = new File(paramString1);
      if (paramString1.isDirectory())
      {
        paramString2 = Cds.PackType.fromString(paramString2);
        paramString2 = CdsValidatorFactory.create(Cds.ContentType.PREVIEW, paramString2);
        try
        {
          if (paramString2.validate(paramContext, paramLong2, paramString1, false))
          {
            LOGGER.verbose("detail image for packid %d already downloaded..", new Object[] { Long.valueOf(paramLong1) });
            return false;
          }
        }
        catch (AssertionError paramString1)
        {
          LOGGER.warn("need to download again previews for packId %d", new Object[] { Long.valueOf(paramLong1) });
        }
      }
    }
    LOGGER.verbose("download detail image for pack %d", new Object[] { Long.valueOf(paramLong1) });
    try
    {
      CdsDownloaderFactory.create(Cds.ContentType.PREVIEW).download(paramContext, paramLong1);
      return true;
    }
    catch (IOException paramContext)
    {
      paramContext.printStackTrace();
    }
    return false;
  }
  
  private void processPreviews(boolean paramBoolean, int paramInt)
    throws IOException, IllegalStateException
  {
    LOGGER.log("processFutureMessages");
    if (getBaseContext() == null) {
      throw new IllegalStateException("Invalid Context");
    }
    Cds.PackType[] arrayOfPackType = Cds.PackType.values();
    int m = arrayOfPackType.length;
    int i = 0;
    while (i < m)
    {
      Object localObject2 = arrayOfPackType[i];
      LOGGER.verbose("processing %s", new Object[] { localObject2 });
      localObject2 = ((Cds.PackType)localObject2).toCdsString();
      localObject2 = getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(getBaseContext(), "pack/content/list"), new String[] { "content_packId", "content_previewPath", "pack_type", "content_id" }, "pack_type=? AND content_purchased=? AND pack_visible=? AND pack_markedForDeletion=? AND ifnull(length(content_previewURL), 0) > 0", new String[] { localObject2, "0", "1", "0" }, "content_purchased ASC, pack_displayOrder ASC");
      if (localObject2 == null) {
        throw new IllegalStateException("Cursor is null");
      }
      try
      {
        LOGGER.verbose("cursor.size: %d", new Object[] { Integer.valueOf(((Cursor)localObject2).getCount()) });
        int k;
        for (int j = 0;; j = k)
        {
          if (((Cursor)localObject2).moveToNext())
          {
            if ((paramInt > 0) && (j >= paramInt)) {
              LOGGER.verbose("Processed %d items. Stop", new Object[] { Integer.valueOf(j) });
            }
          }
          else
          {
            IOUtils.closeSilently((Cursor)localObject2);
            i += 1;
            break;
          }
          long l1 = ((Cursor)localObject2).getLong(0);
          String str1 = ((Cursor)localObject2).getString(1);
          String str2 = ((Cursor)localObject2).getString(2);
          long l2 = ((Cursor)localObject2).getLong(3);
          k = j;
          if (processPreview(getBaseContext(), l1, l2, str1, str2, paramBoolean)) {
            k = j + 1;
          }
          SystemUtils.trySleep(5L);
        }
        return;
      }
      finally
      {
        IOUtils.closeSilently((Cursor)localObject2);
      }
    }
  }
  
  private void throwIfNotConnected(Context paramContext)
    throws IOException
  {
    if (!ConnectionUtils.isWifiConnected(paramContext)) {
      throw new IOException("NotConnected");
    }
  }
  
  public void onCreate()
  {
    super.onCreate();
  }
  
  public void onDestroy()
  {
    super.onDestroy();
  }
  
  protected void onHandleIntent(Intent paramIntent)
  {
    LOGGER.log("onHandleIntent: %s", new Object[] { paramIntent });
    if (paramIntent == null) {}
    String str;
    boolean bool;
    int i;
    do
    {
      return;
      str = paramIntent.getAction();
      bool = paramIntent.getBooleanExtra("extra-execute-wifi-only", true);
      i = paramIntent.getIntExtra("extra-max-items", -1);
    } while (!"aviary.intent.action.CDS_DOWNLOAD_EXTRA_ASSETS".equals(str));
    try
    {
      downloadExtraAssets(bool, i);
      return;
    }
    catch (Throwable paramIntent)
    {
      paramIntent.printStackTrace();
    }
  }
}
