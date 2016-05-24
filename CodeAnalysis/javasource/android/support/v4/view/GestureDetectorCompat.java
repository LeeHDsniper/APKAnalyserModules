package android.support.v4.view;

import android.content.Context;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Message;
import android.view.GestureDetector;
import android.view.GestureDetector.OnDoubleTapListener;
import android.view.GestureDetector.OnGestureListener;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;

public class GestureDetectorCompat
{
  private final GestureDetectorCompatImpl mImpl;
  
  public GestureDetectorCompat(Context paramContext, GestureDetector.OnGestureListener paramOnGestureListener)
  {
    this(paramContext, paramOnGestureListener, null);
  }
  
  public GestureDetectorCompat(Context paramContext, GestureDetector.OnGestureListener paramOnGestureListener, Handler paramHandler)
  {
    if (Build.VERSION.SDK_INT > 17)
    {
      mImpl = new GestureDetectorCompatImplJellybeanMr2(paramContext, paramOnGestureListener, paramHandler);
      return;
    }
    mImpl = new GestureDetectorCompatImplBase(paramContext, paramOnGestureListener, paramHandler);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    return mImpl.onTouchEvent(paramMotionEvent);
  }
  
  static abstract interface GestureDetectorCompatImpl
  {
    public abstract boolean onTouchEvent(MotionEvent paramMotionEvent);
  }
  
