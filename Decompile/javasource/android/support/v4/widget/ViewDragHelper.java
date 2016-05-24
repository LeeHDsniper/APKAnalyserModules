package android.support.v4.widget;

import android.content.Context;
import android.content.res.Resources;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.VelocityTrackerCompat;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import java.util.Arrays;

public class ViewDragHelper
{
  private static final Interpolator sInterpolator = new Interpolator()
  {
    public float getInterpolation(float paramAnonymousFloat)
    {
      paramAnonymousFloat -= 1.0F;
      return paramAnonymousFloat * paramAnonymousFloat * paramAnonymousFloat * paramAnonymousFloat * paramAnonymousFloat + 1.0F;
    }
  };
  private int mActivePointerId = -1;
  private final Callback mCallback;
  private View mCapturedView;
  private int mDragState;
  private int[] mEdgeDragsInProgress;
  private int[] mEdgeDragsLocked;
  private int mEdgeSize;
  private int[] mInitialEdgesTouched;
  private float[] mInitialMotionX;
  private float[] mInitialMotionY;
  private float[] mLastMotionX;
  private float[] mLastMotionY;
  private float mMaxVelocity;
  private float mMinVelocity;
  private final ViewGroup mParentView;
  private int mPointersDown;
  private boolean mReleaseInProgress;
  private ScrollerCompat mScroller;
  private final Runnable mSetIdleRunnable = new Runnable()
  {
    public void run()
    {
      setDragState(0);
    }
  };
  private int mTouchSlop;
  private int mTrackingEdges;
  private VelocityTracker mVelocityTracker;
  
  private ViewDragHelper(Context paramContext, ViewGroup paramViewGroup, Callback paramCallback)
  {
    if (paramViewGroup == null) {
      throw new IllegalArgumentException("Parent view may not be null");
    }
    if (paramCallback == null) {
      throw new IllegalArgumentException("Callback may not be null");
    }
    mParentView = paramViewGroup;
    mCallback = paramCallback;
    paramViewGroup = ViewConfiguration.get(paramContext);
    mEdgeSize = ((int)(20.0F * getResourcesgetDisplayMetricsdensity + 0.5F));
    mTouchSlop = paramViewGroup.getScaledTouchSlop();
    mMaxVelocity = paramViewGroup.getScaledMaximumFlingVelocity();
    mMinVelocity = paramViewGroup.getScaledMinimumFlingVelocity();
    mScroller = ScrollerCompat.create(paramContext, sInterpolator);
  }
  
  private boolean checkNewEdgeDrag(float paramFloat1, float paramFloat2, int paramInt1, int paramInt2)
  {
    paramFloat1 = Math.abs(paramFloat1);
    paramFloat2 = Math.abs(paramFloat2);
    if (((mInitialEdgesTouched[paramInt1] & paramInt2) != paramInt2) || ((mTrackingEdges & paramInt2) == 0) || ((mEdgeDragsLocked[paramInt1] & paramInt2) == paramInt2) || ((mEdgeDragsInProgress[paramInt1] & paramInt2) == paramInt2) || ((paramFloat1 <= mTouchSlop) && (paramFloat2 <= mTouchSlop))) {}
    do
    {
      return false;
      if ((paramFloat1 < 0.5F * paramFloat2) && (mCallback.onEdgeLock(paramInt2)))
      {
        int[] arrayOfInt = mEdgeDragsLocked;
        arrayOfInt[paramInt1] |= paramInt2;
        return false;
      }
    } while (((mEdgeDragsInProgress[paramInt1] & paramInt2) != 0) || (paramFloat1 <= mTouchSlop));
    return true;
  }
  
