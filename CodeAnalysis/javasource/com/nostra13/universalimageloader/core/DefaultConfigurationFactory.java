package com.nostra13.universalimageloader.core;

import android.content.Context;
import com.nostra13.universalimageloader.cache.disc.DiskCache;
import com.nostra13.universalimageloader.cache.disc.impl.UnlimitedDiscCache;
import com.nostra13.universalimageloader.cache.disc.impl.ext.LruDiscCache;
import com.nostra13.universalimageloader.cache.disc.naming.FileNameGenerator;
import com.nostra13.universalimageloader.cache.disc.naming.HashCodeFileNameGenerator;
import com.nostra13.universalimageloader.cache.memory.MemoryCache;
import com.nostra13.universalimageloader.cache.memory.impl.LruMemoryCache;
import com.nostra13.universalimageloader.core.assist.QueueProcessingType;
import com.nostra13.universalimageloader.core.assist.deque.LIFOLinkedBlockingDeque;
import com.nostra13.universalimageloader.core.decode.BaseImageDecoder;
import com.nostra13.universalimageloader.core.decode.ImageDecoder;
import com.nostra13.universalimageloader.core.display.BitmapDisplayer;
import com.nostra13.universalimageloader.core.display.SimpleBitmapDisplayer;
import com.nostra13.universalimageloader.core.download.BaseImageDownloader;
import com.nostra13.universalimageloader.core.download.ImageDownloader;
import com.nostra13.universalimageloader.utils.StorageUtils;
import java.io.File;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class DefaultConfigurationFactory
{
  public static BitmapDisplayer createBitmapDisplayer()
  {
    return new SimpleBitmapDisplayer();
  }
  
  public static DiskCache createDiskCache(Context paramContext, FileNameGenerator paramFileNameGenerator, long paramLong, int paramInt)
  {
    File localFile = createReserveDiskCacheDir(paramContext);
    if ((paramLong > 0L) || (paramInt > 0))
    {
      paramContext = new LruDiscCache(StorageUtils.getIndividualCacheDirectory(paramContext), paramFileNameGenerator, paramLong, paramInt);
      paramContext.setReserveCacheDir(localFile);
      return paramContext;
    }
    return new UnlimitedDiscCache(StorageUtils.getCacheDirectory(paramContext), localFile, paramFileNameGenerator);
  }
  
  public static Executor createExecutor(int paramInt1, int paramInt2, QueueProcessingType paramQueueProcessingType)
  {
    int i;
    if (paramQueueProcessingType == QueueProcessingType.LIFO)
    {
      i = 1;
      if (i == 0) {
        break label52;
      }
    }
    label52:
    for (paramQueueProcessingType = new LIFOLinkedBlockingDeque();; paramQueueProcessingType = new LinkedBlockingQueue())
    {
      paramQueueProcessingType = (BlockingQueue)paramQueueProcessingType;
      return new ThreadPoolExecutor(paramInt1, paramInt1, 0L, TimeUnit.MILLISECONDS, paramQueueProcessingType, createThreadFactory(paramInt2, "uil-pool-"));
      i = 0;
      break;
    }
  }
  
  public static FileNameGenerator createFileNameGenerator()
  {
    return new HashCodeFileNameGenerator();
  }
  
  public static ImageDecoder createImageDecoder(boolean paramBoolean)
  {
    return new BaseImageDecoder(paramBoolean);
  }
  
  public static ImageDownloader createImageDownloader(Context paramContext)
  {
    return new BaseImageDownloader(paramContext);
  }
  
  public static MemoryCache createMemoryCache(int paramInt)
  {
    int i = paramInt;
    if (paramInt == 0) {
      i = (int)(Runtime.getRuntime().maxMemory() / 8L);
    }
    return new LruMemoryCache(i);
  }
  
  private static File createReserveDiskCacheDir(Context paramContext)
  {
    paramContext = StorageUtils.getCacheDirectory(paramContext, false);
    File localFile = new File(paramContext, "uil-images");
    if ((localFile.exists()) || (localFile.mkdir())) {
      paramContext = localFile;
    }
    return paramContext;
  }
  
  public static Executor createTaskDistributor()
  {
    return Executors.newCachedThreadPool(createThreadFactory(5, "uil-pool-d-"));
  }
  
  private static ThreadFactory createThreadFactory(int paramInt, String paramString)
  {
    return new DefaultThreadFactory(paramInt, paramString);
  }
  
  private static class DefaultThreadFactory
    implements ThreadFactory
  {
    private static final AtomicInteger poolNumber = new AtomicInteger(1);
    private final ThreadGroup group;
    private final String namePrefix;
    private final AtomicInteger threadNumber = new AtomicInteger(1);
    private final int threadPriority;
    
    DefaultThreadFactory(int paramInt, String paramString)
    {
      threadPriority = paramInt;
      Object localObject = System.getSecurityManager();
      if (localObject != null) {}
      for (localObject = ((SecurityManager)localObject).getThreadGroup();; localObject = Thread.currentThread().getThreadGroup())
      {
        group = ((ThreadGroup)localObject);
        namePrefix = (paramString + poolNumber.getAndIncrement() + "-thread-");
        return;
      }
    }
    
    public Thread newThread(Runnable paramRunnable)
    {
      paramRunnable = new Thread(group, paramRunnable, namePrefix + threadNumber.getAndIncrement(), 0L);
      if (paramRunnable.isDaemon()) {
        paramRunnable.setDaemon(false);
      }
      paramRunnable.setPriority(threadPriority);
      return paramRunnable;
    }
  }
}
