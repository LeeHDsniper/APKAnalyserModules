package android.support.v7.widget;

import android.content.Context;
import android.graphics.PointF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.support.v4.view.accessibility.AccessibilityRecordCompat;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import java.util.List;

public class LinearLayoutManager
  extends RecyclerView.LayoutManager
{
  final AnchorInfo mAnchorInfo = new AnchorInfo();
  private boolean mLastStackFromEnd;
  private LayoutState mLayoutState;
  int mOrientation;
  OrientationHelper mOrientationHelper;
  SavedState mPendingSavedState = null;
  int mPendingScrollPosition = -1;
  int mPendingScrollPositionOffset = Integer.MIN_VALUE;
  private boolean mRecycleChildrenOnDetach;
  private boolean mReverseLayout = false;
  boolean mShouldReverseLayout = false;
  private boolean mSmoothScrollbarEnabled = true;
  private boolean mStackFromEnd = false;
  
  public LinearLayoutManager(Context paramContext)
  {
    this(paramContext, 1, false);
  }
  
  public LinearLayoutManager(Context paramContext, int paramInt, boolean paramBoolean)
  {
    setOrientation(paramInt);
    setReverseLayout(paramBoolean);
  }
  
  private int computeScrollExtent(RecyclerView.State paramState)
  {
    boolean bool2 = false;
    if (getChildCount() == 0) {
      return 0;
    }
    ensureLayoutState();
    OrientationHelper localOrientationHelper = mOrientationHelper;
    if (!mSmoothScrollbarEnabled) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      View localView = findFirstVisibleChildClosestToStart(bool1, true);
      bool1 = bool2;
      if (!mSmoothScrollbarEnabled) {
        bool1 = true;
      }
      return ScrollbarHelper.computeScrollExtent(paramState, localOrientationHelper, localView, findFirstVisibleChildClosestToEnd(bool1, true), this, mSmoothScrollbarEnabled);
    }
  }
  
  private int computeScrollOffset(RecyclerView.State paramState)
  {
    boolean bool2 = false;
    if (getChildCount() == 0) {
      return 0;
    }
    ensureLayoutState();
    OrientationHelper localOrientationHelper = mOrientationHelper;
    if (!mSmoothScrollbarEnabled) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      View localView = findFirstVisibleChildClosestToStart(bool1, true);
      bool1 = bool2;
      if (!mSmoothScrollbarEnabled) {
        bool1 = true;
      }
      return ScrollbarHelper.computeScrollOffset(paramState, localOrientationHelper, localView, findFirstVisibleChildClosestToEnd(bool1, true), this, mSmoothScrollbarEnabled, mShouldReverseLayout);
    }
  }
  
  private int computeScrollRange(RecyclerView.State paramState)
  {
    boolean bool2 = false;
    if (getChildCount() == 0) {
      return 0;
    }
    ensureLayoutState();
    OrientationHelper localOrientationHelper = mOrientationHelper;
    if (!mSmoothScrollbarEnabled) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      View localView = findFirstVisibleChildClosestToStart(bool1, true);
      bool1 = bool2;
      if (!mSmoothScrollbarEnabled) {
        bool1 = true;
      }
      return ScrollbarHelper.computeScrollRange(paramState, localOrientationHelper, localView, findFirstVisibleChildClosestToEnd(bool1, true), this, mSmoothScrollbarEnabled);
    }
  }
  
  private int convertFocusDirectionToLayoutDirection(int paramInt)
  {
    int j = -1;
    int k = 1;
    int m = Integer.MIN_VALUE;
    int i = j;
    switch (paramInt)
    {
    default: 
      i = Integer.MIN_VALUE;
    case 1: 
    case 2: 
    case 33: 
    case 130: 
    case 17: 
      do
      {
        do
        {
          return i;
          return 1;
          i = j;
        } while (mOrientation == 1);
        return Integer.MIN_VALUE;
        paramInt = m;
        if (mOrientation == 1) {
          paramInt = 1;
        }
        return paramInt;
        i = j;
      } while (mOrientation == 0);
      return Integer.MIN_VALUE;
    }
    if (mOrientation == 0) {}
    for (paramInt = k;; paramInt = Integer.MIN_VALUE) {
      return paramInt;
    }
  }
  
  private View findFirstReferenceChild(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    return findReferenceChild(paramRecycler, paramState, 0, getChildCount(), paramState.getItemCount());
  }
  
  private View findFirstVisibleChildClosestToEnd(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (mShouldReverseLayout) {
      return findOneVisibleChild(0, getChildCount(), paramBoolean1, paramBoolean2);
    }
    return findOneVisibleChild(getChildCount() - 1, -1, paramBoolean1, paramBoolean2);
  }
  
  private View findFirstVisibleChildClosestToStart(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (mShouldReverseLayout) {
      return findOneVisibleChild(getChildCount() - 1, -1, paramBoolean1, paramBoolean2);
    }
    return findOneVisibleChild(0, getChildCount(), paramBoolean1, paramBoolean2);
  }
  
  private View findLastReferenceChild(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    return findReferenceChild(paramRecycler, paramState, getChildCount() - 1, -1, paramState.getItemCount());
  }
  
  private View findReferenceChildClosestToEnd(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    if (mShouldReverseLayout) {
      return findFirstReferenceChild(paramRecycler, paramState);
    }
    return findLastReferenceChild(paramRecycler, paramState);
  }
  
  private View findReferenceChildClosestToStart(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    if (mShouldReverseLayout) {
      return findLastReferenceChild(paramRecycler, paramState);
    }
    return findFirstReferenceChild(paramRecycler, paramState);
  }
  
  private int fixLayoutEndGap(int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, boolean paramBoolean)
  {
    int i = mOrientationHelper.getEndAfterPadding() - paramInt;
    if (i > 0)
    {
      i = -scrollBy(-i, paramRecycler, paramState);
      if (paramBoolean)
      {
        paramInt = mOrientationHelper.getEndAfterPadding() - (paramInt + i);
        if (paramInt > 0)
        {
          mOrientationHelper.offsetChildren(paramInt);
          return paramInt + i;
        }
      }
    }
    else
    {
      return 0;
    }
    return i;
  }
  
  private int fixLayoutStartGap(int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, boolean paramBoolean)
  {
    int i = paramInt - mOrientationHelper.getStartAfterPadding();
    if (i > 0)
    {
      i = -scrollBy(i, paramRecycler, paramState);
      if (paramBoolean)
      {
        paramInt = paramInt + i - mOrientationHelper.getStartAfterPadding();
        if (paramInt > 0)
        {
          mOrientationHelper.offsetChildren(-paramInt);
          return i - paramInt;
        }
      }
    }
    else
    {
      return 0;
    }
    return i;
  }
  
  private View getChildClosestToEnd()
  {
    if (mShouldReverseLayout) {}
    for (int i = 0;; i = getChildCount() - 1) {
      return getChildAt(i);
    }
  }
  
  private View getChildClosestToStart()
  {
    if (mShouldReverseLayout) {}
    for (int i = getChildCount() - 1;; i = 0) {
      return getChildAt(i);
    }
  }
  
  private void layoutForPredictiveAnimations(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, int paramInt1, int paramInt2)
  {
    if ((!paramState.willRunPredictiveAnimations()) || (getChildCount() == 0) || (paramState.isPreLayout()) || (!supportsPredictiveItemAnimations())) {
      return;
    }
    int j = 0;
    int k = 0;
    List localList = paramRecycler.getScrapList();
    int n = localList.size();
    int i1 = getPosition(getChildAt(0));
    int i = 0;
    if (i < n)
    {
      RecyclerView.ViewHolder localViewHolder = (RecyclerView.ViewHolder)localList.get(i);
      if (localViewHolder.isRemoved()) {}
      for (;;)
      {
        i += 1;
        break;
        int i2;
        if (localViewHolder.getLayoutPosition() < i1)
        {
          i2 = 1;
          label115:
          if (i2 == mShouldReverseLayout) {
            break label159;
          }
        }
        label159:
        for (int m = -1;; m = 1)
        {
          if (m != -1) {
            break label165;
          }
          j += mOrientationHelper.getDecoratedMeasurement(itemView);
          break;
          i2 = 0;
          break label115;
        }
        label165:
        k += mOrientationHelper.getDecoratedMeasurement(itemView);
      }
    }
    mLayoutState.mScrapList = localList;
    if (j > 0)
    {
      updateLayoutStateToFillStart(getPosition(getChildClosestToStart()), paramInt1);
      mLayoutState.mExtra = j;
      mLayoutState.mAvailable = 0;
      mLayoutState.assignPositionFromScrapList();
      fill(paramRecycler, mLayoutState, paramState, false);
    }
    if (k > 0)
    {
      updateLayoutStateToFillEnd(getPosition(getChildClosestToEnd()), paramInt2);
      mLayoutState.mExtra = k;
      mLayoutState.mAvailable = 0;
      mLayoutState.assignPositionFromScrapList();
      fill(paramRecycler, mLayoutState, paramState, false);
    }
    mLayoutState.mScrapList = null;
  }
  
  private void recycleByLayoutState(RecyclerView.Recycler paramRecycler, LayoutState paramLayoutState)
  {
    if (!mRecycle) {
      return;
    }
    if (mLayoutDirection == -1)
    {
      recycleViewsFromEnd(paramRecycler, mScrollingOffset);
      return;
    }
    recycleViewsFromStart(paramRecycler, mScrollingOffset);
  }
  
  private void recycleChildren(RecyclerView.Recycler paramRecycler, int paramInt1, int paramInt2)
  {
    if (paramInt1 == paramInt2) {}
    for (;;)
    {
      return;
      if (paramInt2 > paramInt1)
      {
        paramInt2 -= 1;
        while (paramInt2 >= paramInt1)
        {
          removeAndRecycleViewAt(paramInt2, paramRecycler);
          paramInt2 -= 1;
        }
      }
      else
      {
        while (paramInt1 > paramInt2)
        {
          removeAndRecycleViewAt(paramInt1, paramRecycler);
          paramInt1 -= 1;
        }
      }
    }
  }
  
  private void recycleViewsFromEnd(RecyclerView.Recycler paramRecycler, int paramInt)
  {
    int i = getChildCount();
    if (paramInt < 0) {}
    for (;;)
    {
      return;
      int j = mOrientationHelper.getEnd() - paramInt;
      View localView;
      if (mShouldReverseLayout)
      {
        paramInt = 0;
        while (paramInt < i)
        {
          localView = getChildAt(paramInt);
          if (mOrientationHelper.getDecoratedStart(localView) < j)
          {
            recycleChildren(paramRecycler, 0, paramInt);
            return;
          }
          paramInt += 1;
        }
      }
      else
      {
        paramInt = i - 1;
        while (paramInt >= 0)
        {
          localView = getChildAt(paramInt);
          if (mOrientationHelper.getDecoratedStart(localView) < j)
          {
            recycleChildren(paramRecycler, i - 1, paramInt);
            return;
          }
          paramInt -= 1;
        }
      }
    }
  }
  
  private void recycleViewsFromStart(RecyclerView.Recycler paramRecycler, int paramInt)
  {
    if (paramInt < 0) {}
    for (;;)
    {
      return;
      int j = getChildCount();
      int i;
      View localView;
      if (mShouldReverseLayout)
      {
        i = j - 1;
        while (i >= 0)
        {
          localView = getChildAt(i);
          if (mOrientationHelper.getDecoratedEnd(localView) > paramInt)
          {
            recycleChildren(paramRecycler, j - 1, i);
            return;
          }
          i -= 1;
        }
      }
      else
      {
        i = 0;
        while (i < j)
        {
          localView = getChildAt(i);
          if (mOrientationHelper.getDecoratedEnd(localView) > paramInt)
          {
            recycleChildren(paramRecycler, 0, i);
            return;
          }
          i += 1;
        }
      }
    }
  }
  
  private void resolveShouldLayoutReverse()
  {
    boolean bool = true;
    if ((mOrientation == 1) || (!isLayoutRTL()))
    {
      mShouldReverseLayout = mReverseLayout;
      return;
    }
    if (!mReverseLayout) {}
    for (;;)
    {
      mShouldReverseLayout = bool;
      return;
      bool = false;
    }
  }
  
  private boolean updateAnchorFromChildren(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, AnchorInfo paramAnchorInfo)
  {
    if (getChildCount() == 0) {}
    do
    {
      return false;
      View localView = getFocusedChild();
      if ((localView != null) && (paramAnchorInfo.isViewValidAsAnchor(localView, paramState)))
      {
        paramAnchorInfo.assignFromViewAndKeepVisibleRect(localView);
        return true;
      }
    } while (mLastStackFromEnd != mStackFromEnd);
    if (mLayoutFromEnd)
    {
      paramRecycler = findReferenceChildClosestToEnd(paramRecycler, paramState);
      label63:
      if (paramRecycler == null) {
        break label162;
      }
      paramAnchorInfo.assignFromView(paramRecycler);
      if ((!paramState.isPreLayout()) && (supportsPredictiveItemAnimations()))
      {
        if ((mOrientationHelper.getDecoratedStart(paramRecycler) < mOrientationHelper.getEndAfterPadding()) && (mOrientationHelper.getDecoratedEnd(paramRecycler) >= mOrientationHelper.getStartAfterPadding())) {
          break label164;
        }
        i = 1;
        label125:
        if (i != 0) {
          if (!mLayoutFromEnd) {
            break label170;
          }
        }
      }
    }
    label162:
    label164:
    label170:
    for (int i = mOrientationHelper.getEndAfterPadding();; i = mOrientationHelper.getStartAfterPadding())
    {
      mCoordinate = i;
      return true;
      paramRecycler = findReferenceChildClosestToStart(paramRecycler, paramState);
      break label63;
      break;
      i = 0;
      break label125;
    }
  }
  
  private boolean updateAnchorFromPendingData(RecyclerView.State paramState, AnchorInfo paramAnchorInfo)
  {
    boolean bool = false;
    if ((paramState.isPreLayout()) || (mPendingScrollPosition == -1)) {
      return false;
    }
    if ((mPendingScrollPosition < 0) || (mPendingScrollPosition >= paramState.getItemCount()))
    {
      mPendingScrollPosition = -1;
      mPendingScrollPositionOffset = Integer.MIN_VALUE;
      return false;
    }
    mPosition = mPendingScrollPosition;
    if ((mPendingSavedState != null) && (mPendingSavedState.hasValidAnchor()))
    {
      mLayoutFromEnd = mPendingSavedState.mAnchorLayoutFromEnd;
      if (mLayoutFromEnd)
      {
        mCoordinate = (mOrientationHelper.getEndAfterPadding() - mPendingSavedState.mAnchorOffset);
        return true;
      }
      mCoordinate = (mOrientationHelper.getStartAfterPadding() + mPendingSavedState.mAnchorOffset);
      return true;
    }
    if (mPendingScrollPositionOffset == Integer.MIN_VALUE)
    {
      paramState = findViewByPosition(mPendingScrollPosition);
      int i;
      if (paramState != null)
      {
        if (mOrientationHelper.getDecoratedMeasurement(paramState) > mOrientationHelper.getTotalSpace())
        {
          paramAnchorInfo.assignCoordinateFromPadding();
          return true;
        }
        if (mOrientationHelper.getDecoratedStart(paramState) - mOrientationHelper.getStartAfterPadding() < 0)
        {
          mCoordinate = mOrientationHelper.getStartAfterPadding();
          mLayoutFromEnd = false;
          return true;
        }
        if (mOrientationHelper.getEndAfterPadding() - mOrientationHelper.getDecoratedEnd(paramState) < 0)
        {
          mCoordinate = mOrientationHelper.getEndAfterPadding();
          mLayoutFromEnd = true;
          return true;
        }
        if (mLayoutFromEnd) {}
        for (i = mOrientationHelper.getDecoratedEnd(paramState) + mOrientationHelper.getTotalSpaceChange();; i = mOrientationHelper.getDecoratedStart(paramState))
        {
          mCoordinate = i;
          return true;
        }
      }
      if (getChildCount() > 0)
      {
        i = getPosition(getChildAt(0));
        if (mPendingScrollPosition >= i) {
          break label351;
        }
      }
      label351:
      for (int j = 1;; j = 0)
      {
        if (j == mShouldReverseLayout) {
          bool = true;
        }
        mLayoutFromEnd = bool;
        paramAnchorInfo.assignCoordinateFromPadding();
        return true;
      }
    }
    mLayoutFromEnd = mShouldReverseLayout;
    if (mShouldReverseLayout)
    {
      mCoordinate = (mOrientationHelper.getEndAfterPadding() - mPendingScrollPositionOffset);
      return true;
    }
    mCoordinate = (mOrientationHelper.getStartAfterPadding() + mPendingScrollPositionOffset);
    return true;
  }
  
  private void updateAnchorInfoForLayout(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, AnchorInfo paramAnchorInfo)
  {
    if (updateAnchorFromPendingData(paramState, paramAnchorInfo)) {}
    while (updateAnchorFromChildren(paramRecycler, paramState, paramAnchorInfo)) {
      return;
    }
    paramAnchorInfo.assignCoordinateFromPadding();
    if (mStackFromEnd) {}
    for (int i = paramState.getItemCount() - 1;; i = 0)
    {
      mPosition = i;
      return;
    }
  }
  
  private void updateLayoutState(int paramInt1, int paramInt2, boolean paramBoolean, RecyclerView.State paramState)
  {
    int i = -1;
    int j = 1;
    mLayoutState.mExtra = getExtraLayoutSpace(paramState);
    mLayoutState.mLayoutDirection = paramInt1;
    if (paramInt1 == 1)
    {
      paramState = mLayoutState;
      mExtra += mOrientationHelper.getEndPadding();
      paramState = getChildClosestToEnd();
      localLayoutState = mLayoutState;
      if (mShouldReverseLayout) {}
      for (paramInt1 = i;; paramInt1 = 1)
      {
        mItemDirection = paramInt1;
        mLayoutState.mCurrentPosition = (getPosition(paramState) + mLayoutState.mItemDirection);
        mLayoutState.mOffset = mOrientationHelper.getDecoratedEnd(paramState);
        paramInt1 = mOrientationHelper.getDecoratedEnd(paramState) - mOrientationHelper.getEndAfterPadding();
        mLayoutState.mAvailable = paramInt2;
        if (paramBoolean)
        {
          paramState = mLayoutState;
          mAvailable -= paramInt1;
        }
        mLayoutState.mScrollingOffset = paramInt1;
        return;
      }
    }
    paramState = getChildClosestToStart();
    LayoutState localLayoutState = mLayoutState;
    mExtra += mOrientationHelper.getStartAfterPadding();
    localLayoutState = mLayoutState;
    if (mShouldReverseLayout) {}
    for (paramInt1 = j;; paramInt1 = -1)
    {
      mItemDirection = paramInt1;
      mLayoutState.mCurrentPosition = (getPosition(paramState) + mLayoutState.mItemDirection);
      mLayoutState.mOffset = mOrientationHelper.getDecoratedStart(paramState);
      paramInt1 = -mOrientationHelper.getDecoratedStart(paramState) + mOrientationHelper.getStartAfterPadding();
      break;
    }
  }
  
  private void updateLayoutStateToFillEnd(int paramInt1, int paramInt2)
  {
    mLayoutState.mAvailable = (mOrientationHelper.getEndAfterPadding() - paramInt2);
    LayoutState localLayoutState = mLayoutState;
    if (mShouldReverseLayout) {}
    for (int i = -1;; i = 1)
    {
      mItemDirection = i;
      mLayoutState.mCurrentPosition = paramInt1;
      mLayoutState.mLayoutDirection = 1;
      mLayoutState.mOffset = paramInt2;
      mLayoutState.mScrollingOffset = Integer.MIN_VALUE;
      return;
    }
  }
  
  private void updateLayoutStateToFillEnd(AnchorInfo paramAnchorInfo)
  {
    updateLayoutStateToFillEnd(mPosition, mCoordinate);
  }
  
  private void updateLayoutStateToFillStart(int paramInt1, int paramInt2)
  {
    mLayoutState.mAvailable = (paramInt2 - mOrientationHelper.getStartAfterPadding());
    mLayoutState.mCurrentPosition = paramInt1;
    LayoutState localLayoutState = mLayoutState;
    if (mShouldReverseLayout) {}
    for (paramInt1 = 1;; paramInt1 = -1)
    {
      mItemDirection = paramInt1;
      mLayoutState.mLayoutDirection = -1;
      mLayoutState.mOffset = paramInt2;
      mLayoutState.mScrollingOffset = Integer.MIN_VALUE;
      return;
    }
  }
  
  private void updateLayoutStateToFillStart(AnchorInfo paramAnchorInfo)
  {
    updateLayoutStateToFillStart(mPosition, mCoordinate);
  }
  
  public void assertNotInLayoutOrScroll(String paramString)
  {
    if (mPendingSavedState == null) {
      super.assertNotInLayoutOrScroll(paramString);
    }
  }
  
  public boolean canScrollHorizontally()
  {
    return mOrientation == 0;
  }
  
  public boolean canScrollVertically()
  {
    return mOrientation == 1;
  }
  
  public int computeHorizontalScrollExtent(RecyclerView.State paramState)
  {
    return computeScrollExtent(paramState);
  }
  
  public int computeHorizontalScrollOffset(RecyclerView.State paramState)
  {
    return computeScrollOffset(paramState);
  }
  
  public int computeHorizontalScrollRange(RecyclerView.State paramState)
  {
    return computeScrollRange(paramState);
  }
  
  public PointF computeScrollVectorForPosition(int paramInt)
  {
    int i = 0;
    if (getChildCount() == 0) {
      return null;
    }
    if (paramInt < getPosition(getChildAt(0))) {
      i = 1;
    }
    if (i != mShouldReverseLayout) {}
    for (paramInt = -1; mOrientation == 0; paramInt = 1) {
      return new PointF(paramInt, 0.0F);
    }
    return new PointF(0.0F, paramInt);
  }
  
  public int computeVerticalScrollExtent(RecyclerView.State paramState)
  {
    return computeScrollExtent(paramState);
  }
  
  public int computeVerticalScrollOffset(RecyclerView.State paramState)
  {
    return computeScrollOffset(paramState);
  }
  
  public int computeVerticalScrollRange(RecyclerView.State paramState)
  {
    return computeScrollRange(paramState);
  }
  
  LayoutState createLayoutState()
  {
    return new LayoutState();
  }
  
  void ensureLayoutState()
  {
    if (mLayoutState == null) {
      mLayoutState = createLayoutState();
    }
    if (mOrientationHelper == null) {
      mOrientationHelper = OrientationHelper.createOrientationHelper(this, mOrientation);
    }
  }
  
  int fill(RecyclerView.Recycler paramRecycler, LayoutState paramLayoutState, RecyclerView.State paramState, boolean paramBoolean)
  {
    int k = mAvailable;
    if (mScrollingOffset != Integer.MIN_VALUE)
    {
      if (mAvailable < 0) {
        mScrollingOffset += mAvailable;
      }
      recycleByLayoutState(paramRecycler, paramLayoutState);
    }
    int i = mAvailable + mExtra;
    LayoutChunkResult localLayoutChunkResult = new LayoutChunkResult();
    if ((i > 0) && (paramLayoutState.hasMore(paramState)))
    {
      localLayoutChunkResult.resetInternal();
      layoutChunk(paramRecycler, paramState, paramLayoutState, localLayoutChunkResult);
      if (!mFinished) {
        break label104;
      }
    }
    for (;;)
    {
      return k - mAvailable;
      label104:
      mOffset += mConsumed * mLayoutDirection;
      int j;
      if ((mIgnoreConsumed) && (mLayoutState.mScrapList == null))
      {
        j = i;
        if (paramState.isPreLayout()) {}
      }
      else
      {
        mAvailable -= mConsumed;
        j = i - mConsumed;
      }
      if (mScrollingOffset != Integer.MIN_VALUE)
      {
        mScrollingOffset += mConsumed;
        if (mAvailable < 0) {
          mScrollingOffset += mAvailable;
        }
        recycleByLayoutState(paramRecycler, paramLayoutState);
      }
      i = j;
      if (!paramBoolean) {
        break;
      }
      i = j;
      if (!mFocusable) {
        break;
      }
    }
  }
  
  public int findFirstVisibleItemPosition()
  {
    View localView = findOneVisibleChild(0, getChildCount(), false, true);
    if (localView == null) {
      return -1;
    }
    return getPosition(localView);
  }
  
  public int findLastVisibleItemPosition()
  {
    View localView = findOneVisibleChild(getChildCount() - 1, -1, false, true);
    if (localView == null) {
      return -1;
    }
    return getPosition(localView);
  }
  
  View findOneVisibleChild(int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
  {
    ensureLayoutState();
    int j = mOrientationHelper.getStartAfterPadding();
    int k = mOrientationHelper.getEndAfterPadding();
    int i;
    if (paramInt2 > paramInt1) {
      i = 1;
    }
    Object localObject2;
    for (Object localObject1 = null;; localObject1 = localObject2)
    {
      if (paramInt1 == paramInt2) {
        break label150;
      }
      View localView = getChildAt(paramInt1);
      int m = mOrientationHelper.getDecoratedStart(localView);
      int n = mOrientationHelper.getDecoratedEnd(localView);
      localObject2 = localObject1;
      if (m < k)
      {
        localObject2 = localObject1;
        if (n > j)
        {
          if ((!paramBoolean1) || ((m >= j) && (n <= k)))
          {
            return localView;
            i = -1;
            break;
          }
          localObject2 = localObject1;
          if (paramBoolean2)
          {
            localObject2 = localObject1;
            if (localObject1 == null) {
              localObject2 = localView;
            }
          }
        }
      }
      paramInt1 += i;
    }
    label150:
    return localObject1;
  }
  
  View findReferenceChild(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, int paramInt1, int paramInt2, int paramInt3)
  {
    ensureLayoutState();
    paramState = null;
    paramRecycler = null;
    int j = mOrientationHelper.getStartAfterPadding();
    int k = mOrientationHelper.getEndAfterPadding();
    int i;
    View localView;
    Object localObject1;
    Object localObject2;
    if (paramInt2 > paramInt1)
    {
      i = 1;
      if (paramInt1 == paramInt2) {
        break label183;
      }
      localView = getChildAt(paramInt1);
      int m = getPosition(localView);
      localObject1 = paramState;
      localObject2 = paramRecycler;
      if (m >= 0)
      {
        localObject1 = paramState;
        localObject2 = paramRecycler;
        if (m < paramInt3)
        {
          if (!((RecyclerView.LayoutParams)localView.getLayoutParams()).isItemRemoved()) {
            break label131;
          }
          localObject1 = paramState;
          localObject2 = paramRecycler;
          if (paramState == null)
          {
            localObject2 = paramRecycler;
            localObject1 = localView;
          }
        }
      }
    }
    for (;;)
    {
      paramInt1 += i;
      paramState = (RecyclerView.State)localObject1;
      paramRecycler = (RecyclerView.Recycler)localObject2;
      break;
      i = -1;
      break;
      label131:
      if (mOrientationHelper.getDecoratedStart(localView) < k)
      {
        localObject1 = localView;
        if (mOrientationHelper.getDecoratedEnd(localView) >= j) {
          break label190;
        }
      }
      localObject1 = paramState;
      localObject2 = paramRecycler;
      if (paramRecycler == null)
      {
        localObject1 = paramState;
        localObject2 = localView;
      }
    }
    label183:
    if (paramRecycler != null) {}
    for (;;)
    {
      localObject1 = paramRecycler;
      label190:
      return localObject1;
      paramRecycler = paramState;
    }
  }
  
  public View findViewByPosition(int paramInt)
  {
    int i = getChildCount();
    Object localObject;
    if (i == 0) {
      localObject = null;
    }
    View localView;
    do
    {
      return localObject;
      int j = paramInt - getPosition(getChildAt(0));
      if ((j < 0) || (j >= i)) {
        break;
      }
      localView = getChildAt(j);
      localObject = localView;
    } while (getPosition(localView) == paramInt);
    return super.findViewByPosition(paramInt);
  }
  
  public RecyclerView.LayoutParams generateDefaultLayoutParams()
  {
    return new RecyclerView.LayoutParams(-2, -2);
  }
  
  protected int getExtraLayoutSpace(RecyclerView.State paramState)
  {
    if (paramState.hasTargetScrollPosition()) {
      return mOrientationHelper.getTotalSpace();
    }
    return 0;
  }
  
  public int getOrientation()
  {
    return mOrientation;
  }
  
  protected boolean isLayoutRTL()
  {
    return getLayoutDirection() == 1;
  }
  
  void layoutChunk(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, LayoutState paramLayoutState, LayoutChunkResult paramLayoutChunkResult)
  {
    paramRecycler = paramLayoutState.next(paramRecycler);
    if (paramRecycler == null)
    {
      mFinished = true;
      return;
    }
    paramState = (RecyclerView.LayoutParams)paramRecycler.getLayoutParams();
    boolean bool2;
    boolean bool1;
    label61:
    int k;
    int j;
    label120:
    int i;
    int m;
    if (mScrapList == null)
    {
      bool2 = mShouldReverseLayout;
      if (mLayoutDirection == -1)
      {
        bool1 = true;
        if (bool2 != bool1) {
          break label215;
        }
        addView(paramRecycler);
        measureChildWithMargins(paramRecycler, 0, 0);
        mConsumed = mOrientationHelper.getDecoratedMeasurement(paramRecycler);
        if (mOrientation != 1) {
          break label314;
        }
        if (!isLayoutRTL()) {
          break label271;
        }
        k = getWidth() - getPaddingRight();
        j = k - mOrientationHelper.getDecoratedMeasurementInOther(paramRecycler);
        if (mLayoutDirection != -1) {
          break label293;
        }
        i = mOffset;
        m = mOffset - mConsumed;
      }
    }
    for (;;)
    {
      layoutDecorated(paramRecycler, j + leftMargin, m + topMargin, k - rightMargin, i - bottomMargin);
      if ((paramState.isItemRemoved()) || (paramState.isItemChanged())) {
        mIgnoreConsumed = true;
      }
      mFocusable = paramRecycler.isFocusable();
      return;
      bool1 = false;
      break;
      label215:
      addView(paramRecycler, 0);
      break label61;
      bool2 = mShouldReverseLayout;
      if (mLayoutDirection == -1) {}
      for (bool1 = true;; bool1 = false)
      {
        if (bool2 != bool1) {
          break label262;
        }
        addDisappearingView(paramRecycler);
        break;
      }
      label262:
      addDisappearingView(paramRecycler, 0);
      break label61;
      label271:
      j = getPaddingLeft();
      k = j + mOrientationHelper.getDecoratedMeasurementInOther(paramRecycler);
      break label120;
      label293:
      m = mOffset;
      i = mOffset + mConsumed;
      continue;
      label314:
      m = getPaddingTop();
      i = m + mOrientationHelper.getDecoratedMeasurementInOther(paramRecycler);
      if (mLayoutDirection == -1)
      {
        k = mOffset;
        j = mOffset - mConsumed;
      }
      else
      {
        j = mOffset;
        k = mOffset + mConsumed;
      }
    }
  }
  
  void onAnchorReady(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, AnchorInfo paramAnchorInfo) {}
  
  public void onDetachedFromWindow(RecyclerView paramRecyclerView, RecyclerView.Recycler paramRecycler)
  {
    super.onDetachedFromWindow(paramRecyclerView, paramRecycler);
    if (mRecycleChildrenOnDetach)
    {
      removeAndRecycleAllViews(paramRecycler);
      paramRecycler.clear();
    }
  }
  
  public View onFocusSearchFailed(View paramView, int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    resolveShouldLayoutReverse();
    if (getChildCount() == 0)
    {
      paramRecycler = null;
      return paramRecycler;
    }
    paramInt = convertFocusDirectionToLayoutDirection(paramInt);
    if (paramInt == Integer.MIN_VALUE) {
      return null;
    }
    ensureLayoutState();
    if (paramInt == -1) {}
    for (View localView = findReferenceChildClosestToStart(paramRecycler, paramState); localView == null; localView = findReferenceChildClosestToEnd(paramRecycler, paramState)) {
      return null;
    }
    ensureLayoutState();
    updateLayoutState(paramInt, (int)(0.33F * mOrientationHelper.getTotalSpace()), false, paramState);
    mLayoutState.mScrollingOffset = Integer.MIN_VALUE;
    mLayoutState.mRecycle = false;
    fill(paramRecycler, mLayoutState, paramState, true);
    if (paramInt == -1) {}
    for (paramView = getChildClosestToStart();; paramView = getChildClosestToEnd())
    {
      if (paramView != localView)
      {
        paramRecycler = paramView;
        if (paramView.isFocusable()) {
          break;
        }
      }
      return null;
    }
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    if (getChildCount() > 0)
    {
      paramAccessibilityEvent = AccessibilityEventCompat.asRecord(paramAccessibilityEvent);
      paramAccessibilityEvent.setFromIndex(findFirstVisibleItemPosition());
      paramAccessibilityEvent.setToIndex(findLastVisibleItemPosition());
    }
  }
  
  public void onLayoutChildren(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    if ((mPendingSavedState != null) && (mPendingSavedState.hasValidAnchor())) {
      mPendingScrollPosition = mPendingSavedState.mAnchorPosition;
    }
    ensureLayoutState();
    mLayoutState.mRecycle = false;
    resolveShouldLayoutReverse();
    mAnchorInfo.reset();
    mAnchorInfo.mLayoutFromEnd = (mShouldReverseLayout ^ mStackFromEnd);
    updateAnchorInfoForLayout(paramRecycler, paramState, mAnchorInfo);
    int i = getExtraLayoutSpace(paramState);
    int j;
    int m;
    Object localObject;
    label216:
    label229:
    int n;
    if (mLayoutState.mLastScrollDelta >= 0)
    {
      j = 0;
      k = j + mOrientationHelper.getStartAfterPadding();
      m = i + mOrientationHelper.getEndPadding();
      i = m;
      j = k;
      if (paramState.isPreLayout())
      {
        i = m;
        j = k;
        if (mPendingScrollPosition != -1)
        {
          i = m;
          j = k;
          if (mPendingScrollPositionOffset != Integer.MIN_VALUE)
          {
            localObject = findViewByPosition(mPendingScrollPosition);
            i = m;
            j = k;
            if (localObject != null)
            {
              if (!mShouldReverseLayout) {
                break label590;
              }
              i = mOrientationHelper.getEndAfterPadding() - mOrientationHelper.getDecoratedEnd((View)localObject) - mPendingScrollPositionOffset;
              if (i <= 0) {
                break label622;
              }
              j = k + i;
              i = m;
            }
          }
        }
      }
      onAnchorReady(paramRecycler, paramState, mAnchorInfo);
      detachAndScrapAttachedViews(paramRecycler);
      mLayoutState.mIsPreLayout = paramState.isPreLayout();
      if (!mAnchorInfo.mLayoutFromEnd) {
        break label634;
      }
      updateLayoutStateToFillStart(mAnchorInfo);
      mLayoutState.mExtra = j;
      fill(paramRecycler, mLayoutState, paramState, false);
      k = mLayoutState.mOffset;
      n = mLayoutState.mCurrentPosition;
      j = i;
      if (mLayoutState.mAvailable > 0) {
        j = i + mLayoutState.mAvailable;
      }
      updateLayoutStateToFillEnd(mAnchorInfo);
      mLayoutState.mExtra = j;
      localObject = mLayoutState;
      mCurrentPosition += mLayoutState.mItemDirection;
      fill(paramRecycler, mLayoutState, paramState, false);
      m = mLayoutState.mOffset;
      i = m;
      j = k;
      if (mLayoutState.mAvailable > 0)
      {
        i = mLayoutState.mAvailable;
        updateLayoutStateToFillStart(n, k);
        mLayoutState.mExtra = i;
        fill(paramRecycler, mLayoutState, paramState, false);
        j = mLayoutState.mOffset;
        i = m;
      }
      label463:
      k = i;
      m = j;
      if (getChildCount() > 0)
      {
        if (!(mShouldReverseLayout ^ mStackFromEnd)) {
          break label833;
        }
        k = fixLayoutEndGap(i, paramRecycler, paramState, true);
        m = j + k;
        j = fixLayoutStartGap(m, paramRecycler, paramState, false);
        m += j;
      }
    }
    for (int k = i + k + j;; k = i + n)
    {
      layoutForPredictiveAnimations(paramRecycler, paramState, m, k);
      if (!paramState.isPreLayout())
      {
        mPendingScrollPosition = -1;
        mPendingScrollPositionOffset = Integer.MIN_VALUE;
        mOrientationHelper.onLayoutComplete();
      }
      mLastStackFromEnd = mStackFromEnd;
      mPendingSavedState = null;
      return;
      j = i;
      i = 0;
      break;
      label590:
      i = mOrientationHelper.getDecoratedStart((View)localObject);
      j = mOrientationHelper.getStartAfterPadding();
      i = mPendingScrollPositionOffset - (i - j);
      break label216;
      label622:
      i = m - i;
      j = k;
      break label229;
      label634:
      updateLayoutStateToFillEnd(mAnchorInfo);
      mLayoutState.mExtra = i;
      fill(paramRecycler, mLayoutState, paramState, false);
      k = mLayoutState.mOffset;
      n = mLayoutState.mCurrentPosition;
      i = j;
      if (mLayoutState.mAvailable > 0) {
        i = j + mLayoutState.mAvailable;
      }
      updateLayoutStateToFillStart(mAnchorInfo);
      mLayoutState.mExtra = i;
      localObject = mLayoutState;
      mCurrentPosition += mLayoutState.mItemDirection;
      fill(paramRecycler, mLayoutState, paramState, false);
      m = mLayoutState.mOffset;
      i = k;
      j = m;
      if (mLayoutState.mAvailable <= 0) {
        break label463;
      }
      i = mLayoutState.mAvailable;
      updateLayoutStateToFillEnd(n, k);
      mLayoutState.mExtra = i;
      fill(paramRecycler, mLayoutState, paramState, false);
      i = mLayoutState.mOffset;
      j = m;
      break label463;
      label833:
      k = fixLayoutStartGap(j, paramRecycler, paramState, true);
      i += k;
      n = fixLayoutEndGap(i, paramRecycler, paramState, false);
      m = j + k + n;
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    if ((paramParcelable instanceof SavedState))
    {
      mPendingSavedState = ((SavedState)paramParcelable);
      requestLayout();
    }
  }
  
  public Parcelable onSaveInstanceState()
  {
    if (mPendingSavedState != null) {
      return new SavedState(mPendingSavedState);
    }
    SavedState localSavedState = new SavedState();
    if (getChildCount() > 0)
    {
      ensureLayoutState();
      boolean bool = mLastStackFromEnd ^ mShouldReverseLayout;
      mAnchorLayoutFromEnd = bool;
      if (bool)
      {
        localView = getChildClosestToEnd();
        mAnchorOffset = (mOrientationHelper.getEndAfterPadding() - mOrientationHelper.getDecoratedEnd(localView));
        mAnchorPosition = getPosition(localView);
        return localSavedState;
      }
      View localView = getChildClosestToStart();
      mAnchorPosition = getPosition(localView);
      mAnchorOffset = (mOrientationHelper.getDecoratedStart(localView) - mOrientationHelper.getStartAfterPadding());
      return localSavedState;
    }
    localSavedState.invalidateAnchor();
    return localSavedState;
  }
  
  int scrollBy(int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    if ((getChildCount() == 0) || (paramInt == 0)) {}
    int i;
    int j;
    int k;
    do
    {
      return 0;
      mLayoutState.mRecycle = true;
      ensureLayoutState();
      if (paramInt <= 0) {
        break;
      }
      i = 1;
      j = Math.abs(paramInt);
      updateLayoutState(i, j, true, paramState);
      k = mLayoutState.mScrollingOffset + fill(paramRecycler, mLayoutState, paramState, false);
    } while (k < 0);
    if (j > k) {
      paramInt = i * k;
    }
    for (;;)
    {
      mOrientationHelper.offsetChildren(-paramInt);
      mLayoutState.mLastScrollDelta = paramInt;
      return paramInt;
      i = -1;
      break;
    }
  }
  
  public int scrollHorizontallyBy(int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    if (mOrientation == 1) {
      return 0;
    }
    return scrollBy(paramInt, paramRecycler, paramState);
  }
  
  public void scrollToPosition(int paramInt)
  {
    mPendingScrollPosition = paramInt;
    mPendingScrollPositionOffset = Integer.MIN_VALUE;
    if (mPendingSavedState != null) {
      mPendingSavedState.invalidateAnchor();
    }
    requestLayout();
  }
  
  public void scrollToPositionWithOffset(int paramInt1, int paramInt2)
  {
    mPendingScrollPosition = paramInt1;
    mPendingScrollPositionOffset = paramInt2;
    if (mPendingSavedState != null) {
      mPendingSavedState.invalidateAnchor();
    }
    requestLayout();
  }
  
  public int scrollVerticallyBy(int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    if (mOrientation == 0) {
      return 0;
    }
    return scrollBy(paramInt, paramRecycler, paramState);
  }
  
  public void setOrientation(int paramInt)
  {
    if ((paramInt != 0) && (paramInt != 1)) {
      throw new IllegalArgumentException("invalid orientation:" + paramInt);
    }
    assertNotInLayoutOrScroll(null);
    if (paramInt == mOrientation) {
      return;
    }
    mOrientation = paramInt;
    mOrientationHelper = null;
    requestLayout();
  }
  
  public void setReverseLayout(boolean paramBoolean)
  {
    assertNotInLayoutOrScroll(null);
    if (paramBoolean == mReverseLayout) {
      return;
    }
    mReverseLayout = paramBoolean;
    requestLayout();
  }
  
  public void setSmoothScrollbarEnabled(boolean paramBoolean)
  {
    mSmoothScrollbarEnabled = paramBoolean;
  }
  
  public void smoothScrollToPosition(RecyclerView paramRecyclerView, RecyclerView.State paramState, int paramInt)
  {
    paramRecyclerView = new LinearSmoothScroller(paramRecyclerView.getContext())
    {
      public PointF computeScrollVectorForPosition(int paramAnonymousInt)
      {
        return LinearLayoutManager.this.computeScrollVectorForPosition(paramAnonymousInt);
      }
    };
    paramRecyclerView.setTargetPosition(paramInt);
    startSmoothScroll(paramRecyclerView);
  }
  
  public boolean supportsPredictiveItemAnimations()
  {
    return (mPendingSavedState == null) && (mLastStackFromEnd == mStackFromEnd);
  }
  
  class AnchorInfo
  {
    int mCoordinate;
    boolean mLayoutFromEnd;
    int mPosition;
    
    AnchorInfo() {}
    
    private boolean isViewValidAsAnchor(View paramView, RecyclerView.State paramState)
    {
      paramView = (RecyclerView.LayoutParams)paramView.getLayoutParams();
      return (!paramView.isItemRemoved()) && (paramView.getViewLayoutPosition() >= 0) && (paramView.getViewLayoutPosition() < paramState.getItemCount());
    }
    
    void assignCoordinateFromPadding()
    {
      if (mLayoutFromEnd) {}
      for (int i = mOrientationHelper.getEndAfterPadding();; i = mOrientationHelper.getStartAfterPadding())
      {
        mCoordinate = i;
        return;
      }
    }
    
    public void assignFromView(View paramView)
    {
      if (mLayoutFromEnd) {}
      for (mCoordinate = (mOrientationHelper.getDecoratedEnd(paramView) + mOrientationHelper.getTotalSpaceChange());; mCoordinate = mOrientationHelper.getDecoratedStart(paramView))
      {
        mPosition = getPosition(paramView);
        return;
      }
    }
    
    public void assignFromViewAndKeepVisibleRect(View paramView)
    {
      int j = mOrientationHelper.getTotalSpaceChange();
      if (j >= 0) {
        assignFromView(paramView);
      }
      int i;
      do
      {
        int k;
        do
        {
          do
          {
            do
            {
              return;
              mPosition = getPosition(paramView);
              if (!mLayoutFromEnd) {
                break;
              }
              i = mOrientationHelper.getEndAfterPadding() - j - mOrientationHelper.getDecoratedEnd(paramView);
              mCoordinate = (mOrientationHelper.getEndAfterPadding() - i);
            } while (i <= 0);
            j = mOrientationHelper.getDecoratedMeasurement(paramView);
            k = mCoordinate;
            m = mOrientationHelper.getStartAfterPadding();
            j = k - j - (m + Math.min(mOrientationHelper.getDecoratedStart(paramView) - m, 0));
          } while (j >= 0);
          mCoordinate += Math.min(i, -j);
          return;
          k = mOrientationHelper.getDecoratedStart(paramView);
          i = k - mOrientationHelper.getStartAfterPadding();
          mCoordinate = k;
        } while (i <= 0);
        int m = mOrientationHelper.getDecoratedMeasurement(paramView);
        int n = mOrientationHelper.getEndAfterPadding();
        int i1 = mOrientationHelper.getDecoratedEnd(paramView);
        j = mOrientationHelper.getEndAfterPadding() - Math.min(0, n - j - i1) - (k + m);
      } while (j >= 0);
      mCoordinate -= Math.min(i, -j);
    }
    
    void reset()
    {
      mPosition = -1;
      mCoordinate = Integer.MIN_VALUE;
      mLayoutFromEnd = false;
    }
    
    public String toString()
    {
      return "AnchorInfo{mPosition=" + mPosition + ", mCoordinate=" + mCoordinate + ", mLayoutFromEnd=" + mLayoutFromEnd + '}';
    }
  }
  
  protected static class LayoutChunkResult
  {
    public int mConsumed;
    public boolean mFinished;
    public boolean mFocusable;
    public boolean mIgnoreConsumed;
    
    protected LayoutChunkResult() {}
    
    void resetInternal()
    {
      mConsumed = 0;
      mFinished = false;
      mIgnoreConsumed = false;
      mFocusable = false;
    }
  }
  
  static class LayoutState
  {
    int mAvailable;
    int mCurrentPosition;
    int mExtra = 0;
    boolean mIsPreLayout = false;
    int mItemDirection;
    int mLastScrollDelta;
    int mLayoutDirection;
    int mOffset;
    boolean mRecycle = true;
    List<RecyclerView.ViewHolder> mScrapList = null;
    int mScrollingOffset;
    
    LayoutState() {}
    
    private View nextViewFromScrapList()
    {
      int j = mScrapList.size();
      int i = 0;
      if (i < j)
      {
        RecyclerView.ViewHolder localViewHolder = (RecyclerView.ViewHolder)mScrapList.get(i);
        if (localViewHolder.isRemoved()) {}
        while (mCurrentPosition != localViewHolder.getLayoutPosition())
        {
          i += 1;
          break;
        }
        assignPositionFromScrapList(localViewHolder);
        return itemView;
      }
      return null;
    }
    
    public void assignPositionFromScrapList()
    {
      assignPositionFromScrapList(null);
    }
    
    public void assignPositionFromScrapList(RecyclerView.ViewHolder paramViewHolder)
    {
      paramViewHolder = nextViewHolderInLimitedList(paramViewHolder);
      if (paramViewHolder == null) {}
      for (int i = -1;; i = paramViewHolder.getLayoutPosition())
      {
        mCurrentPosition = i;
        return;
      }
    }
    
    boolean hasMore(RecyclerView.State paramState)
    {
      return (mCurrentPosition >= 0) && (mCurrentPosition < paramState.getItemCount());
    }
    
    View next(RecyclerView.Recycler paramRecycler)
    {
      if (mScrapList != null) {
        return nextViewFromScrapList();
      }
      paramRecycler = paramRecycler.getViewForPosition(mCurrentPosition);
      mCurrentPosition += mItemDirection;
      return paramRecycler;
    }
    
    public RecyclerView.ViewHolder nextViewHolderInLimitedList(RecyclerView.ViewHolder paramViewHolder)
    {
      int n = mScrapList.size();
      Object localObject1 = null;
      int j = Integer.MAX_VALUE;
      int i = 0;
      Object localObject2 = localObject1;
      if (i < n)
      {
        RecyclerView.ViewHolder localViewHolder = (RecyclerView.ViewHolder)mScrapList.get(i);
        localObject2 = localObject1;
        int k = j;
        if (localViewHolder != paramViewHolder)
        {
          if (!localViewHolder.isRemoved()) {
            break label86;
          }
          k = j;
          localObject2 = localObject1;
        }
        label86:
        int m;
        do
        {
          do
          {
            do
            {
              i += 1;
              localObject1 = localObject2;
              j = k;
              break;
              m = (localViewHolder.getLayoutPosition() - mCurrentPosition) * mItemDirection;
              localObject2 = localObject1;
              k = j;
            } while (m < 0);
            localObject2 = localObject1;
            k = j;
          } while (m >= j);
          localObject1 = localViewHolder;
          k = m;
          localObject2 = localObject1;
        } while (m != 0);
        localObject2 = localObject1;
      }
      return localObject2;
    }
  }
  
  static class SavedState
    implements Parcelable
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public LinearLayoutManager.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new LinearLayoutManager.SavedState(paramAnonymousParcel);
      }
      
      public LinearLayoutManager.SavedState[] newArray(int paramAnonymousInt)
      {
        return new LinearLayoutManager.SavedState[paramAnonymousInt];
      }
    };
    boolean mAnchorLayoutFromEnd;
    int mAnchorOffset;
    int mAnchorPosition;
    
    public SavedState() {}
    
    SavedState(Parcel paramParcel)
    {
      mAnchorPosition = paramParcel.readInt();
      mAnchorOffset = paramParcel.readInt();
      if (paramParcel.readInt() == 1) {}
      for (;;)
      {
        mAnchorLayoutFromEnd = bool;
        return;
        bool = false;
      }
    }
    
    public SavedState(SavedState paramSavedState)
    {
      mAnchorPosition = mAnchorPosition;
      mAnchorOffset = mAnchorOffset;
      mAnchorLayoutFromEnd = mAnchorLayoutFromEnd;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    boolean hasValidAnchor()
    {
      return mAnchorPosition >= 0;
    }
    
    void invalidateAnchor()
    {
      mAnchorPosition = -1;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      paramParcel.writeInt(mAnchorPosition);
      paramParcel.writeInt(mAnchorOffset);
      if (mAnchorLayoutFromEnd) {}
      for (paramInt = 1;; paramInt = 0)
      {
        paramParcel.writeInt(paramInt);
        return;
      }
    }
  }
}