  private boolean checkTouchSlop(View paramView, float paramFloat1, float paramFloat2)
  {
    boolean bool = true;
    if (paramView == null) {
      bool = false;
    }
    label27:
    label80:
    label86:
    do
    {
      int j;
      do
      {
        return bool;
        int i;
        if (mCallback.getViewHorizontalDragRange(paramView) > 0)
        {
          i = 1;
          if (mCallback.getViewVerticalDragRange(paramView) <= 0) {
            break label80;
          }
        }
        for (j = 1;; j = 0)
        {
          if ((i == 0) || (j == 0)) {
            break label86;
          }
          if (paramFloat1 * paramFloat1 + paramFloat2 * paramFloat2 > mTouchSlop * mTouchSlop) {
            break;
          }
          return false;
          i = 0;
          break label27;
        }
        if (i == 0) {
          break;
        }
      } while (Math.abs(paramFloat1) > mTouchSlop);
      return false;
      if (j == 0) {
        break;
      }
    } while (Math.abs(paramFloat2) > mTouchSlop);
    return false;
    return false;
  }
  
  private float clampMag(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    float f = Math.abs(paramFloat1);
    if (f < paramFloat2) {
      paramFloat2 = 0.0F;
    }
    do
    {
      return paramFloat2;
      if (f <= paramFloat3) {
        break;
      }
      paramFloat2 = paramFloat3;
    } while (paramFloat1 > 0.0F);
    return -paramFloat3;
    return paramFloat1;
  }
  
  private int clampMag(int paramInt1, int paramInt2, int paramInt3)
  {
    int i = Math.abs(paramInt1);
    if (i < paramInt2) {
      paramInt2 = 0;
    }
    do
    {
      return paramInt2;
      if (i <= paramInt3) {
        break;
      }
      paramInt2 = paramInt3;
    } while (paramInt1 > 0);
    return -paramInt3;
    return paramInt1;
  }
  
  private void clearMotionHistory()
  {
    if (mInitialMotionX == null) {
      return;
    }
    Arrays.fill(mInitialMotionX, 0.0F);
    Arrays.fill(mInitialMotionY, 0.0F);
    Arrays.fill(mLastMotionX, 0.0F);
    Arrays.fill(mLastMotionY, 0.0F);
    Arrays.fill(mInitialEdgesTouched, 0);
    Arrays.fill(mEdgeDragsInProgress, 0);
    Arrays.fill(mEdgeDragsLocked, 0);
    mPointersDown = 0;
  }
  
  private void clearMotionHistory(int paramInt)
  {
    if (mInitialMotionX == null) {
      return;
    }
    mInitialMotionX[paramInt] = 0.0F;
    mInitialMotionY[paramInt] = 0.0F;
    mLastMotionX[paramInt] = 0.0F;
    mLastMotionY[paramInt] = 0.0F;
    mInitialEdgesTouched[paramInt] = 0;
    mEdgeDragsInProgress[paramInt] = 0;
    mEdgeDragsLocked[paramInt] = 0;
    mPointersDown &= (1 << paramInt ^ 0xFFFFFFFF);
  }
  
