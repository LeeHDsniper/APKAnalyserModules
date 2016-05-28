package com.nostra13.universalimageloader.core;

import android.graphics.Bitmap;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import com.nostra13.universalimageloader.cache.memory.MemoryCache;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.display.BitmapDisplayer;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.imageaware.ImageViewAware;
import com.nostra13.universalimageloader.core.imageaware.NonViewAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.core.listener.ImageLoadingProgressListener;
import com.nostra13.universalimageloader.core.listener.SimpleImageLoadingListener;
import com.nostra13.universalimageloader.utils.ImageSizeUtils;
import com.nostra13.universalimageloader.utils.L;
import com.nostra13.universalimageloader.utils.MemoryCacheUtils;

public class ImageLoader
{
  public static final String TAG = ImageLoader.class.getSimpleName();
  private static volatile ImageLoader instance;
  private ImageLoaderConfiguration configuration;
  private final ImageLoadingListener emptyListener = new SimpleImageLoadingListener();
  private ImageLoaderEngine engine;
  
  protected ImageLoader() {}
  
  private void checkConfiguration()
  {
    if (configuration == null) {
      throw new IllegalStateException("ImageLoader must be init with configuration before using");
    }
  }
  
  private static Handler defineHandler(DisplayImageOptions paramDisplayImageOptions)
  {
    Handler localHandler = paramDisplayImageOptions.getHandler();
    if (paramDisplayImageOptions.isSyncLoading()) {
      paramDisplayImageOptions = null;
    }
    do
    {
      do
      {
        return paramDisplayImageOptions;
        paramDisplayImageOptions = localHandler;
      } while (localHandler != null);
      paramDisplayImageOptions = localHandler;
    } while (Looper.myLooper() != Looper.getMainLooper());
    return new Handler();
  }
  
  public static ImageLoader getInstance()
  {
    if (instance == null) {}
    try
    {
      if (instance == null) {
        instance = new ImageLoader();
      }
      return instance;
    }
    finally {}
  }
  
  public void cancelDisplayTask(ImageView paramImageView)
  {
    engine.cancelDisplayTaskFor(new ImageViewAware(paramImageView));
  }
  
  public void displayImage(String paramString, ImageView paramImageView)
  {
    displayImage(paramString, new ImageViewAware(paramImageView), null, null, null);
  }
  
  public void displayImage(String paramString, ImageView paramImageView, DisplayImageOptions paramDisplayImageOptions)
  {
    displayImage(paramString, new ImageViewAware(paramImageView), paramDisplayImageOptions, null, null);
  }
  
  public void displayImage(String paramString, ImageView paramImageView, DisplayImageOptions paramDisplayImageOptions, ImageLoadingListener paramImageLoadingListener)
  {
    displayImage(paramString, paramImageView, paramDisplayImageOptions, paramImageLoadingListener, null);
  }
  
  public void displayImage(String paramString, ImageView paramImageView, DisplayImageOptions paramDisplayImageOptions, ImageLoadingListener paramImageLoadingListener, ImageLoadingProgressListener paramImageLoadingProgressListener)
  {
    displayImage(paramString, new ImageViewAware(paramImageView), paramDisplayImageOptions, paramImageLoadingListener, paramImageLoadingProgressListener);
  }
  
  public void displayImage(String paramString, ImageAware paramImageAware, DisplayImageOptions paramDisplayImageOptions, ImageLoadingListener paramImageLoadingListener, ImageLoadingProgressListener paramImageLoadingProgressListener)
  {
    checkConfiguration();
    if (paramImageAware == null) {
      throw new IllegalArgumentException("Wrong arguments were passed to displayImage() method (ImageView reference must not be null)");
    }
    ImageLoadingListener localImageLoadingListener = paramImageLoadingListener;
    if (paramImageLoadingListener == null) {
      localImageLoadingListener = emptyListener;
    }
    paramImageLoadingListener = paramDisplayImageOptions;
    if (paramDisplayImageOptions == null) {
      paramImageLoadingListener = configuration.defaultDisplayImageOptions;
    }
    if (TextUtils.isEmpty(paramString))
    {
      engine.cancelDisplayTaskFor(paramImageAware);
      localImageLoadingListener.onLoadingStarted(paramString, paramImageAware.getWrappedView());
      if (paramImageLoadingListener.shouldShowImageForEmptyUri()) {
        paramImageAware.setImageDrawable(paramImageLoadingListener.getImageForEmptyUri(configuration.resources));
      }
      for (;;)
      {
        localImageLoadingListener.onLoadingComplete(paramString, paramImageAware.getWrappedView(), null);
        return;
        paramImageAware.setImageDrawable(null);
      }
    }
    ImageSize localImageSize = ImageSizeUtils.defineTargetSizeForView(paramImageAware, configuration.getMaxImageSize());
    String str = MemoryCacheUtils.generateKey(paramString, localImageSize);
    engine.prepareDisplayTaskFor(paramImageAware, str);
    localImageLoadingListener.onLoadingStarted(paramString, paramImageAware.getWrappedView());
    paramDisplayImageOptions = (Bitmap)configuration.memoryCache.get(str);
    if ((paramDisplayImageOptions != null) && (!paramDisplayImageOptions.isRecycled()))
    {
      L.d("Load image from memory cache [%s]", new Object[] { str });
      if (paramImageLoadingListener.shouldPostProcess())
      {
        paramString = new ImageLoadingInfo(paramString, paramImageAware, localImageSize, str, paramImageLoadingListener, localImageLoadingListener, paramImageLoadingProgressListener, engine.getLockForUri(paramString));
        paramString = new ProcessAndDisplayImageTask(engine, paramDisplayImageOptions, paramString, defineHandler(paramImageLoadingListener));
        if (paramImageLoadingListener.isSyncLoading())
        {
          paramString.run();
          return;
        }
        engine.submit(paramString);
        return;
      }
      paramImageLoadingListener.getDisplayer().display(paramDisplayImageOptions, paramImageAware, LoadedFrom.MEMORY_CACHE);
      localImageLoadingListener.onLoadingComplete(paramString, paramImageAware.getWrappedView(), paramDisplayImageOptions);
      return;
    }
    if (paramImageLoadingListener.shouldShowImageOnLoading()) {
      paramImageAware.setImageDrawable(paramImageLoadingListener.getImageOnLoading(configuration.resources));
    }
    for (;;)
    {
      paramString = new ImageLoadingInfo(paramString, paramImageAware, localImageSize, str, paramImageLoadingListener, localImageLoadingListener, paramImageLoadingProgressListener, engine.getLockForUri(paramString));
      paramString = new LoadAndDisplayImageTask(engine, paramString, defineHandler(paramImageLoadingListener));
      if (!paramImageLoadingListener.isSyncLoading()) {
        break;
      }
      paramString.run();
      return;
      if (paramImageLoadingListener.isResetViewBeforeLoading()) {
        paramImageAware.setImageDrawable(null);
      }
    }
    engine.submit(paramString);
  }
  
