package uk.co.senab.photoview.gestures;

import android.content.Context;
import android.util.FloatMath;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;

public class CupcakeGestureDetector
  implements GestureDetector
{
  private boolean mIsDragging;
  float mLastTouchX;
  float mLastTouchY;
  protected OnGestureListener mListener;
  final float mMinimumVelocity;
  final float mTouchSlop;
  private VelocityTracker mVelocityTracker;
  
  public CupcakeGestureDetector(Context paramContext)
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
            if (mVelocityTracker != null) {
              mVelocityTracker.addMovement(paramMotionEvent);
            }
            for (;;)
            {
              mLastTouchX = getActiveX(paramMotionEvent);
              mLastTouchY = getActiveY(paramMotionEvent);
              mIsDragging = false;
              return true;
              Log.i("CupcakeGestureDetector", "Velocity tracker is null");
            }
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
  
  public void setOnGestureListener(OnGestureListener paramOnGestureListener)
  {
    mListener = paramOnGestureListener;
  }
}
