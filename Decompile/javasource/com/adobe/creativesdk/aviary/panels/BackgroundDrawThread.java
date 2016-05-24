package com.adobe.creativesdk.aviary.panels;

import android.graphics.Bitmap;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Handler;
import com.adobe.creativesdk.aviary.internal.headless.filters.MoaJavaToolStrokeResult;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeToolFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeToolFilter.BrushMode;
import com.adobe.creativesdk.aviary.internal.headless.moa.Moa;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaStrokeParameter;
import com.adobe.creativesdk.aviary.internal.utils.ArrayUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import java.lang.ref.SoftReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

final class BackgroundDrawThread
  extends Thread
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("BackgroundDrawThread", LoggerFactory.LoggerType.ConsoleLoggerType);
  private double brushMultiplier;
  private NativeToolFilter filter;
  private Handler handler;
  private DrawQueue mCurrentQueue;
  private final PointF mLastPoint = new PointF();
  SoftReference<Bitmap> mPreviewBitmap;
  private final Queue<DrawQueue> mQueue = new LinkedBlockingQueue();
  private boolean mRegisterStrokeInitParams;
  SoftReference<Bitmap> mSourceBitmap;
  private volatile boolean running;
  private boolean singleTapAllowed;
  private boolean started;
  
  public BackgroundDrawThread(String paramString, int paramInt, NativeToolFilter paramNativeToolFilter, Handler paramHandler, double paramDouble)
  {
    super(paramString);
    filter = paramNativeToolFilter;
    handler = paramHandler;
    brushMultiplier = paramDouble;
    setPriority(paramInt);
    init();
  }
  
  public void clear()
  {
    logger.info("clear");
    if (running) {
      synchronized (mQueue)
      {
        while (mQueue.size() > 0)
        {
          DrawQueue localDrawQueue = (DrawQueue)mQueue.poll();
          if (localDrawQueue != null)
          {
            logger.log("end element...");
            localDrawQueue.end();
          }
        }
      }
    }
  }
  
  public void finish()
  {
    logger.info("finish");
    if (running) {
      synchronized (mQueue)
      {
        Iterator localIterator = mQueue.iterator();
        while (localIterator.hasNext())
        {
          DrawQueue localDrawQueue = (DrawQueue)localIterator.next();
          if (localDrawQueue != null)
          {
            logger.log("end element...");
            localDrawQueue.end();
          }
        }
      }
    }
  }
  
  public int getQueueSize()
  {
    return mQueue.size();
  }
  
  public void init() {}
  
  public boolean isCompleted()
  {
    return mQueue.size() == 0;
  }
  
  public boolean isInterrupted()
  {
    if (!running) {
      return true;
    }
    return super.isInterrupted();
  }
  
  public void lineTo(float[] paramArrayOfFloat)
  {
    if ((!running) || (mCurrentQueue == null)) {
      return;
    }
    float f = PointF.length(Math.abs(mLastPoint.x - paramArrayOfFloat[0]), Math.abs(mLastPoint.y - paramArrayOfFloat[1]));
    if (f > 10.0F)
    {
      mLastPoint.set(paramArrayOfFloat[0], paramArrayOfFloat[1]);
      mCurrentQueue.add(paramArrayOfFloat);
      return;
    }
    logger.warn("skipping point, too close... " + f);
  }
  
  public void pathEnd()
  {
    for (;;)
    {
      try
      {
        if (running)
        {
          DrawQueue localDrawQueue = mCurrentQueue;
          if (localDrawQueue != null) {}
        }
        else
        {
          return;
        }
        logger.info("pathEnd");
        if (singleTapAllowed)
        {
          mCurrentQueue.add(new float[] { mLastPoint.x, mLastPoint.y });
          mCurrentQueue.end();
          mCurrentQueue = null;
          continue;
        }
        if (mLastPoint.equals(mCurrentQueue.getOriginalPoint())) {
          break label150;
        }
      }
      finally {}
      logger.log("adding tail");
      mCurrentQueue.add(new float[] { mLastPoint.x, mLastPoint.y });
      continue;
      label150:
      logger.log("skipping tail");
    }
  }
  
  /* Error */
  public void pathStart(float paramFloat, float[] paramArrayOfFloat, NativeToolFilter.BrushMode paramBrushMode)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 88	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:running	Z
    //   6: istore 4
    //   8: iload 4
    //   10: ifne +6 -> 16
    //   13: aload_0
    //   14: monitorexit
    //   15: return
    //   16: getstatic 49	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   19: ldc -63
    //   21: invokeinterface 86 2 0
    //   26: aload_0
    //   27: getfield 130	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:mCurrentQueue	Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    //   30: ifnull +15 -> 45
    //   33: aload_0
    //   34: getfield 130	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:mCurrentQueue	Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    //   37: invokevirtual 106	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue:end	()V
    //   40: aload_0
    //   41: aconst_null
    //   42: putfield 130	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:mCurrentQueue	Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    //   45: aload_0
    //   46: getfield 66	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:mLastPoint	Landroid/graphics/PointF;
    //   49: aload_2
    //   50: iconst_0
    //   51: faload
    //   52: aload_2
    //   53: iconst_1
    //   54: faload
    //   55: invokevirtual 152	android/graphics/PointF:set	(FF)V
    //   58: new 6	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue
    //   61: dup
    //   62: aload_3
    //   63: fload_1
    //   64: aload_2
    //   65: invokespecial 196	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue:<init>	(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;F[F)V
    //   68: astore_2
    //   69: aload_0
    //   70: getfield 61	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:mQueue	Ljava/util/Queue;
    //   73: aload_2
    //   74: invokeinterface 197 2 0
    //   79: pop
    //   80: aload_0
    //   81: aload_2
    //   82: putfield 130	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:mCurrentQueue	Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    //   85: goto -72 -> 13
    //   88: astore_2
    //   89: aload_0
    //   90: monitorexit
    //   91: aload_2
    //   92: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	93	0	this	BackgroundDrawThread
    //   0	93	1	paramFloat	float
    //   0	93	2	paramArrayOfFloat	float[]
    //   0	93	3	paramBrushMode	NativeToolFilter.BrushMode
    //   6	3	4	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	8	88	finally
    //   16	45	88	finally
    //   45	85	88	finally
  }
  
  public void quit()
  {
    try
    {
      logger.info("quit");
      started = true;
      running = false;
      filter = null;
      interrupt();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void run()
  {
    while (!started) {}
    int j = 0;
    DrawQueue localDrawQueue = null;
    Rect localRect = new Rect();
    MoaJavaToolStrokeResult localMoaJavaToolStrokeResult;
    Object localObject2;
    Object localObject3;
    int i;
    Object localObject1;
    if (mRegisterStrokeInitParams)
    {
      localMoaJavaToolStrokeResult = new MoaJavaToolStrokeResult();
      logger.log("thread.start!");
      localArrayList = null;
      localMoaStrokeParameter = null;
      localObject2 = localArrayList;
      localObject3 = localDrawQueue;
      i = j;
      if (filter != null)
      {
        localObject2 = localArrayList;
        localObject3 = localDrawQueue;
        i = j;
        if (!isInterrupted())
        {
          localObject2 = localArrayList;
          localObject3 = localDrawQueue;
          i = j;
          if (mSourceBitmap != null)
          {
            localObject4 = (Bitmap)mSourceBitmap.get();
            if (mPreviewBitmap == null) {
              break label422;
            }
            localObject1 = (Bitmap)mPreviewBitmap.get();
            label142:
            localObject2 = localArrayList;
            localObject3 = localDrawQueue;
            i = j;
            if (localObject4 != null)
            {
              localObject2 = localArrayList;
              localObject3 = localDrawQueue;
              i = j;
              if (!((Bitmap)localObject4).isRecycled()) {
                if (localObject1 != null)
                {
                  localObject2 = localArrayList;
                  localObject3 = localDrawQueue;
                  i = j;
                  if (((Bitmap)localObject1).isRecycled()) {}
                }
                else
                {
                  filter.init((Bitmap)localObject4, (Bitmap)localObject1);
                  if (localObject1 == null) {
                    break label428;
                  }
                  label221:
                  if ((filter != null) && (!isInterrupted())) {
                    filter.renderPreview();
                  }
                  localObject2 = localObject1;
                  localObject3 = localDrawQueue;
                  i = j;
                  if (handler != null)
                  {
                    localObject2 = localObject1;
                    localObject3 = localDrawQueue;
                    i = j;
                    if (!isInterrupted())
                    {
                      Moa.notifyPixelsChanged((Bitmap)localObject1);
                      handler.sendEmptyMessage(1003);
                      handler.sendEmptyMessage(1000);
                      i = j;
                      localObject3 = localDrawQueue;
                      localObject2 = localObject1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    label422:
    label428:
    int k;
    for (;;)
    {
      if (!isInterrupted())
      {
        if (isInterrupted()) {
          logger.log("isInterrupted:true");
        }
      }
      else
      {
        logger.log("exiting while isInterrupted: " + isInterrupted());
        if ((handler != null) && (!isInterrupted())) {
          handler.sendEmptyMessage(1002);
        }
        handler = null;
        logger.log("exiting thread...");
        return;
        localMoaJavaToolStrokeResult = null;
        break;
        localObject1 = null;
        break label142;
        localObject1 = localMoaStrokeParameter;
        if (localObject4 == null) {
          break label221;
        }
        localObject1 = localObject4;
        break label221;
      }
      if ((mQueue.size() <= 0) || (isInterrupted())) {
        break label1610;
      }
      logger.log("queue.size: " + mQueue.size());
      j = i;
      if (i == 0)
      {
        i = 1;
        j = i;
        if (handler != null)
        {
          handler.sendEmptyMessage(1001);
          j = i;
        }
      }
      k = 1;
      localDrawQueue = (DrawQueue)mQueue.element();
      if (localDrawQueue != null) {
        break label576;
      }
      mQueue.poll();
      i = j;
    }
    label576:
    float f1 = localDrawQueue.getRadius();
    logger.log("radius: %.2f", new Object[] { Float.valueOf(f1) });
    Object localObject4 = localDrawQueue.getMode();
    MoaStrokeParameter localMoaStrokeParameter = new MoaStrokeParameter((NativeToolFilter.BrushMode)localObject4, f1);
    ArrayList localArrayList = new ArrayList();
    int m = 0;
    label636:
    do
    {
      if (((localDrawQueue.size() <= 0) && (localDrawQueue.isCompleted())) || (isInterrupted())) {}
      while (filter == null)
      {
        if ((filter != null) && (!isInterrupted())) {
          filter.addStrokeData(localMoaStrokeParameter);
        }
        mQueue.poll();
        i = j;
        break;
      }
      localObject1 = (float[])localDrawQueue.poll();
    } while (localObject1 == null);
    int n;
    if (k != 0)
    {
      n = 0;
      localRect.set((int)(localObject1[0] - f1 * brushMultiplier), (int)(localObject1[1] - f1 * brushMultiplier), (int)(localObject1[0] + f1 * brushMultiplier), (int)(localObject1[1] + f1 * brushMultiplier));
      localMoaStrokeParameter.addPoint((float[])localObject1);
      localArrayList.add(Float.valueOf(localObject1[0]));
      localArrayList.add(Float.valueOf(localObject1[1]));
      if ((filter != null) && (!isInterrupted()))
      {
        filter.setBrushMode((NativeToolFilter.BrushMode)localObject4);
        filter.drawStart(f1, 0.0D, localRect.centerX(), localRect.centerY(), localMoaJavaToolStrokeResult);
        if (localMoaJavaToolStrokeResult != null)
        {
          logger.log("strokeResult: %s", new Object[] { localMoaJavaToolStrokeResult });
          localMoaStrokeParameter.setInitParams(localMoaJavaToolStrokeResult);
        }
        if (filter != null) {
          filter.renderPreview(localRect);
        }
      }
      if ((handler == null) || (isInterrupted())) {
        break label1646;
      }
      Moa.notifyPixelsChanged((Bitmap)localObject2);
      handler.sendEmptyMessage(1003);
      i = 2;
    }
    for (;;)
    {
      localObject3 = localObject1;
      m = i;
      k = n;
      break label636;
      if (localObject3 == null) {
        break label636;
      }
      logger.log("path.size: %d", new Object[] { Integer.valueOf(localArrayList.size()) });
      logger.log("element.iscompleted: %b", new Object[] { Boolean.valueOf(localDrawQueue.isCompleted()) });
      logger.log("element.size: %d", new Object[] { Integer.valueOf(localDrawQueue.size()) });
      i = 0;
      label1220:
      double d;
      if ((localArrayList.size() == 2) && (localDrawQueue.isCompleted()) && (localDrawQueue.size() == 0) && (singleTapAllowed))
      {
        logger.warn("single tap!");
        float f2 = ((Float)localArrayList.get(localArrayList.size() - 2)).floatValue();
        float f3 = ((Float)localArrayList.get(localArrayList.size() - 1)).floatValue();
        if ((f2 != localObject1[0]) || (f3 != localObject1[1]))
        {
          localArrayList.add(Float.valueOf(localObject1[0]));
          localArrayList.add(Float.valueOf(localObject1[1]));
          localMoaStrokeParameter.addPoint(localObject1[0], localObject1[1]);
          i = 2;
          n = (int)localObject3[0];
          int i1 = (int)localObject1[0];
          int i2 = (int)localObject3[1];
          int i3 = (int)localObject1[1];
          localRect.set(Math.min(n, i1), Math.min(i2, i3), Math.max(n, i1), Math.max(i2, i3));
          localRect.sort();
          localRect.inset(-(int)(f1 * brushMultiplier), -(int)(f1 * brushMultiplier));
          if (localDrawQueue.isCompleted()) {
            logger.log("size: " + localDrawQueue.size() + ", empty: " + localDrawQueue.isEmpty());
          }
          if ((filter != null) && (!isInterrupted()))
          {
            localObject3 = filter;
            d = f1;
            if ((!localDrawQueue.isCompleted()) || (!localDrawQueue.isEmpty())) {
              break label1604;
            }
          }
        }
      }
      label1604:
      for (boolean bool = true;; bool = false)
      {
        localObject3 = ((NativeToolFilter)localObject3).draw(d, 0.0D, m, bool, ArrayUtils.toPrimitive(localArrayList));
        if ((localObject3 != null) && (localObject3.length == 4)) {
          localRect.set((int)localObject3[0], (int)localObject3[1], (int)localObject3[2], (int)localObject3[3]);
        }
        if (filter != null) {
          filter.renderPreview(localRect);
        }
        m += i;
        i = m;
        n = k;
        if (handler == null) {
          break;
        }
        i = m;
        n = k;
        if (isInterrupted()) {
          break;
        }
        Moa.notifyPixelsChanged((Bitmap)localObject2);
        handler.sendEmptyMessage(1003);
        i = m;
        n = k;
        break;
        logger.warn("dont add more points..");
        break label1220;
        localArrayList.add(Float.valueOf(localObject1[0]));
        localArrayList.add(Float.valueOf(localObject1[1]));
        localMoaStrokeParameter.addPoint(localObject1[0], localObject1[1]);
        i = 2;
        break label1220;
      }
      label1610:
      if (i == 0) {
        break;
      }
      if ((handler != null) && (!isInterrupted())) {
        handler.sendEmptyMessage(1002);
      }
      i = 0;
      break;
      label1646:
      i = 2;
    }
  }
  
  public void setRegisterStrokeInitParams(boolean paramBoolean)
  {
    mRegisterStrokeInitParams = paramBoolean;
  }
  
  public void setSingleTapAllowed(boolean paramBoolean)
  {
    try
    {
      singleTapAllowed = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public void start(Bitmap paramBitmap)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 201	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:started	Z
    //   6: istore_2
    //   7: iload_2
    //   8: ifeq +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: getstatic 49	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   17: ldc_w 403
    //   20: invokeinterface 86 2 0
    //   25: aload_0
    //   26: new 220	java/lang/ref/SoftReference
    //   29: dup
    //   30: aload_1
    //   31: invokespecial 406	java/lang/ref/SoftReference:<init>	(Ljava/lang/Object;)V
    //   34: putfield 218	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:mSourceBitmap	Ljava/lang/ref/SoftReference;
    //   37: aload_0
    //   38: iconst_1
    //   39: putfield 201	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:started	Z
    //   42: aload_0
    //   43: iconst_1
    //   44: putfield 88	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:running	Z
    //   47: aload_0
    //   48: invokespecial 408	java/lang/Thread:start	()V
    //   51: goto -40 -> 11
    //   54: astore_1
    //   55: aload_0
    //   56: monitorexit
    //   57: aload_1
    //   58: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	59	0	this	BackgroundDrawThread
    //   0	59	1	paramBitmap	Bitmap
    //   6	2	2	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	7	54	finally
    //   14	51	54	finally
  }
  
  /* Error */
  public void start(Bitmap paramBitmap1, Bitmap paramBitmap2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 201	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:started	Z
    //   6: istore_3
    //   7: iload_3
    //   8: ifeq +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: getstatic 49	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:logger	Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    //   17: ldc_w 403
    //   20: invokeinterface 86 2 0
    //   25: aload_0
    //   26: new 220	java/lang/ref/SoftReference
    //   29: dup
    //   30: aload_1
    //   31: invokespecial 406	java/lang/ref/SoftReference:<init>	(Ljava/lang/Object;)V
    //   34: putfield 218	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:mSourceBitmap	Ljava/lang/ref/SoftReference;
    //   37: aload_0
    //   38: new 220	java/lang/ref/SoftReference
    //   41: dup
    //   42: aload_2
    //   43: invokespecial 406	java/lang/ref/SoftReference:<init>	(Ljava/lang/Object;)V
    //   46: putfield 227	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:mPreviewBitmap	Ljava/lang/ref/SoftReference;
    //   49: aload_0
    //   50: iconst_1
    //   51: putfield 201	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:started	Z
    //   54: aload_0
    //   55: iconst_1
    //   56: putfield 88	com/adobe/creativesdk/aviary/panels/BackgroundDrawThread:running	Z
    //   59: aload_0
    //   60: invokespecial 408	java/lang/Thread:start	()V
    //   63: goto -52 -> 11
    //   66: astore_1
    //   67: aload_0
    //   68: monitorexit
    //   69: aload_1
    //   70: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	71	0	this	BackgroundDrawThread
    //   0	71	1	paramBitmap1	Bitmap
    //   0	71	2	paramBitmap2	Bitmap
    //   6	2	3	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   2	7	66	finally
    //   14	63	66	finally
  }
  
  static class DrawQueue
    extends LinkedBlockingQueue<float[]>
  {
    private static final long serialVersionUID = 1L;
    private volatile boolean completed;
    private NativeToolFilter.BrushMode mode;
    private float radius;
    private PointF startPoint;
    
    public DrawQueue(NativeToolFilter.BrushMode paramBrushMode, float paramFloat, float[] paramArrayOfFloat)
    {
      mode = paramBrushMode;
      radius = paramFloat;
      completed = false;
      startPoint = new PointF();
      if ((paramArrayOfFloat != null) && (paramArrayOfFloat.length >= 2))
      {
        startPoint.x = paramArrayOfFloat[0];
        startPoint.y = paramArrayOfFloat[1];
      }
      add(paramArrayOfFloat);
    }
    
    public void end()
    {
      completed = true;
    }
    
    public NativeToolFilter.BrushMode getMode()
    {
      return mode;
    }
    
    public PointF getOriginalPoint()
    {
      return startPoint;
    }
    
    public float getRadius()
    {
      return radius;
    }
    
    public boolean isCompleted()
    {
      return completed;
    }
  }
}