  public MemoryCache getMemoryCache()
  {
    checkConfiguration();
    return configuration.memoryCache;
  }
  
  public void init(ImageLoaderConfiguration paramImageLoaderConfiguration)
  {
    if (paramImageLoaderConfiguration == null) {
      try
      {
        throw new IllegalArgumentException("ImageLoader configuration can not be initialized with null");
      }
      finally {}
    }
    if (configuration == null)
    {
      L.d("Initialize ImageLoader with configuration", new Object[0]);
      engine = new ImageLoaderEngine(paramImageLoaderConfiguration);
      configuration = paramImageLoaderConfiguration;
    }
    for (;;)
    {
      return;
      L.w("Try to initialize ImageLoader which had already been initialized before. To re-init ImageLoader with new configuration call ImageLoader.destroy() at first.", new Object[0]);
    }
  }
  
  public boolean isInited()
  {
    return configuration != null;
  }
  
  public void loadImage(String paramString, ImageSize paramImageSize, DisplayImageOptions paramDisplayImageOptions, ImageLoadingListener paramImageLoadingListener)
  {
    loadImage(paramString, paramImageSize, paramDisplayImageOptions, paramImageLoadingListener, null);
  }
  
  public void loadImage(String paramString, ImageSize paramImageSize, DisplayImageOptions paramDisplayImageOptions, ImageLoadingListener paramImageLoadingListener, ImageLoadingProgressListener paramImageLoadingProgressListener)
  {
    checkConfiguration();
    ImageSize localImageSize = paramImageSize;
    if (paramImageSize == null) {
      localImageSize = configuration.getMaxImageSize();
    }
    paramImageSize = paramDisplayImageOptions;
    if (paramDisplayImageOptions == null) {
      paramImageSize = configuration.defaultDisplayImageOptions;
    }
    displayImage(paramString, new NonViewAware(paramString, localImageSize, ViewScaleType.CROP), paramImageSize, paramImageLoadingListener, paramImageLoadingProgressListener);
  }
  
  public Bitmap loadImageSync(String paramString, DisplayImageOptions paramDisplayImageOptions)
  {
    return loadImageSync(paramString, null, paramDisplayImageOptions);
  }
  
  public Bitmap loadImageSync(String paramString, ImageSize paramImageSize, DisplayImageOptions paramDisplayImageOptions)
  {
    Object localObject = paramDisplayImageOptions;
    if (paramDisplayImageOptions == null) {
      localObject = configuration.defaultDisplayImageOptions;
    }
    paramDisplayImageOptions = new DisplayImageOptions.Builder().cloneFrom((DisplayImageOptions)localObject).syncLoading(true).build();
    localObject = new SyncImageLoadingListener(null);
    loadImage(paramString, paramImageSize, paramDisplayImageOptions, (ImageLoadingListener)localObject);
    return ((SyncImageLoadingListener)localObject).getLoadedBitmap();
  }
  
  private static class SyncImageLoadingListener
    extends SimpleImageLoadingListener
  {
    private Bitmap loadedImage;
    
    private SyncImageLoadingListener() {}
    
    public Bitmap getLoadedBitmap()
    {
      return loadedImage;
    }
    
    public void onLoadingComplete(String paramString, View paramView, Bitmap paramBitmap)
    {
      loadedImage = paramBitmap;
    }
  }
}
