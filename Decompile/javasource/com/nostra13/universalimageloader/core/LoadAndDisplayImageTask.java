package com.nostra13.universalimageloader.core;

import android.graphics.Bitmap;
import android.os.Handler;
import com.nostra13.universalimageloader.cache.disc.DiskCache;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.assist.FailReason.FailType;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.LoadedFrom;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.decode.ImageDecoder;
import com.nostra13.universalimageloader.core.decode.ImageDecodingInfo;
import com.nostra13.universalimageloader.core.download.ImageDownloader;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.nostra13.universalimageloader.core.listener.ImageLoadingProgressListener;
import com.nostra13.universalimageloader.core.process.BitmapProcessor;
import com.nostra13.universalimageloader.utils.IoUtils.CopyListener;
import com.nostra13.universalimageloader.utils.L;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.atomic.AtomicBoolean;

final class LoadAndDisplayImageTask
  implements IoUtils.CopyListener, Runnable
{
  private final ImageLoaderConfiguration configuration;
  private final ImageDecoder decoder;
  private final ImageDownloader downloader;
  private final ImageLoaderEngine engine;
  private final Handler handler;
  final ImageAware imageAware;
  private final ImageLoadingInfo imageLoadingInfo;
  final ImageLoadingListener listener;
  private LoadedFrom loadedFrom = LoadedFrom.NETWORK;
  private final String memoryCacheKey;
  private final ImageDownloader networkDeniedDownloader;
  final DisplayImageOptions options;
  final ImageLoadingProgressListener progressListener;
  private final ImageDownloader slowNetworkDownloader;
  private final boolean syncLoading;
  private final ImageSize targetSize;
  final String uri;
  
  public LoadAndDisplayImageTask(ImageLoaderEngine paramImageLoaderEngine, ImageLoadingInfo paramImageLoadingInfo, Handler paramHandler)
  {
    engine = paramImageLoaderEngine;
    imageLoadingInfo = paramImageLoadingInfo;
    handler = paramHandler;
    configuration = configuration;
    downloader = configuration.downloader;
    networkDeniedDownloader = configuration.networkDeniedDownloader;
    slowNetworkDownloader = configuration.slowNetworkDownloader;
    decoder = configuration.decoder;
    uri = uri;
    memoryCacheKey = memoryCacheKey;
    imageAware = imageAware;
    targetSize = targetSize;
    options = options;
    listener = listener;
    progressListener = progressListener;
    syncLoading = options.isSyncLoading();
  }
  
  private void checkTaskInterrupted()
    throws LoadAndDisplayImageTask.TaskCancelledException
  {
    if (isTaskInterrupted()) {
      throw new TaskCancelledException();
    }
  }
  
  private void checkTaskNotActual()
    throws LoadAndDisplayImageTask.TaskCancelledException
  {
    checkViewCollected();
    checkViewReused();
  }
  
  private void checkViewCollected()
    throws LoadAndDisplayImageTask.TaskCancelledException
  {
    if (isViewCollected()) {
      throw new TaskCancelledException();
    }
  }
  
  private void checkViewReused()
    throws LoadAndDisplayImageTask.TaskCancelledException
  {
    if (isViewReused()) {
      throw new TaskCancelledException();
    }
  }
  
  private Bitmap decodeImage(String paramString)
    throws IOException
  {
    ViewScaleType localViewScaleType = imageAware.getScaleType();
    paramString = new ImageDecodingInfo(memoryCacheKey, paramString, uri, targetSize, localViewScaleType, getDownloader(), options);
    return decoder.decode(paramString);
  }
  
  private boolean delayIfNeed()
  {
    if (options.shouldDelayBeforeLoading())
    {
      L.d("Delay %d ms before loading...  [%s]", new Object[] { Integer.valueOf(options.getDelayBeforeLoading()), memoryCacheKey });
      try
      {
        Thread.sleep(options.getDelayBeforeLoading());
        return isTaskNotActual();
      }
      catch (InterruptedException localInterruptedException)
      {
        L.e("Task was interrupted [%s]", new Object[] { memoryCacheKey });
        return true;
      }
    }
    return false;
  }
  
  private boolean downloadImage()
    throws IOException
  {
    InputStream localInputStream = getDownloader().getStream(uri, options.getExtraForDownloader());
    return configuration.diskCache.save(uri, localInputStream, this);
  }
  
  private void fireCancelEvent()
  {
    if ((syncLoading) || (isTaskInterrupted())) {
      return;
    }
    runTask(new Runnable()
    {
      public void run()
      {
        listener.onLoadingCancelled(uri, imageAware.getWrappedView());
      }
    }, false, handler, engine);
  }
  
  private void fireFailEvent(final FailReason.FailType paramFailType, final Throwable paramThrowable)
  {
    if ((syncLoading) || (isTaskInterrupted()) || (isTaskNotActual())) {
      return;
    }
    runTask(new Runnable()
    {
      public void run()
      {
        if (options.shouldShowImageOnFail()) {
          imageAware.setImageDrawable(options.getImageOnFail(configuration.resources));
        }
        listener.onLoadingFailed(uri, imageAware.getWrappedView(), new FailReason(paramFailType, paramThrowable));
      }
    }, false, handler, engine);
  }
  
  private boolean fireProgressEvent(final int paramInt1, final int paramInt2)
  {
    if ((syncLoading) || (isTaskInterrupted()) || (isTaskNotActual())) {
      return false;
    }
    if (progressListener != null) {
      runTask(new Runnable()
      {
        public void run()
        {
          progressListener.onProgressUpdate(uri, imageAware.getWrappedView(), paramInt1, paramInt2);
        }
      }, false, handler, engine);
    }
    return true;
  }
  
  private ImageDownloader getDownloader()
  {
    if (engine.isNetworkDenied()) {
      return networkDeniedDownloader;
    }
    if (engine.isSlowNetwork()) {
      return slowNetworkDownloader;
    }
    return downloader;
  }
  
  private boolean isTaskInterrupted()
  {
    if (Thread.interrupted())
    {
      L.d("Task was interrupted [%s]", new Object[] { memoryCacheKey });
      return true;
    }
    return false;
  }
  
  private boolean isTaskNotActual()
  {
    return (isViewCollected()) || (isViewReused());
  }
  
  private boolean isViewCollected()
  {
    if (imageAware.isCollected())
    {
      L.d("ImageAware was collected by GC. Task is cancelled. [%s]", new Object[] { memoryCacheKey });
      return true;
    }
    return false;
  }
  
  private boolean isViewReused()
  {
    String str = engine.getLoadingUriForView(imageAware);
    if (!memoryCacheKey.equals(str)) {}
    for (int i = 1; i != 0; i = 0)
    {
      L.d("ImageAware is reused for another image. Task is cancelled. [%s]", new Object[] { memoryCacheKey });
      return true;
    }
    return false;
  }
  
  private boolean resizeAndSaveImage(int paramInt1, int paramInt2)
    throws IOException
  {
    boolean bool2 = false;
    Object localObject1 = configuration.diskCache.get(uri);
    boolean bool1 = bool2;
    if (localObject1 != null)
    {
      bool1 = bool2;
      if (((File)localObject1).exists())
      {
        Object localObject2 = new ImageSize(paramInt1, paramInt2);
        DisplayImageOptions localDisplayImageOptions = new DisplayImageOptions.Builder().cloneFrom(options).imageScaleType(ImageScaleType.IN_SAMPLE_INT).build();
        localObject1 = new ImageDecodingInfo(memoryCacheKey, ImageDownloader.Scheme.FILE.wrap(((File)localObject1).getAbsolutePath()), uri, (ImageSize)localObject2, ViewScaleType.FIT_INSIDE, getDownloader(), localDisplayImageOptions);
        localObject2 = decoder.decode((ImageDecodingInfo)localObject1);
        localObject1 = localObject2;
        if (localObject2 != null)
        {
          localObject1 = localObject2;
          if (configuration.processorForDiskCache != null)
          {
            L.d("Process image before cache on disk [%s]", new Object[] { memoryCacheKey });
            localObject2 = configuration.processorForDiskCache.process((Bitmap)localObject2);
            localObject1 = localObject2;
            if (localObject2 == null)
            {
              L.e("Bitmap processor for disk cache returned null [%s]", new Object[] { memoryCacheKey });
              localObject1 = localObject2;
            }
          }
        }
        bool1 = bool2;
        if (localObject1 != null)
        {
          bool1 = configuration.diskCache.save(uri, (Bitmap)localObject1);
          ((Bitmap)localObject1).recycle();
        }
      }
    }
    return bool1;
  }
  
  static void runTask(Runnable paramRunnable, boolean paramBoolean, Handler paramHandler, ImageLoaderEngine paramImageLoaderEngine)
  {
    if (paramBoolean)
    {
      paramRunnable.run();
      return;
    }
    if (paramHandler == null)
    {
      paramImageLoaderEngine.fireCallback(paramRunnable);
      return;
    }
    paramHandler.post(paramRunnable);
  }
  
  private boolean tryCacheImageOnDisk()
    throws LoadAndDisplayImageTask.TaskCancelledException
  {
    L.d("Cache image on disk [%s]", new Object[] { memoryCacheKey });
    try
    {
      boolean bool = downloadImage();
      if (bool)
      {
        int i = configuration.maxImageWidthForDiskCache;
        int j = configuration.maxImageHeightForDiskCache;
        if ((i > 0) || (j > 0))
        {
          L.d("Resize image in disk cache [%s]", new Object[] { memoryCacheKey });
          resizeAndSaveImage(i, j);
        }
      }
      return bool;
    }
    catch (IOException localIOException)
    {
      L.e(localIOException);
    }
    return false;
  }
  
  private Bitmap tryLoadBitmap()
    throws LoadAndDisplayImageTask.TaskCancelledException
  {
    String str = null;
    File localFile1 = null;
    Object localObject7 = null;
    Object localObject8 = null;
    Object localObject6 = null;
    Object localObject2 = str;
    Object localObject3 = localFile1;
    Object localObject4 = localObject7;
    Object localObject5 = localObject8;
    try
    {
      File localFile2 = configuration.diskCache.get(uri);
      Object localObject1 = localObject6;
      if (localFile2 != null)
      {
        localObject1 = localObject6;
        localObject2 = str;
        localObject3 = localFile1;
        localObject4 = localObject7;
        localObject5 = localObject8;
        if (localFile2.exists())
        {
          localObject2 = str;
          localObject3 = localFile1;
          localObject4 = localObject7;
          localObject5 = localObject8;
          L.d("Load image from disk cache [%s]", new Object[] { memoryCacheKey });
          localObject2 = str;
          localObject3 = localFile1;
          localObject4 = localObject7;
          localObject5 = localObject8;
          loadedFrom = LoadedFrom.DISC_CACHE;
          localObject2 = str;
          localObject3 = localFile1;
          localObject4 = localObject7;
          localObject5 = localObject8;
          checkTaskNotActual();
          localObject2 = str;
          localObject3 = localFile1;
          localObject4 = localObject7;
          localObject5 = localObject8;
          localObject1 = decodeImage(ImageDownloader.Scheme.FILE.wrap(localFile2.getAbsolutePath()));
        }
      }
      if (localObject1 != null)
      {
        localObject2 = localObject1;
        localObject3 = localObject1;
        localObject4 = localObject1;
        localObject5 = localObject1;
        if (((Bitmap)localObject1).getWidth() > 0)
        {
          localObject6 = localObject1;
          localObject2 = localObject1;
          localObject3 = localObject1;
          localObject4 = localObject1;
          localObject5 = localObject1;
          if (((Bitmap)localObject1).getHeight() > 0) {
            break label479;
          }
        }
      }
      localObject2 = localObject1;
      localObject3 = localObject1;
      localObject4 = localObject1;
      localObject5 = localObject1;
      L.d("Load image from network [%s]", new Object[] { memoryCacheKey });
      localObject2 = localObject1;
      localObject3 = localObject1;
      localObject4 = localObject1;
      localObject5 = localObject1;
      loadedFrom = LoadedFrom.NETWORK;
      localObject2 = localObject1;
      localObject3 = localObject1;
      localObject4 = localObject1;
      localObject5 = localObject1;
      str = uri;
      localObject6 = str;
      localObject2 = localObject1;
      localObject3 = localObject1;
      localObject4 = localObject1;
      localObject5 = localObject1;
      if (options.isCacheOnDisk())
      {
        localObject6 = str;
        localObject2 = localObject1;
        localObject3 = localObject1;
        localObject4 = localObject1;
        localObject5 = localObject1;
        if (tryCacheImageOnDisk())
        {
          localObject2 = localObject1;
          localObject3 = localObject1;
          localObject4 = localObject1;
          localObject5 = localObject1;
          localFile1 = configuration.diskCache.get(uri);
          localObject6 = str;
          if (localFile1 != null)
          {
            localObject2 = localObject1;
            localObject3 = localObject1;
            localObject4 = localObject1;
            localObject5 = localObject1;
            localObject6 = ImageDownloader.Scheme.FILE.wrap(localFile1.getAbsolutePath());
          }
        }
      }
      localObject2 = localObject1;
      localObject3 = localObject1;
      localObject4 = localObject1;
      localObject5 = localObject1;
      checkTaskNotActual();
      localObject2 = localObject1;
      localObject3 = localObject1;
      localObject4 = localObject1;
      localObject5 = localObject1;
      localObject1 = decodeImage((String)localObject6);
      if (localObject1 != null)
      {
        localObject2 = localObject1;
        localObject3 = localObject1;
        localObject4 = localObject1;
        localObject5 = localObject1;
        if (((Bitmap)localObject1).getWidth() > 0)
        {
          localObject6 = localObject1;
          localObject2 = localObject1;
          localObject3 = localObject1;
          localObject4 = localObject1;
          localObject5 = localObject1;
          if (((Bitmap)localObject1).getHeight() > 0) {
            break label479;
          }
        }
      }
      localObject2 = localObject1;
      localObject3 = localObject1;
      localObject4 = localObject1;
      localObject5 = localObject1;
      fireFailEvent(FailReason.FailType.DECODING_ERROR, null);
      localObject6 = localObject1;
      label479:
      return localObject6;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      fireFailEvent(FailReason.FailType.NETWORK_DENIED, null);
      return localObject2;
    }
    catch (TaskCancelledException localTaskCancelledException)
    {
      throw localTaskCancelledException;
    }
    catch (IOException localIOException)
    {
      L.e(localIOException);
      fireFailEvent(FailReason.FailType.IO_ERROR, localIOException);
      return localObject3;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      L.e(localOutOfMemoryError);
      fireFailEvent(FailReason.FailType.OUT_OF_MEMORY, localOutOfMemoryError);
      return localObject4;
    }
    catch (Throwable localThrowable)
    {
      L.e(localThrowable);
      fireFailEvent(FailReason.FailType.UNKNOWN, localThrowable);
    }
    return localObject5;
  }
  
  private boolean waitIfPaused()
  {
    AtomicBoolean localAtomicBoolean = engine.getPause();
    if (localAtomicBoolean.get()) {}
    synchronized (engine.getPauseLock())
    {
      if (localAtomicBoolean.get()) {
        L.d("ImageLoader is paused. Waiting...  [%s]", new Object[] { memoryCacheKey });
      }
      try
      {
        engine.getPauseLock().wait();
        L.d(".. Resume loading [%s]", new Object[] { memoryCacheKey });
        return isTaskNotActual();
      }
      catch (InterruptedException localInterruptedException)
      {
        L.e("Task was interrupted [%s]", new Object[] { memoryCacheKey });
        return true;
      }
    }
  }
  
  String getLoadingUri()
  {
    return uri;
  }
  
  public boolean onBytesCopied(int paramInt1, int paramInt2)
  {
    return fireProgressEvent(paramInt1, paramInt2);
  }
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 451	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:waitIfPaused	()Z
    //   4: ifeq +4 -> 8
    //   7: return
    //   8: aload_0
    //   9: invokespecial 453	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:delayIfNeed	()Z
    //   12: ifne -5 -> 7
    //   15: aload_0
    //   16: getfield 64	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:imageLoadingInfo	Lcom/nostra13/universalimageloader/core/ImageLoadingInfo;
    //   19: getfield 457	com/nostra13/universalimageloader/core/ImageLoadingInfo:loadFromUriLock	Ljava/util/concurrent/locks/ReentrantLock;
    //   22: astore_3
    //   23: ldc_w 459
    //   26: iconst_1
    //   27: anewarray 4	java/lang/Object
    //   30: dup
    //   31: iconst_0
    //   32: aload_0
    //   33: getfield 93	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:memoryCacheKey	Ljava/lang/String;
    //   36: aastore
    //   37: invokestatic 189	com/nostra13/universalimageloader/utils/L:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   40: aload_3
    //   41: invokevirtual 464	java/util/concurrent/locks/ReentrantLock:isLocked	()Z
    //   44: ifeq +20 -> 64
    //   47: ldc_w 466
    //   50: iconst_1
    //   51: anewarray 4	java/lang/Object
    //   54: dup
    //   55: iconst_0
    //   56: aload_0
    //   57: getfield 93	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:memoryCacheKey	Ljava/lang/String;
    //   60: aastore
    //   61: invokestatic 189	com/nostra13/universalimageloader/utils/L:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   64: aload_3
    //   65: invokevirtual 469	java/util/concurrent/locks/ReentrantLock:lock	()V
    //   68: aload_0
    //   69: invokespecial 391	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:checkTaskNotActual	()V
    //   72: aload_0
    //   73: getfield 71	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:configuration	Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
    //   76: getfield 473	com/nostra13/universalimageloader/core/ImageLoaderConfiguration:memoryCache	Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;
    //   79: aload_0
    //   80: getfield 93	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:memoryCacheKey	Ljava/lang/String;
    //   83: invokeinterface 478 2 0
    //   88: checkcast 341	android/graphics/Bitmap
    //   91: astore_2
    //   92: aload_2
    //   93: ifnull +10 -> 103
    //   96: aload_2
    //   97: invokevirtual 481	android/graphics/Bitmap:isRecycled	()Z
    //   100: ifeq +270 -> 370
    //   103: aload_0
    //   104: invokespecial 483	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:tryLoadBitmap	()Landroid/graphics/Bitmap;
    //   107: astore_2
    //   108: aload_2
    //   109: ifnonnull +8 -> 117
    //   112: aload_3
    //   113: invokevirtual 486	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   116: return
    //   117: aload_0
    //   118: invokespecial 391	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:checkTaskNotActual	()V
    //   121: aload_0
    //   122: invokespecial 488	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:checkTaskInterrupted	()V
    //   125: aload_2
    //   126: astore_1
    //   127: aload_0
    //   128: getfield 102	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:options	Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    //   131: invokevirtual 491	com/nostra13/universalimageloader/core/DisplayImageOptions:shouldPreProcess	()Z
    //   134: ifeq +59 -> 193
    //   137: ldc_w 493
    //   140: iconst_1
    //   141: anewarray 4	java/lang/Object
    //   144: dup
    //   145: iconst_0
    //   146: aload_0
    //   147: getfield 93	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:memoryCacheKey	Ljava/lang/String;
    //   150: aastore
    //   151: invokestatic 189	com/nostra13/universalimageloader/utils/L:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   154: aload_0
    //   155: getfield 102	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:options	Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    //   158: invokevirtual 497	com/nostra13/universalimageloader/core/DisplayImageOptions:getPreProcessor	()Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;
    //   161: aload_2
    //   162: invokeinterface 334 2 0
    //   167: astore_2
    //   168: aload_2
    //   169: astore_1
    //   170: aload_2
    //   171: ifnonnull +22 -> 193
    //   174: ldc_w 499
    //   177: iconst_1
    //   178: anewarray 4	java/lang/Object
    //   181: dup
    //   182: iconst_0
    //   183: aload_0
    //   184: getfield 93	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:memoryCacheKey	Ljava/lang/String;
    //   187: aastore
    //   188: invokestatic 203	com/nostra13/universalimageloader/utils/L:e	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   191: aload_2
    //   192: astore_1
    //   193: aload_1
    //   194: astore_2
    //   195: aload_1
    //   196: ifnull +52 -> 248
    //   199: aload_1
    //   200: astore_2
    //   201: aload_0
    //   202: getfield 102	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:options	Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    //   205: invokevirtual 502	com/nostra13/universalimageloader/core/DisplayImageOptions:isCacheInMemory	()Z
    //   208: ifeq +40 -> 248
    //   211: ldc_w 504
    //   214: iconst_1
    //   215: anewarray 4	java/lang/Object
    //   218: dup
    //   219: iconst_0
    //   220: aload_0
    //   221: getfield 93	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:memoryCacheKey	Ljava/lang/String;
    //   224: aastore
    //   225: invokestatic 189	com/nostra13/universalimageloader/utils/L:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   228: aload_0
    //   229: getfield 71	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:configuration	Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
    //   232: getfield 473	com/nostra13/universalimageloader/core/ImageLoaderConfiguration:memoryCache	Lcom/nostra13/universalimageloader/cache/memory/MemoryCache;
    //   235: aload_0
    //   236: getfield 93	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:memoryCacheKey	Ljava/lang/String;
    //   239: aload_1
    //   240: invokeinterface 508 3 0
    //   245: pop
    //   246: aload_1
    //   247: astore_2
    //   248: aload_2
    //   249: astore_1
    //   250: aload_2
    //   251: ifnull +71 -> 322
    //   254: aload_2
    //   255: astore_1
    //   256: aload_0
    //   257: getfield 102	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:options	Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    //   260: invokevirtual 511	com/nostra13/universalimageloader/core/DisplayImageOptions:shouldPostProcess	()Z
    //   263: ifeq +59 -> 322
    //   266: ldc_w 513
    //   269: iconst_1
    //   270: anewarray 4	java/lang/Object
    //   273: dup
    //   274: iconst_0
    //   275: aload_0
    //   276: getfield 93	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:memoryCacheKey	Ljava/lang/String;
    //   279: aastore
    //   280: invokestatic 189	com/nostra13/universalimageloader/utils/L:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   283: aload_0
    //   284: getfield 102	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:options	Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    //   287: invokevirtual 516	com/nostra13/universalimageloader/core/DisplayImageOptions:getPostProcessor	()Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;
    //   290: aload_2
    //   291: invokeinterface 334 2 0
    //   296: astore_2
    //   297: aload_2
    //   298: astore_1
    //   299: aload_2
    //   300: ifnonnull +22 -> 322
    //   303: ldc_w 518
    //   306: iconst_1
    //   307: anewarray 4	java/lang/Object
    //   310: dup
    //   311: iconst_0
    //   312: aload_0
    //   313: getfield 93	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:memoryCacheKey	Ljava/lang/String;
    //   316: aastore
    //   317: invokestatic 203	com/nostra13/universalimageloader/utils/L:e	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   320: aload_2
    //   321: astore_1
    //   322: aload_0
    //   323: invokespecial 391	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:checkTaskNotActual	()V
    //   326: aload_0
    //   327: invokespecial 488	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:checkTaskInterrupted	()V
    //   330: aload_3
    //   331: invokevirtual 486	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   334: new 520	com/nostra13/universalimageloader/core/DisplayBitmapTask
    //   337: dup
    //   338: aload_1
    //   339: aload_0
    //   340: getfield 64	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:imageLoadingInfo	Lcom/nostra13/universalimageloader/core/ImageLoadingInfo;
    //   343: aload_0
    //   344: getfield 62	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:engine	Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;
    //   347: aload_0
    //   348: getfield 60	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:loadedFrom	Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;
    //   351: invokespecial 523	com/nostra13/universalimageloader/core/DisplayBitmapTask:<init>	(Landroid/graphics/Bitmap;Lcom/nostra13/universalimageloader/core/ImageLoadingInfo;Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;)V
    //   354: aload_0
    //   355: getfield 116	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:syncLoading	Z
    //   358: aload_0
    //   359: getfield 66	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:handler	Landroid/os/Handler;
    //   362: aload_0
    //   363: getfield 62	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:engine	Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;
    //   366: invokestatic 230	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:runTask	(Ljava/lang/Runnable;ZLandroid/os/Handler;Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;)V
    //   369: return
    //   370: aload_0
    //   371: getstatic 526	com/nostra13/universalimageloader/core/assist/LoadedFrom:MEMORY_CACHE	Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;
    //   374: putfield 60	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:loadedFrom	Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;
    //   377: ldc_w 528
    //   380: iconst_1
    //   381: anewarray 4	java/lang/Object
    //   384: dup
    //   385: iconst_0
    //   386: aload_0
    //   387: getfield 93	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:memoryCacheKey	Ljava/lang/String;
    //   390: aastore
    //   391: invokestatic 189	com/nostra13/universalimageloader/utils/L:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   394: goto -146 -> 248
    //   397: astore_1
    //   398: aload_0
    //   399: invokespecial 530	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask:fireCancelEvent	()V
    //   402: aload_3
    //   403: invokevirtual 486	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   406: return
    //   407: astore_1
    //   408: aload_3
    //   409: invokevirtual 486	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   412: aload_1
    //   413: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	414	0	this	LoadAndDisplayImageTask
    //   126	213	1	localObject1	Object
    //   397	1	1	localTaskCancelledException	TaskCancelledException
    //   407	6	1	localObject2	Object
    //   91	230	2	localObject3	Object
    //   22	387	3	localReentrantLock	java.util.concurrent.locks.ReentrantLock
    // Exception table:
    //   from	to	target	type
    //   68	92	397	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask$TaskCancelledException
    //   96	103	397	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask$TaskCancelledException
    //   103	108	397	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask$TaskCancelledException
    //   117	125	397	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask$TaskCancelledException
    //   127	168	397	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask$TaskCancelledException
    //   174	191	397	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask$TaskCancelledException
    //   201	246	397	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask$TaskCancelledException
    //   256	297	397	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask$TaskCancelledException
    //   303	320	397	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask$TaskCancelledException
    //   322	330	397	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask$TaskCancelledException
    //   370	394	397	com/nostra13/universalimageloader/core/LoadAndDisplayImageTask$TaskCancelledException
    //   68	92	407	finally
    //   96	103	407	finally
    //   103	108	407	finally
    //   117	125	407	finally
    //   127	168	407	finally
    //   174	191	407	finally
    //   201	246	407	finally
    //   256	297	407	finally
    //   303	320	407	finally
    //   322	330	407	finally
    //   370	394	407	finally
    //   398	402	407	finally
  }
  
  class TaskCancelledException
    extends Exception
  {
    TaskCancelledException() {}
  }
}
