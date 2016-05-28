package com.adobe.android.ui.widget;

import android.annotation.TargetApi;
import android.view.View;
import android.view.animation.Interpolator;
import android.widget.OverScroller;

public class ScrollerRunnable
  implements Runnable
{
  protected int mAnimationDuration;
  protected boolean mHasMore;
  protected int mLastFlingX;
  private int mOverscrollDistance;
  protected ScrollableView mParent;
  protected int mPreviousX;
  private OverScroller mScroller;
  protected boolean mShouldStopFling;
  
  public ScrollerRunnable(ScrollableView paramScrollableView, int paramInt1, int paramInt2, Interpolator paramInterpolator)
  {
    if (paramInterpolator == null) {}
    for (mScroller = new OverScroller(((View)paramScrollableView).getContext());; mScroller = new OverScroller(((View)paramScrollableView).getContext(), paramInterpolator))
    {
      mOverscrollDistance = paramInt2;
      mParent = paramScrollableView;
      mAnimationDuration = paramInt1;
      return;
    }
  }
  
  protected void abortAnimation()
  {
    mScroller.abortAnimation();
  }
  
  public boolean computeScrollOffset()
  {
    return mScroller.computeScrollOffset();
  }
  
  public void endFling(boolean paramBoolean)
  {
    abortAnimation();
    mLastFlingX = 0;
    mHasMore = false;
    if (paramBoolean) {
      mParent.scrollIntoSlots();
    }
  }
  
  @TargetApi(14)
  public float getCurrVelocity()
  {
    return mScroller.getCurrVelocity();
  }
  
  public int getCurrX()
  {
    return mScroller.getCurrX();
  }
  
  public int getLastFlingX()
  {
    return mLastFlingX;
  }
  
  public boolean isFinished()
  {
    return mScroller.isFinished();
  }
  
  public void run()
  {
    mShouldStopFling = false;
    mPreviousX = getCurrX();
    mHasMore = computeScrollOffset();
    int i = getCurrX();
    mParent.trackMotionScroll(i);
    if ((mHasMore) && (!mShouldStopFling))
    {
      mLastFlingX = i;
      mParent.post(this);
      return;
    }
    endFling(true);
  }
  
  protected void startCommon()
  {
    mParent.removeCallbacks(this);
  }
  
  public void startUsingDistance(int paramInt1, int paramInt2)
  {
    if (paramInt2 == 0) {
      return;
    }
    startCommon();
    mLastFlingX = paramInt1;
    mScroller.startScroll(paramInt1, 0, paramInt2, 0, mAnimationDuration);
    mParent.post(this);
  }
  
  public void startUsingVelocity(int paramInt1, int paramInt2)
  {
    if (paramInt2 == 0) {
      return;
    }
    startCommon();
    mLastFlingX = paramInt1;
    mScroller.fling(paramInt1, 0, paramInt2, 0, mParent.getMinX(), mParent.getMaxX(), 0, Integer.MAX_VALUE, mOverscrollDistance, 0);
    mParent.post(this);
  }
  
  public void stop(boolean paramBoolean)
  {
    mParent.removeCallbacks(this);
    endFling(paramBoolean);
  }
  
  public static abstract interface ScrollableView
  {
    public abstract int getMaxX();
    
    public abstract int getMinX();
    
    public abstract boolean post(Runnable paramRunnable);
    
    public abstract boolean removeCallbacks(Runnable paramRunnable);
    
    public abstract void scrollIntoSlots();
    
    public abstract void trackMotionScroll(int paramInt);
  }
}
