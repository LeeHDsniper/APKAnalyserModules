package com.adobe.creativesdk.foundation.internal.storage.controllers.upload;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.AsyncTask;
import android.util.LruCache;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileUtils;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class AdobeUploadThumbnailMgr
{
  private static AdobeUploadThumbnailMgr _sInstance;
  private final int CACHE_NUM_ENTRIES = 15;
  private LruCache<String, Bitmap> _bitmapCache;
  private LruCache<String, byte[]> _thumbnailCache;
  
  public AdobeUploadThumbnailMgr() {}
  
  public static int calculateInSampleSize(BitmapFactory.Options paramOptions, AdobeAssetImageDimensions paramAdobeAssetImageDimensions)
  {
    int i = outHeight;
    int m = outWidth;
    int j = 1;
    int k = 1;
    float f;
    if (width > height)
    {
      f = width;
      if (i <= m) {
        break label83;
      }
    }
    for (;;)
    {
      if (i <= f) {
        break label89;
      }
      m = i / 2;
      i = k;
      for (;;)
      {
        j = i;
        if (m / i <= f) {
          break;
        }
        i *= 2;
      }
      f = height;
      break;
      label83:
      i = m;
    }
    label89:
    return j;
  }
  
  public static Bitmap decodeSampledBitmapFromStream(URL paramURL, AdobeAssetImageDimensions paramAdobeAssetImageDimensions)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    InputStream localInputStream = fileStreamFromPath(paramURL);
    BitmapFactory.decodeStream(localInputStream, null, localOptions);
    inSampleSize = calculateInSampleSize(localOptions, paramAdobeAssetImageDimensions);
    inJustDecodeBounds = false;
    try
    {
      localInputStream.close();
      paramURL = fileStreamFromPath(paramURL);
      if (paramURL == null) {
        return null;
      }
    }
    catch (IOException paramAdobeAssetImageDimensions)
    {
      for (;;)
      {
        paramAdobeAssetImageDimensions.printStackTrace();
      }
      paramAdobeAssetImageDimensions = BitmapFactory.decodeStream(paramURL, null, localOptions);
      try
      {
        paramURL.close();
        return paramAdobeAssetImageDimensions;
      }
      catch (IOException paramURL)
      {
        paramURL.printStackTrace();
      }
    }
    return paramAdobeAssetImageDimensions;
  }
  
  private static InputStream fileStreamFromPath(URL paramURL)
  {
    try
    {
      paramURL = paramURL.openStream();
      return paramURL;
    }
    catch (IOException paramURL) {}
    return null;
  }
  
  public static AdobeUploadThumbnailMgr getInstance()
  {
    if (_sInstance == null) {
      _sInstance = new AdobeUploadThumbnailMgr();
    }
    return _sInstance;
  }
  
  private void getUploadAssetThumbnailAsync(AdobeCCFilesUploadAssetData paramAdobeCCFilesUploadAssetData, final IAdobeGenericCompletionCallback<byte[]> paramIAdobeGenericCompletionCallback)
  {
    new AsyncTask()
    {
      protected byte[] doInBackground(URL... paramAnonymousVarArgs)
      {
        Object localObject = paramAnonymousVarArgs[0];
        paramAnonymousVarArgs = null;
        localObject = AdobeUploadThumbnailMgr.decodeSampledBitmapFromStream((URL)localObject, AdobeStorageAssetFileUtils.THUMBNAIL_SIZED_RENDITION);
        if (localObject != null)
        {
          paramAnonymousVarArgs = new ByteArrayOutputStream();
          ((Bitmap)localObject).compress(Bitmap.CompressFormat.PNG, 100, paramAnonymousVarArgs);
          paramAnonymousVarArgs = paramAnonymousVarArgs.toByteArray();
        }
        return paramAnonymousVarArgs;
      }
      
      protected void onPostExecute(byte[] paramAnonymousArrayOfByte)
      {
        paramIAdobeGenericCompletionCallback.onCompletion(paramAnonymousArrayOfByte);
      }
      
      protected void onProgressUpdate(Integer... paramAnonymousVarArgs) {}
    }.execute(new URL[] { _localAssetURL });
  }
  
  private void initializeBitmapCache()
  {
    if (_bitmapCache != null) {
      return;
    }
    _bitmapCache = new LruCache(40);
  }
  
  private void initializeCache()
  {
    if (_thumbnailCache != null) {
      return;
    }
    _thumbnailCache = new LruCache(15);
  }
  
  public void clearBitmapCache()
  {
    if (_bitmapCache == null) {
      return;
    }
    _bitmapCache.evictAll();
    _bitmapCache = null;
  }
  
  public void getThumbnail(AdobeCCFilesUploadAssetData paramAdobeCCFilesUploadAssetData, IAdobeGenericCompletionCallback<byte[]> paramIAdobeGenericCompletionCallback)
  {
    initializeCache();
    byte[] arrayOfByte = (byte[])_thumbnailCache.get(guid);
    if (arrayOfByte == null)
    {
      getUploadAssetThumbnailAsync(paramAdobeCCFilesUploadAssetData, paramIAdobeGenericCompletionCallback);
      return;
    }
    paramIAdobeGenericCompletionCallback.onCompletion(arrayOfByte);
  }
  
  public void getThumbnailasBitmap(final AdobeCCFilesUploadAssetData paramAdobeCCFilesUploadAssetData, final IAdobeGenericCompletionCallback<Bitmap> paramIAdobeGenericCompletionCallback)
  {
    initializeBitmapCache();
    Bitmap localBitmap = (Bitmap)_bitmapCache.get(guid);
    if (localBitmap != null)
    {
      paramIAdobeGenericCompletionCallback.onCompletion(localBitmap);
      return;
    }
    new AsyncTask()
    {
      protected Bitmap doInBackground(URL... paramAnonymousVarArgs)
      {
        return AdobeUploadThumbnailMgr.decodeSampledBitmapFromStream(paramAnonymousVarArgs[0], AdobeStorageAssetFileUtils.THUMBNAIL_SIZED_RENDITION);
      }
      
      protected void onPostExecute(Bitmap paramAnonymousBitmap)
      {
        if (paramAdobeCCFilesUploadAssetDataguid != null)
        {
          this$0._bitmapCache.put(paramAdobeCCFilesUploadAssetDataguid, paramAnonymousBitmap);
          paramIAdobeGenericCompletionCallback.onCompletion(paramAnonymousBitmap);
        }
      }
      
      protected void onProgressUpdate(Integer... paramAnonymousVarArgs) {}
    }.execute(new URL[] { _localAssetURL });
  }
}