  static class GestureDetectorCompatImplBase
    implements GestureDetectorCompat.GestureDetectorCompatImpl
  {
    private static final int DOUBLE_TAP_TIMEOUT = ViewConfiguration.getDoubleTapTimeout();
    private static final int LONGPRESS_TIMEOUT = ;
    private static final int TAP_TIMEOUT = ViewConfiguration.getTapTimeout();
    private boolean mAlwaysInBiggerTapRegion;
    private boolean mAlwaysInTapRegion;
    private MotionEvent mCurrentDownEvent;
    private boolean mDeferConfirmSingleTap;
    private GestureDetector.OnDoubleTapListener mDoubleTapListener;
    private int mDoubleTapSlopSquare;
    private float mDownFocusX;
    private float mDownFocusY;
    private final Handler mHandler;
    private boolean mInLongPress;
    private boolean mIsDoubleTapping;
    private boolean mIsLongpressEnabled;
    private float mLastFocusX;
    private float mLastFocusY;
    private final GestureDetector.OnGestureListener mListener;
    private int mMaximumFlingVelocity;
    private int mMinimumFlingVelocity;
    private MotionEvent mPreviousUpEvent;
    private boolean mStillDown;
    private int mTouchSlopSquare;
    private VelocityTracker mVelocityTracker;
    
    public GestureDetectorCompatImplBase(Context paramContext, GestureDetector.OnGestureListener paramOnGestureListener, Handler paramHandler)
    {
      if (paramHandler != null) {}
      for (mHandler = new GestureHandler(paramHandler);; mHandler = new GestureHandler())
      {
        mListener = paramOnGestureListener;
        if ((paramOnGestureListener instanceof GestureDetector.OnDoubleTapListener)) {
          setOnDoubleTapListener((GestureDetector.OnDoubleTapListener)paramOnGestureListener);
        }
        init(paramContext);
        return;
      }
    }
    
    private void cancel()
    {
      mHandler.removeMessages(1);
      mHandler.removeMessages(2);
      mHandler.removeMessages(3);
      mVelocityTracker.recycle();
      mVelocityTracker = null;
      mIsDoubleTapping = false;
      mStillDown = false;
      mAlwaysInTapRegion = false;
      mAlwaysInBiggerTapRegion = false;
      mDeferConfirmSingleTap = false;
      if (mInLongPress) {
        mInLongPress = false;
      }
    }
    
    private void cancelTaps()
    {
      mHandler.removeMessages(1);
      mHandler.removeMessages(2);
      mHandler.removeMessages(3);
      mIsDoubleTapping = false;
      mAlwaysInTapRegion = false;
      mAlwaysInBiggerTapRegion = false;
      mDeferConfirmSingleTap = false;
      if (mInLongPress) {
        mInLongPress = false;
      }
    }
    
    private void dispatchLongPress()
    {
      mHandler.removeMessages(3);
      mDeferConfirmSingleTap = false;
      mInLongPress = true;
      mListener.onLongPress(mCurrentDownEvent);
    }
    
    private void init(Context paramContext)
    {
      if (paramContext == null) {
        throw new IllegalArgumentException("Context must not be null");
      }
      if (mListener == null) {
        throw new IllegalArgumentException("OnGestureListener must not be null");
      }
      mIsLongpressEnabled = true;
      paramContext = ViewConfiguration.get(paramContext);
      int i = paramContext.getScaledTouchSlop();
      int j = paramContext.getScaledDoubleTapSlop();
      mMinimumFlingVelocity = paramContext.getScaledMinimumFlingVelocity();
      mMaximumFlingVelocity = paramContext.getScaledMaximumFlingVelocity();
      mTouchSlopSquare = (i * i);
      mDoubleTapSlopSquare = (j * j);
    }
    
    private boolean isConsideredDoubleTap(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, MotionEvent paramMotionEvent3)
    {
      if (!mAlwaysInBiggerTapRegion) {}
      int i;
      int j;
      do
      {
        do
        {
          return false;
        } while (paramMotionEvent3.getEventTime() - paramMotionEvent2.getEventTime() > DOUBLE_TAP_TIMEOUT);
        i = (int)paramMotionEvent1.getX() - (int)paramMotionEvent3.getX();
        j = (int)paramMotionEvent1.getY() - (int)paramMotionEvent3.getY();
      } while (i * i + j * j >= mDoubleTapSlopSquare);
      return true;
    }
    
    public boolean onTouchEvent(MotionEvent paramMotionEvent)
    {
      int i1 = paramMotionEvent.getAction();
      if (mVelocityTracker == null) {
        mVelocityTracker = VelocityTracker.obtain();
      }
      mVelocityTracker.addMovement(paramMotionEvent);
      int i;
      int k;
      label53:
      float f2;
      float f1;
      int n;
      int m;
      if ((i1 & 0xFF) == 6)
      {
        i = 1;
        if (i == 0) {
          break label95;
        }
        k = MotionEventCompat.getActionIndex(paramMotionEvent);
        f2 = 0.0F;
        f1 = 0.0F;
        n = MotionEventCompat.getPointerCount(paramMotionEvent);
        m = 0;
        label66:
        if (m >= n) {
          break label122;
        }
        if (k != m) {
          break label101;
        }
      }
      for (;;)
      {
        m += 1;
        break label66;
        i = 0;
        break;
        label95:
        k = -1;
        break label53;
        label101:
        f2 += MotionEventCompat.getX(paramMotionEvent, m);
        f1 += MotionEventCompat.getY(paramMotionEvent, m);
      }
      label122:
      boolean bool4;
      boolean bool5;
      boolean bool2;
      boolean bool3;
      if (i != 0)
      {
        i = n - 1;
        f2 /= i;
        f1 /= i;
        k = 0;
        bool4 = false;
        bool5 = false;
        bool2 = false;
        bool3 = bool2;
      }
      label637:
      int j;
      switch (i1 & 0xFF)
      {
      default: 
        bool3 = bool2;
      case 4: 
      case 5: 
      case 6: 
      case 0: 
      case 2: 
        float f3;
        float f4;
        do
        {
          do
          {
            do
            {
              do
              {
                return bool3;
                i = n;
                break;
                mLastFocusX = f2;
                mDownFocusX = f2;
                mLastFocusY = f1;
                mDownFocusY = f1;
                cancelTaps();
                return false;
                mLastFocusX = f2;
                mDownFocusX = f2;
                mLastFocusY = f1;
                mDownFocusY = f1;
                mVelocityTracker.computeCurrentVelocity(1000, mMaximumFlingVelocity);
                k = MotionEventCompat.getActionIndex(paramMotionEvent);
                i = MotionEventCompat.getPointerId(paramMotionEvent, k);
                f1 = VelocityTrackerCompat.getXVelocity(mVelocityTracker, i);
                f2 = VelocityTrackerCompat.getYVelocity(mVelocityTracker, i);
                i = 0;
                bool3 = bool2;
              } while (i >= n);
              if (i == k) {}
              do
              {
                i += 1;
                break;
                m = MotionEventCompat.getPointerId(paramMotionEvent, i);
              } while (f1 * VelocityTrackerCompat.getXVelocity(mVelocityTracker, m) + f2 * VelocityTrackerCompat.getYVelocity(mVelocityTracker, m) >= 0.0F);
              mVelocityTracker.clear();
              return false;
              i = k;
              if (mDoubleTapListener != null)
              {
                bool2 = mHandler.hasMessages(3);
                if (bool2) {
                  mHandler.removeMessages(3);
                }
                if ((mCurrentDownEvent == null) || (mPreviousUpEvent == null) || (!bool2) || (!isConsideredDoubleTap(mCurrentDownEvent, mPreviousUpEvent, paramMotionEvent))) {
                  break label637;
                }
                mIsDoubleTapping = true;
              }
              for (boolean bool1 = false | mDoubleTapListener.onDoubleTap(mCurrentDownEvent) | mDoubleTapListener.onDoubleTapEvent(paramMotionEvent);; bool1 = k)
              {
                mLastFocusX = f2;
                mDownFocusX = f2;
                mLastFocusY = f1;
                mDownFocusY = f1;
                if (mCurrentDownEvent != null) {
                  mCurrentDownEvent.recycle();
                }
                mCurrentDownEvent = MotionEvent.obtain(paramMotionEvent);
                mAlwaysInTapRegion = true;
                mAlwaysInBiggerTapRegion = true;
                mStillDown = true;
                mInLongPress = false;
                mDeferConfirmSingleTap = false;
                if (mIsLongpressEnabled)
                {
                  mHandler.removeMessages(2);
                  mHandler.sendEmptyMessageAtTime(2, mCurrentDownEvent.getDownTime() + TAP_TIMEOUT + LONGPRESS_TIMEOUT);
                }
                mHandler.sendEmptyMessageAtTime(1, mCurrentDownEvent.getDownTime() + TAP_TIMEOUT);
                return bool1 | mListener.onDown(paramMotionEvent);
                mHandler.sendEmptyMessageDelayed(3, DOUBLE_TAP_TIMEOUT);
              }
              bool3 = bool2;
            } while (mInLongPress);
            f3 = mLastFocusX - f2;
            f4 = mLastFocusY - f1;
            if (mIsDoubleTapping) {
              return false | mDoubleTapListener.onDoubleTapEvent(paramMotionEvent);
            }
            if (!mAlwaysInTapRegion) {
              break label835;
            }
            j = (int)(f2 - mDownFocusX);
            k = (int)(f1 - mDownFocusY);
            j = j * j + k * k;
            bool2 = bool4;
            if (j > mTouchSlopSquare)
            {
              bool2 = mListener.onScroll(mCurrentDownEvent, paramMotionEvent, f3, f4);
              mLastFocusX = f2;
              mLastFocusY = f1;
              mAlwaysInTapRegion = false;
              mHandler.removeMessages(3);
              mHandler.removeMessages(1);
              mHandler.removeMessages(2);
            }
            bool3 = bool2;
          } while (j <= mTouchSlopSquare);
          mAlwaysInBiggerTapRegion = false;
          return bool2;
          if (Math.abs(f3) >= 1.0F) {
            break label859;
          }
          bool3 = bool2;
        } while (Math.abs(f4) < 1.0F);
        bool2 = mListener.onScroll(mCurrentDownEvent, paramMotionEvent, f3, f4);
        mLastFocusX = f2;
        mLastFocusY = f1;
        return bool2;
      case 1: 
        label835:
        label859:
        mStillDown = false;
        MotionEvent localMotionEvent = MotionEvent.obtain(paramMotionEvent);
        if (mIsDoubleTapping) {
          bool2 = false | mDoubleTapListener.onDoubleTapEvent(paramMotionEvent);
        }
        for (;;)
        {
          if (mPreviousUpEvent != null) {
            mPreviousUpEvent.recycle();
          }
          mPreviousUpEvent = localMotionEvent;
          if (mVelocityTracker != null)
          {
            mVelocityTracker.recycle();
            mVelocityTracker = null;
          }
          mIsDoubleTapping = false;
          mDeferConfirmSingleTap = false;
          mHandler.removeMessages(1);
          mHandler.removeMessages(2);
          return bool2;
          if (mInLongPress)
          {
            mHandler.removeMessages(3);
            mInLongPress = false;
            bool2 = bool5;
          }
          else if (mAlwaysInTapRegion)
          {
            bool3 = mListener.onSingleTapUp(paramMotionEvent);
            bool2 = bool3;
            if (mDeferConfirmSingleTap)
            {
              bool2 = bool3;
              if (mDoubleTapListener != null)
              {
                mDoubleTapListener.onSingleTapConfirmed(paramMotionEvent);
                bool2 = bool3;
              }
            }
          }
          else
          {
            VelocityTracker localVelocityTracker = mVelocityTracker;
            j = MotionEventCompat.getPointerId(paramMotionEvent, 0);
            localVelocityTracker.computeCurrentVelocity(1000, mMaximumFlingVelocity);
            f1 = VelocityTrackerCompat.getYVelocity(localVelocityTracker, j);
            f2 = VelocityTrackerCompat.getXVelocity(localVelocityTracker, j);
            if (Math.abs(f1) <= mMinimumFlingVelocity)
            {
              bool2 = bool5;
              if (Math.abs(f2) <= mMinimumFlingVelocity) {}
            }
            else
            {
              bool2 = mListener.onFling(mCurrentDownEvent, paramMotionEvent, f2, f1);
            }
          }
        }
      }
      cancel();
      return false;
    }
    
    public void setOnDoubleTapListener(GestureDetector.OnDoubleTapListener paramOnDoubleTapListener)
    {
      mDoubleTapListener = paramOnDoubleTapListener;
    }
    
    private class GestureHandler
      extends Handler
    {
      GestureHandler() {}
      
      GestureHandler(Handler paramHandler)
      {
        super();
      }
      
      public void handleMessage(Message paramMessage)
      {
        switch (what)
        {
        default: 
          throw new RuntimeException("Unknown message " + paramMessage);
        case 1: 
          mListener.onShowPress(mCurrentDownEvent);
        }
        do
        {
          return;
          GestureDetectorCompat.GestureDetectorCompatImplBase.this.dispatchLongPress();
          return;
        } while (mDoubleTapListener == null);
        if (!mStillDown)
        {
          mDoubleTapListener.onSingleTapConfirmed(mCurrentDownEvent);
          return;
        }
        GestureDetectorCompat.GestureDetectorCompatImplBase.access$502(GestureDetectorCompat.GestureDetectorCompatImplBase.this, true);
      }
    }
  }
  
  static class GestureDetectorCompatImplJellybeanMr2
    implements GestureDetectorCompat.GestureDetectorCompatImpl
  {
    private final GestureDetector mDetector;
    
    public GestureDetectorCompatImplJellybeanMr2(Context paramContext, GestureDetector.OnGestureListener paramOnGestureListener, Handler paramHandler)
    {
      mDetector = new GestureDetector(paramContext, paramOnGestureListener, paramHandler);
    }
    
    public boolean onTouchEvent(MotionEvent paramMotionEvent)
    {
      return mDetector.onTouchEvent(paramMotionEvent);
    }
  }
}
