package com.nostra13.universalimageloader.core;

import android.graphics.Bitmap;
import android.os.Handler;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.process.BitmapProcessor;
import com.nostra13.universalimageloader.utils.L;

final class ProcessAndDisplayImageTask
  implements Runnable
{
  private final Bitmap bitmap;
  private final ImageLoaderEngine engine;
  private final Handler handler;
  private final ImageLoadingInfo imageLoadingInfo;
  
  public ProcessAndDisplayImageTask(ImageLoaderEngine paramImageLoaderEngine, Bitmap paramBitmap, ImageLoadingInfo paramImageLoadingInfo, Handler paramHandler)
  {
    engine = paramImageLoaderEngine;
    bitmap = paramBitmap;
    imageLoadingInfo = paramImageLoadingInfo;
    handler = paramHandler;
  }
  
  public void run()
  {
    L.d("PostProcess image before displaying [%s]", new Object[] { imageLoadingInfo.memoryCacheKey });
    LoadAndDisplayImageTask.runTask(new DisplayBitmapTask(imageLoadingInfo.options.getPostProcessor().process(bitmap), imageLoadingInfo, engine, LoadedFrom.MEMORY_CACHE), imageLoadingInfo.options.isSyncLoading(), handler, engine);
  }
}
