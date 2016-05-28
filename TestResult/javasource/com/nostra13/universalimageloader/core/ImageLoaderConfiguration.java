package com.nostra13.universalimageloader.core;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import com.nostra13.universalimageloader.cache.disc.DiskCache;
import com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator;
import com.nostra13.universalimageloader.cache.memory.MemoryCache;
import com.nostra13.universalimageloader.cache.memory.impl.FuzzyKeyMemoryCache;
import com.nostra13.universalimageloader.core.assist.FlushedInputStream;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.QueueProcessingType;
import com.nostra13.universalimageloader.core.decode.ImageDecoder;
import com.nostra13.universalimageloader.core.download.ImageDownloader;
import com.nostra13.universalimageloader.core.process.BitmapProcessor;
import com.nostra13.universalimageloader.utils.L;
import com.nostra13.universalimageloader.utils.MemoryCacheUtils;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.Executor;

public final class ImageLoaderConfiguration
{
  final boolean customExecutor;
  final boolean customExecutorForCachedImages;
  final ImageDecoder decoder;
  final DisplayImageOptions defaultDisplayImageOptions;
  final DiskCache diskCache;
  final ImageDownloader downloader;
  final int maxImageHeightForDiskCache;
  final int maxImageHeightForMemoryCache;
  final int maxImageWidthForDiskCache;
  final int maxImageWidthForMemoryCache;
  final MemoryCache memoryCache;
  final ImageDownloader networkDeniedDownloader;
  final BitmapProcessor processorForDiskCache;
  final Resources resources;
  final ImageDownloader slowNetworkDownloader;
  final Executor taskExecutor;
  final Executor taskExecutorForCachedImages;
  final QueueProcessingType tasksProcessingType;
  final int threadPoolSize;
  final int threadPriority;
  
  private ImageLoaderConfiguration(Builder paramBuilder)
  {
    resources = context.getResources();
    maxImageWidthForMemoryCache = maxImageWidthForMemoryCache;
    maxImageHeightForMemoryCache = maxImageHeightForMemoryCache;
    maxImageWidthForDiskCache = maxImageWidthForDiskCache;
    maxImageHeightForDiskCache = maxImageHeightForDiskCache;
    processorForDiskCache = processorForDiskCache;
    taskExecutor = taskExecutor;
    taskExecutorForCachedImages = taskExecutorForCachedImages;
    threadPoolSize = threadPoolSize;
    threadPriority = threadPriority;
    tasksProcessingType = tasksProcessingType;
    diskCache = diskCache;
    memoryCache = memoryCache;
    defaultDisplayImageOptions = defaultDisplayImageOptions;
    downloader = downloader;
    decoder = decoder;
    customExecutor = customExecutor;
    customExecutorForCachedImages = customExecutorForCachedImages;
    networkDeniedDownloader = new NetworkDeniedImageDownloader(downloader);
    slowNetworkDownloader = new SlowNetworkImageDownloader(downloader);
    L.writeDebugLogs(writeLogs);
  }
  
  public static ImageLoaderConfiguration createDefault(Context paramContext)
  {
    return new Builder(paramContext).build();
  }
  
  ImageSize getMaxImageSize()
  {
    DisplayMetrics localDisplayMetrics = resources.getDisplayMetrics();
    int j = maxImageWidthForMemoryCache;
    int i = j;
    if (j <= 0) {
      i = widthPixels;
    }
    int k = maxImageHeightForMemoryCache;
    j = k;
    if (k <= 0) {
      j = heightPixels;
    }
    return new ImageSize(i, j);
  }
  
