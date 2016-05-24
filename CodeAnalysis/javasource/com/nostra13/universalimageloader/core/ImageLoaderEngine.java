package com.nostra13.universalimageloader.core;

import com.nostra13.universalimageloader.cache.disc.DiskCache;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;

class ImageLoaderEngine
{
  private final Map<Integer, String> cacheKeysForImageAwares = Collections.synchronizedMap(new HashMap());
  final ImageLoaderConfiguration configuration;
  private final AtomicBoolean networkDenied = new AtomicBoolean(false);
  private final Object pauseLock = new Object();
  private final AtomicBoolean paused = new AtomicBoolean(false);
  private final AtomicBoolean slowNetwork = new AtomicBoolean(false);
  private Executor taskDistributor;
  private Executor taskExecutor;
  private Executor taskExecutorForCachedImages;
  private final Map<String, ReentrantLock> uriLocks = new WeakHashMap();
  
  ImageLoaderEngine(ImageLoaderConfiguration paramImageLoaderConfiguration)
  {
    configuration = paramImageLoaderConfiguration;
    taskExecutor = taskExecutor;
    taskExecutorForCachedImages = taskExecutorForCachedImages;
    taskDistributor = DefaultConfigurationFactory.createTaskDistributor();
  }
  
  private Executor createTaskExecutor()
  {
    return DefaultConfigurationFactory.createExecutor(configuration.threadPoolSize, configuration.threadPriority, configuration.tasksProcessingType);
  }
  
  private void initExecutorsIfNeed()
  {
    if ((!configuration.customExecutor) && (((ExecutorService)taskExecutor).isShutdown())) {
      taskExecutor = createTaskExecutor();
    }
    if ((!configuration.customExecutorForCachedImages) && (((ExecutorService)taskExecutorForCachedImages).isShutdown())) {
      taskExecutorForCachedImages = createTaskExecutor();
    }
  }
  
  void cancelDisplayTaskFor(ImageAware paramImageAware)
  {
    cacheKeysForImageAwares.remove(Integer.valueOf(paramImageAware.getId()));
  }
  
  void fireCallback(Runnable paramRunnable)
  {
    taskDistributor.execute(paramRunnable);
  }
  
  String getLoadingUriForView(ImageAware paramImageAware)
  {
    return (String)cacheKeysForImageAwares.get(Integer.valueOf(paramImageAware.getId()));
  }
  
  ReentrantLock getLockForUri(String paramString)
  {
    ReentrantLock localReentrantLock2 = (ReentrantLock)uriLocks.get(paramString);
    ReentrantLock localReentrantLock1 = localReentrantLock2;
    if (localReentrantLock2 == null)
    {
      localReentrantLock1 = new ReentrantLock();
      uriLocks.put(paramString, localReentrantLock1);
    }
    return localReentrantLock1;
  }
  
  AtomicBoolean getPause()
  {
    return paused;
  }
  
  Object getPauseLock()
  {
    return pauseLock;
  }
  
  boolean isNetworkDenied()
  {
    return networkDenied.get();
  }
  
  boolean isSlowNetwork()
  {
    return slowNetwork.get();
  }
  
  void prepareDisplayTaskFor(ImageAware paramImageAware, String paramString)
  {
    cacheKeysForImageAwares.put(Integer.valueOf(paramImageAware.getId()), paramString);
  }
  
  void submit(final LoadAndDisplayImageTask paramLoadAndDisplayImageTask)
  {
    taskDistributor.execute(new Runnable()
    {
      public void run()
      {
        File localFile = configuration.diskCache.get(paramLoadAndDisplayImageTask.getLoadingUri());
        if ((localFile != null) && (localFile.exists())) {}
        for (int i = 1;; i = 0)
        {
          ImageLoaderEngine.this.initExecutorsIfNeed();
          if (i == 0) {
            break;
          }
          taskExecutorForCachedImages.execute(paramLoadAndDisplayImageTask);
          return;
        }
        taskExecutor.execute(paramLoadAndDisplayImageTask);
      }
    });
  }
  
  void submit(ProcessAndDisplayImageTask paramProcessAndDisplayImageTask)
  {
    initExecutorsIfNeed();
    taskExecutorForCachedImages.execute(paramProcessAndDisplayImageTask);
  }
}
