package com.nostra13.universalimageloader.core;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.display.BitmapDisplayer;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.utils.L;

final class DisplayBitmapTask
  implements Runnable
{
  private final Bitmap bitmap;
  private final BitmapDisplayer displayer;
  private final ImageLoaderEngine engine;
  private final ImageAware imageAware;
  private final String imageUri;
  private final ImageLoadingListener listener;
  private final LoadedFrom loadedFrom;
  private final String memoryCacheKey;
  
  public DisplayBitmapTask(Bitmap paramBitmap, ImageLoadingInfo paramImageLoadingInfo, ImageLoaderEngine paramImageLoaderEngine, LoadedFrom paramLoadedFrom)
  {
    bitmap = paramBitmap;
    imageUri = uri;
    imageAware = imageAware;
    memoryCacheKey = memoryCacheKey;
    displayer = options.getDisplayer();
    listener = listener;
    engine = paramImageLoaderEngine;
    loadedFrom = paramLoadedFrom;
  }
  
  private boolean isViewWasReused()
  {
    String str = engine.getLoadingUriForView(imageAware);
    return !memoryCacheKey.equals(str);
  }
  
  public void run()
  {
    if (imageAware.isCollected())
    {
      L.d("ImageAware was collected by GC. Task is cancelled. [%s]", new Object[] { memoryCacheKey });
      listener.onLoadingCancelled(imageUri, imageAware.getWrappedView());
      return;
    }
    if (isViewWasReused())
    {
      L.d("ImageAware is reused for another image. Task is cancelled. [%s]", new Object[] { memoryCacheKey });
      listener.onLoadingCancelled(imageUri, imageAware.getWrappedView());
      return;
    }
    L.d("Display image in ImageAware (loaded from %1$s) [%2$s]", new Object[] { loadedFrom, memoryCacheKey });
    displayer.display(bitmap, imageAware, loadedFrom);
    engine.cancelDisplayTaskFor(imageAware);
    listener.onLoadingComplete(imageUri, imageAware.getWrappedView(), bitmap);
  }
}