  public static class Builder
  {
    public static final QueueProcessingType DEFAULT_TASK_PROCESSING_TYPE = QueueProcessingType.FIFO;
    private Context context;
    private boolean customExecutor = false;
    private boolean customExecutorForCachedImages = false;
    private ImageDecoder decoder;
    private DisplayImageOptions defaultDisplayImageOptions = null;
    private boolean denyCacheImageMultipleSizesInMemory = false;
    private DiskCache diskCache = null;
    private int diskCacheFileCount = 0;
    private FileNameGenerator diskCacheFileNameGenerator = null;
    private long diskCacheSize = 0L;
    private ImageDownloader downloader = null;
    private int maxImageHeightForDiskCache = 0;
    private int maxImageHeightForMemoryCache = 0;
    private int maxImageWidthForDiskCache = 0;
    private int maxImageWidthForMemoryCache = 0;
    private MemoryCache memoryCache = null;
    private int memoryCacheSize = 0;
    private BitmapProcessor processorForDiskCache = null;
    private Executor taskExecutor = null;
    private Executor taskExecutorForCachedImages = null;
    private QueueProcessingType tasksProcessingType = DEFAULT_TASK_PROCESSING_TYPE;
    private int threadPoolSize = 3;
    private int threadPriority = 4;
    private boolean writeLogs = false;
    
    public Builder(Context paramContext)
    {
      context = paramContext.getApplicationContext();
    }
    
    private void initEmptyFieldsWithDefaultValues()
    {
      if (taskExecutor == null)
      {
        taskExecutor = DefaultConfigurationFactory.createExecutor(threadPoolSize, threadPriority, tasksProcessingType);
        if (taskExecutorForCachedImages != null) {
          break label198;
        }
        taskExecutorForCachedImages = DefaultConfigurationFactory.createExecutor(threadPoolSize, threadPriority, tasksProcessingType);
      }
      for (;;)
      {
        if (diskCache == null)
        {
          if (diskCacheFileNameGenerator == null) {
            diskCacheFileNameGenerator = DefaultConfigurationFactory.createFileNameGenerator();
          }
          diskCache = DefaultConfigurationFactory.createDiskCache(context, diskCacheFileNameGenerator, diskCacheSize, diskCacheFileCount);
        }
        if (memoryCache == null) {
          memoryCache = DefaultConfigurationFactory.createMemoryCache(memoryCacheSize);
        }
        if (denyCacheImageMultipleSizesInMemory) {
          memoryCache = new FuzzyKeyMemoryCache(memoryCache, MemoryCacheUtils.createFuzzyKeyComparator());
        }
        if (downloader == null) {
          downloader = DefaultConfigurationFactory.createImageDownloader(context);
        }
        if (decoder == null) {
          decoder = DefaultConfigurationFactory.createImageDecoder(writeLogs);
        }
        if (defaultDisplayImageOptions == null) {
          defaultDisplayImageOptions = DisplayImageOptions.createSimple();
        }
        return;
        customExecutor = true;
        break;
        label198:
        customExecutorForCachedImages = true;
      }
    }
    
    public ImageLoaderConfiguration build()
    {
      initEmptyFieldsWithDefaultValues();
      return new ImageLoaderConfiguration(this, null);
    }
  }
  
  private static class NetworkDeniedImageDownloader
    implements ImageDownloader
  {
    private final ImageDownloader wrappedDownloader;
    
    public NetworkDeniedImageDownloader(ImageDownloader paramImageDownloader)
    {
      wrappedDownloader = paramImageDownloader;
    }
    
    public InputStream getStream(String paramString, Object paramObject)
      throws IOException
    {
      switch (ImageLoaderConfiguration.1.$SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme.ofUri(paramString).ordinal()])
      {
      default: 
        return wrappedDownloader.getStream(paramString, paramObject);
      }
      throw new IllegalStateException();
    }
  }
  
  private static class SlowNetworkImageDownloader
    implements ImageDownloader
  {
    private final ImageDownloader wrappedDownloader;
    
    public SlowNetworkImageDownloader(ImageDownloader paramImageDownloader)
    {
      wrappedDownloader = paramImageDownloader;
    }
    
    public InputStream getStream(String paramString, Object paramObject)
      throws IOException
    {
      paramObject = wrappedDownloader.getStream(paramString, paramObject);
      switch (ImageLoaderConfiguration.1.$SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme.ofUri(paramString).ordinal()])
      {
      default: 
        return paramObject;
      }
      return new FlushedInputStream(paramObject);
    }
  }
}