  private int computeAxisDuration(int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramInt1 == 0) {
      return 0;
    }
    int i = mParentView.getWidth();
    int j = i / 2;
    float f3 = Math.min(1.0F, Math.abs(paramInt1) / i);
    float f1 = j;
    float f2 = j;
    f3 = distanceInfluenceForSnapDuration(f3);
    paramInt2 = Math.abs(paramInt2);
    if (paramInt2 > 0) {}
    for (paramInt1 = Math.round(1000.0F * Math.abs((f1 + f2 * f3) / paramInt2)) * 4;; paramInt1 = (int)((Math.abs(paramInt1) / paramInt3 + 1.0F) * 256.0F)) {
      return Math.min(paramInt1, 600);
    }
  }
  
  private int computeSettleDuration(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    paramInt3 = clampMag(paramInt3, (int)mMinVelocity, (int)mMaxVelocity);
    paramInt4 = clampMag(paramInt4, (int)mMinVelocity, (int)mMaxVelocity);
    int i = Math.abs(paramInt1);
    int j = Math.abs(paramInt2);
    int k = Math.abs(paramInt3);
    int m = Math.abs(paramInt4);
    int n = k + m;
    int i1 = i + j;
    float f1;
    if (paramInt3 != 0)
    {
      f1 = k / n;
      if (paramInt4 == 0) {
        break label161;
      }
    }
    label161:
    for (float f2 = m / n;; f2 = j / i1)
    {
      paramInt1 = computeAxisDuration(paramInt1, paramInt3, mCallback.getViewHorizontalDragRange(paramView));
      paramInt2 = computeAxisDuration(paramInt2, paramInt4, mCallback.getViewVerticalDragRange(paramView));
      return (int)(paramInt1 * f1 + paramInt2 * f2);
      f1 = i / i1;
      break;
    }
  }
  
  public static ViewDragHelper create(ViewGroup paramViewGroup, float paramFloat, Callback paramCallback)
  {
    paramViewGroup = create(paramViewGroup, paramCallback);
    mTouchSlop = ((int)(mTouchSlop * (1.0F / paramFloat)));
    return paramViewGroup;
  }
  
  public static ViewDragHelper create(ViewGroup paramViewGroup, Callback paramCallback)
  {
    return new ViewDragHelper(paramViewGroup.getContext(), paramViewGroup, paramCallback);
  }
  
  private void dispatchViewReleased(float paramFloat1, float paramFloat2)
  {
    mReleaseInProgress = true;
    mCallback.onViewReleased(mCapturedView, paramFloat1, paramFloat2);
    mReleaseInProgress = false;
    if (mDragState == 1) {
      setDragState(0);
    }
  }
  
  private float distanceInfluenceForSnapDuration(float paramFloat)
  {
    return (float)Math.sin((float)((paramFloat - 0.5F) * 0.4712389167638204D));
  }
  
  private void dragTo(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int j = paramInt1;
    int i = paramInt2;
    int k = mCapturedView.getLeft();
    int m = mCapturedView.getTop();
    if (paramInt3 != 0)
    {
      j = mCallback.clampViewPositionHorizontal(mCapturedView, paramInt1, paramInt3);
      mCapturedView.offsetLeftAndRight(j - k);
    }
    if (paramInt4 != 0)
    {
      i = mCallback.clampViewPositionVertical(mCapturedView, paramInt2, paramInt4);
      mCapturedView.offsetTopAndBottom(i - m);
    }
    if ((paramInt3 != 0) || (paramInt4 != 0)) {
      mCallback.onViewPositionChanged(mCapturedView, j, i, j - k, i - m);
    }
  }
  
  private void ensureMotionHistorySizeForId(int paramInt)
  {
    if ((mInitialMotionX == null) || (mInitialMotionX.length <= paramInt))
    {
      float[] arrayOfFloat1 = new float[paramInt + 1];
      float[] arrayOfFloat2 = new float[paramInt + 1];
      float[] arrayOfFloat3 = new float[paramInt + 1];
      float[] arrayOfFloat4 = new float[paramInt + 1];
      int[] arrayOfInt1 = new int[paramInt + 1];
      int[] arrayOfInt2 = new int[paramInt + 1];
      int[] arrayOfInt3 = new int[paramInt + 1];
      if (mInitialMotionX != null)
      {
        System.arraycopy(mInitialMotionX, 0, arrayOfFloat1, 0, mInitialMotionX.length);
        System.arraycopy(mInitialMotionY, 0, arrayOfFloat2, 0, mInitialMotionY.length);
        System.arraycopy(mLastMotionX, 0, arrayOfFloat3, 0, mLastMotionX.length);
        System.arraycopy(mLastMotionY, 0, arrayOfFloat4, 0, mLastMotionY.length);
        System.arraycopy(mInitialEdgesTouched, 0, arrayOfInt1, 0, mInitialEdgesTouched.length);
        System.arraycopy(mEdgeDragsInProgress, 0, arrayOfInt2, 0, mEdgeDragsInProgress.length);
        System.arraycopy(mEdgeDragsLocked, 0, arrayOfInt3, 0, mEdgeDragsLocked.length);
      }
      mInitialMotionX = arrayOfFloat1;
      mInitialMotionY = arrayOfFloat2;
      mLastMotionX = arrayOfFloat3;
      mLastMotionY = arrayOfFloat4;
      mInitialEdgesTouched = arrayOfInt1;
      mEdgeDragsInProgress = arrayOfInt2;
      mEdgeDragsLocked = arrayOfInt3;
    }
  }
  
  private boolean forceSettleCapturedViewAt(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = mCapturedView.getLeft();
    int j = mCapturedView.getTop();
    paramInt1 -= i;
    paramInt2 -= j;
    if ((paramInt1 == 0) && (paramInt2 == 0))
    {
      mScroller.abortAnimation();
      setDragState(0);
      return false;
    }
    paramInt3 = computeSettleDuration(mCapturedView, paramInt1, paramInt2, paramInt3, paramInt4);
    mScroller.startScroll(i, j, paramInt1, paramInt2, paramInt3);
    setDragState(2);
    return true;
  }
  
  private int getEdgesTouched(int paramInt1, int paramInt2)
  {
    int j = 0;
    if (paramInt1 < mParentView.getLeft() + mEdgeSize) {
      j = 0x0 | 0x1;
    }
    int i = j;
    if (paramInt2 < mParentView.getTop() + mEdgeSize) {
      i = j | 0x4;
    }
    j = i;
    if (paramInt1 > mParentView.getRight() - mEdgeSize) {
      j = i | 0x2;
    }
    paramInt1 = j;
    if (paramInt2 > mParentView.getBottom() - mEdgeSize) {
      paramInt1 = j | 0x8;
    }
    return paramInt1;
  }
  
  private void releaseViewForPointerUp()
  {
    mVelocityTracker.computeCurrentVelocity(1000, mMaxVelocity);
    dispatchViewReleased(clampMag(VelocityTrackerCompat.getXVelocity(mVelocityTracker, mActivePointerId), mMinVelocity, mMaxVelocity), clampMag(VelocityTrackerCompat.getYVelocity(mVelocityTracker, mActivePointerId), mMinVelocity, mMaxVelocity));
  }
  
  private void reportNewEdgeDrags(float paramFloat1, float paramFloat2, int paramInt)
  {
    int j = 0;
    if (checkNewEdgeDrag(paramFloat1, paramFloat2, paramInt, 1)) {
      j = 0x0 | 0x1;
    }
    int i = j;
    if (checkNewEdgeDrag(paramFloat2, paramFloat1, paramInt, 4)) {
      i = j | 0x4;
    }
    j = i;
    if (checkNewEdgeDrag(paramFloat1, paramFloat2, paramInt, 2)) {
      j = i | 0x2;
    }
    i = j;
    if (checkNewEdgeDrag(paramFloat2, paramFloat1, paramInt, 8)) {
      i = j | 0x8;
    }
    if (i != 0)
    {
      int[] arrayOfInt = mEdgeDragsInProgress;
      arrayOfInt[paramInt] |= i;
      mCallback.onEdgeDragStarted(i, paramInt);
    }
  }
  
  private void saveInitialMotion(float paramFloat1, float paramFloat2, int paramInt)
  {
    ensureMotionHistorySizeForId(paramInt);
    float[] arrayOfFloat = mInitialMotionX;
    mLastMotionX[paramInt] = paramFloat1;
    arrayOfFloat[paramInt] = paramFloat1;
    arrayOfFloat = mInitialMotionY;
    mLastMotionY[paramInt] = paramFloat2;
    arrayOfFloat[paramInt] = paramFloat2;
    mInitialEdgesTouched[paramInt] = getEdgesTouched((int)paramFloat1, (int)paramFloat2);
    mPointersDown |= 1 << paramInt;
  }
  
  private void saveLastMotion(MotionEvent paramMotionEvent)
  {
    int j = MotionEventCompat.getPointerCount(paramMotionEvent);
    int i = 0;
    while (i < j)
    {
      int k = MotionEventCompat.getPointerId(paramMotionEvent, i);
      float f1 = MotionEventCompat.getX(paramMotionEvent, i);
      float f2 = MotionEventCompat.getY(paramMotionEvent, i);
      mLastMotionX[k] = f1;
      mLastMotionY[k] = f2;
      i += 1;
    }
  }
  
  public void abort()
  {
    cancel();
    if (mDragState == 2)
    {
      int i = mScroller.getCurrX();
      int j = mScroller.getCurrY();
      mScroller.abortAnimation();
      int k = mScroller.getCurrX();
      int m = mScroller.getCurrY();
      mCallback.onViewPositionChanged(mCapturedView, k, m, k - i, m - j);
    }
    setDragState(0);
  }
  
  public void cancel()
  {
    mActivePointerId = -1;
    clearMotionHistory();
    if (mVelocityTracker != null)
    {
      mVelocityTracker.recycle();
      mVelocityTracker = null;
    }
  }
  
  public void captureChildView(View paramView, int paramInt)
  {
    if (paramView.getParent() != mParentView) {
      throw new IllegalArgumentException("captureChildView: parameter must be a descendant of the ViewDragHelper's tracked parent view (" + mParentView + ")");
    }
    mCapturedView = paramView;
    mActivePointerId = paramInt;
    mCallback.onViewCaptured(paramView, paramInt);
    setDragState(1);
  }
  
  public boolean checkTouchSlop(int paramInt)
  {
    int j = mInitialMotionX.length;
    int i = 0;
    while (i < j)
    {
      if (checkTouchSlop(paramInt, i)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  public boolean checkTouchSlop(int paramInt1, int paramInt2)
  {
    boolean bool = true;
    if (!isPointerDown(paramInt2)) {
      bool = false;
    }
    label27:
    float f2;
    label105:
    label110:
    do
    {
      float f1;
      do
      {
        return bool;
        int i;
        if ((paramInt1 & 0x1) == 1)
        {
          i = 1;
          if ((paramInt1 & 0x2) != 2) {
            break label105;
          }
        }
        for (paramInt1 = 1;; paramInt1 = 0)
        {
          f1 = mLastMotionX[paramInt2] - mInitialMotionX[paramInt2];
          f2 = mLastMotionY[paramInt2] - mInitialMotionY[paramInt2];
          if ((i == 0) || (paramInt1 == 0)) {
            break label110;
          }
          if (f1 * f1 + f2 * f2 > mTouchSlop * mTouchSlop) {
            break;
          }
          return false;
          i = 0;
          break label27;
        }
        if (i == 0) {
          break;
        }
      } while (Math.abs(f1) > mTouchSlop);
      return false;
      if (paramInt1 == 0) {
        break;
      }
    } while (Math.abs(f2) > mTouchSlop);
    return false;
    return false;
  }
  
  public boolean continueSettling(boolean paramBoolean)
  {
    if (mDragState == 2)
    {
      boolean bool2 = mScroller.computeScrollOffset();
      int i = mScroller.getCurrX();
      int j = mScroller.getCurrY();
      int k = i - mCapturedView.getLeft();
      int m = j - mCapturedView.getTop();
      if (k != 0) {
        mCapturedView.offsetLeftAndRight(k);
      }
      if (m != 0) {
        mCapturedView.offsetTopAndBottom(m);
      }
      if ((k != 0) || (m != 0)) {
        mCallback.onViewPositionChanged(mCapturedView, i, j, k, m);
      }
      boolean bool1 = bool2;
      if (bool2)
      {
        bool1 = bool2;
        if (i == mScroller.getFinalX())
        {
          bool1 = bool2;
          if (j == mScroller.getFinalY())
          {
            mScroller.abortAnimation();
            bool1 = false;
          }
        }
      }
      if (!bool1)
      {
        if (!paramBoolean) {
          break label190;
        }
        mParentView.post(mSetIdleRunnable);
      }
    }
    while (mDragState == 2)
    {
      return true;
      label190:
      setDragState(0);
    }
    return false;
  }
  
  public View findTopChildUnder(int paramInt1, int paramInt2)
  {
    int i = mParentView.getChildCount() - 1;
    while (i >= 0)
    {
      View localView = mParentView.getChildAt(mCallback.getOrderedChildIndex(i));
      if ((paramInt1 >= localView.getLeft()) && (paramInt1 < localView.getRight()) && (paramInt2 >= localView.getTop()) && (paramInt2 < localView.getBottom())) {
        return localView;
      }
      i -= 1;
    }
    return null;
  }
  
  public View getCapturedView()
  {
    return mCapturedView;
  }
  
  public int getEdgeSize()
  {
    return mEdgeSize;
  }
  
  public int getTouchSlop()
  {
    return mTouchSlop;
  }
  
  public int getViewDragState()
  {
    return mDragState;
  }
  
  public boolean isCapturedViewUnder(int paramInt1, int paramInt2)
  {
    return isViewUnder(mCapturedView, paramInt1, paramInt2);
  }
  
  public boolean isPointerDown(int paramInt)
  {
    return (mPointersDown & 1 << paramInt) != 0;
  }
  
  public boolean isViewUnder(View paramView, int paramInt1, int paramInt2)
  {
    if (paramView == null) {}
    while ((paramInt1 < paramView.getLeft()) || (paramInt1 >= paramView.getRight()) || (paramInt2 < paramView.getTop()) || (paramInt2 >= paramView.getBottom())) {
      return false;
    }
    return true;
  }
  
  public void processTouchEvent(MotionEvent paramMotionEvent)
  {
    int j = MotionEventCompat.getActionMasked(paramMotionEvent);
    int i = MotionEventCompat.getActionIndex(paramMotionEvent);
    if (j == 0) {
      cancel();
    }
    if (mVelocityTracker == null) {
      mVelocityTracker = VelocityTracker.obtain();
    }
    mVelocityTracker.addMovement(paramMotionEvent);
    float f1;
    float f2;
    int k;
    switch (j)
    {
    case 4: 
    default: 
    case 0: 
    case 5: 
      do
      {
        do
        {
          do
          {
            return;
            f1 = paramMotionEvent.getX();
            f2 = paramMotionEvent.getY();
            i = MotionEventCompat.getPointerId(paramMotionEvent, 0);
            paramMotionEvent = findTopChildUnder((int)f1, (int)f2);
            saveInitialMotion(f1, f2, i);
            tryCaptureViewForDrag(paramMotionEvent, i);
            j = mInitialEdgesTouched[i];
          } while ((mTrackingEdges & j) == 0);
          mCallback.onEdgeTouched(mTrackingEdges & j, i);
          return;
          j = MotionEventCompat.getPointerId(paramMotionEvent, i);
          f1 = MotionEventCompat.getX(paramMotionEvent, i);
          f2 = MotionEventCompat.getY(paramMotionEvent, i);
          saveInitialMotion(f1, f2, j);
          if (mDragState != 0) {
            break;
          }
          tryCaptureViewForDrag(findTopChildUnder((int)f1, (int)f2), j);
          i = mInitialEdgesTouched[j];
        } while ((mTrackingEdges & i) == 0);
        mCallback.onEdgeTouched(mTrackingEdges & i, j);
        return;
      } while (!isCapturedViewUnder((int)f1, (int)f2));
      tryCaptureViewForDrag(mCapturedView, j);
      return;
    case 2: 
      if (mDragState == 1)
      {
        i = MotionEventCompat.findPointerIndex(paramMotionEvent, mActivePointerId);
        f1 = MotionEventCompat.getX(paramMotionEvent, i);
        f2 = MotionEventCompat.getY(paramMotionEvent, i);
        i = (int)(f1 - mLastMotionX[mActivePointerId]);
        j = (int)(f2 - mLastMotionY[mActivePointerId]);
        dragTo(mCapturedView.getLeft() + i, mCapturedView.getTop() + j, i, j);
        saveLastMotion(paramMotionEvent);
        return;
      }
      j = MotionEventCompat.getPointerCount(paramMotionEvent);
      i = 0;
      for (;;)
      {
        float f3;
        float f4;
        if (i < j)
        {
          k = MotionEventCompat.getPointerId(paramMotionEvent, i);
          f1 = MotionEventCompat.getX(paramMotionEvent, i);
          f2 = MotionEventCompat.getY(paramMotionEvent, i);
          f3 = f1 - mInitialMotionX[k];
          f4 = f2 - mInitialMotionY[k];
          reportNewEdgeDrags(f3, f4, k);
          if (mDragState != 1) {
            break label456;
          }
        }
        View localView;
        do
        {
          saveLastMotion(paramMotionEvent);
          return;
          localView = findTopChildUnder((int)f1, (int)f2);
        } while ((checkTouchSlop(localView, f3, f4)) && (tryCaptureViewForDrag(localView, k)));
        i += 1;
      }
    case 6: 
      int m = MotionEventCompat.getPointerId(paramMotionEvent, i);
      if ((mDragState == 1) && (m == mActivePointerId))
      {
        k = -1;
        int n = MotionEventCompat.getPointerCount(paramMotionEvent);
        i = 0;
        j = k;
        if (i < n)
        {
          j = MotionEventCompat.getPointerId(paramMotionEvent, i);
          if (j == mActivePointerId) {}
          do
          {
            i += 1;
            break;
            f1 = MotionEventCompat.getX(paramMotionEvent, i);
            f2 = MotionEventCompat.getY(paramMotionEvent, i);
          } while ((findTopChildUnder((int)f1, (int)f2) != mCapturedView) || (!tryCaptureViewForDrag(mCapturedView, j)));
          j = mActivePointerId;
        }
        if (j == -1) {
          releaseViewForPointerUp();
        }
      }
      clearMotionHistory(m);
      return;
    case 1: 
      label456:
      if (mDragState == 1) {
        releaseViewForPointerUp();
      }
      cancel();
      return;
    }
    if (mDragState == 1) {
      dispatchViewReleased(0.0F, 0.0F);
    }
    cancel();
  }
  
  void setDragState(int paramInt)
  {
    mParentView.removeCallbacks(mSetIdleRunnable);
    if (mDragState != paramInt)
    {
      mDragState = paramInt;
      mCallback.onViewDragStateChanged(paramInt);
      if (mDragState == 0) {
        mCapturedView = null;
      }
    }
  }
  
  public void setEdgeTrackingEnabled(int paramInt)
  {
    mTrackingEdges = paramInt;
  }
  
  public void setMinVelocity(float paramFloat)
  {
    mMinVelocity = paramFloat;
  }
  
  public boolean settleCapturedViewAt(int paramInt1, int paramInt2)
  {
    if (!mReleaseInProgress) {
      throw new IllegalStateException("Cannot settleCapturedViewAt outside of a call to Callback#onViewReleased");
    }
    return forceSettleCapturedViewAt(paramInt1, paramInt2, (int)VelocityTrackerCompat.getXVelocity(mVelocityTracker, mActivePointerId), (int)VelocityTrackerCompat.getYVelocity(mVelocityTracker, mActivePointerId));
  }
  
  public boolean shouldInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    int j = MotionEventCompat.getActionMasked(paramMotionEvent);
    int i = MotionEventCompat.getActionIndex(paramMotionEvent);
    if (j == 0) {
      cancel();
    }
    if (mVelocityTracker == null) {
      mVelocityTracker = VelocityTracker.obtain();
    }
    mVelocityTracker.addMovement(paramMotionEvent);
    switch (j)
    {
    }
    while (mDragState == 1)
    {
      return true;
      float f1 = paramMotionEvent.getX();
      float f2 = paramMotionEvent.getY();
      i = MotionEventCompat.getPointerId(paramMotionEvent, 0);
      saveInitialMotion(f1, f2, i);
      paramMotionEvent = findTopChildUnder((int)f1, (int)f2);
      if ((paramMotionEvent == mCapturedView) && (mDragState == 2)) {
        tryCaptureViewForDrag(paramMotionEvent, i);
      }
      j = mInitialEdgesTouched[i];
      if ((mTrackingEdges & j) != 0)
      {
        mCallback.onEdgeTouched(mTrackingEdges & j, i);
        continue;
        j = MotionEventCompat.getPointerId(paramMotionEvent, i);
        f1 = MotionEventCompat.getX(paramMotionEvent, i);
        f2 = MotionEventCompat.getY(paramMotionEvent, i);
        saveInitialMotion(f1, f2, j);
        if (mDragState == 0)
        {
          i = mInitialEdgesTouched[j];
          if ((mTrackingEdges & i) != 0) {
            mCallback.onEdgeTouched(mTrackingEdges & i, j);
          }
        }
        else if (mDragState == 2)
        {
          paramMotionEvent = findTopChildUnder((int)f1, (int)f2);
          if (paramMotionEvent == mCapturedView)
          {
            tryCaptureViewForDrag(paramMotionEvent, j);
            continue;
            if ((mInitialMotionX != null) && (mInitialMotionY != null))
            {
              int k = MotionEventCompat.getPointerCount(paramMotionEvent);
              i = 0;
              for (;;)
              {
                int m;
                float f3;
                float f4;
                View localView;
                if (i < k)
                {
                  m = MotionEventCompat.getPointerId(paramMotionEvent, i);
                  f1 = MotionEventCompat.getX(paramMotionEvent, i);
                  f2 = MotionEventCompat.getY(paramMotionEvent, i);
                  f3 = f1 - mInitialMotionX[m];
                  f4 = f2 - mInitialMotionY[m];
                  localView = findTopChildUnder((int)f1, (int)f2);
                  if ((localView == null) || (!checkTouchSlop(localView, f3, f4))) {
                    break label541;
                  }
                  j = 1;
                  label410:
                  if (j == 0) {
                    break label547;
                  }
                  int n = localView.getLeft();
                  int i1 = (int)f3;
                  i1 = mCallback.clampViewPositionHorizontal(localView, n + i1, (int)f3);
                  int i2 = localView.getTop();
                  int i3 = (int)f4;
                  i3 = mCallback.clampViewPositionVertical(localView, i2 + i3, (int)f4);
                  int i4 = mCallback.getViewHorizontalDragRange(localView);
                  int i5 = mCallback.getViewVerticalDragRange(localView);
                  if (((i4 != 0) && ((i4 <= 0) || (i1 != n))) || ((i5 != 0) && ((i5 <= 0) || (i3 != i2)))) {
                    break label547;
                  }
                }
                label541:
                label547:
                do
                {
                  saveLastMotion(paramMotionEvent);
                  break;
                  j = 0;
                  break label410;
                  reportNewEdgeDrags(f3, f4, m);
                } while ((mDragState == 1) || ((j != 0) && (tryCaptureViewForDrag(localView, m))));
                i += 1;
              }
              clearMotionHistory(MotionEventCompat.getPointerId(paramMotionEvent, i));
              continue;
              cancel();
            }
          }
        }
      }
    }
    return false;
  }
  
  public boolean smoothSlideViewTo(View paramView, int paramInt1, int paramInt2)
  {
    mCapturedView = paramView;
    mActivePointerId = -1;
    boolean bool = forceSettleCapturedViewAt(paramInt1, paramInt2, 0, 0);
    if ((!bool) && (mDragState == 0) && (mCapturedView != null)) {
      mCapturedView = null;
    }
    return bool;
  }
  
  boolean tryCaptureViewForDrag(View paramView, int paramInt)
  {
    if ((paramView == mCapturedView) && (mActivePointerId == paramInt)) {
      return true;
    }
    if ((paramView != null) && (mCallback.tryCaptureView(paramView, paramInt)))
    {
      mActivePointerId = paramInt;
      captureChildView(paramView, paramInt);
      return true;
    }
    return false;
  }
  
  public static abstract class Callback
  {
    public Callback() {}
    
    public int clampViewPositionHorizontal(View paramView, int paramInt1, int paramInt2)
    {
      return 0;
    }
    
    public int clampViewPositionVertical(View paramView, int paramInt1, int paramInt2)
    {
      return 0;
    }
    
    public int getOrderedChildIndex(int paramInt)
    {
      return paramInt;
    }
    
    public int getViewHorizontalDragRange(View paramView)
    {
      return 0;
    }
    
    public int getViewVerticalDragRange(View paramView)
    {
      return 0;
    }
    
    public void onEdgeDragStarted(int paramInt1, int paramInt2) {}
    
    public boolean onEdgeLock(int paramInt)
    {
      return false;
    }
    
    public void onEdgeTouched(int paramInt1, int paramInt2) {}
    
    public void onViewCaptured(View paramView, int paramInt) {}
    
    public void onViewDragStateChanged(int paramInt) {}
    
    public void onViewPositionChanged(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {}
    
    public void onViewReleased(View paramView, float paramFloat1, float paramFloat2) {}
    
    public abstract boolean tryCaptureView(View paramView, int paramInt);
  }
}
