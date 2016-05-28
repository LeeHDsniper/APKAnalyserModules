package com.behance.sdk.senab.photoview;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build.VERSION;
import android.util.FloatMath;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.OnScaleGestureListener;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;

public abstract class VersionedGestureDetector
{
  OnGestureListener mListener;
  
  public VersionedGestureDetector() {}
  
  public static VersionedGestureDetector newInstance(Context paramContext, OnGestureListener paramOnGestureListener)
  {
    int i = Build.VERSION.SDK_INT;
    if (i < 5) {
      paramContext = new CupcakeDetector(paramContext);
    }
    for (;;)
    {
      mListener = paramOnGestureListener;
      return paramContext;
      if (i < 8) {
        paramContext = new EclairDetector(paramContext);
      } else {
        paramContext = new FroyoDetector(paramContext);
      }
    }
  }
  
  public abstract boolean isScaling();
  
  public abstract boolean onTouchEvent(MotionEvent paramMotionEvent);
  
  private static class CupcakeDetector
    extends VersionedGestureDetector
  {
    private boolean mIsDragging;
    float mLastTouchX;
    float mLastTouchY;
    final float mMinimumVelocity;
    final float mTouchSlop;
    private VelocityTracker mVelocityTracker;
    
    public CupcakeDetector(Context paramContext)
    {
      paramContext = ViewConfiguration.get(paramContext);
      mMinimumVelocity = paramContext.getScaledMinimumFlingVelocity();
      mTouchSlop = paramContext.getScaledTouchSlop();
    }
    
    float getActiveX(MotionEvent paramMotionEvent)
    {
      return paramMotionEvent.getX();
    }
    
    float getActiveY(MotionEvent paramMotionEvent)
    {
      return paramMotionEvent.getY();
    }
    
    public boolean isScaling()
    {
      return false;
    }
    
    public boolean onTouchEvent(MotionEvent paramMotionEvent)
    {
      boolean bool = false;
      switch (paramMotionEvent.getAction())
      {
      }
      do
      {
        float f1;
        float f2;
        do
        {
          do
          {
            float f3;
            float f4;
            do
            {
              return true;
              mVelocityTracker = VelocityTracker.obtain();
              mVelocityTracker.addMovement(paramMotionEvent);
              mLastTouchX = getActiveX(paramMotionEvent);
              mLastTouchY = getActiveY(paramMotionEvent);
              mIsDragging = false;
              return true;
              f1 = getActiveX(paramMotionEvent);
              f2 = getActiveY(paramMotionEvent);
              f3 = f1 - mLastTouchX;
              f4 = f2 - mLastTouchY;
              if (!mIsDragging)
              {
                if (FloatMath.sqrt(f3 * f3 + f4 * f4) >= mTouchSlop) {
                  bool = true;
                }
                mIsDragging = bool;
              }
            } while (!mIsDragging);
            mListener.onDrag(f3, f4);
            mLastTouchX = f1;
            mLastTouchY = f2;
          } while (mVelocityTracker == null);
          mVelocityTracker.addMovement(paramMotionEvent);
          return true;
        } while (mVelocityTracker == null);
        mVelocityTracker.recycle();
        mVelocityTracker = null;
        return true;
        if ((mIsDragging) && (mVelocityTracker != null))
        {
          mLastTouchX = getActiveX(paramMotionEvent);
          mLastTouchY = getActiveY(paramMotionEvent);
          mVelocityTracker.addMovement(paramMotionEvent);
          mVelocityTracker.computeCurrentVelocity(1000);
          f1 = mVelocityTracker.getXVelocity();
          f2 = mVelocityTracker.getYVelocity();
          if (Math.max(Math.abs(f1), Math.abs(f2)) >= mMinimumVelocity) {
            mListener.onFling(mLastTouchX, mLastTouchY, -f1, -f2);
          }
        }
      } while (mVelocityTracker == null);
      mVelocityTracker.recycle();
      mVelocityTracker = null;
      return true;
    }
  }
  
  @TargetApi(5)
  private static class EclairDetector
    extends VersionedGestureDetector.CupcakeDetector
  {
    private int mActivePointerId = -1;
    private int mActivePointerIndex = 0;
    
    public EclairDetector(Context paramContext)
    {
      super();
    }
    
    float getActiveX(MotionEvent paramMotionEvent)
    {
      try
      {
        float f = paramMotionEvent.getX(mActivePointerIndex);
        return f;
      }
      catch (Exception localException) {}
      return paramMotionEvent.getX();
    }
    
    float getActiveY(MotionEvent paramMotionEvent)
    {
      try
      {
        float f = paramMotionEvent.getY(mActivePointerIndex);
        return f;
      }
      catch (Exception localException) {}
      return paramMotionEvent.getY();
    }
    
    public boolean onTouchEvent(MotionEvent paramMotionEvent)
    {
      int j = 0;
      switch (paramMotionEvent.getAction() & 0xFF)
      {
      }
      do
      {
        for (;;)
        {
          i = j;
          if (mActivePointerId != -1) {
            i = mActivePointerId;
          }
          mActivePointerIndex = paramMotionEvent.findPointerIndex(i);
          return super.onTouchEvent(paramMotionEvent);
          mActivePointerId = paramMotionEvent.getPointerId(0);
          continue;
          mActivePointerId = -1;
        }
        i = (paramMotionEvent.getAction() & 0xFF00) >> 8;
      } while (paramMotionEvent.getPointerId(i) != mActivePointerId);
      if (i == 0) {}
      for (int i = 1;; i = 0)
      {
        mActivePointerId = paramMotionEvent.getPointerId(i);
        mLastTouchX = paramMotionEvent.getX(i);
        mLastTouchY = paramMotionEvent.getY(i);
        break;
      }
    }
  }
  
  @TargetApi(8)
  private static class FroyoDetector
    extends VersionedGestureDetector.EclairDetector
  {
    private final ScaleGestureDetector mDetector = new ScaleGestureDetector(paramContext, mScaleListener);
    private final ScaleGestureDetector.OnScaleGestureListener mScaleListener = new ScaleGestureDetector.OnScaleGestureListener()
    {
      public boolean onScale(ScaleGestureDetector paramAnonymousScaleGestureDetector)
      {
        mListener.onScale(paramAnonymousScaleGestureDetector.getScaleFactor(), paramAnonymousScaleGestureDetector.getFocusX(), paramAnonymousScaleGestureDetector.getFocusY());
        return true;
      }
      
      public boolean onScaleBegin(ScaleGestureDetector paramAnonymousScaleGestureDetector)
      {
        return true;
      }
      
      public void onScaleEnd(ScaleGestureDetector paramAnonymousScaleGestureDetector) {}
    };
    
    public FroyoDetector(Context paramContext)
    {
      super();
    }
    
    public boolean isScaling()
    {
      return mDetector.isInProgress();
    }
    
    public boolean onTouchEvent(MotionEvent paramMotionEvent)
    {
      mDetector.onTouchEvent(paramMotionEvent);
      return super.onTouchEvent(paramMotionEvent);
    }
  }
  
  public static abstract interface OnGestureListener
  {
    public abstract void onDrag(float paramFloat1, float paramFloat2);
    
    public abstract void onFling(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
    
    public abstract void onScale(float paramFloat1, float paramFloat2, float paramFloat3);
  }
}
