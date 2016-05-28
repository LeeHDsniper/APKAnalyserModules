package android.support.design.widget;

import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.widget.ViewDragHelper;
import android.support.v4.widget.ViewDragHelper.Callback;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;

public class SwipeDismissBehavior<V extends View>
  extends CoordinatorLayout.Behavior<V>
{
  private float mAlphaEndSwipeDistance = 0.5F;
  private float mAlphaStartSwipeDistance = 0.0F;
  private final ViewDragHelper.Callback mDragCallback = new ViewDragHelper.Callback()
  {
    private int mOriginalCapturedViewLeft;
    
    private boolean shouldDismiss(View paramAnonymousView, float paramAnonymousFloat)
    {
      int i;
      if (paramAnonymousFloat != 0.0F) {
        if (ViewCompat.getLayoutDirection(paramAnonymousView) == 1)
        {
          i = 1;
          if (mSwipeDirection != 2) {
            break label34;
          }
        }
      }
      label34:
      label56:
      label64:
      label87:
      int j;
      int k;
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                return true;
                i = 0;
                break;
                if (mSwipeDirection != 0) {
                  break label64;
                }
                if (i == 0) {
                  break label56;
                }
              } while (paramAnonymousFloat < 0.0F);
              return false;
            } while (paramAnonymousFloat > 0.0F);
            return false;
            if (mSwipeDirection != 1) {
              break label138;
            }
            if (i == 0) {
              break label87;
            }
          } while (paramAnonymousFloat > 0.0F);
          return false;
        } while (paramAnonymousFloat < 0.0F);
        return false;
        i = paramAnonymousView.getLeft();
        j = mOriginalCapturedViewLeft;
        k = Math.round(paramAnonymousView.getWidth() * mDragDismissThreshold);
      } while (Math.abs(i - j) >= k);
      return false;
      label138:
      return false;
    }
    
    public int clampViewPositionHorizontal(View paramAnonymousView, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      int i;
      if (ViewCompat.getLayoutDirection(paramAnonymousView) == 1)
      {
        paramAnonymousInt2 = 1;
        if (mSwipeDirection != 0) {
          break label72;
        }
        if (paramAnonymousInt2 == 0) {
          break label53;
        }
        i = mOriginalCapturedViewLeft - paramAnonymousView.getWidth();
        paramAnonymousInt2 = mOriginalCapturedViewLeft;
      }
      for (;;)
      {
        return SwipeDismissBehavior.clamp(i, paramAnonymousInt1, paramAnonymousInt2);
        paramAnonymousInt2 = 0;
        break;
        label53:
        i = mOriginalCapturedViewLeft;
        paramAnonymousInt2 = mOriginalCapturedViewLeft + paramAnonymousView.getWidth();
        continue;
        label72:
        if (mSwipeDirection == 1)
        {
          if (paramAnonymousInt2 != 0)
          {
            i = mOriginalCapturedViewLeft;
            paramAnonymousInt2 = mOriginalCapturedViewLeft + paramAnonymousView.getWidth();
          }
          else
          {
            i = mOriginalCapturedViewLeft - paramAnonymousView.getWidth();
            paramAnonymousInt2 = mOriginalCapturedViewLeft;
          }
        }
        else
        {
          i = mOriginalCapturedViewLeft - paramAnonymousView.getWidth();
          paramAnonymousInt2 = mOriginalCapturedViewLeft + paramAnonymousView.getWidth();
        }
      }
    }
    
    public int clampViewPositionVertical(View paramAnonymousView, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      return paramAnonymousView.getTop();
    }
    
    public int getViewHorizontalDragRange(View paramAnonymousView)
    {
      return paramAnonymousView.getWidth();
    }
    
    public void onViewDragStateChanged(int paramAnonymousInt)
    {
      if (mListener != null) {
        mListener.onDragStateChanged(paramAnonymousInt);
      }
    }
    
    public void onViewPositionChanged(View paramAnonymousView, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3, int paramAnonymousInt4)
    {
      float f1 = paramAnonymousView.getWidth() * mAlphaStartSwipeDistance;
      float f2 = paramAnonymousView.getWidth() * mAlphaEndSwipeDistance;
      if (paramAnonymousInt1 <= f1)
      {
        ViewCompat.setAlpha(paramAnonymousView, 1.0F);
        return;
      }
      if (paramAnonymousInt1 >= f2)
      {
        ViewCompat.setAlpha(paramAnonymousView, 0.0F);
        return;
      }
      ViewCompat.setAlpha(paramAnonymousView, SwipeDismissBehavior.clamp(0.0F, 1.0F - SwipeDismissBehavior.fraction(f1, f2, paramAnonymousInt1), 1.0F));
    }
    
    public void onViewReleased(View paramAnonymousView, float paramAnonymousFloat1, float paramAnonymousFloat2)
    {
      int i = paramAnonymousView.getWidth();
      boolean bool = false;
      if (shouldDismiss(paramAnonymousView, paramAnonymousFloat1)) {
        if (paramAnonymousView.getLeft() < mOriginalCapturedViewLeft)
        {
          i = mOriginalCapturedViewLeft - i;
          bool = true;
          label41:
          if (!mViewDragHelper.settleCapturedViewAt(i, paramAnonymousView.getTop())) {
            break label100;
          }
          ViewCompat.postOnAnimation(paramAnonymousView, new SwipeDismissBehavior.SettleRunnable(SwipeDismissBehavior.this, paramAnonymousView, bool));
        }
      }
      label100:
      while ((!bool) || (mListener == null))
      {
        return;
        i = mOriginalCapturedViewLeft + i;
        break;
        i = mOriginalCapturedViewLeft;
        break label41;
      }
      mListener.onDismiss(paramAnonymousView);
    }
    
    public boolean tryCaptureView(View paramAnonymousView, int paramAnonymousInt)
    {
      mOriginalCapturedViewLeft = paramAnonymousView.getLeft();
      return true;
    }
  };
  private float mDragDismissThreshold = 0.5F;
  private boolean mIgnoreEvents;
  private OnDismissListener mListener;
  private float mSensitivity = 0.0F;
  private boolean mSensitivitySet;
  private int mSwipeDirection = 2;
  private ViewDragHelper mViewDragHelper;
  
  public SwipeDismissBehavior() {}
  
  private static float clamp(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    return Math.min(Math.max(paramFloat1, paramFloat2), paramFloat3);
  }
  
  private static int clamp(int paramInt1, int paramInt2, int paramInt3)
  {
    return Math.min(Math.max(paramInt1, paramInt2), paramInt3);
  }
  
  private void ensureViewDragHelper(ViewGroup paramViewGroup)
  {
    if (mViewDragHelper == null) {
      if (!mSensitivitySet) {
        break label33;
      }
    }
    label33:
    for (paramViewGroup = ViewDragHelper.create(paramViewGroup, mSensitivity, mDragCallback);; paramViewGroup = ViewDragHelper.create(paramViewGroup, mDragCallback))
    {
      mViewDragHelper = paramViewGroup;
      return;
    }
  }
  
  static float fraction(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    return (paramFloat3 - paramFloat1) / (paramFloat2 - paramFloat1);
  }
  
  public int getDragState()
  {
    if (mViewDragHelper != null) {
      return mViewDragHelper.getViewDragState();
    }
    return 0;
  }
  
  public boolean onInterceptTouchEvent(CoordinatorLayout paramCoordinatorLayout, V paramV, MotionEvent paramMotionEvent)
  {
    switch (MotionEventCompat.getActionMasked(paramMotionEvent))
    {
    case 2: 
    default: 
      if (paramCoordinatorLayout.isPointInChildBounds(paramV, (int)paramMotionEvent.getX(), (int)paramMotionEvent.getY())) {
        break;
      }
    }
    for (boolean bool = true;; bool = false)
    {
      mIgnoreEvents = bool;
      do
      {
        if (!mIgnoreEvents) {
          break;
        }
        return false;
      } while (!mIgnoreEvents);
      mIgnoreEvents = false;
      return false;
    }
    ensureViewDragHelper(paramCoordinatorLayout);
    return mViewDragHelper.shouldInterceptTouchEvent(paramMotionEvent);
  }
  
  public boolean onTouchEvent(CoordinatorLayout paramCoordinatorLayout, V paramV, MotionEvent paramMotionEvent)
  {
    if (mViewDragHelper != null)
    {
      mViewDragHelper.processTouchEvent(paramMotionEvent);
      return true;
    }
    return false;
  }
  
  public void setEndAlphaSwipeDistance(float paramFloat)
  {
    mAlphaEndSwipeDistance = clamp(0.0F, paramFloat, 1.0F);
  }
  
  public void setListener(OnDismissListener paramOnDismissListener)
  {
    mListener = paramOnDismissListener;
  }
  
  public void setStartAlphaSwipeDistance(float paramFloat)
  {
    mAlphaStartSwipeDistance = clamp(0.0F, paramFloat, 1.0F);
  }
  
  public void setSwipeDirection(int paramInt)
  {
    mSwipeDirection = paramInt;
  }
  
  public static abstract interface OnDismissListener
  {
    public abstract void onDismiss(View paramView);
    
    public abstract void onDragStateChanged(int paramInt);
  }
  
  private class SettleRunnable
    implements Runnable
  {
    private final boolean mDismiss;
    private final View mView;
    
    SettleRunnable(View paramView, boolean paramBoolean)
    {
      mView = paramView;
      mDismiss = paramBoolean;
    }
    
    public void run()
    {
      if ((mViewDragHelper != null) && (mViewDragHelper.continueSettling(true))) {
        ViewCompat.postOnAnimation(mView, this);
      }
      while ((!mDismiss) || (mListener == null)) {
        return;
      }
      mListener.onDismiss(mView);
    }
  }
}
