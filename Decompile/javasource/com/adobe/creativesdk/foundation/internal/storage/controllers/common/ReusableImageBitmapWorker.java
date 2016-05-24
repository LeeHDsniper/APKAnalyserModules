package com.adobe.creativesdk.foundation.internal.storage.controllers.common;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.os.AsyncTask;
import android.support.v4.app.FragmentManager;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import java.util.HashMap;

public class ReusableImageBitmapWorker
{
  private HashMap<String, DecodeImageInBackgroundTask> _image2DecodeTaskMap;
  private ReusableImageBitmapCache mImageCache;
  private ReusableImageBitmapCache.ImageCacheParams mImageCacheParams;
  private final Resources mResources;
  
  public ReusableImageBitmapWorker(Context paramContext)
  {
    mResources = paramContext.getResources();
    _image2DecodeTaskMap = new HashMap();
  }
  
  private DecodeImageInBackgroundTask createReusableBitmapFromImageData(String paramString, byte[] paramArrayOfByte, IAdobeGenericCompletionCallback<Bitmap> paramIAdobeGenericCompletionCallback)
  {
    return new DecodeImageInBackgroundTask(paramString, paramIAdobeGenericCompletionCallback);
  }
  
  public void addImageCache(FragmentManager paramFragmentManager, ReusableImageBitmapCache.ImageCacheParams paramImageCacheParams)
  {
    mImageCacheParams = paramImageCacheParams;
    mImageCache = ReusableImageBitmapCache.getInstance(paramFragmentManager, mImageCacheParams);
  }
  
  public void cancelImageLoad(String paramString)
  {
    if (_image2DecodeTaskMap.size() == 0) {}
    DecodeImageInBackgroundTask localDecodeImageInBackgroundTask;
    do
    {
      return;
      localDecodeImageInBackgroundTask = (DecodeImageInBackgroundTask)_image2DecodeTaskMap.get(paramString);
    } while (localDecodeImageInBackgroundTask == null);
    _image2DecodeTaskMap.remove(paramString);
    localDecodeImageInBackgroundTask.cancel(false);
  }
  
  public void clearCache()
  {
    mImageCache.clearCache();
  }
  
  public BitmapDrawable loadImage(String paramString)
  {
    if (paramString == null) {}
    while (mImageCache == null) {
      return null;
    }
    return mImageCache.getBitmapFromMemCache(paramString);
  }
  
  public void loadImageWithData(final String paramString, byte[] paramArrayOfByte, final IAdobeGenericCompletionCallback<BitmapDrawable> paramIAdobeGenericCompletionCallback)
  {
    if (paramString == null)
    {
      paramIAdobeGenericCompletionCallback.onCompletion(null);
      return;
    }
    cancelImageLoad(paramString);
    paramIAdobeGenericCompletionCallback = createReusableBitmapFromImageData(paramString, paramArrayOfByte, new IAdobeGenericCompletionCallback()
    {
      public void onCompletion(Bitmap paramAnonymousBitmap)
      {
        if (paramAnonymousBitmap != null)
        {
          paramAnonymousBitmap = new BitmapDrawable(mResources, paramAnonymousBitmap);
          if (mImageCache != null) {
            mImageCache.addBitmapToCache(paramString, paramAnonymousBitmap);
          }
          paramIAdobeGenericCompletionCallback.onCompletion(paramAnonymousBitmap);
        }
      }
    });
    _image2DecodeTaskMap.put(paramString, paramIAdobeGenericCompletionCallback);
    paramIAdobeGenericCompletionCallback.execute(new byte[][] { paramArrayOfByte });
  }
  
  class DecodeImageInBackgroundTask
    extends AsyncTask<byte[], Integer, Bitmap>
  {
    private final String _dataKey;
    private final IAdobeGenericCompletionCallback<Bitmap> _onCompleteCallBack;
    
    DecodeImageInBackgroundTask(IAdobeGenericCompletionCallback<Bitmap> paramIAdobeGenericCompletionCallback)
    {
      Object localObject;
      _onCompleteCallBack = localObject;
      _dataKey = paramIAdobeGenericCompletionCallback;
    }
    
    private void removeTaskFromMap()
    {
      if ((DecodeImageInBackgroundTask)_image2DecodeTaskMap.get(_dataKey) == this) {
        _image2DecodeTaskMap.remove(_dataKey);
      }
    }
    
    protected Bitmap doInBackground(byte[]... paramVarArgs)
    {
      paramVarArgs = paramVarArgs[0];
      if ((paramVarArgs == null) || (isCancelled())) {
        return null;
      }
      return BitmapFactory.decodeByteArray(paramVarArgs, 0, paramVarArgs.length);
    }
    
    protected void onCancelled(Bitmap paramBitmap)
    {
      removeTaskFromMap();
      if (paramBitmap != null) {
        _onCompleteCallBack.onCompletion(paramBitmap);
      }
    }
    
    protected void onPostExecute(Bitmap paramBitmap)
    {
      removeTaskFromMap();
      _onCompleteCallBack.onCompletion(paramBitmap);
    }
  }
}
