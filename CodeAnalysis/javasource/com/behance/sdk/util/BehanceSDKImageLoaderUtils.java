package com.behance.sdk.util;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Matrix;
import android.widget.ImageView;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.ui.animations.BehanceSDKCustomFadeInBitmapDisplayer;
import com.nostra13.universalimageloader.cache.memory.MemoryCache;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.utils.MemoryCacheUtils;
import java.util.List;

public class BehanceSDKImageLoaderUtils
{
  private static DisplayImageOptions imageOptions;
  
  public static void displayImageFromCacheOrLoadFromServer(String paramString, ImageView paramImageView, ImageLoadingListener paramImageLoadingListener, DisplayImageOptions paramDisplayImageOptions)
  {
    ImageLoader localImageLoader = ImageLoader.getInstance();
    int j = 0;
    localImageLoader.cancelDisplayTask(paramImageView);
    Object localObject = localImageLoader.getMemoryCache();
    int i = j;
    if (localObject != null)
    {
      localObject = MemoryCacheUtils.findCachedBitmapsForImageUri(paramString, (MemoryCache)localObject);
      i = j;
      if (localObject != null)
      {
        i = j;
        if (((List)localObject).size() > 0)
        {
          localObject = (Bitmap)((List)localObject).get(0);
          i = j;
          if (localObject != null)
          {
            i = j;
            if (!((Bitmap)localObject).isRecycled())
            {
              j = 1;
              if (paramImageLoadingListener == null) {
                break label135;
              }
              paramImageLoadingListener.onLoadingComplete(paramString, paramImageView, (Bitmap)localObject);
              i = j;
            }
          }
        }
      }
    }
    for (;;)
    {
      if (i == 0)
      {
        if (paramImageLoadingListener == null) {
          break;
        }
        localImageLoader.displayImage(paramString, paramImageView, paramDisplayImageOptions, paramImageLoadingListener);
      }
      return;
      label135:
      i = j;
      if (paramImageView != null)
      {
        paramImageView.setImageBitmap((Bitmap)localObject);
        i = j;
      }
    }
    localImageLoader.displayImage(paramString, paramImageView, paramDisplayImageOptions);
  }
  
  public static DisplayImageOptions getDefaultImageLoaderOptions()
  {
    if (imageOptions == null) {
      imageOptions = new DisplayImageOptions.Builder().cacheInMemory(false).resetViewBeforeLoading(false).cacheOnDisk(false).imageScaleType(ImageScaleType.EXACTLY).displayer(new BehanceSDKCustomFadeInBitmapDisplayer(300, true, false, false)).showImageOnFail(17301624).bitmapConfig(Bitmap.Config.RGB_565).build();
    }
    return imageOptions;
  }
  
  public static Bitmap getImageBitmap(String paramString)
  {
    return ImageLoader.getInstance().loadImageSync(paramString, getDefaultImageLoaderOptions());
  }
  
  public static Bitmap updateBitmapForRotation(Bitmap paramBitmap, ImageModule paramImageModule)
  {
    int i = paramImageModule.getRotation();
    paramImageModule = paramBitmap;
    if (i > 0)
    {
      paramImageModule = new Matrix();
      paramImageModule.postRotate(i * 90);
      paramImageModule = Bitmap.createBitmap(paramBitmap, 0, 0, paramBitmap.getWidth(), paramBitmap.getHeight(), paramImageModule, true);
    }
    return paramImageModule;
  }
}
