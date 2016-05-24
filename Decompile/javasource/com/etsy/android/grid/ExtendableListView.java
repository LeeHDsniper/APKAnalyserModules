package com.etsy.android.grid;

import android.annotation.SuppressLint;
import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.util.SparseArrayCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.widget.AbsListView;
import android.widget.AbsListView.LayoutParams;
import android.widget.AbsListView.OnScrollListener;
import android.widget.ListAdapter;
import android.widget.Scroller;
import java.util.ArrayList;
import java.util.Iterator;

@SuppressLint({"WrongCall"})
public abstract class ExtendableListView
  extends AbsListView
{
  private int mActivePointerId = -1;
  ListAdapter mAdapter;
  private boolean mBlockLayoutRequests = false;
  protected boolean mClipToPadding;
  private boolean mDataChanged;
  protected int mFirstPosition;
  private FlingRunnable mFlingRunnable;
  private int mFlingVelocity;
  private ArrayList<FixedViewInfo> mFooterViewInfos;
  private ArrayList<FixedViewInfo> mHeaderViewInfos;
  private boolean mInLayout;
  private boolean mIsAttached;
  final boolean[] mIsScrap = new boolean[1];
  private int mItemCount;
  private int mLastY;
  private int mLayoutMode;
  private int mMaximumVelocity;
  private int mMotionCorrection;
  private int mMotionPosition;
  private int mMotionX;
  private int mMotionY;
  boolean mNeedSync = false;
  private AdapterDataSetObserver mObserver;
  private int mOldItemCount;
  private AbsListView.OnScrollListener mOnScrollListener;
  private PerformClick mPerformClick;
  private RecycleBin mRecycleBin;
  private int mScrollState = 0;
  protected int mSpecificTop;
  long mSyncHeight;
  protected int mSyncPosition;
  long mSyncRowId = Long.MIN_VALUE;
  private ListSavedState mSyncState;
  private int mTouchMode;
  private int mTouchSlop;
  private VelocityTracker mVelocityTracker = null;
  private int mWidthMeasureSpec;
  
  public ExtendableListView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setWillNotDraw(false);
    setClipToPadding(false);
    setFocusableInTouchMode(false);
    paramContext = ViewConfiguration.get(paramContext);
    mTouchSlop = paramContext.getScaledTouchSlop();
    mMaximumVelocity = paramContext.getScaledMaximumFlingVelocity();
    mFlingVelocity = paramContext.getScaledMinimumFlingVelocity();
    mRecycleBin = new RecycleBin();
    mObserver = new AdapterDataSetObserver();
    mHeaderViewInfos = new ArrayList();
    mFooterViewInfos = new ArrayList();
    mLayoutMode = 0;
  }
  
  private void adjustViewsUpOrDown()
  {
    if (getChildCount() > 0)
    {
      int j = getHighestChildTop() - getListPaddingTop();
      int i = j;
      if (j < 0) {
        i = 0;
      }
      if (i != 0) {
        offsetChildrenTopAndBottom(-i);
      }
    }
  }
  
  private void clearRecycledState(ArrayList<FixedViewInfo> paramArrayList)
  {
    if (paramArrayList == null) {}
    for (;;)
    {
      return;
      paramArrayList = paramArrayList.iterator();
      while (paramArrayList.hasNext())
      {
        LayoutParams localLayoutParams = (LayoutParams)nextview.getLayoutParams();
        if (localLayoutParams != null) {
          recycledHeaderFooter = false;
        }
      }
    }
  }
  
  private void clearState()
  {
    clearRecycledState(mHeaderViewInfos);
    clearRecycledState(mFooterViewInfos);
    removeAllViewsInLayout();
    mFirstPosition = 0;
    mDataChanged = false;
    mRecycleBin.clear();
    mNeedSync = false;
    mSyncState = null;
    mLayoutMode = 0;
    invalidate();
  }
  
  private void correctTooHigh(int paramInt)
  {
    if ((mFirstPosition + paramInt - 1 == mItemCount - 1) && (paramInt > 0))
    {
      paramInt = getLowestChildBottom();
      int i = getBottom() - getTop() - getListPaddingBottom() - paramInt;
      int j = getHighestChildTop();
      if ((i > 0) && ((mFirstPosition > 0) || (j < getListPaddingTop())))
      {
        paramInt = i;
        if (mFirstPosition == 0) {
          paramInt = Math.min(i, getListPaddingTop() - j);
        }
        offsetChildrenTopAndBottom(paramInt);
        if (mFirstPosition > 0)
        {
          paramInt = mFirstPosition - 1;
          fillUp(paramInt, getNextChildUpsBottom(paramInt));
          adjustViewsUpOrDown();
        }
      }
    }
  }
  
  private void correctTooLow(int paramInt)
  {
    int m;
    if ((mFirstPosition == 0) && (paramInt > 0))
    {
      int i = getHighestChildTop();
      int k = getListPaddingTop();
      int j = getTop() - getBottom() - getListPaddingBottom();
      i -= k;
      k = getLowestChildBottom();
      m = mFirstPosition + paramInt - 1;
      if (i > 0)
      {
        if ((m >= mItemCount - 1) && (k <= j)) {
          break label139;
        }
        paramInt = i;
        if (m == mItemCount - 1) {
          paramInt = Math.min(i, k - j);
        }
        offsetChildrenTopAndBottom(-paramInt);
        if (m < mItemCount - 1)
        {
          paramInt = m + 1;
          fillDown(paramInt, getNextChildDownsTop(paramInt));
          adjustViewsUpOrDown();
        }
      }
    }
    label139:
    while (m != mItemCount - 1) {
      return;
    }
    adjustViewsUpOrDown();
  }
  
  private View fillDown(int paramInt1, int paramInt2)
  {
    int m = getHeight();
    int i = m;
    int j = paramInt1;
    int k = paramInt2;
    if (mClipToPadding)
    {
      i = m - getListPaddingBottom();
      k = paramInt2;
      j = paramInt1;
    }
    for (;;)
    {
      if (((k >= i) && (!hasSpaceDown())) || (j >= mItemCount)) {
        return null;
      }
      makeAndAddView(j, k, true, false);
      j += 1;
      k = getNextChildDownsTop(j);
    }
  }
  
  private View fillFromTop(int paramInt)
  {
    mFirstPosition = Math.min(mFirstPosition, mItemCount - 1);
    if (mFirstPosition < 0) {
      mFirstPosition = 0;
    }
    return fillDown(mFirstPosition, paramInt);
  }
  
  private View fillSpecific(int paramInt1, int paramInt2)
  {
    View localView1 = makeAndAddView(paramInt1, paramInt2, true, false);
    mFirstPosition = paramInt1;
    paramInt2 = getNextChildUpsBottom(paramInt1 - 1);
    int i = getNextChildDownsTop(paramInt1 + 1);
    View localView2 = fillUp(paramInt1 - 1, paramInt2);
    adjustViewsUpOrDown();
    View localView3 = fillDown(paramInt1 + 1, i);
    paramInt1 = getChildCount();
    if (paramInt1 > 0) {
      correctTooHigh(paramInt1);
    }
    if (0 != 0) {
      return localView1;
    }
    if (localView2 != null) {
      return localView2;
    }
    return localView3;
  }
  
  private View fillUp(int paramInt1, int paramInt2)
  {
    int i;
    if (mClipToPadding) {
      i = getListPaddingTop();
    }
    for (;;)
    {
      if (((paramInt2 <= i) && (!hasSpaceUp())) || (paramInt1 < 0))
      {
        mFirstPosition = (paramInt1 + 1);
        return null;
        i = 0;
      }
      else
      {
        makeAndAddView(paramInt1, paramInt2, false, false);
        paramInt1 -= 1;
        paramInt2 = getNextChildUpsBottom(paramInt1);
      }
    }
  }
  
  private int findMotionRow(int paramInt)
  {
    int j = getChildCount();
    int i;
    if (j > 0) {
      i = 0;
    }
    for (;;)
    {
      if (i >= j) {
        return -1;
      }
      if (paramInt <= getChildAt(i).getBottom()) {
        return mFirstPosition + i;
      }
      i += 1;
    }
  }
  
  private void initOrResetVelocityTracker()
  {
    if (mVelocityTracker == null)
    {
      mVelocityTracker = VelocityTracker.obtain();
      return;
    }
    mVelocityTracker.clear();
  }
  
  private void initVelocityTrackerIfNotExists()
  {
    if (mVelocityTracker == null) {
      mVelocityTracker = VelocityTracker.obtain();
    }
  }
  
  private View makeAndAddView(int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
  {
    onChildCreated(paramInt1, paramBoolean1);
    if (!mDataChanged)
    {
      localView = mRecycleBin.getActiveView(paramInt1);
      if (localView != null)
      {
        setupChild(localView, paramInt1, paramInt2, paramBoolean1, paramBoolean2, true);
        return localView;
      }
    }
    View localView = obtainView(paramInt1, mIsScrap);
    setupChild(localView, paramInt1, paramInt2, paramBoolean1, paramBoolean2, mIsScrap[0]);
    return localView;
  }
  
  private boolean moveTheChildren(int paramInt1, int paramInt2)
  {
    if (!hasChildren()) {
      return true;
    }
    paramInt1 = getHighestChildTop();
    int i = getLowestChildBottom();
    int k = 0;
    int j = 0;
    if (mClipToPadding)
    {
      k = getListPaddingTop();
      j = getListPaddingBottom();
    }
    int i3 = getHeight();
    int i4 = getFirstChildTop();
    int i5 = getLastChildBottom();
    int m = i3 - getListPaddingBottom() - getListPaddingTop();
    int i6;
    int i7;
    if (paramInt2 < 0)
    {
      m = Math.max(-(m - 1), paramInt2);
      i6 = mFirstPosition;
      n = getListPaddingTop();
      paramInt2 = getListPaddingBottom();
      i7 = getChildCount();
      if ((i6 != 0) || (paramInt1 < n) || (m < 0)) {
        break label183;
      }
      paramInt1 = 1;
      label132:
      if ((i6 + i7 != mItemCount) || (i > i3 - paramInt2) || (m > 0)) {
        break label188;
      }
      paramInt2 = 1;
    }
    for (;;)
    {
      if (paramInt1 != 0)
      {
        if (m != 0)
        {
          return true;
          m = Math.min(m - 1, paramInt2);
          break;
          label183:
          paramInt1 = 0;
          break label132;
          label188:
          paramInt2 = 0;
          continue;
        }
        return false;
      }
    }
    if (paramInt2 != 0) {
      return m != 0;
    }
    boolean bool;
    int i8;
    int i9;
    int i2;
    int i1;
    View localView;
    if (m < 0)
    {
      bool = true;
      i8 = getHeaderViewsCount();
      i9 = mItemCount - getFooterViewsCount();
      i = 0;
      n = 0;
      paramInt2 = 0;
      paramInt1 = 0;
      if (bool)
      {
        i = -m;
        paramInt2 = i;
        if (mClipToPadding) {
          paramInt2 = i + getListPaddingTop();
        }
        i = 0;
      }
    }
    else
    {
      for (;;)
      {
        if (i >= i7)
        {
          i2 = n;
          i1 = paramInt1;
        }
        do
        {
          mBlockLayoutRequests = true;
          if (i1 > 0)
          {
            detachViewsFromParent(i2, i1);
            mRecycleBin.removeSkippedScrap();
            onChildrenDetached(i2, i1);
          }
          if (!awakenScrollBars()) {
            invalidate();
          }
          offsetChildrenTopAndBottom(m);
          if (bool) {
            mFirstPosition += i1;
          }
          paramInt1 = Math.abs(m);
          if ((k - i4 < paramInt1) || (i5 - (i3 - j) < paramInt1)) {
            fillGap(bool);
          }
          mBlockLayoutRequests = false;
          invokeOnItemScrollListener();
          return false;
          bool = false;
          break;
          localView = getChildAt(i);
          i1 = paramInt1;
          i2 = n;
        } while (localView.getBottom() >= paramInt2);
        paramInt1 += 1;
        i1 = i6 + i;
        if ((i1 >= i8) && (i1 < i9)) {
          mRecycleBin.addScrapView(localView, i1);
        }
        i += 1;
      }
    }
    paramInt1 = i3 - m;
    int n = paramInt1;
    if (mClipToPadding) {
      n = paramInt1 - getListPaddingBottom();
    }
    paramInt1 = i7 - 1;
    for (;;)
    {
      i1 = paramInt2;
      i2 = i;
      if (paramInt1 < 0) {
        break;
      }
      localView = getChildAt(paramInt1);
      i1 = paramInt2;
      i2 = i;
      if (localView.getTop() <= n) {
        break;
      }
      i = paramInt1;
      paramInt2 += 1;
      i1 = i6 + paramInt1;
      if ((i1 >= i8) && (i1 < i9)) {
        mRecycleBin.addScrapView(localView, i1);
      }
      paramInt1 -= 1;
    }
  }
  
  private View obtainView(int paramInt, boolean[] paramArrayOfBoolean)
  {
    paramArrayOfBoolean[0] = false;
    View localView1 = mRecycleBin.getScrapView(paramInt);
    if (localView1 != null)
    {
      View localView2 = mAdapter.getView(paramInt, localView1, this);
      if (localView2 != localView1)
      {
        mRecycleBin.addScrapView(localView1, paramInt);
        return localView2;
      }
      paramArrayOfBoolean[0] = true;
      return localView2;
    }
    return mAdapter.getView(paramInt, null, this);
  }
  
  private void onSecondaryPointerUp(MotionEvent paramMotionEvent)
  {
    int i = (paramMotionEvent.getAction() & 0xFF00) >> 8;
    if (paramMotionEvent.getPointerId(i) == mActivePointerId) {
      if (i != 0) {
        break label64;
      }
    }
    label64:
    for (i = 1;; i = 0)
    {
      mMotionX = ((int)paramMotionEvent.getX(i));
      mMotionY = ((int)paramMotionEvent.getY(i));
      mActivePointerId = paramMotionEvent.getPointerId(i);
      recycleVelocityTracker();
      return;
    }
  }
  
  private boolean onTouchCancel(MotionEvent paramMotionEvent)
  {
    mTouchMode = 0;
    setPressed(false);
    invalidate();
    recycleVelocityTracker();
    mActivePointerId = -1;
    return true;
  }
  
  private boolean onTouchDown(MotionEvent paramMotionEvent)
  {
    int k = (int)paramMotionEvent.getX();
    int m = (int)paramMotionEvent.getY();
    int j = pointToPosition(k, m);
    mVelocityTracker.clear();
    mActivePointerId = MotionEventCompat.getPointerId(paramMotionEvent, 0);
    int i;
    if ((mTouchMode != 2) && (!mDataChanged) && (j >= 0) && (getAdapter().isEnabled(j)))
    {
      mTouchMode = 3;
      i = j;
      if (paramMotionEvent.getEdgeFlags() != 0)
      {
        i = j;
        if (j < 0) {
          return false;
        }
      }
    }
    else
    {
      i = j;
      if (mTouchMode == 2)
      {
        mTouchMode = 1;
        mMotionCorrection = 0;
        i = findMotionRow(m);
      }
    }
    mMotionX = k;
    mMotionY = m;
    mMotionPosition = i;
    mLastY = Integer.MIN_VALUE;
    return true;
  }
  
  private boolean onTouchMove(MotionEvent paramMotionEvent)
  {
    int i = MotionEventCompat.findPointerIndex(paramMotionEvent, mActivePointerId);
    if (i < 0)
    {
      Log.e("ExtendableListView", "onTouchMove could not find pointer with id " + mActivePointerId + " - did ExtendableListView receive an inconsistent " + "event stream?");
      return false;
    }
    i = (int)MotionEventCompat.getY(paramMotionEvent, i);
    if (mDataChanged) {
      layoutChildren();
    }
    switch (mTouchMode)
    {
    }
    for (;;)
    {
      return true;
      startScrollIfNeeded(i);
      continue;
      scrollIfNeeded(i);
    }
  }
  
  private boolean onTouchPointerUp(MotionEvent paramMotionEvent)
  {
    onSecondaryPointerUp(paramMotionEvent);
    int j = mMotionX;
    int i = mMotionY;
    j = pointToPosition(j, i);
    if (j >= 0) {
      mMotionPosition = j;
    }
    mLastY = i;
    return true;
  }
  
  private boolean onTouchUp(MotionEvent paramMotionEvent)
  {
    switch (mTouchMode)
    {
    case 2: 
    default: 
      setPressed(false);
      invalidate();
      recycleVelocityTracker();
      mActivePointerId = -1;
      return true;
    case 3: 
    case 4: 
    case 5: 
      return onTouchUpTap(paramMotionEvent);
    }
    return onTouchUpScrolling(paramMotionEvent);
  }
  
  private boolean onTouchUpScrolling(MotionEvent paramMotionEvent)
  {
    if (hasChildren())
    {
      int i = getFirstChildTop();
      int j = getLastChildBottom();
      if ((mFirstPosition == 0) && (i >= getListPaddingTop()) && (mFirstPosition + getChildCount() < mItemCount) && (j <= getHeight() - getListPaddingBottom())) {}
      for (i = 1; i == 0; i = 0)
      {
        mVelocityTracker.computeCurrentVelocity(1000, mMaximumVelocity);
        float f = mVelocityTracker.getYVelocity(mActivePointerId);
        if (Math.abs(f) <= mFlingVelocity) {
          break;
        }
        startFlingRunnable(f);
        mTouchMode = 2;
        mMotionY = 0;
        invalidate();
        return true;
      }
    }
    stopFlingRunnable();
    recycleVelocityTracker();
    mTouchMode = 0;
    return true;
  }
  
  private boolean onTouchUpTap(MotionEvent paramMotionEvent)
  {
    if (mPerformClick == null)
    {
      invalidate();
      mPerformClick = new PerformClick(null);
    }
    int i = mMotionPosition;
    if ((!mDataChanged) && (i >= 0) && (mAdapter.isEnabled(i)))
    {
      paramMotionEvent = mPerformClick;
      mClickMotionPosition = i;
      paramMotionEvent.rememberWindowAttachCount();
      paramMotionEvent.run();
    }
    return true;
  }
  
  private void postOnAnimate(Runnable paramRunnable)
  {
    ViewCompat.postOnAnimation(this, paramRunnable);
  }
  
  private void recycleVelocityTracker()
  {
    if (mVelocityTracker != null)
    {
      mVelocityTracker.recycle();
      mVelocityTracker = null;
    }
  }
  
  static View retrieveFromScrap(ArrayList<View> paramArrayList, int paramInt)
  {
    int j = paramArrayList.size();
    if (j > 0)
    {
      int i = 0;
      for (;;)
      {
        if (i >= j) {
          return (View)paramArrayList.remove(j - 1);
        }
        View localView = (View)paramArrayList.get(i);
        if (getLayoutParamsposition == paramInt)
        {
          paramArrayList.remove(i);
          return localView;
        }
        i += 1;
      }
    }
    return null;
  }
  
  private void scrollIfNeeded(int paramInt)
  {
    int j = paramInt - mMotionY;
    int k = j - mMotionCorrection;
    int i;
    if (mLastY != Integer.MIN_VALUE)
    {
      i = paramInt - mLastY;
      if ((mTouchMode == 1) && (paramInt != mLastY))
      {
        if (Math.abs(j) > mTouchSlop)
        {
          ViewParent localViewParent = getParent();
          if (localViewParent != null) {
            localViewParent.requestDisallowInterceptTouchEvent(true);
          }
        }
        if (mMotionPosition < 0) {
          break label132;
        }
      }
    }
    label132:
    for (j = mMotionPosition - mFirstPosition;; j = getChildCount() / 2)
    {
      if (i != 0) {
        moveTheChildren(k, i);
      }
      if (getChildAt(j) != null) {
        mMotionY = paramInt;
      }
      mLastY = paramInt;
      return;
      i = k;
      break;
    }
  }
  
  private void setupChild(View paramView, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    boolean bool1 = paramView.isSelected();
    int i = mTouchMode;
    label61:
    int j;
    LayoutParams localLayoutParams;
    label87:
    label131:
    label176:
    int k;
    if ((i > 3) && (i < 1) && (mMotionPosition == paramInt1))
    {
      paramBoolean2 = true;
      boolean bool2 = paramView.isPressed();
      if ((!paramBoolean3) || (bool1) || (paramView.isLayoutRequested())) {
        break label232;
      }
      i = 0;
      j = mAdapter.getItemViewType(paramInt1);
      if (j != -2) {
        break label238;
      }
      localLayoutParams = generateWrapperLayoutParams(paramView);
      viewType = j;
      position = paramInt1;
      if ((!paramBoolean3) && ((!recycledHeaderFooter) || (viewType != -2))) {
        break label254;
      }
      if (!paramBoolean1) {
        break label248;
      }
      j = -1;
      attachViewToParent(paramView, j, localLayoutParams);
      if (bool1) {
        paramView.setSelected(false);
      }
      if ((paramBoolean2 ^ bool2)) {
        paramView.setPressed(paramBoolean2);
      }
      if (i == 0) {
        break label298;
      }
      onMeasureChild(paramView, localLayoutParams);
      j = paramView.getMeasuredWidth();
      k = paramView.getMeasuredHeight();
      if (!paramBoolean1) {
        break label306;
      }
    }
    int m;
    for (;;)
    {
      m = getChildLeft(paramInt1);
      if (i == 0) {
        break label314;
      }
      onLayoutChild(paramView, paramInt1, paramBoolean1, m, paramInt2, m + j, paramInt2 + k);
      return;
      paramBoolean2 = false;
      break;
      label232:
      i = 1;
      break label61;
      label238:
      localLayoutParams = generateChildLayoutParams(paramView);
      break label87;
      label248:
      j = 0;
      break label131;
      label254:
      if (viewType == -2) {
        recycledHeaderFooter = true;
      }
      if (paramBoolean1) {}
      for (j = -1;; j = 0)
      {
        addViewInLayout(paramView, j, localLayoutParams, true);
        break;
      }
      label298:
      cleanupLayoutState(paramView);
      break label176;
      label306:
      paramInt2 -= k;
    }
    label314:
    onOffsetChild(paramView, paramInt1, paramBoolean1, m, paramInt2);
  }
  
  private void startFlingRunnable(float paramFloat)
  {
    if (mFlingRunnable == null) {
      mFlingRunnable = new FlingRunnable();
    }
    mFlingRunnable.start((int)-paramFloat);
  }
  
  private boolean startScrollIfNeeded(int paramInt)
  {
    int i = paramInt - mMotionY;
    if (Math.abs(i) > mTouchSlop)
    {
      mTouchMode = 1;
      if (i > 0) {}
      for (i = mTouchSlop;; i = -mTouchSlop)
      {
        mMotionCorrection = i;
        setPressed(false);
        Object localObject = getChildAt(mMotionPosition - mFirstPosition);
        if (localObject != null) {
          ((View)localObject).setPressed(false);
        }
        localObject = getParent();
        if (localObject != null) {
          ((ViewParent)localObject).requestDisallowInterceptTouchEvent(true);
        }
        scrollIfNeeded(paramInt);
        return true;
      }
    }
    return false;
  }
  
  private void stopFlingRunnable()
  {
    if (mFlingRunnable != null) {
      mFlingRunnable.endFling();
    }
  }
  
  private void updateEmptyStatus()
  {
    int i;
    View localView;
    if ((getAdapter() != null) && (!getAdapter().isEmpty()))
    {
      i = 0;
      if (isInFilterMode()) {
        i = 0;
      }
      localView = getEmptyView();
      if (i == 0) {
        break label96;
      }
      if (localView == null) {
        break label88;
      }
      localView.setVisibility(0);
      setVisibility(8);
    }
    for (;;)
    {
      if (mDataChanged) {
        onLayout(false, getLeft(), getTop(), getRight(), getBottom());
      }
      return;
      i = 1;
      break;
      label88:
      setVisibility(0);
    }
    label96:
    if (localView != null) {
      localView.setVisibility(8);
    }
    setVisibility(0);
  }
  
  protected void adjustViewsAfterFillGap(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      correctTooHigh(getChildCount());
      return;
    }
    correctTooLow(getChildCount());
  }
  
  protected void fillGap(boolean paramBoolean)
  {
    int i = getChildCount();
    if (paramBoolean)
    {
      i = mFirstPosition + i;
      fillDown(i, getChildTop(i));
    }
    for (;;)
    {
      adjustViewsAfterFillGap(paramBoolean);
      return;
      i = mFirstPosition - 1;
      fillUp(i, getChildBottom(i));
    }
  }
  
  protected LayoutParams generateChildLayoutParams(View paramView)
  {
    return generateWrapperLayoutParams(paramView);
  }
  
  protected LayoutParams generateDefaultLayoutParams()
  {
    return new LayoutParams(-1, -2, 0);
  }
  
  protected LayoutParams generateWrapperLayoutParams(View paramView)
  {
    Object localObject = null;
    ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
    paramView = (View)localObject;
    if (localLayoutParams != null) {
      if (!(localLayoutParams instanceof LayoutParams)) {
        break label38;
      }
    }
    label38:
    for (paramView = (LayoutParams)localLayoutParams;; paramView = new LayoutParams(localLayoutParams))
    {
      localObject = paramView;
      if (paramView == null) {
        localObject = generateDefaultLayoutParams();
      }
      return localObject;
    }
  }
  
  public ListAdapter getAdapter()
  {
    return mAdapter;
  }
  
  protected int getChildBottom(int paramInt)
  {
    int i = getChildCount();
    paramInt = 0;
    if (mClipToPadding) {
      paramInt = getListPaddingBottom();
    }
    if (i > 0) {
      return getChildAt(0).getTop();
    }
    return getHeight() - paramInt;
  }
  
  protected int getChildLeft(int paramInt)
  {
    return getListPaddingLeft();
  }
  
  protected int getChildTop(int paramInt)
  {
    int i = getChildCount();
    paramInt = 0;
    if (mClipToPadding) {
      paramInt = getListPaddingTop();
    }
    if (i > 0) {
      paramInt = getChildAt(i - 1).getBottom();
    }
    return paramInt;
  }
  
  public int getCount()
  {
    return mItemCount;
  }
  
  protected int getFirstChildTop()
  {
    int i = 0;
    if (hasChildren()) {
      i = getChildAt(0).getTop();
    }
    return i;
  }
  
  public int getFirstVisiblePosition()
  {
    return Math.max(0, mFirstPosition - getHeaderViewsCount());
  }
  
  public int getFooterViewsCount()
  {
    return mFooterViewInfos.size();
  }
  
  public int getHeaderViewsCount()
  {
    return mHeaderViewInfos.size();
  }
  
  protected int getHighestChildTop()
  {
    int i = 0;
    if (hasChildren()) {
      i = getChildAt(0).getTop();
    }
    return i;
  }
  
  protected int getLastChildBottom()
  {
    if (hasChildren()) {
      return getChildAt(getChildCount() - 1).getBottom();
    }
    return 0;
  }
  
  public int getLastVisiblePosition()
  {
    return Math.min(mFirstPosition + getChildCount() - 1, mAdapter.getCount() - 1);
  }
  
  protected int getLowestChildBottom()
  {
    if (hasChildren()) {
      return getChildAt(getChildCount() - 1).getBottom();
    }
    return 0;
  }
  
  protected int getNextChildDownsTop(int paramInt)
  {
    paramInt = getChildCount();
    if (paramInt > 0) {
      return getChildAt(paramInt - 1).getBottom();
    }
    return 0;
  }
  
  protected int getNextChildUpsBottom(int paramInt)
  {
    paramInt = getChildCount();
    if (paramInt == 0) {}
    while (paramInt <= 0) {
      return 0;
    }
    return getChildAt(0).getTop();
  }
  
  public View getSelectedView()
  {
    return null;
  }
  
  protected void handleDataChanged()
  {
    super.handleDataChanged();
    int i = mItemCount;
    if ((i > 0) && (mNeedSync))
    {
      mNeedSync = false;
      mSyncState = null;
      mLayoutMode = 2;
      mSyncPosition = Math.min(Math.max(0, mSyncPosition), i - 1);
      return;
    }
    mLayoutMode = 1;
    mNeedSync = false;
    mSyncState = null;
  }
  
  protected boolean hasChildren()
  {
    return getChildCount() > 0;
  }
  
  protected boolean hasSpaceDown()
  {
    return false;
  }
  
  protected boolean hasSpaceUp()
  {
    return false;
  }
  
  void invokeOnItemScrollListener()
  {
    if (mOnScrollListener != null) {
      mOnScrollListener.onScroll(this, mFirstPosition, getChildCount(), mItemCount);
    }
  }
  
  protected void layoutChildren()
  {
    if (mBlockLayoutRequests) {
      return;
    }
    mBlockLayoutRequests = true;
    int j;
    int k;
    boolean bool;
    try
    {
      super.layoutChildren();
      invalidate();
      if (mAdapter == null)
      {
        clearState();
        return;
      }
      j = getListPaddingTop();
      k = getChildCount();
      View localView = null;
      if (mLayoutMode == 0) {
        localView = getChildAt(0);
      }
      bool = mDataChanged;
      if (bool) {
        handleDataChanged();
      }
      if (mItemCount == 0)
      {
        clearState();
        return;
      }
      if (mItemCount != mAdapter.getCount()) {
        throw new IllegalStateException("The content of the adapter has changed but ExtendableListView did not receive a notification. Make sure the content of your adapter is not modified from a background thread, but only from the UI thread. [in ExtendableListView(" + getId() + ", " + getClass() + ") with Adapter(" + mAdapter.getClass() + ")]");
      }
    }
    finally
    {
      mBlockLayoutRequests = false;
    }
    int m = mFirstPosition;
    RecycleBin localRecycleBin = mRecycleBin;
    int i;
    if (bool)
    {
      i = 0;
      break label406;
      detachAllViewsFromParent();
      localRecycleBin.removeSkippedScrap();
      switch (mLayoutMode)
      {
      }
    }
    for (;;)
    {
      if (k == 0)
      {
        fillFromTop(j);
        label254:
        localRecycleBin.scrapActiveViews();
        mDataChanged = false;
        mNeedSync = false;
        mLayoutMode = 0;
        mBlockLayoutRequests = false;
        return;
      }
      label406:
      do
      {
        localRecycleBin.addScrapView(getChildAt(i), m + i);
        i += 1;
        continue;
        localRecycleBin.fillActiveViews(k, m);
        break;
        mFirstPosition = 0;
        resetToTop();
        adjustViewsUpOrDown();
        fillFromTop(j);
        adjustViewsUpOrDown();
        break label254;
        fillSpecific(mSyncPosition, mSpecificTop);
        break label254;
        if (mFirstPosition < mItemCount)
        {
          k = mFirstPosition;
          if (localObject == null) {}
          for (i = j;; i = localObject.getTop())
          {
            fillSpecific(k, i);
            break;
          }
        }
        fillSpecific(0, j);
        break label254;
      } while (i < k);
      break;
    }
  }
  
  public void notifyTouchMode()
  {
    switch (mTouchMode)
    {
    default: 
      return;
    case 1: 
      reportScrollStateChange(1);
      return;
    case 2: 
      reportScrollStateChange(2);
      return;
    }
    reportScrollStateChange(0);
  }
  
  protected void offsetChildrenTopAndBottom(int paramInt)
  {
    int j = getChildCount();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        return;
      }
      getChildAt(i).offsetTopAndBottom(paramInt);
      i += 1;
    }
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    if (mAdapter != null)
    {
      mDataChanged = true;
      mOldItemCount = mItemCount;
      mItemCount = mAdapter.getCount();
    }
    mIsAttached = true;
  }
  
  protected void onChildCreated(int paramInt, boolean paramBoolean) {}
  
  protected void onChildrenDetached(int paramInt1, int paramInt2) {}
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    mRecycleBin.clear();
    if (mFlingRunnable != null) {
      removeCallbacks(mFlingRunnable);
    }
    mIsAttached = false;
  }
  
  protected void onFocusChanged(boolean paramBoolean, int paramInt, Rect paramRect) {}
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    int i = paramMotionEvent.getAction();
    if (!mIsAttached) {}
    do
    {
      do
      {
        return false;
        switch (i & 0xFF)
        {
        case 4: 
        case 5: 
        default: 
          return false;
        case 0: 
          i = mTouchMode;
          j = (int)paramMotionEvent.getX();
          int k = (int)paramMotionEvent.getY();
          mActivePointerId = paramMotionEvent.getPointerId(0);
          int m = findMotionRow(k);
          if ((i != 2) && (m >= 0))
          {
            mMotionX = j;
            mMotionY = k;
            mMotionPosition = m;
            mTouchMode = 3;
          }
          mLastY = Integer.MIN_VALUE;
          initOrResetVelocityTracker();
          mVelocityTracker.addMovement(paramMotionEvent);
        }
      } while (i != 2);
      return true;
      switch (mTouchMode)
      {
      default: 
        return false;
      }
      int j = paramMotionEvent.findPointerIndex(mActivePointerId);
      i = j;
      if (j == -1)
      {
        i = 0;
        mActivePointerId = paramMotionEvent.getPointerId(0);
      }
      i = (int)paramMotionEvent.getY(i);
      initVelocityTrackerIfNotExists();
      mVelocityTracker.addMovement(paramMotionEvent);
    } while (!startScrollIfNeeded(i));
    return true;
    mTouchMode = 0;
    mActivePointerId = -1;
    recycleVelocityTracker();
    reportScrollStateChange(0);
    return false;
    onSecondaryPointerUp(paramMotionEvent);
    return false;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (mAdapter == null) {
      return;
    }
    if (paramBoolean)
    {
      paramInt2 = getChildCount();
      paramInt1 = 0;
    }
    for (;;)
    {
      if (paramInt1 >= paramInt2)
      {
        mRecycleBin.markChildrenDirty();
        mInLayout = true;
        layoutChildren();
        mInLayout = false;
        return;
      }
      getChildAt(paramInt1).forceLayout();
      paramInt1 += 1;
    }
  }
  
  protected void onLayoutChild(View paramView, int paramInt1, boolean paramBoolean, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    paramView.layout(paramInt2, paramInt3, paramInt4, paramInt5);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    setMeasuredDimension(View.MeasureSpec.getSize(paramInt1), View.MeasureSpec.getSize(paramInt2));
    mWidthMeasureSpec = paramInt1;
  }
  
  protected void onMeasureChild(View paramView, LayoutParams paramLayoutParams)
  {
    int j = ViewGroup.getChildMeasureSpec(mWidthMeasureSpec, getListPaddingLeft() + getListPaddingRight(), width);
    int i = height;
    if (i > 0) {}
    for (i = View.MeasureSpec.makeMeasureSpec(i, 1073741824);; i = View.MeasureSpec.makeMeasureSpec(0, 0))
    {
      paramView.measure(j, i);
      return;
    }
  }
  
  protected void onOffsetChild(View paramView, int paramInt1, boolean paramBoolean, int paramInt2, int paramInt3)
  {
    paramView.offsetLeftAndRight(paramInt2 - paramView.getLeft());
    paramView.offsetTopAndBottom(paramInt3 - paramView.getTop());
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (ListSavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    mDataChanged = true;
    mSyncHeight = height;
    if (firstId >= 0L)
    {
      mNeedSync = true;
      mSyncState = paramParcelable;
      mSyncRowId = firstId;
      mSyncPosition = position;
      mSpecificTop = viewTop;
    }
    requestLayout();
  }
  
  public Parcelable onSaveInstanceState()
  {
    ListSavedState localListSavedState = new ListSavedState(super.onSaveInstanceState());
    if (mSyncState != null)
    {
      selectedId = mSyncState.selectedId;
      firstId = mSyncState.firstId;
      viewTop = mSyncState.viewTop;
      position = mSyncState.position;
      height = mSyncState.height;
      return localListSavedState;
    }
    if ((getChildCount() > 0) && (mItemCount > 0)) {}
    for (int i = 1;; i = 0)
    {
      selectedId = getSelectedItemId();
      height = getHeight();
      if ((i == 0) || (mFirstPosition <= 0)) {
        break;
      }
      viewTop = getChildAt(0).getTop();
      int j = mFirstPosition;
      i = j;
      if (j >= mItemCount) {
        i = mItemCount - 1;
      }
      position = i;
      firstId = mAdapter.getItemId(i);
      return localListSavedState;
    }
    viewTop = 0;
    firstId = -1L;
    position = 0;
    return localListSavedState;
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2)
  {
    if (getChildCount() > 0)
    {
      stopFlingRunnable();
      mRecycleBin.clear();
      mDataChanged = true;
      rememberSyncState();
    }
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    onSizeChanged(paramInt1, paramInt2);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (!isEnabled()) {
      if ((isClickable()) || (isLongClickable())) {}
    }
    do
    {
      return false;
      return true;
      initVelocityTrackerIfNotExists();
      mVelocityTracker.addMovement(paramMotionEvent);
    } while (!hasChildren());
    boolean bool;
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    case 1: 
    case 4: 
    case 5: 
    default: 
      bool = onTouchUp(paramMotionEvent);
    }
    for (;;)
    {
      notifyTouchMode();
      return bool;
      bool = onTouchDown(paramMotionEvent);
      continue;
      bool = onTouchMove(paramMotionEvent);
      continue;
      bool = onTouchCancel(paramMotionEvent);
      continue;
      bool = onTouchPointerUp(paramMotionEvent);
    }
  }
  
  public void onWindowFocusChanged(boolean paramBoolean) {}
  
  void rememberSyncState()
  {
    View localView;
    ListAdapter localListAdapter;
    if (getChildCount() > 0)
    {
      mNeedSync = true;
      mSyncHeight = getHeight();
      localView = getChildAt(0);
      localListAdapter = getAdapter();
      if ((mFirstPosition < 0) || (mFirstPosition >= localListAdapter.getCount())) {
        break label87;
      }
    }
    label87:
    for (mSyncRowId = localListAdapter.getItemId(mFirstPosition);; mSyncRowId = -1L)
    {
      if (localView != null) {
        mSpecificTop = localView.getTop();
      }
      mSyncPosition = mFirstPosition;
      return;
    }
  }
  
  void reportScrollStateChange(int paramInt)
  {
    if (paramInt != mScrollState)
    {
      mScrollState = paramInt;
      if (mOnScrollListener != null) {
        mOnScrollListener.onScrollStateChanged(this, paramInt);
      }
    }
  }
  
  public void requestDisallowInterceptTouchEvent(boolean paramBoolean)
  {
    if (paramBoolean) {
      recycleVelocityTracker();
    }
    super.requestDisallowInterceptTouchEvent(paramBoolean);
  }
  
  public void requestLayout()
  {
    if ((!mBlockLayoutRequests) && (!mInLayout)) {
      super.requestLayout();
    }
  }
  
  public void resetToTop() {}
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (mAdapter != null) {
      mAdapter.unregisterDataSetObserver(mObserver);
    }
    if ((mHeaderViewInfos.size() > 0) || (mFooterViewInfos.size() > 0))
    {
      mAdapter = new HeaderViewListAdapter(mHeaderViewInfos, mFooterViewInfos, paramListAdapter);
      mDataChanged = true;
      if (paramListAdapter == null) {
        break label121;
      }
    }
    label121:
    for (int i = paramListAdapter.getCount();; i = 0)
    {
      mItemCount = i;
      if (paramListAdapter != null)
      {
        paramListAdapter.registerDataSetObserver(mObserver);
        mRecycleBin.setViewTypeCount(paramListAdapter.getViewTypeCount());
      }
      requestLayout();
      return;
      mAdapter = paramListAdapter;
      break;
    }
  }
  
  public void setClipToPadding(boolean paramBoolean)
  {
    super.setClipToPadding(paramBoolean);
    mClipToPadding = paramBoolean;
  }
  
  public void setOnScrollListener(AbsListView.OnScrollListener paramOnScrollListener)
  {
    super.setOnScrollListener(paramOnScrollListener);
    mOnScrollListener = paramOnScrollListener;
  }
  
  public void setSelection(int paramInt)
  {
    if (paramInt >= 0)
    {
      mLayoutMode = 2;
      mSpecificTop = getListPaddingTop();
      mFirstPosition = 0;
      if (mNeedSync)
      {
        mSyncPosition = paramInt;
        mSyncRowId = mAdapter.getItemId(paramInt);
      }
      requestLayout();
    }
  }
  
  class AdapterDataSetObserver
    extends DataSetObserver
  {
    private Parcelable mInstanceState = null;
    
    AdapterDataSetObserver() {}
    
    public void onChanged()
    {
      mDataChanged = true;
      mOldItemCount = mItemCount;
      mItemCount = getAdapter().getCount();
      mRecycleBin.clearTransientStateViews();
      if ((getAdapter().hasStableIds()) && (mInstanceState != null) && (mOldItemCount == 0) && (mItemCount > 0))
      {
        onRestoreInstanceState(mInstanceState);
        mInstanceState = null;
      }
      for (;;)
      {
        ExtendableListView.this.updateEmptyStatus();
        requestLayout();
        return;
        rememberSyncState();
      }
    }
    
    public void onInvalidated()
    {
      mDataChanged = true;
      if (getAdapter().hasStableIds()) {
        mInstanceState = onSaveInstanceState();
      }
      mOldItemCount = mItemCount;
      mItemCount = 0;
      mNeedSync = false;
      ExtendableListView.this.updateEmptyStatus();
      requestLayout();
    }
  }
  
  public class FixedViewInfo
  {
    public Object data;
    public boolean isSelectable;
    public View view;
  }
  
  private class FlingRunnable
    implements Runnable
  {
    private int mLastFlingY;
    private final Scroller mScroller = new Scroller(getContext());
    
    FlingRunnable() {}
    
    private void endFling()
    {
      mLastFlingY = 0;
      mTouchMode = 0;
      reportScrollStateChange(0);
      removeCallbacks(this);
      mScroller.forceFinished(true);
    }
    
    public void run()
    {
      switch (mTouchMode)
      {
      default: 
        return;
      }
      if ((mItemCount == 0) || (getChildCount() == 0))
      {
        endFling();
        return;
      }
      Scroller localScroller = mScroller;
      boolean bool1 = localScroller.computeScrollOffset();
      int j = localScroller.getCurrY();
      int i = mLastFlingY - j;
      if (i > 0) {
        mMotionPosition = mFirstPosition;
      }
      for (i = Math.min(getHeight() - getPaddingBottom() - getPaddingTop() - 1, i);; i = Math.max(-(getHeight() - getPaddingBottom() - getPaddingTop() - 1), i))
      {
        boolean bool2 = ExtendableListView.this.moveTheChildren(i, i);
        if ((!bool1) || (bool2)) {
          break;
        }
        invalidate();
        mLastFlingY = j;
        ExtendableListView.this.postOnAnimate(this);
        return;
        int k = getChildCount();
        mMotionPosition = (mFirstPosition + (k - 1));
      }
      endFling();
    }
    
    void start(int paramInt)
    {
      if (paramInt < 0) {}
      for (int i = Integer.MAX_VALUE;; i = 0)
      {
        mLastFlingY = i;
        mScroller.forceFinished(true);
        mScroller.fling(0, i, 0, paramInt, 0, Integer.MAX_VALUE, 0, Integer.MAX_VALUE);
        mTouchMode = 2;
        ExtendableListView.this.postOnAnimate(this);
        return;
      }
    }
  }
  
  public static class LayoutParams
    extends AbsListView.LayoutParams
  {
    long itemId = -1L;
    int position;
    boolean recycledHeaderFooter;
    int viewType;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
    }
    
    public LayoutParams(int paramInt1, int paramInt2, int paramInt3)
    {
      super(paramInt2);
      viewType = paramInt3;
    }
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
  }
  
  public static class ListSavedState
    extends ClassLoaderSavedState
  {
    public static final Parcelable.Creator<ListSavedState> CREATOR = new Parcelable.Creator()
    {
      public ExtendableListView.ListSavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new ExtendableListView.ListSavedState(paramAnonymousParcel);
      }
      
      public ExtendableListView.ListSavedState[] newArray(int paramAnonymousInt)
      {
        return new ExtendableListView.ListSavedState[paramAnonymousInt];
      }
    };
    protected long firstId;
    protected int height;
    protected int position;
    protected long selectedId;
    protected int viewTop;
    
    public ListSavedState(Parcel paramParcel)
    {
      super();
      selectedId = paramParcel.readLong();
      firstId = paramParcel.readLong();
      viewTop = paramParcel.readInt();
      position = paramParcel.readInt();
      height = paramParcel.readInt();
    }
    
    public ListSavedState(Parcelable paramParcelable)
    {
      super(AbsListView.class.getClassLoader());
    }
    
    public String toString()
    {
      return "ExtendableListView.ListSavedState{" + Integer.toHexString(System.identityHashCode(this)) + " selectedId=" + selectedId + " firstId=" + firstId + " viewTop=" + viewTop + " position=" + position + " height=" + height + "}";
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeLong(selectedId);
      paramParcel.writeLong(firstId);
      paramParcel.writeInt(viewTop);
      paramParcel.writeInt(position);
      paramParcel.writeInt(height);
    }
  }
  
  private class PerformClick
    extends ExtendableListView.WindowRunnnable
    implements Runnable
  {
    int mClickMotionPosition;
    
    private PerformClick()
    {
      super(null);
    }
    
    public void run()
    {
      if (mDataChanged) {}
      ListAdapter localListAdapter;
      int i;
      View localView;
      do
      {
        do
        {
          return;
          localListAdapter = mAdapter;
          i = mClickMotionPosition;
        } while ((localListAdapter == null) || (mItemCount <= 0) || (i == -1) || (i >= localListAdapter.getCount()) || (!sameWindow()));
        localView = getChildAt(i);
      } while (localView == null);
      performItemClick(localView, mFirstPosition + i, localListAdapter.getItemId(i));
    }
  }
  
  class RecycleBin
  {
    private View[] mActiveViews = new View[0];
    private ArrayList<View> mCurrentScrap;
    private int mFirstActivePosition;
    private ArrayList<View>[] mScrapViews;
    private ArrayList<View> mSkippedScrap;
    private SparseArrayCompat<View> mTransientStateViews;
    private int mViewTypeCount;
    
    RecycleBin() {}
    
    private void pruneScrapViews()
    {
      int m = mActiveViews.length;
      int n = mViewTypeCount;
      ArrayList[] arrayOfArrayList = mScrapViews;
      int i = 0;
      if (i >= n) {
        if (mTransientStateViews == null) {}
      }
      int j;
      for (i = 0;; i = j + 1)
      {
        if (i >= mTransientStateViews.size())
        {
          return;
          ArrayList localArrayList = arrayOfArrayList[i];
          int i1 = localArrayList.size();
          int k = 0;
          j = i1 - 1;
          for (;;)
          {
            if (k >= i1 - m)
            {
              i += 1;
              break;
            }
            removeDetachedView((View)localArrayList.remove(j), false);
            k += 1;
            j -= 1;
          }
        }
        j = i;
        if (!ViewCompat.hasTransientState((View)mTransientStateViews.valueAt(i)))
        {
          mTransientStateViews.removeAt(i);
          j = i - 1;
        }
      }
    }
    
    void addScrapView(View paramView, int paramInt)
    {
      ExtendableListView.LayoutParams localLayoutParams = (ExtendableListView.LayoutParams)paramView.getLayoutParams();
      if (localLayoutParams == null) {}
      int i;
      boolean bool;
      do
      {
        return;
        position = paramInt;
        i = viewType;
        bool = ViewCompat.hasTransientState(paramView);
        if ((shouldRecycleViewType(i)) && (!bool)) {
          break;
        }
        if ((i != -2) || (bool))
        {
          if (mSkippedScrap == null) {
            mSkippedScrap = new ArrayList();
          }
          mSkippedScrap.add(paramView);
        }
      } while (!bool);
      if (mTransientStateViews == null) {
        mTransientStateViews = new SparseArrayCompat();
      }
      mTransientStateViews.put(paramInt, paramView);
      return;
      if (mViewTypeCount == 1)
      {
        mCurrentScrap.add(paramView);
        return;
      }
      mScrapViews[i].add(paramView);
    }
    
    void clear()
    {
      ArrayList localArrayList;
      int j;
      if (mViewTypeCount == 1)
      {
        localArrayList = mCurrentScrap;
        j = localArrayList.size();
        i = 0;
        for (;;)
        {
          if (i >= j)
          {
            if (mTransientStateViews != null) {
              mTransientStateViews.clear();
            }
            return;
          }
          removeDetachedView((View)localArrayList.remove(j - 1 - i), false);
          i += 1;
        }
      }
      int k = mViewTypeCount;
      int i = 0;
      label77:
      int m;
      if (i < k)
      {
        localArrayList = mScrapViews[i];
        m = localArrayList.size();
        j = 0;
      }
      for (;;)
      {
        if (j >= m)
        {
          i += 1;
          break label77;
          break;
        }
        removeDetachedView((View)localArrayList.remove(m - 1 - j), false);
        j += 1;
      }
    }
    
    void clearTransientStateViews()
    {
      if (mTransientStateViews != null) {
        mTransientStateViews.clear();
      }
    }
    
    void fillActiveViews(int paramInt1, int paramInt2)
    {
      if (mActiveViews.length < paramInt1) {
        mActiveViews = new View[paramInt1];
      }
      mFirstActivePosition = paramInt2;
      View[] arrayOfView = mActiveViews;
      paramInt2 = 0;
      for (;;)
      {
        if (paramInt2 >= paramInt1) {
          return;
        }
        View localView = getChildAt(paramInt2);
        ExtendableListView.LayoutParams localLayoutParams = (ExtendableListView.LayoutParams)localView.getLayoutParams();
        if ((localLayoutParams != null) && (viewType != -2)) {
          arrayOfView[paramInt2] = localView;
        }
        paramInt2 += 1;
      }
    }
    
    View getActiveView(int paramInt)
    {
      paramInt -= mFirstActivePosition;
      View[] arrayOfView = mActiveViews;
      if ((paramInt >= 0) && (paramInt < arrayOfView.length))
      {
        View localView = arrayOfView[paramInt];
        arrayOfView[paramInt] = null;
        return localView;
      }
      return null;
    }
    
    View getScrapView(int paramInt)
    {
      if (mViewTypeCount == 1) {
        return ExtendableListView.retrieveFromScrap(mCurrentScrap, paramInt);
      }
      int i = mAdapter.getItemViewType(paramInt);
      if ((i >= 0) && (i < mScrapViews.length)) {
        return ExtendableListView.retrieveFromScrap(mScrapViews[i], paramInt);
      }
      return null;
    }
    
    public void markChildrenDirty()
    {
      ArrayList localArrayList;
      int j;
      int i;
      if (mViewTypeCount == 1)
      {
        localArrayList = mCurrentScrap;
        j = localArrayList.size();
        i = 0;
        if (i >= j) {
          if (mTransientStateViews != null)
          {
            j = mTransientStateViews.size();
            i = 0;
          }
        }
      }
      for (;;)
      {
        if (i >= j)
        {
          return;
          ((View)localArrayList.get(i)).forceLayout();
          i += 1;
          break;
          int k = mViewTypeCount;
          i = 0;
          label76:
          int m;
          if (i < k)
          {
            localArrayList = mScrapViews[i];
            m = localArrayList.size();
            j = 0;
          }
          for (;;)
          {
            if (j >= m)
            {
              i += 1;
              break label76;
              break;
            }
            ((View)localArrayList.get(j)).forceLayout();
            j += 1;
          }
        }
        ((View)mTransientStateViews.valueAt(i)).forceLayout();
        i += 1;
      }
    }
    
    void removeSkippedScrap()
    {
      if (mSkippedScrap == null) {
        return;
      }
      int j = mSkippedScrap.size();
      int i = 0;
      for (;;)
      {
        if (i >= j)
        {
          mSkippedScrap.clear();
          return;
        }
        removeDetachedView((View)mSkippedScrap.get(i), false);
        i += 1;
      }
    }
    
    void scrapActiveViews()
    {
      int i = 1;
      View[] arrayOfView = mActiveViews;
      if (mViewTypeCount > 1) {}
      Object localObject1;
      int j;
      for (;;)
      {
        localObject1 = mCurrentScrap;
        j = arrayOfView.length - 1;
        if (j >= 0) {
          break;
        }
        pruneScrapViews();
        return;
        i = 0;
      }
      View localView = arrayOfView[j];
      Object localObject2 = localObject1;
      int k;
      if (localView != null)
      {
        localObject2 = (ExtendableListView.LayoutParams)localView.getLayoutParams();
        arrayOfView[j] = null;
        boolean bool = ViewCompat.hasTransientState(localView);
        k = viewType;
        if ((shouldRecycleViewType(k)) && (!bool)) {
          break label176;
        }
        if ((k != -2) || (bool)) {
          removeDetachedView(localView, false);
        }
        localObject2 = localObject1;
        if (bool)
        {
          if (mTransientStateViews == null) {
            mTransientStateViews = new SparseArrayCompat();
          }
          mTransientStateViews.put(mFirstActivePosition + j, localView);
        }
      }
      for (localObject2 = localObject1;; localObject2 = localObject1)
      {
        j -= 1;
        localObject1 = localObject2;
        break;
        label176:
        if (i != 0) {
          localObject1 = mScrapViews[k];
        }
        position = (mFirstActivePosition + j);
        ((ArrayList)localObject1).add(localView);
      }
    }
    
    public void setViewTypeCount(int paramInt)
    {
      if (paramInt < 1) {
        throw new IllegalArgumentException("Can't have a viewTypeCount < 1");
      }
      ArrayList[] arrayOfArrayList = new ArrayList[paramInt];
      int i = 0;
      for (;;)
      {
        if (i >= paramInt)
        {
          mViewTypeCount = paramInt;
          mCurrentScrap = arrayOfArrayList[0];
          mScrapViews = arrayOfArrayList;
          return;
        }
        arrayOfArrayList[i] = new ArrayList();
        i += 1;
      }
    }
    
    public boolean shouldRecycleViewType(int paramInt)
    {
      return paramInt >= 0;
    }
  }
  
  private class WindowRunnnable
  {
    private int mOriginalAttachCount;
    
    private WindowRunnnable() {}
    
    public void rememberWindowAttachCount()
    {
      mOriginalAttachCount = getWindowAttachCount();
    }
    
    public boolean sameWindow()
    {
      return (hasWindowFocus()) && (getWindowAttachCount() == mOriginalAttachCount);
    }
  }
}
