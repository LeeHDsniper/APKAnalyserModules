package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.BlurMaskFilter;
import android.graphics.BlurMaskFilter.Blur;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import com.adobe.android.ui.utils.UIUtils;
import com.adobe.creativesdk.aviary.internal.graphics.drawable.EditableDrawable;
import com.adobe.creativesdk.aviary.internal.graphics.drawable.FeatherDrawable;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.aviary.android.feather.sdk.R.styleable;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ImageViewDrawableOverlay
  extends ImageViewTouch
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("ImageviewDrawableOverlay");
  private OnDrawableEventListener mDrawableListener;
  private Paint mDropPaint;
  private boolean mForceSingleSelection = true;
  float mLastMotionScrollX;
  float mLastMotionScrollY;
  private int mOverlayStyleId;
  private DrawableHighlightView mOverlayView;
  private List<DrawableHighlightView> mOverlayViews = new ArrayList();
  private boolean mScaleWithContent = false;
  boolean mScrollStarted;
  private Rect mTempRect = new Rect();
  
  public ImageViewDrawableOverlay(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public ImageViewDrawableOverlay(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private DrawableHighlightView checkSelection(MotionEvent paramMotionEvent)
  {
    Iterator localIterator = mOverlayViews.iterator();
    Object localObject = null;
    while (localIterator.hasNext())
    {
      DrawableHighlightView localDrawableHighlightView = (DrawableHighlightView)localIterator.next();
      if (localDrawableHighlightView.getHit(paramMotionEvent.getX(), paramMotionEvent.getY()) != 1) {
        localObject = localDrawableHighlightView;
      }
    }
    return localObject;
  }
  
  private void ensureVisible(DrawableHighlightView paramDrawableHighlightView, float paramFloat1, float paramFloat2)
  {
    paramDrawableHighlightView = paramDrawableHighlightView.getDrawRect();
    int i = 0;
    int k = 0;
    int j = 0;
    int m = 0;
    if (paramFloat1 > 0.0F) {
      i = (int)Math.max(0.0F, getLeft() - left);
    }
    if (paramFloat1 < 0.0F) {
      k = (int)Math.min(0.0F, getRight() - right);
    }
    if (paramFloat2 > 0.0F) {
      j = (int)Math.max(0.0F, getTop() - top);
    }
    if (paramFloat2 < 0.0F) {
      m = (int)Math.min(0.0F, getBottom() - bottom);
    }
    if (i != 0) {
      if (j == 0) {
        break label147;
      }
    }
    for (;;)
    {
      if ((i != 0) || (j != 0)) {
        panBy(i, j);
      }
      return;
      i = k;
      break;
      label147:
      j = m;
    }
  }
  
  public boolean addHighlightView(DrawableHighlightView paramDrawableHighlightView)
  {
    boolean bool = true;
    if (mOverlayViews.contains(paramDrawableHighlightView)) {
      bool = false;
    }
    do
    {
      return bool;
      mOverlayViews.add(paramDrawableHighlightView);
      postInvalidate();
    } while (mOverlayViews.size() != 1);
    setSelectedHighlightView(paramDrawableHighlightView);
    return true;
  }
  
  public void animate(DrawableHighlightView paramDrawableHighlightView)
  {
    paramDrawableHighlightView.animateContent();
  }
  
  public void clearOverlays()
  {
    setSelectedHighlightView(null);
    while (mOverlayViews.size() > 0) {
      ((DrawableHighlightView)mOverlayViews.remove(0)).dispose();
    }
    mOverlayView = null;
  }
  
  public int getHighlightCount()
  {
    return mOverlayViews.size();
  }
  
  public DrawableHighlightView getHighlightViewAt(int paramInt)
  {
    if (mOverlayViews.size() > 0) {
      return (DrawableHighlightView)mOverlayViews.get(paramInt);
    }
    return null;
  }
  
  public int getOverlayStyleId()
  {
    return mOverlayStyleId;
  }
  
  public boolean getScaleWithContent()
  {
    return mScaleWithContent;
  }
  
  public DrawableHighlightView getSelectedHighlightView()
  {
    return mOverlayView;
  }
  
  protected void init(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super.init(paramContext, paramAttributeSet, paramInt);
    mTouchSlop = ViewConfiguration.get(paramContext).getScaledDoubleTapSlop();
    mGestureDetector.setIsLongpressEnabled(false);
    paramContext = paramContext.getTheme().obtainStyledAttributes(paramAttributeSet, R.styleable.AdobeImageViewDrawableOverlay, paramInt, 0);
    mOverlayStyleId = paramContext.getResourceId(R.styleable.AdobeImageViewDrawableOverlay_adobe_highlightStyle, -1);
    paramContext.recycle();
  }
  
  public boolean onDown(MotionEvent paramMotionEvent)
  {
    Log.i("ImageViewTouchBase", "onDown");
    mScrollStarted = false;
    mLastMotionScrollX = paramMotionEvent.getX();
    mLastMotionScrollY = paramMotionEvent.getY();
    DrawableHighlightView localDrawableHighlightView = checkSelection(paramMotionEvent);
    Object localObject = localDrawableHighlightView;
    if (localDrawableHighlightView == null)
    {
      localObject = localDrawableHighlightView;
      if (mOverlayViews.size() == 1)
      {
        localObject = localDrawableHighlightView;
        if (mForceSingleSelection) {
          localObject = (DrawableHighlightView)mOverlayViews.get(0);
        }
      }
    }
    setSelectedHighlightView((DrawableHighlightView)localObject);
    if ((localDrawableHighlightView != null) && (mScaleWithContent))
    {
      localObject = localDrawableHighlightView.getDisplayRect(localDrawableHighlightView.getMatrix(), localDrawableHighlightView.getCropRectF());
      boolean bool = localDrawableHighlightView.getContent().validateSize((RectF)localObject);
      Log.d("ImageViewTouchBase", "invalidSize: " + bool);
      if (!bool)
      {
        Log.w("ImageViewTouchBase", "drawable too small!!!");
        float f1 = localDrawableHighlightView.getContent().getMinWidth();
        float f2 = localDrawableHighlightView.getContent().getMinHeight();
        Log.d("ImageViewTouchBase", "minW: " + f1);
        Log.d("ImageViewTouchBase", "minH: " + f2);
        float f3 = Math.min(f1, f2) * 1.1F;
        Log.d("ImageViewTouchBase", "minSize: " + f3);
        float f4 = Math.min(((RectF)localObject).width(), ((RectF)localObject).height());
        Log.d("ImageViewTouchBase", "minRectSize: " + f4);
        f3 /= f4;
        Log.d("ImageViewTouchBase", "diff: " + f3);
        Log.d("ImageViewTouchBase", "min.size: " + f1 + "x" + f2);
        Log.d("ImageViewTouchBase", "cur.size: " + ((RectF)localObject).width() + "x" + ((RectF)localObject).height());
        Log.d("ImageViewTouchBase", "zooming to: " + getScale() * f3);
        zoomTo(getScale() * f3, ((RectF)localObject).centerX(), ((RectF)localObject).centerY(), 300L);
        return true;
      }
    }
    int i;
    if (mOverlayView != null)
    {
      i = mOverlayView.getHit(paramMotionEvent.getX(), paramMotionEvent.getY());
      if (!UIUtils.checkBits(i, 1))
      {
        if (!UIUtils.checkBits(i, 128)) {
          break label588;
        }
        mOverlayView.setMode(128);
      }
    }
    label588:
    do
    {
      for (;;)
      {
        postInvalidate();
        if (mDrawableListener != null) {
          mDrawableListener.onDown(mOverlayView);
        }
        return super.onDown(paramMotionEvent);
        if (!UIUtils.checkBits(i, 256)) {
          break;
        }
        mOverlayView.setMode(256);
      }
    } while (UIUtils.checkBits(i, 512));
    localObject = mOverlayView;
    if (i == 64) {
      i = 64;
    }
    for (;;)
    {
      ((DrawableHighlightView)localObject).setMode(i);
      break;
      if (i == 32) {
        i = 32;
      } else {
        i = 30;
      }
    }
  }
  
  public void onDragEntered()
  {
    mDropPaint = new Paint();
    mDropPaint.setColor(-13388315);
    mDropPaint.setStrokeWidth(2.0F);
    mDropPaint.setMaskFilter(new BlurMaskFilter(4.0F, BlurMaskFilter.Blur.NORMAL));
    mDropPaint.setStyle(Paint.Style.STROKE);
    postInvalidate();
  }
  
  public void onDragExited()
  {
    mDropPaint = null;
    postInvalidate();
  }
  
  public void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    int j = 0;
    int i = 0;
    while (i < mOverlayViews.size())
    {
      paramCanvas.save(1);
      Object localObject = (DrawableHighlightView)mOverlayViews.get(i);
      ((DrawableHighlightView)localObject).draw(paramCanvas);
      int k = j;
      if (j == 0)
      {
        localObject = ((DrawableHighlightView)localObject).getContent();
        k = j;
        if ((localObject instanceof EditableDrawable))
        {
          k = j;
          if (((EditableDrawable)localObject).isEditing()) {
            k = 1;
          }
        }
      }
      paramCanvas.restore();
      i += 1;
      j = k;
    }
    if (mDropPaint != null)
    {
      getDrawingRect(mTempRect);
      paramCanvas.drawRect(mTempRect, mDropPaint);
    }
    if (j != 0) {
      postInvalidateDelayed(400L);
    }
  }
  
  public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    Log.i("ImageViewTouchBase", "onFling");
    if ((mOverlayView != null) && (mOverlayView.getMode() != 1)) {
      return false;
    }
    return super.onFling(paramMotionEvent1, paramMotionEvent2, paramFloat1, paramFloat2);
  }
  
  protected void onLayoutChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayoutChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    if (getDrawable() != null)
    {
      Iterator localIterator = mOverlayViews.iterator();
      while (localIterator.hasNext())
      {
        DrawableHighlightView localDrawableHighlightView = (DrawableHighlightView)localIterator.next();
        localDrawableHighlightView.getMatrix().set(getImageMatrix());
        localDrawableHighlightView.invalidate();
      }
    }
  }
  
  public boolean onScroll(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    Log.i("ImageViewTouchBase", "onScroll");
    float f3 = paramMotionEvent2.getX();
    float f4 = paramMotionEvent2.getY();
    float f1;
    float f2;
    if (!mScrollStarted)
    {
      f1 = 0.0F;
      f2 = 0.0F;
      mScrollStarted = true;
    }
    for (;;)
    {
      mLastMotionScrollX = f3;
      mLastMotionScrollY = f4;
      if ((mOverlayView == null) || (mOverlayView.getMode() == 1) || (mOverlayView.getMode() == 128)) {
        break;
      }
      mOverlayView.onMouseMove(mOverlayView.getMode(), paramMotionEvent2, -f1, -f2);
      postInvalidate();
      if (mDrawableListener != null) {
        mDrawableListener.onMove(mOverlayView);
      }
      if ((mOverlayView.getMode() == 64) && (!mScaleWithContent)) {
        ensureVisible(mOverlayView, paramFloat1, paramFloat2);
      }
      return true;
      f1 = mLastMotionScrollX - f3;
      f2 = mLastMotionScrollY - f4;
    }
    return super.onScroll(paramMotionEvent1, paramMotionEvent2, paramFloat1, paramFloat2);
  }
  
  public boolean onSingleTapConfirmed(MotionEvent paramMotionEvent)
  {
    Iterator localIterator = mOverlayViews.iterator();
    while (localIterator.hasNext())
    {
      DrawableHighlightView localDrawableHighlightView = (DrawableHighlightView)localIterator.next();
      if (localDrawableHighlightView.isSelected())
      {
        localDrawableHighlightView.onSingleTapConfirmed(paramMotionEvent.getX(), paramMotionEvent.getY());
        postInvalidate();
      }
    }
    return super.onSingleTapConfirmed(paramMotionEvent);
  }
  
  public boolean onSingleTapUp(MotionEvent paramMotionEvent)
  {
    if (mOverlayView != null)
    {
      if ((mOverlayView.getHit(paramMotionEvent.getX(), paramMotionEvent.getY()) & 0x40) == 64)
      {
        if (mDrawableListener != null) {
          mDrawableListener.onClick(mOverlayView);
        }
        return true;
      }
      mOverlayView.setMode(1);
      postInvalidate();
      if (mOverlayViews.size() != 1) {
        setSelectedHighlightView(null);
      }
    }
    return super.onSingleTapUp(paramMotionEvent);
  }
  
  public boolean onUp(MotionEvent paramMotionEvent)
  {
    if (mOverlayView != null)
    {
      mOverlayView.setMode(1);
      postInvalidate();
    }
    return super.onUp(paramMotionEvent);
  }
  
  protected void postScale(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    if (mOverlayViews.size() > 0)
    {
      Iterator localIterator = mOverlayViews.iterator();
      Matrix localMatrix = new Matrix(getImageViewMatrix());
      super.postScale(paramFloat1, paramFloat2, paramFloat3);
      if (localIterator.hasNext())
      {
        DrawableHighlightView localDrawableHighlightView = (DrawableHighlightView)localIterator.next();
        if (!mScaleWithContent)
        {
          RectF localRectF1 = localDrawableHighlightView.getCropRectF();
          RectF localRectF2 = localDrawableHighlightView.getDisplayRect(localMatrix, localDrawableHighlightView.getCropRectF());
          RectF localRectF3 = localDrawableHighlightView.getDisplayRect(getImageViewMatrix(), localDrawableHighlightView.getCropRectF());
          float[] arrayOfFloat = new float[9];
          getImageViewMatrix().getValues(arrayOfFloat);
          paramFloat1 = arrayOfFloat[0];
          localRectF1.offset((left - left) / paramFloat1, (top - top) / paramFloat1);
          right += -(localRectF3.width() - localRectF2.width()) / paramFloat1;
          bottom += -(localRectF3.height() - localRectF2.height()) / paramFloat1;
          localDrawableHighlightView.getMatrix().set(getImageMatrix());
          localDrawableHighlightView.getCropRectF().set(localRectF1);
        }
        for (;;)
        {
          localDrawableHighlightView.invalidate();
          break;
          localDrawableHighlightView.getMatrix().set(getImageMatrix());
        }
      }
    }
    else
    {
      super.postScale(paramFloat1, paramFloat2, paramFloat3);
    }
  }
  
  protected void postTranslate(float paramFloat1, float paramFloat2)
  {
    super.postTranslate(paramFloat1, paramFloat2);
    Iterator localIterator = mOverlayViews.iterator();
    while (localIterator.hasNext())
    {
      DrawableHighlightView localDrawableHighlightView = (DrawableHighlightView)localIterator.next();
      if (getScale() != 1.0F)
      {
        float[] arrayOfFloat = new float[9];
        getImageMatrix().getValues(arrayOfFloat);
        float f = arrayOfFloat[0];
        if (!mScaleWithContent) {
          localDrawableHighlightView.getCropRectF().offset(-paramFloat1 / f, -paramFloat2 / f);
        }
      }
      localDrawableHighlightView.getMatrix().set(getImageMatrix());
      localDrawableHighlightView.invalidate();
    }
  }
  
  public boolean removeHightlightView(DrawableHighlightView paramDrawableHighlightView)
  {
    int i = 0;
    while (i < mOverlayViews.size())
    {
      if (((DrawableHighlightView)mOverlayViews.get(i)).equals(paramDrawableHighlightView))
      {
        paramDrawableHighlightView = (DrawableHighlightView)mOverlayViews.remove(i);
        if (paramDrawableHighlightView.equals(mOverlayView)) {
          setSelectedHighlightView(null);
        }
        paramDrawableHighlightView.dispose();
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  public void setForceSingleSelection(boolean paramBoolean)
  {
    mForceSingleSelection = paramBoolean;
  }
  
  public void setImageDrawable(Drawable paramDrawable, Matrix paramMatrix, float paramFloat1, float paramFloat2)
  {
    super.setImageDrawable(paramDrawable, paramMatrix, paramFloat1, paramFloat2);
  }
  
  public void setOnDrawableEventListener(OnDrawableEventListener paramOnDrawableEventListener)
  {
    mDrawableListener = paramOnDrawableEventListener;
  }
  
  public void setScaleWithContent(boolean paramBoolean)
  {
    mScaleWithContent = paramBoolean;
  }
  
  public void setSelectedHighlightView(DrawableHighlightView paramDrawableHighlightView)
  {
    DrawableHighlightView localDrawableHighlightView = mOverlayView;
    if ((mOverlayView != null) && (!mOverlayView.equals(paramDrawableHighlightView))) {
      mOverlayView.setSelected(false);
    }
    if (paramDrawableHighlightView != null) {
      paramDrawableHighlightView.setSelected(true);
    }
    postInvalidate();
    mOverlayView = paramDrawableHighlightView;
    if (mDrawableListener != null) {
      mDrawableListener.onFocusChange(paramDrawableHighlightView, localDrawableHighlightView);
    }
  }
  
  public static abstract interface OnDrawableEventListener
  {
    public abstract void onClick(DrawableHighlightView paramDrawableHighlightView);
    
    public abstract void onDown(DrawableHighlightView paramDrawableHighlightView);
    
    public abstract void onFocusChange(DrawableHighlightView paramDrawableHighlightView1, DrawableHighlightView paramDrawableHighlightView2);
    
    public abstract void onMove(DrawableHighlightView paramDrawableHighlightView);
  }
}
