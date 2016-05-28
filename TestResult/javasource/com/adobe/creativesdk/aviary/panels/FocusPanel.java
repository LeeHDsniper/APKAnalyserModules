package com.adobe.creativesdk.aviary.panels;

import android.annotation.SuppressLint;
import android.app.ProgressDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeToolFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeToolFilter.TiltShiftMode;
import com.adobe.creativesdk.aviary.internal.headless.moa.Moa;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.widget.AdobeImageHighlightImageButton;
import com.adobe.creativesdk.aviary.widget.AdobeImageHighlightImageButton.OnCheckedChangeListener;
import com.adobe.creativesdk.aviary.widget.ImageViewTiltiShiftTouch;
import com.adobe.creativesdk.aviary.widget.ImageViewTiltiShiftTouch.OnTiltShiftDrawListener;
import com.adobe.creativesdk.aviary.widget.ImageViewTiltiShiftTouch.TiltShiftDrawMode;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.DisplayType;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.OnDrawableChangeListener;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

public class FocusPanel
  extends AbstractContentPanel
  implements AdobeImageHighlightImageButton.OnCheckedChangeListener, ImageViewTiltiShiftTouch.OnTiltShiftDrawListener, ImageViewTouchBase.OnDrawableChangeListener
{
  private BackgroundDrawThread mBackgroundDrawThread;
  private AdobeImageHighlightImageButton mCircleButton;
  private NativeToolFilter mFilter;
  private AdobeImageHighlightImageButton mRectButton;
  NativeToolFilter.TiltShiftMode mTiltShiftMode;
  final ToolActionVO<String> mToolAction = new ToolActionVO();
  
  public FocusPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
  }
  
  protected NativeToolFilter createFilter()
  {
    return (NativeToolFilter)ToolLoaderFactory.get(ToolLoaderFactory.Tools.FOCUS);
  }
  
  @SuppressLint({"InflateParams"})
  protected View generateContentView(LayoutInflater paramLayoutInflater)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_content_focus, null);
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_panel_focus, paramViewGroup, false);
  }
  
  public void onActivate()
  {
    super.onActivate();
    mPreview = BitmapUtils.copy(mBitmap, Bitmap.Config.ARGB_8888);
    mBackgroundDrawThread.start();
    ((ImageViewTiltiShiftTouch)mImageView).setOnDrawStartListener(this);
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    mImageView.setImageBitmap(mPreview, null, -1.0F, 8.0F);
    contentReady();
  }
  
  public void onCancelled()
  {
    super.onCancelled();
  }
  
  public void onCheckedChanged(AdobeImageHighlightImageButton paramAdobeImageHighlightImageButton, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = paramAdobeImageHighlightImageButton.getId();
    if (!paramBoolean1) {
      return;
    }
    if (i == mRectButton.getId())
    {
      logger.log("rect");
      mTiltShiftMode = NativeToolFilter.TiltShiftMode.Linear;
      mCircleButton.setChecked(false);
    }
    while (!paramBoolean2)
    {
      logger.log("return");
      return;
      if (i == mCircleButton.getId())
      {
        logger.log("circle");
        mTiltShiftMode = NativeToolFilter.TiltShiftMode.Radial;
        mRectButton.setChecked(false);
      }
    }
    paramAdobeImageHighlightImageButton = new HashMap();
    if (mTiltShiftMode == NativeToolFilter.TiltShiftMode.Radial)
    {
      ((ImageViewTiltiShiftTouch)mImageView).setTiltShiftDrawMode(ImageViewTiltiShiftTouch.TiltShiftDrawMode.Radial);
      paramAdobeImageHighlightImageButton.put("style", "circle");
    }
    for (;;)
    {
      getContext().getTracker().tagEventAttributes(ToolLoaderFactory.Tools.FOCUS.name().toLowerCase(Locale.US) + ": style_selected", paramAdobeImageHighlightImageButton);
      return;
      if (mTiltShiftMode == NativeToolFilter.TiltShiftMode.Linear)
      {
        ((ImageViewTiltiShiftTouch)mImageView).setTiltShiftDrawMode(ImageViewTiltiShiftTouch.TiltShiftDrawMode.Linear);
        paramAdobeImageHighlightImageButton.put("style", "rectangle");
      }
    }
  }
  
  protected void onComplete(Bitmap paramBitmap, MoaActionList paramMoaActionList)
  {
    if (mTiltShiftMode == NativeToolFilter.TiltShiftMode.Radial) {
      mTrackingAttributes.put("style", "circle");
    }
    for (;;)
    {
      mEditResult.setActionList(paramMoaActionList);
      mEditResult.setToolAction(mToolAction);
      super.onComplete(paramBitmap);
      return;
      mTrackingAttributes.put("style", "rectangle");
    }
  }
  
  @SuppressLint({"WrongViewCast"})
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    mRectButton = ((AdobeImageHighlightImageButton)getOptionView().findViewById(R.id.button2));
    mCircleButton = ((AdobeImageHighlightImageButton)getOptionView().findViewById(R.id.button1));
    mImageView = ((ImageViewTiltiShiftTouch)getContentView().findViewById(R.id.image));
    paramBitmap = (ImageViewTiltiShiftTouch)mImageView;
    paramBitmap.setOnDrawableChangedListener(this);
    paramBitmap.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    mCircleButton.setOnCheckedChangeListener(this);
    mRectButton.setOnCheckedChangeListener(this);
    mBackgroundDrawThread = new BackgroundDrawThread("filter-thread", 5);
    mFilter = createFilter();
  }
  
  public void onDeactivate()
  {
    mImageView.setOnDrawableChangedListener(null);
    mCircleButton.setOnCheckedChangeListener(this);
    mRectButton.setOnCheckedChangeListener(this);
    ((ImageViewTiltiShiftTouch)mImageView).setOnDrawStartListener(null);
    if (mBackgroundDrawThread != null)
    {
      mBackgroundDrawThread.clear();
      if (mBackgroundDrawThread.isAlive())
      {
        mBackgroundDrawThread.quit();
        while (mBackgroundDrawThread.isAlive()) {
          logger.log("isAlive...");
        }
      }
    }
    onProgressEnd();
    super.onDeactivate();
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    mBackgroundDrawThread = null;
    mImageView.clear();
  }
  
  protected void onDispose()
  {
    mFilter.dispose();
    super.onDispose();
  }
  
  public void onDrawEnd()
  {
    mBackgroundDrawThread.pathEnd();
  }
  
  public void onDrawStart(float[] paramArrayOfFloat, ImageViewTiltiShiftTouch.TiltShiftDrawMode paramTiltShiftDrawMode, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    mBackgroundDrawThread.drawStart(paramArrayOfFloat, paramTiltShiftDrawMode, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6);
    setIsChanged(true);
  }
  
  public void onDrawableChanged(Drawable paramDrawable)
  {
    if (mCircleButton.isChecked()) {
      mTiltShiftMode = NativeToolFilter.TiltShiftMode.Radial;
    }
    for (;;)
    {
      getHandler().postDelayed(new Runnable()
      {
        public void run()
        {
          ImageViewTiltiShiftTouch localImageViewTiltiShiftTouch = (ImageViewTiltiShiftTouch)mImageView;
          if (mTiltShiftMode == NativeToolFilter.TiltShiftMode.Radial)
          {
            mCircleButton.setChecked(true);
            localImageViewTiltiShiftTouch.setTiltShiftDrawMode(ImageViewTiltiShiftTouch.TiltShiftDrawMode.Radial);
            return;
          }
          mRectButton.setChecked(true);
          localImageViewTiltiShiftTouch.setTiltShiftDrawMode(ImageViewTiltiShiftTouch.TiltShiftDrawMode.Linear);
        }
      }, 500L);
      return;
      if (mRectButton.isChecked()) {
        mTiltShiftMode = NativeToolFilter.TiltShiftMode.Linear;
      }
    }
  }
  
  public void onDrawing(float[] paramArrayOfFloat, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    mBackgroundDrawThread.draw(paramArrayOfFloat, paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6);
  }
  
  protected void onGenerateResult()
  {
    if ((mBackgroundDrawThread.isAlive()) && (!mBackgroundDrawThread.isCompleted()))
    {
      mBackgroundDrawThread.finish();
      new GenerateResultTask().execute(new Void[0]);
      return;
    }
    onComplete(mPreview, mFilter.getActions());
  }
  
  class BackgroundDrawThread
    extends Thread
  {
    FocusPanel.DrawQueue mCurrentQueue;
    final Queue<FocusPanel.DrawQueue> mQueue = new LinkedBlockingQueue();
    volatile boolean running;
    boolean started;
    
    public BackgroundDrawThread(String paramString, int paramInt)
    {
      super();
      setPriority(paramInt);
      init();
    }
    
    public void clear()
    {
      if ((running) && (mQueue != null)) {
        synchronized (mQueue)
        {
          while (mQueue.size() > 0)
          {
            FocusPanel.DrawQueue localDrawQueue = (FocusPanel.DrawQueue)mQueue.poll();
            if (localDrawQueue != null)
            {
              logger.log("end element...");
              localDrawQueue.end();
            }
          }
        }
      }
    }
    
    /* Error */
    public void draw(float[] paramArrayOfFloat, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 42	com/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread:running	Z
      //   6: ifeq +14 -> 20
      //   9: aload_0
      //   10: getfield 72	com/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread:mCurrentQueue	Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
      //   13: astore 8
      //   15: aload 8
      //   17: ifnonnull +6 -> 23
      //   20: aload_0
      //   21: monitorexit
      //   22: return
      //   23: aload_0
      //   24: getfield 72	com/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread:mCurrentQueue	Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
      //   27: invokevirtual 74	com/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue:clear	()V
      //   30: aload_0
      //   31: getfield 72	com/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread:mCurrentQueue	Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
      //   34: bipush 8
      //   36: newarray float
      //   38: dup
      //   39: iconst_0
      //   40: aload_1
      //   41: iconst_0
      //   42: faload
      //   43: fastore
      //   44: dup
      //   45: iconst_1
      //   46: aload_1
      //   47: iconst_1
      //   48: faload
      //   49: fastore
      //   50: dup
      //   51: iconst_2
      //   52: fload_2
      //   53: fastore
      //   54: dup
      //   55: iconst_3
      //   56: fload_3
      //   57: fastore
      //   58: dup
      //   59: iconst_4
      //   60: fload 4
      //   62: fastore
      //   63: dup
      //   64: iconst_5
      //   65: fload 5
      //   67: fastore
      //   68: dup
      //   69: bipush 6
      //   71: fload 6
      //   73: fastore
      //   74: dup
      //   75: bipush 7
      //   77: fload 7
      //   79: fastore
      //   80: invokevirtual 78	com/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue:add	(Ljava/lang/Object;)Z
      //   83: pop
      //   84: goto -64 -> 20
      //   87: astore_1
      //   88: aload_0
      //   89: monitorexit
      //   90: aload_1
      //   91: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	92	0	this	BackgroundDrawThread
      //   0	92	1	paramArrayOfFloat	float[]
      //   0	92	2	paramFloat1	float
      //   0	92	3	paramFloat2	float
      //   0	92	4	paramFloat3	float
      //   0	92	5	paramFloat4	float
      //   0	92	6	paramFloat5	float
      //   0	92	7	paramFloat6	float
      //   13	3	8	localDrawQueue	FocusPanel.DrawQueue
      // Exception table:
      //   from	to	target	type
      //   2	15	87	finally
      //   23	84	87	finally
    }
    
    public void drawStart(float[] paramArrayOfFloat, ImageViewTiltiShiftTouch.TiltShiftDrawMode paramTiltShiftDrawMode, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
    {
      for (;;)
      {
        try
        {
          boolean bool = running;
          if (!bool) {
            return;
          }
          if (mCurrentQueue != null)
          {
            mCurrentQueue.end();
            mCurrentQueue = null;
          }
          if (paramTiltShiftDrawMode == ImageViewTiltiShiftTouch.TiltShiftDrawMode.Radial)
          {
            localObject = NativeToolFilter.TiltShiftMode.Radial;
            localObject = new FocusPanel.DrawQueue((NativeToolFilter.TiltShiftMode)localObject);
            ((FocusPanel.DrawQueue)localObject).add(new float[] { paramArrayOfFloat[0], paramArrayOfFloat[1], paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6 });
            ToolActionVO localToolActionVO = mToolAction;
            if (paramTiltShiftDrawMode != ImageViewTiltiShiftTouch.TiltShiftDrawMode.Radial) {
              break label170;
            }
            paramArrayOfFloat = "circle";
            localToolActionVO.setValue(paramArrayOfFloat);
            mQueue.add(localObject);
            mCurrentQueue = ((FocusPanel.DrawQueue)localObject);
            continue;
          }
          Object localObject = NativeToolFilter.TiltShiftMode.Linear;
        }
        finally {}
        continue;
        label170:
        paramArrayOfFloat = "rectangle";
      }
    }
    
    public void finish()
    {
      if ((running) && (mQueue != null)) {
        synchronized (mQueue)
        {
          Iterator localIterator = mQueue.iterator();
          while (localIterator.hasNext())
          {
            FocusPanel.DrawQueue localDrawQueue = (FocusPanel.DrawQueue)localIterator.next();
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
    
    void init() {}
    
    public boolean isCompleted()
    {
      return mQueue.size() == 0;
    }
    
    /* Error */
    public void pathEnd()
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 42	com/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread:running	Z
      //   6: ifeq +12 -> 18
      //   9: aload_0
      //   10: getfield 72	com/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread:mCurrentQueue	Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
      //   13: astore_1
      //   14: aload_1
      //   15: ifnonnull +6 -> 21
      //   18: aload_0
      //   19: monitorexit
      //   20: return
      //   21: aload_0
      //   22: getfield 72	com/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread:mCurrentQueue	Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
      //   25: invokevirtual 68	com/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue:end	()V
      //   28: aload_0
      //   29: aconst_null
      //   30: putfield 72	com/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread:mCurrentQueue	Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
      //   33: goto -15 -> 18
      //   36: astore_1
      //   37: aload_0
      //   38: monitorexit
      //   39: aload_1
      //   40: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	41	0	this	BackgroundDrawThread
      //   13	2	1	localDrawQueue	FocusPanel.DrawQueue
      //   36	4	1	localObject	Object
      // Exception table:
      //   from	to	target	type
      //   2	14	36	finally
      //   21	33	36	finally
    }
    
    public void quit()
    {
      try
      {
        started = true;
        running = false;
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
      int i = 0;
      logger.log("thread.start!");
      logger.log("filter.init");
      mFilter.init(mBitmap, mPreview);
      RectF localRectF1 = new RectF(0.0F, 0.0F, mPreview.getWidth(), mPreview.getHeight());
      RectF localRectF2 = new RectF();
      while (running) {
        if ((mQueue.size() > 0) && (!isInterrupted()))
        {
          logger.log("queue.size: " + mQueue.size());
          int j = i;
          if (i == 0)
          {
            j = 1;
            onProgressStart();
          }
          FocusPanel.DrawQueue localDrawQueue = (FocusPanel.DrawQueue)mQueue.element();
          if (localDrawQueue == null)
          {
            mQueue.poll();
            i = j;
          }
          else
          {
            Object localObject = FocusPanel.DrawQueue.access$300(localDrawQueue);
            mFilter.setTiltShiftMode((NativeToolFilter.TiltShiftMode)localObject);
            for (;;)
            {
              if (((localDrawQueue.size() <= 0) && (localDrawQueue.isCompleted())) || (!running) || (isInterrupted()))
              {
                mQueue.poll();
                i = j;
                break;
              }
              localObject = (float[])localDrawQueue.poll();
              if (localObject != null)
              {
                float f1 = localObject[0];
                float f2 = localObject[1];
                float f3 = localObject[2];
                float f4 = localObject[3];
                float f5 = localObject[4];
                float f6 = localObject[5];
                float f7 = localObject[6];
                float f8 = localObject[7];
                mFilter.draw(f3, f4, 0, false, new float[] { f1, f2 });
                localRectF2.set(f5, f6, f7, f8);
                localRectF1.union(localRectF2);
                mFilter.renderPreview(localRectF1);
                localRectF1.set(localRectF2);
                Moa.notifyPixelsChanged(mPreview);
              }
            }
          }
        }
        else if (i != 0)
        {
          onProgressEnd();
          i = 0;
        }
      }
      onProgressEnd();
      logger.log("thread.end");
    }
    
    public void start()
    {
      try
      {
        started = true;
        running = true;
        super.start();
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }
  }
  
  static class DrawQueue
    extends LinkedBlockingQueue<float[]>
  {
    private static final long serialVersionUID = 1L;
    private volatile boolean completed;
    private NativeToolFilter.TiltShiftMode tiltShiftMode;
    
    public DrawQueue(NativeToolFilter.TiltShiftMode paramTiltShiftMode)
    {
      tiltShiftMode = paramTiltShiftMode;
      completed = false;
    }
    
    public void end()
    {
      completed = true;
    }
    
    public boolean isCompleted()
    {
      return completed;
    }
  }
  
  class GenerateResultTask
    extends AdobeImageAsyncTask<Void, Void, Void>
  {
    ProgressDialog mProgress = new ProgressDialog(getContext().getBaseContext());
    
    GenerateResultTask() {}
    
    protected Void doInBackground(Void... paramVarArgs)
    {
      if (mBackgroundDrawThread != null) {
        while ((mBackgroundDrawThread != null) && (!mBackgroundDrawThread.isCompleted()))
        {
          logger.log("waiting.... " + mBackgroundDrawThread.getQueueSize());
          try
          {
            Thread.sleep(50L);
          }
          catch (InterruptedException paramVarArgs)
          {
            paramVarArgs.printStackTrace();
          }
        }
      }
      return null;
    }
    
    protected void doPostExecute(Void paramVoid)
    {
      if (getContext().getBaseActivity().isFinishing()) {
        return;
      }
      if (mProgress.isShowing()) {}
      try
      {
        mProgress.dismiss();
        onComplete(mPreview, mFilter.getActions());
        return;
      }
      catch (IllegalArgumentException paramVoid)
      {
        for (;;) {}
      }
    }
    
    protected void doPreExecute()
    {
      mProgress.setTitle(getContext().getBaseContext().getString(R.string.feather_loading_title));
      mProgress.setMessage(getContext().getBaseContext().getString(R.string.feather_effect_loading_message));
      mProgress.setIndeterminate(true);
      mProgress.setCancelable(false);
      mProgress.show();
    }
  }
}
