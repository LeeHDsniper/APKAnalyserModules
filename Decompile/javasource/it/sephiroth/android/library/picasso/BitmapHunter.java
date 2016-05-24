package it.sephiroth.android.library.picasso;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.net.NetworkInfo;
import android.os.Handler;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;

class BitmapHunter
  implements Runnable
{
  private static final Object DECODE_LOCK = new Object();
  private static final RequestHandler ERRORING_HANDLER = new RequestHandler()
  {
    public boolean canHandleRequest(Request paramAnonymousRequest)
    {
      return true;
    }
    
    public RequestHandler.Result load(Request paramAnonymousRequest, int paramAnonymousInt)
      throws IOException
    {
      throw new IllegalStateException("Unrecognized type of request: " + paramAnonymousRequest);
    }
  };
  private static final ThreadLocal<StringBuilder> NAME_BUILDER = new ThreadLocal()
  {
    protected StringBuilder initialValue()
    {
      return new StringBuilder("Picasso-");
    }
  };
  private static final AtomicInteger SEQUENCE_GENERATOR = new AtomicInteger();
  Action action;
  List<Action> actions;
  final Cache cache;
  final Request data;
  final Cache diskCache;
  final Dispatcher dispatcher;
  Exception exception;
  int exifRotation;
  Future<?> future;
  final String key;
  Picasso.LoadedFrom loadedFrom;
  final int memoryPolicy;
  int networkPolicy;
  final Picasso picasso;
  Picasso.Priority priority;
  final RequestHandler requestHandler;
  Bitmap result;
  int retryCount;
  final int sequence = SEQUENCE_GENERATOR.incrementAndGet();
  final Stats stats;
  
  BitmapHunter(Picasso paramPicasso, Dispatcher paramDispatcher, Cache paramCache1, Cache paramCache2, Stats paramStats, Action paramAction, RequestHandler paramRequestHandler)
  {
    picasso = paramPicasso;
    dispatcher = paramDispatcher;
    cache = paramCache1;
    diskCache = paramCache2;
    stats = paramStats;
    action = paramAction;
    key = paramAction.getKey();
    data = paramAction.getRequest();
    priority = paramAction.getPriority();
    memoryPolicy = paramAction.getMemoryPolicy();
    networkPolicy = paramAction.getNetworkPolicy();
    requestHandler = paramRequestHandler;
    retryCount = paramRequestHandler.getRetryCount();
  }
  
  static Bitmap applyCustomTransformations(final List<Transformation> paramList, Bitmap paramBitmap)
  {
    int i = 0;
    int j = paramList.size();
    for (;;)
    {
      Bitmap localBitmap = paramBitmap;
      Transformation localTransformation;
      if (i < j)
      {
        localTransformation = (Transformation)paramList.get(i);
        try
        {
          localBitmap = localTransformation.transform(paramBitmap);
          if (localBitmap != null) {
            break label165;
          }
          paramBitmap = new StringBuilder().append("Transformation ").append(localTransformation.key()).append(" returned null after ").append(i).append(" previous transformation(s).\n\nTransformation list:\n");
          paramList = paramList.iterator();
          while (paramList.hasNext())
          {
            paramBitmap.append(((Transformation)paramList.next()).key()).append('\n');
            continue;
            return localBitmap;
          }
        }
        catch (RuntimeException paramList)
        {
          Picasso.HANDLER.post(new Runnable()
          {
            public void run()
            {
              throw new RuntimeException("Transformation " + val$transformation.key() + " crashed with exception.", paramList);
            }
          });
          localBitmap = null;
        }
      }
      Picasso.HANDLER.post(new Runnable()
      {
        public void run()
        {
          throw new NullPointerException(val$builder.toString());
        }
      });
      return null;
      label165:
      if ((localBitmap == paramBitmap) && (paramBitmap.isRecycled()))
      {
        Picasso.HANDLER.post(new Runnable()
        {
          public void run()
          {
            throw new IllegalStateException("Transformation " + val$transformation.key() + " returned input Bitmap but recycled it.");
          }
        });
        return null;
      }
      paramBitmap = localBitmap;
      i += 1;
    }
  }
  
  private Picasso.Priority computeNewPriority()
  {
    Object localObject1 = Picasso.Priority.LOW;
    int i;
    if ((actions != null) && (!actions.isEmpty()))
    {
      i = 1;
      if ((action == null) && (i == 0)) {
        break label49;
      }
    }
    label49:
    for (int j = 1;; j = 0)
    {
      if (j != 0) {
        break label54;
      }
      return localObject1;
      i = 0;
      break;
    }
    label54:
    if (action != null) {
      localObject1 = action.getPriority();
    }
    Object localObject2 = localObject1;
    if (i != 0)
    {
      i = 0;
      j = actions.size();
      for (;;)
      {
        localObject2 = localObject1;
        if (i >= j) {
          break;
        }
        Picasso.Priority localPriority = ((Action)actions.get(i)).getPriority();
        localObject2 = localObject1;
        if (localPriority.ordinal() > ((Picasso.Priority)localObject1).ordinal()) {
          localObject2 = localPriority;
        }
        i += 1;
        localObject1 = localObject2;
      }
    }
    return localObject2;
  }
  
  static Bitmap decodeStream(InputStream paramInputStream, Request paramRequest)
    throws IOException
  {
    Object localObject = new MarkableInputStream(paramInputStream);
    ((MarkableInputStream)localObject).allowMarksToExpire(false);
    long l = ((MarkableInputStream)localObject).savePosition(1024);
    paramInputStream = RequestHandler.createBitmapOptions(paramRequest);
    boolean bool1 = RequestHandler.requiresInSampleSize(paramInputStream);
    boolean bool2 = Utils.isWebPFile((InputStream)localObject);
    ((MarkableInputStream)localObject).reset(l);
    if (bool2)
    {
      localObject = Utils.toByteArray((InputStream)localObject);
      if (bool1)
      {
        BitmapFactory.decodeByteArray((byte[])localObject, 0, localObject.length, paramInputStream);
        RequestHandler.calculateInSampleSize(targetWidth, targetHeight, paramInputStream, paramRequest);
      }
      paramInputStream = BitmapFactory.decodeByteArray((byte[])localObject, 0, localObject.length, paramInputStream);
    }
    do
    {
      return paramInputStream;
      if (bool1)
      {
        BitmapFactory.decodeStream((InputStream)localObject, null, paramInputStream);
        RequestHandler.calculateInSampleSize(targetWidth, targetHeight, paramInputStream, paramRequest);
        ((MarkableInputStream)localObject).reset(l);
      }
      ((MarkableInputStream)localObject).allowMarksToExpire(true);
      paramRequest = BitmapFactory.decodeStream((InputStream)localObject, null, paramInputStream);
      paramInputStream = paramRequest;
    } while (paramRequest != null);
    throw new IOException("Failed to decode stream.");
  }
  
  static BitmapHunter forRequest(Picasso paramPicasso, Dispatcher paramDispatcher, Cache paramCache1, Cache paramCache2, Stats paramStats, Action paramAction)
  {
    Request localRequest = paramAction.getRequest();
    List localList = paramPicasso.getRequestHandlers();
    int i = 0;
    int j = localList.size();
    while (i < j)
    {
      RequestHandler localRequestHandler = (RequestHandler)localList.get(i);
      if (localRequestHandler.canHandleRequest(localRequest)) {
        return new BitmapHunter(paramPicasso, paramDispatcher, paramCache1, paramCache2, paramStats, paramAction, localRequestHandler);
      }
      i += 1;
    }
    return new BitmapHunter(paramPicasso, paramDispatcher, paramCache1, paramCache2, paramStats, paramAction, ERRORING_HANDLER);
  }
  
  private static boolean shouldResize(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    return (!paramBoolean) || (paramInt1 > paramInt3) || (paramInt2 > paramInt4);
  }
  
  static Bitmap transformResult(Request paramRequest, Bitmap paramBitmap, int paramInt)
  {
    int i4 = paramBitmap.getWidth();
    int i5 = paramBitmap.getHeight();
    boolean bool = onlyScaleDown;
    int m = 0;
    int i6 = 0;
    int i7 = 0;
    int k = 0;
    int j = i4;
    int i = i5;
    Object localObject = new Matrix();
    int n = m;
    int i1 = i7;
    int i2 = j;
    int i3 = i;
    int i8;
    int i9;
    float f1;
    if (paramRequest.needsMatrixTransform())
    {
      i8 = targetWidth;
      i9 = targetHeight;
      f1 = rotationDegrees;
      if (f1 != 0.0F)
      {
        if (!hasRotationPivot) {
          break label289;
        }
        ((Matrix)localObject).setRotate(f1, rotationPivotX, rotationPivotY);
      }
      if (!centerCrop) {
        break label333;
      }
      f1 = i8 / i4;
      f2 = i9 / i5;
      if (f1 <= f2) {
        break label298;
      }
      i = (int)Math.ceil(i5 * (f2 / f1));
      k = (i5 - i) / 2;
      f2 = i9 / i;
      m = j;
      j = i6;
      label186:
      n = j;
      i1 = k;
      i2 = m;
      i3 = i;
      if (shouldResize(bool, i4, i5, i8, i9))
      {
        ((Matrix)localObject).preScale(f1, f2);
        i3 = i;
        i2 = m;
        i1 = k;
        n = j;
      }
    }
    label289:
    label298:
    label333:
    label578:
    do
    {
      do
      {
        if (paramInt != 0) {
          ((Matrix)localObject).preRotate(paramInt);
        }
        localObject = Bitmap.createBitmap(paramBitmap, n, i1, i2, i3, (Matrix)localObject, true);
        paramRequest = paramBitmap;
        if (localObject != paramBitmap)
        {
          paramBitmap.recycle();
          paramRequest = (Request)localObject;
        }
        return paramRequest;
        ((Matrix)localObject).setRotate(f1);
        break;
        m = (int)Math.ceil(i4 * (f1 / f2));
        j = (i4 - m) / 2;
        f1 = i8 / m;
        break label186;
        if (centerInside)
        {
          f1 = i8 / i4;
          f2 = i9 / i5;
          if (f1 < f2) {}
          for (;;)
          {
            n = m;
            i1 = i7;
            i2 = j;
            i3 = i;
            if (!shouldResize(bool, i4, i5, i8, i9)) {
              break;
            }
            ((Matrix)localObject).preScale(f1, f1);
            n = m;
            i1 = i7;
            i2 = j;
            i3 = i;
            break;
            f1 = f2;
          }
        }
        if ((resizeByMaxSide) && ((i8 != i4) || (i9 != i5)))
        {
          if (i4 > i5) {}
          for (f1 = i8 / i4;; f1 = i9 / i5)
          {
            if (bool)
            {
              n = m;
              i1 = i7;
              i2 = j;
              i3 = i;
              if (!bool) {
                break;
              }
              n = m;
              i1 = i7;
              i2 = j;
              i3 = i;
              if (f1 >= 1.0D) {
                break;
              }
            }
            ((Matrix)localObject).preScale(f1, f1);
            n = m;
            i1 = i7;
            i2 = j;
            i3 = i;
            break;
          }
        }
        if (i8 != 0) {
          break label578;
        }
        n = m;
        i1 = i7;
        i2 = j;
        i3 = i;
      } while (i9 == 0);
      if (i8 != i4) {
        break label608;
      }
      n = m;
      i1 = i7;
      i2 = j;
      i3 = i;
    } while (i9 == i5);
    label608:
    if (i8 != 0)
    {
      f1 = i8 / i4;
      label621:
      if (i9 == 0) {
        break label706;
      }
    }
    label706:
    for (float f2 = i9 / i5;; f2 = i8 / i4)
    {
      n = m;
      i1 = i7;
      i2 = j;
      i3 = i;
      if (!shouldResize(bool, i4, i5, i8, i9)) {
        break;
      }
      ((Matrix)localObject).preScale(f1, f2);
      n = m;
      i1 = i7;
      i2 = j;
      i3 = i;
      break;
      f1 = i9 / i5;
      break label621;
    }
  }
  
  static void updateThreadName(Request paramRequest)
  {
    paramRequest = paramRequest.getName();
    StringBuilder localStringBuilder = (StringBuilder)NAME_BUILDER.get();
    localStringBuilder.ensureCapacity("Picasso-".length() + paramRequest.length());
    localStringBuilder.replace("Picasso-".length(), localStringBuilder.length(), paramRequest);
    Thread.currentThread().setName(localStringBuilder.toString());
  }
  
  void attach(Action paramAction)
  {
    boolean bool = picasso.loggingEnabled;
    Request localRequest = request;
    if (action == null)
    {
      action = paramAction;
      if (bool)
      {
        if ((actions != null) && (!actions.isEmpty())) {
          break label65;
        }
        Utils.log("Hunter", "joined", localRequest.logId(), "to empty hunter");
      }
    }
    label65:
    do
    {
      return;
      Utils.log("Hunter", "joined", localRequest.logId(), Utils.getLogIdsForHunter(this, "to "));
      return;
      if (actions == null) {
        actions = new ArrayList(3);
      }
      actions.add(paramAction);
      if (bool) {
        Utils.log("Hunter", "joined", localRequest.logId(), Utils.getLogIdsForHunter(this, "to "));
      }
      paramAction = paramAction.getPriority();
    } while (paramAction.ordinal() <= priority.ordinal());
    priority = paramAction;
  }
  
  boolean cancel()
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (action == null) {
      if (actions != null)
      {
        bool1 = bool2;
        if (!actions.isEmpty()) {}
      }
      else
      {
        bool1 = bool2;
        if (future != null)
        {
          bool1 = bool2;
          if (future.cancel(false)) {
            bool1 = true;
          }
        }
      }
    }
    return bool1;
  }
  
  void detach(Action paramAction)
  {
    boolean bool = false;
    if (action == paramAction)
    {
      action = null;
      bool = true;
    }
    for (;;)
    {
      if ((bool) && (paramAction.getPriority() == priority)) {
        priority = computeNewPriority();
      }
      if (picasso.loggingEnabled) {
        Utils.log("Hunter", "removed", request.logId(), Utils.getLogIdsForHunter(this, "from "));
      }
      return;
      if (actions != null) {
        bool = actions.remove(paramAction);
      }
    }
  }
  
  Action getAction()
  {
    return action;
  }
  
  List<Action> getActions()
  {
    return actions;
  }
  
  Request getData()
  {
    return data;
  }
  
  Exception getException()
  {
    return exception;
  }
  
  String getKey()
  {
    return key;
  }
  
  Picasso.LoadedFrom getLoadedFrom()
  {
    return loadedFrom;
  }
  
  int getMemoryPolicy()
  {
    return memoryPolicy;
  }
  
  Picasso getPicasso()
  {
    return picasso;
  }
  
  Picasso.Priority getPriority()
  {
    return priority;
  }
  
  Bitmap getResult()
  {
    return result;
  }
  
  Bitmap hunt()
    throws IOException
  {
    Object localObject1 = null;
    if (isCancelled()) {
      return null;
    }
    if (MemoryPolicy.shouldReadFromMemoryCache(memoryPolicy))
    {
      if (picasso.loggingEnabled) {
        Utils.log("Hunter", "executing", data.logId(), "cache: " + cache);
      }
      localObject4 = cache.get(key);
      localObject1 = localObject4;
      if (localObject4 != null)
      {
        stats.dispatchCacheHit();
        loadedFrom = Picasso.LoadedFrom.MEMORY;
        if (picasso.loggingEnabled) {
          Utils.log("Hunter", "decoded", data.logId(), "from cache");
        }
        return localObject4;
      }
    }
    if (diskCache != null)
    {
      if (picasso.loggingEnabled) {
        Utils.log("Hunter", "executing", data.logId(), "diskCache: " + diskCache);
      }
      localObject4 = diskCache.get(key);
      localObject1 = localObject4;
      if (localObject4 != null)
      {
        stats.dispatchCacheHit();
        loadedFrom = Picasso.LoadedFrom.DISK_CACHE;
        return localObject4;
      }
    }
    if (isCancelled()) {
      return null;
    }
    Object localObject4 = data;
    if (retryCount == 0) {}
    for (int i = OFFLINEindex;; i = networkPolicy)
    {
      networkPolicy = i;
      ??? = requestHandler.load(data, networkPolicy);
      if (??? != null)
      {
        loadedFrom = ((RequestHandler.Result)???).getLoadedFrom();
        exifRotation = ((RequestHandler.Result)???).getExifOrientation();
        localObject4 = ((RequestHandler.Result)???).getBitmap();
        localObject1 = localObject4;
        if (localObject4 == null) {
          localObject4 = ((RequestHandler.Result)???).getStream();
        }
      }
      try
      {
        localObject1 = decodeStream((InputStream)localObject4, data);
        Utils.closeQuietly((InputStream)localObject4);
        return null;
      }
      finally
      {
        Utils.closeQuietly((InputStream)localObject4);
      }
    }
    if (localBitmap != null)
    {
      if (picasso.loggingEnabled) {
        Utils.log("Hunter", "decoded", data.logId());
      }
      stats.dispatchBitmapDecoded(localBitmap);
      if (!data.needsTransformation())
      {
        localObject4 = localBitmap;
        if (exifRotation == 0) {
          break label560;
        }
      }
    }
    synchronized (DECODE_LOCK)
    {
      if (!data.needsMatrixTransform())
      {
        localObject4 = localBitmap;
        if (exifRotation == 0) {}
      }
      else
      {
        localObject2 = transformResult(data, localBitmap, exifRotation);
        localObject4 = localObject2;
        if (picasso.loggingEnabled)
        {
          Utils.log("Hunter", "transformed", data.logId());
          localObject4 = localObject2;
        }
      }
      Object localObject2 = localObject4;
      if (data.hasCustomTransformations())
      {
        localObject4 = applyCustomTransformations(data.transformations, (Bitmap)localObject4);
        localObject2 = localObject4;
        if (picasso.loggingEnabled)
        {
          Utils.log("Hunter", "transformed", data.logId(), "from custom transformations");
          localObject2 = localObject4;
        }
      }
      localObject4 = localObject2;
      if (localObject2 != null)
      {
        stats.dispatchBitmapTransformed((Bitmap)localObject2);
        localObject4 = localObject2;
      }
      label560:
      return localObject4;
    }
  }
  
  boolean isCancelled()
  {
    return (future != null) && (future.isCancelled());
  }
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 113	it/sephiroth/android/library/picasso/BitmapHunter:data	Lit/sephiroth/android/library/picasso/Request;
    //   4: invokestatic 608	it/sephiroth/android/library/picasso/BitmapHunter:updateThreadName	(Lit/sephiroth/android/library/picasso/Request;)V
    //   7: aload_0
    //   8: getfield 89	it/sephiroth/android/library/picasso/BitmapHunter:picasso	Lit/sephiroth/android/library/picasso/Picasso;
    //   11: getfield 426	it/sephiroth/android/library/picasso/Picasso:loggingEnabled	Z
    //   14: ifeq +16 -> 30
    //   17: ldc_w 431
    //   20: ldc_w 505
    //   23: aload_0
    //   24: invokestatic 611	it/sephiroth/android/library/picasso/Utils:getLogIdsForHunter	(Lit/sephiroth/android/library/picasso/BitmapHunter;)Ljava/lang/String;
    //   27: invokestatic 572	it/sephiroth/android/library/picasso/Utils:log	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   30: aload_0
    //   31: aload_0
    //   32: invokevirtual 613	it/sephiroth/android/library/picasso/BitmapHunter:hunt	()Landroid/graphics/Bitmap;
    //   35: putfield 493	it/sephiroth/android/library/picasso/BitmapHunter:result	Landroid/graphics/Bitmap;
    //   38: aload_0
    //   39: getfield 493	it/sephiroth/android/library/picasso/BitmapHunter:result	Landroid/graphics/Bitmap;
    //   42: ifnonnull +21 -> 63
    //   45: aload_0
    //   46: getfield 91	it/sephiroth/android/library/picasso/BitmapHunter:dispatcher	Lit/sephiroth/android/library/picasso/Dispatcher;
    //   49: aload_0
    //   50: invokevirtual 619	it/sephiroth/android/library/picasso/Dispatcher:dispatchFailed	(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    //   53: invokestatic 415	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   56: ldc_w 621
    //   59: invokevirtual 421	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   62: return
    //   63: aload_0
    //   64: getfield 91	it/sephiroth/android/library/picasso/BitmapHunter:dispatcher	Lit/sephiroth/android/library/picasso/Dispatcher;
    //   67: aload_0
    //   68: invokevirtual 624	it/sephiroth/android/library/picasso/Dispatcher:dispatchComplete	(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    //   71: goto -18 -> 53
    //   74: astore_1
    //   75: aload_1
    //   76: getfield 627	it/sephiroth/android/library/picasso/Downloader$ResponseException:localCacheOnly	Z
    //   79: ifeq +13 -> 92
    //   82: aload_1
    //   83: getfield 630	it/sephiroth/android/library/picasso/Downloader$ResponseException:responseCode	I
    //   86: sipush 504
    //   89: if_icmpeq +8 -> 97
    //   92: aload_0
    //   93: aload_1
    //   94: putfield 483	it/sephiroth/android/library/picasso/BitmapHunter:exception	Ljava/lang/Exception;
    //   97: aload_0
    //   98: getfield 91	it/sephiroth/android/library/picasso/BitmapHunter:dispatcher	Lit/sephiroth/android/library/picasso/Dispatcher;
    //   101: aload_0
    //   102: invokevirtual 619	it/sephiroth/android/library/picasso/Dispatcher:dispatchFailed	(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    //   105: invokestatic 415	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   108: ldc_w 621
    //   111: invokevirtual 421	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   114: return
    //   115: astore_1
    //   116: aload_0
    //   117: aload_1
    //   118: putfield 483	it/sephiroth/android/library/picasso/BitmapHunter:exception	Ljava/lang/Exception;
    //   121: aload_0
    //   122: getfield 91	it/sephiroth/android/library/picasso/BitmapHunter:dispatcher	Lit/sephiroth/android/library/picasso/Dispatcher;
    //   125: aload_0
    //   126: invokevirtual 633	it/sephiroth/android/library/picasso/Dispatcher:dispatchRetry	(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    //   129: invokestatic 415	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   132: ldc_w 621
    //   135: invokevirtual 421	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   138: return
    //   139: astore_1
    //   140: aload_0
    //   141: aload_1
    //   142: putfield 483	it/sephiroth/android/library/picasso/BitmapHunter:exception	Ljava/lang/Exception;
    //   145: aload_0
    //   146: getfield 91	it/sephiroth/android/library/picasso/BitmapHunter:dispatcher	Lit/sephiroth/android/library/picasso/Dispatcher;
    //   149: aload_0
    //   150: invokevirtual 633	it/sephiroth/android/library/picasso/Dispatcher:dispatchRetry	(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    //   153: invokestatic 415	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   156: ldc_w 621
    //   159: invokevirtual 421	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   162: return
    //   163: astore_1
    //   164: new 635	java/io/StringWriter
    //   167: dup
    //   168: invokespecial 636	java/io/StringWriter:<init>	()V
    //   171: astore_2
    //   172: aload_0
    //   173: getfield 97	it/sephiroth/android/library/picasso/BitmapHunter:stats	Lit/sephiroth/android/library/picasso/Stats;
    //   176: invokevirtual 640	it/sephiroth/android/library/picasso/Stats:createSnapshot	()Lit/sephiroth/android/library/picasso/StatsSnapshot;
    //   179: new 642	java/io/PrintWriter
    //   182: dup
    //   183: aload_2
    //   184: invokespecial 645	java/io/PrintWriter:<init>	(Ljava/io/Writer;)V
    //   187: invokevirtual 651	it/sephiroth/android/library/picasso/StatsSnapshot:dump	(Ljava/io/PrintWriter;)V
    //   190: aload_0
    //   191: new 142	java/lang/RuntimeException
    //   194: dup
    //   195: aload_2
    //   196: invokevirtual 652	java/io/StringWriter:toString	()Ljava/lang/String;
    //   199: aload_1
    //   200: invokespecial 655	java/lang/RuntimeException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   203: putfield 483	it/sephiroth/android/library/picasso/BitmapHunter:exception	Ljava/lang/Exception;
    //   206: aload_0
    //   207: getfield 91	it/sephiroth/android/library/picasso/BitmapHunter:dispatcher	Lit/sephiroth/android/library/picasso/Dispatcher;
    //   210: aload_0
    //   211: invokevirtual 619	it/sephiroth/android/library/picasso/Dispatcher:dispatchFailed	(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    //   214: invokestatic 415	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   217: ldc_w 621
    //   220: invokevirtual 421	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   223: return
    //   224: astore_1
    //   225: aload_0
    //   226: aload_1
    //   227: putfield 483	it/sephiroth/android/library/picasso/BitmapHunter:exception	Ljava/lang/Exception;
    //   230: aload_0
    //   231: getfield 91	it/sephiroth/android/library/picasso/BitmapHunter:dispatcher	Lit/sephiroth/android/library/picasso/Dispatcher;
    //   234: aload_0
    //   235: invokevirtual 619	it/sephiroth/android/library/picasso/Dispatcher:dispatchFailed	(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    //   238: aload_1
    //   239: invokevirtual 658	java/lang/Exception:printStackTrace	()V
    //   242: invokestatic 415	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   245: ldc_w 621
    //   248: invokevirtual 421	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   251: return
    //   252: astore_1
    //   253: invokestatic 415	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   256: ldc_w 621
    //   259: invokevirtual 421	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   262: aload_1
    //   263: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	264	0	this	BitmapHunter
    //   74	20	1	localResponseException	Downloader.ResponseException
    //   115	3	1	localContentLengthException	NetworkRequestHandler.ContentLengthException
    //   139	3	1	localIOException	IOException
    //   163	37	1	localOutOfMemoryError	OutOfMemoryError
    //   224	15	1	localException	Exception
    //   252	11	1	localObject	Object
    //   171	25	2	localStringWriter	java.io.StringWriter
    // Exception table:
    //   from	to	target	type
    //   0	30	74	it/sephiroth/android/library/picasso/Downloader$ResponseException
    //   30	53	74	it/sephiroth/android/library/picasso/Downloader$ResponseException
    //   63	71	74	it/sephiroth/android/library/picasso/Downloader$ResponseException
    //   0	30	115	it/sephiroth/android/library/picasso/NetworkRequestHandler$ContentLengthException
    //   30	53	115	it/sephiroth/android/library/picasso/NetworkRequestHandler$ContentLengthException
    //   63	71	115	it/sephiroth/android/library/picasso/NetworkRequestHandler$ContentLengthException
    //   0	30	139	java/io/IOException
    //   30	53	139	java/io/IOException
    //   63	71	139	java/io/IOException
    //   0	30	163	java/lang/OutOfMemoryError
    //   30	53	163	java/lang/OutOfMemoryError
    //   63	71	163	java/lang/OutOfMemoryError
    //   0	30	224	java/lang/Exception
    //   30	53	224	java/lang/Exception
    //   63	71	224	java/lang/Exception
    //   0	30	252	finally
    //   30	53	252	finally
    //   63	71	252	finally
    //   75	92	252	finally
    //   92	97	252	finally
    //   97	105	252	finally
    //   116	129	252	finally
    //   140	153	252	finally
    //   164	214	252	finally
    //   225	242	252	finally
  }
  
  boolean shouldRetry(boolean paramBoolean, NetworkInfo paramNetworkInfo)
  {
    if (retryCount > 0) {}
    for (int i = 1; i == 0; i = 0) {
      return false;
    }
    retryCount -= 1;
    return requestHandler.shouldRetry(paramBoolean, paramNetworkInfo);
  }
  
  boolean supportsReplay()
  {
    return requestHandler.supportsReplay();
  }
}
