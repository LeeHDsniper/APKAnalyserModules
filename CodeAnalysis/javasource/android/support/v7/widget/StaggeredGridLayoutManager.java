package android.support.v7.widget;

import android.content.Context;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.CollectionItemInfoCompat;
import android.support.v4.view.accessibility.AccessibilityRecordCompat;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.accessibility.AccessibilityEvent;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.List;

public class StaggeredGridLayoutManager
  extends RecyclerView.LayoutManager
{
  private final AnchorInfo mAnchorInfo = new AnchorInfo(null);
  private final Runnable mCheckForGapsRunnable = new Runnable()
  {
    public void run()
    {
      StaggeredGridLayoutManager.this.checkForGaps();
    }
  };
  private int mFullSizeSpec;
  private int mGapStrategy = 2;
  private int mHeightSpec;
  private boolean mLaidOutInvalidFullSpan = false;
  private boolean mLastLayoutFromEnd;
  private boolean mLastLayoutRTL;
  private LayoutState mLayoutState;
  LazySpanLookup mLazySpanLookup = new LazySpanLookup();
  private int mOrientation;
  private SavedState mPendingSavedState;
  int mPendingScrollPosition = -1;
  int mPendingScrollPositionOffset = Integer.MIN_VALUE;
  OrientationHelper mPrimaryOrientation;
  private BitSet mRemainingSpans;
  private boolean mReverseLayout = false;
  OrientationHelper mSecondaryOrientation;
  boolean mShouldReverseLayout = false;
  private int mSizePerSpan;
  private boolean mSmoothScrollbarEnabled = true;
  private int mSpanCount = -1;
  private Span[] mSpans;
  private final Rect mTmpRect = new Rect();
  private int mWidthSpec;
  
  public StaggeredGridLayoutManager(int paramInt1, int paramInt2)
  {
    mOrientation = paramInt2;
    setSpanCount(paramInt1);
  }
  
  private void appendViewToAllSpans(View paramView)
  {
    int i = mSpanCount - 1;
    while (i >= 0)
    {
      mSpans[i].appendToSpan(paramView);
      i -= 1;
    }
  }
  
  private void applyPendingSavedState(AnchorInfo paramAnchorInfo)
  {
    if (mPendingSavedState.mSpanOffsetsSize > 0) {
      if (mPendingSavedState.mSpanOffsetsSize == mSpanCount)
      {
        int j = 0;
        if (j < mSpanCount)
        {
          mSpans[j].clear();
          int k = mPendingSavedState.mSpanOffsets[j];
          int i = k;
          if (k != Integer.MIN_VALUE) {
            if (!mPendingSavedState.mAnchorLayoutFromEnd) {
              break label102;
            }
          }
          label102:
          for (i = k + mPrimaryOrientation.getEndAfterPadding();; i = k + mPrimaryOrientation.getStartAfterPadding())
          {
            mSpans[j].setLine(i);
            j += 1;
            break;
          }
        }
      }
      else
      {
        mPendingSavedState.invalidateSpanInfo();
        mPendingSavedState.mAnchorPosition = mPendingSavedState.mVisibleAnchorPosition;
      }
    }
    mLastLayoutRTL = mPendingSavedState.mLastLayoutRTL;
    setReverseLayout(mPendingSavedState.mReverseLayout);
    resolveShouldLayoutReverse();
    if (mPendingSavedState.mAnchorPosition != -1) {
      mPendingScrollPosition = mPendingSavedState.mAnchorPosition;
    }
    for (mLayoutFromEnd = mPendingSavedState.mAnchorLayoutFromEnd;; mLayoutFromEnd = mShouldReverseLayout)
    {
      if (mPendingSavedState.mSpanLookupSize > 1)
      {
        mLazySpanLookup.mData = mPendingSavedState.mSpanLookup;
        mLazySpanLookup.mFullSpanItems = mPendingSavedState.mFullSpanItems;
      }
      return;
    }
  }
  
  private void attachViewToSpans(View paramView, LayoutParams paramLayoutParams, LayoutState paramLayoutState)
  {
    if (mLayoutDirection == 1)
    {
      if (mFullSpan)
      {
        appendViewToAllSpans(paramView);
        return;
      }
      mSpan.appendToSpan(paramView);
      return;
    }
    if (mFullSpan)
    {
      prependViewToAllSpans(paramView);
      return;
    }
    mSpan.prependToSpan(paramView);
  }
  
  private int calculateScrollDirectionForPosition(int paramInt)
  {
    int i = -1;
    if (getChildCount() == 0)
    {
      if (mShouldReverseLayout) {
        return 1;
      }
      return -1;
    }
    int j;
    if (paramInt < getFirstChildPosition())
    {
      j = 1;
      if (j == mShouldReverseLayout) {
        break label47;
      }
    }
    label47:
    for (paramInt = i;; paramInt = 1)
    {
      return paramInt;
      j = 0;
      break;
    }
  }
  
  private boolean checkForGaps()
  {
    if ((getChildCount() == 0) || (mGapStrategy == 0) || (!isAttachedToWindow())) {
      return false;
    }
    int j;
    if (mShouldReverseLayout) {
      j = getLastChildPosition();
    }
    for (int i = getFirstChildPosition(); (j == 0) && (hasGapsToFix() != null); i = getLastChildPosition())
    {
      mLazySpanLookup.clear();
      requestSimpleAnimationsInNextLayout();
      requestLayout();
      return true;
      j = getFirstChildPosition();
    }
    if (!mLaidOutInvalidFullSpan) {
      return false;
    }
    if (mShouldReverseLayout) {}
    StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem localFullSpanItem1;
    for (int k = -1;; k = 1)
    {
      localFullSpanItem1 = mLazySpanLookup.getFirstFullSpanItemInRange(j, i + 1, k, true);
      if (localFullSpanItem1 != null) {
        break;
      }
      mLaidOutInvalidFullSpan = false;
      mLazySpanLookup.forceInvalidateAfter(i + 1);
      return false;
    }
    StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem localFullSpanItem2 = mLazySpanLookup.getFirstFullSpanItemInRange(j, mPosition, k * -1, true);
    if (localFullSpanItem2 == null) {
      mLazySpanLookup.forceInvalidateAfter(mPosition);
    }
    for (;;)
    {
      requestSimpleAnimationsInNextLayout();
      requestLayout();
      return true;
      mLazySpanLookup.forceInvalidateAfter(mPosition + 1);
    }
  }
  
  private boolean checkSpanForGap(Span paramSpan)
  {
    if (mShouldReverseLayout)
    {
      if (paramSpan.getEndLine() >= mPrimaryOrientation.getEndAfterPadding()) {}
    }
    else {
      while (paramSpan.getStartLine() > mPrimaryOrientation.getStartAfterPadding()) {
        return true;
      }
    }
    return false;
  }
  
  private int computeScrollExtent(RecyclerView.State paramState)
  {
    boolean bool2 = false;
    if (getChildCount() == 0) {
      return 0;
    }
    ensureOrientationHelper();
    OrientationHelper localOrientationHelper = mPrimaryOrientation;
    if (!mSmoothScrollbarEnabled) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      View localView = findFirstVisibleItemClosestToStart(bool1, true);
      bool1 = bool2;
      if (!mSmoothScrollbarEnabled) {
        bool1 = true;
      }
      return ScrollbarHelper.computeScrollExtent(paramState, localOrientationHelper, localView, findFirstVisibleItemClosestToEnd(bool1, true), this, mSmoothScrollbarEnabled);
    }
  }
  
  private int computeScrollOffset(RecyclerView.State paramState)
  {
    boolean bool2 = false;
    if (getChildCount() == 0) {
      return 0;
    }
    ensureOrientationHelper();
    OrientationHelper localOrientationHelper = mPrimaryOrientation;
    if (!mSmoothScrollbarEnabled) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      View localView = findFirstVisibleItemClosestToStart(bool1, true);
      bool1 = bool2;
      if (!mSmoothScrollbarEnabled) {
        bool1 = true;
      }
      return ScrollbarHelper.computeScrollOffset(paramState, localOrientationHelper, localView, findFirstVisibleItemClosestToEnd(bool1, true), this, mSmoothScrollbarEnabled, mShouldReverseLayout);
    }
  }
  
  private int computeScrollRange(RecyclerView.State paramState)
  {
    boolean bool2 = false;
    if (getChildCount() == 0) {
      return 0;
    }
    ensureOrientationHelper();
    OrientationHelper localOrientationHelper = mPrimaryOrientation;
    if (!mSmoothScrollbarEnabled) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      View localView = findFirstVisibleItemClosestToStart(bool1, true);
      bool1 = bool2;
      if (!mSmoothScrollbarEnabled) {
        bool1 = true;
      }
      return ScrollbarHelper.computeScrollRange(paramState, localOrientationHelper, localView, findFirstVisibleItemClosestToEnd(bool1, true), this, mSmoothScrollbarEnabled);
    }
  }
  
  private StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem createFullSpanItemFromEnd(int paramInt)
  {
    StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem localFullSpanItem = new StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem();
    mGapPerSpan = new int[mSpanCount];
    int i = 0;
    while (i < mSpanCount)
    {
      mGapPerSpan[i] = (paramInt - mSpans[i].getEndLine(paramInt));
      i += 1;
    }
    return localFullSpanItem;
  }
  
  private StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem createFullSpanItemFromStart(int paramInt)
  {
    StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem localFullSpanItem = new StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem();
    mGapPerSpan = new int[mSpanCount];
    int i = 0;
    while (i < mSpanCount)
    {
      mGapPerSpan[i] = (mSpans[i].getStartLine(paramInt) - paramInt);
      i += 1;
    }
    return localFullSpanItem;
  }
  
  private void ensureOrientationHelper()
  {
    if (mPrimaryOrientation == null)
    {
      mPrimaryOrientation = OrientationHelper.createOrientationHelper(this, mOrientation);
      mSecondaryOrientation = OrientationHelper.createOrientationHelper(this, 1 - mOrientation);
      mLayoutState = new LayoutState();
    }
  }
  
  private int fill(RecyclerView.Recycler paramRecycler, LayoutState paramLayoutState, RecyclerView.State paramState)
  {
    mRemainingSpans.set(0, mSpanCount, true);
    int j;
    int k;
    label58:
    label61:
    View localView;
    LayoutParams localLayoutParams;
    int i3;
    int i1;
    label123:
    Span localSpan;
    label144:
    label155:
    label176:
    label208:
    int i2;
    int m;
    int n;
    StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem localFullSpanItem;
    if (mLayoutDirection == 1)
    {
      j = mEndLine + mAvailable;
      updateAllRemainingSpans(mLayoutDirection, j);
      if (!mShouldReverseLayout) {
        break label427;
      }
      k = mPrimaryOrientation.getEndAfterPadding();
      i = 0;
      if ((!paramLayoutState.hasMore(paramState)) || (mRemainingSpans.isEmpty())) {
        break label737;
      }
      localView = paramLayoutState.next(paramRecycler);
      localLayoutParams = (LayoutParams)localView.getLayoutParams();
      i3 = localLayoutParams.getViewLayoutPosition();
      i = mLazySpanLookup.getSpan(i3);
      if (i != -1) {
        break label439;
      }
      i1 = 1;
      if (i1 == 0) {
        break label455;
      }
      if (!mFullSpan) {
        break label445;
      }
      localSpan = mSpans[0];
      mLazySpanLookup.setSpan(i3, localSpan);
      mSpan = localSpan;
      if (mLayoutDirection != 1) {
        break label467;
      }
      addView(localView);
      measureChildWithDecorationsAndMargin(localView, localLayoutParams);
      if (mLayoutDirection != 1) {
        break label489;
      }
      if (!mFullSpan) {
        break label477;
      }
      i = getMaxEnd(k);
      i2 = i + mPrimaryOrientation.getDecoratedMeasurement(localView);
      m = i;
      n = i2;
      if (i1 != 0)
      {
        m = i;
        n = i2;
        if (mFullSpan)
        {
          localFullSpanItem = createFullSpanItemFromEnd(i);
          mGapDir = -1;
          mPosition = i3;
          mLazySpanLookup.addFullSpanItem(localFullSpanItem);
          n = i2;
          m = i;
        }
      }
      if ((mFullSpan) && (mItemDirection == -1))
      {
        if (i1 == 0) {
          break label601;
        }
        mLaidOutInvalidFullSpan = true;
      }
      attachViewToSpans(localView, localLayoutParams, paramLayoutState);
      if (!mFullSpan) {
        break label679;
      }
      i = mSecondaryOrientation.getStartAfterPadding();
      label341:
      i1 = i + mSecondaryOrientation.getDecoratedMeasurement(localView);
      if (mOrientation != 1) {
        break label702;
      }
      layoutDecoratedWithMargins(localView, i, m, i1, n);
      label377:
      if (!mFullSpan) {
        break label719;
      }
      updateAllRemainingSpans(mLayoutState.mLayoutDirection, j);
    }
    for (;;)
    {
      recycle(paramRecycler, mLayoutState);
      i = 1;
      break label61;
      j = mStartLine - mAvailable;
      break;
      label427:
      k = mPrimaryOrientation.getStartAfterPadding();
      break label58;
      label439:
      i1 = 0;
      break label123;
      label445:
      localSpan = getNextSpan(paramLayoutState);
      break label144;
      label455:
      localSpan = mSpans[i];
      break label155;
      label467:
      addView(localView, 0);
      break label176;
      label477:
      i = localSpan.getEndLine(k);
      break label208;
      label489:
      if (mFullSpan) {}
      for (i = getMinStart(k);; i = localSpan.getStartLine(k))
      {
        i2 = i - mPrimaryOrientation.getDecoratedMeasurement(localView);
        m = i2;
        n = i;
        if (i1 == 0) {
          break;
        }
        m = i2;
        n = i;
        if (!mFullSpan) {
          break;
        }
        localFullSpanItem = createFullSpanItemFromStart(i);
        mGapDir = 1;
        mPosition = i3;
        mLazySpanLookup.addFullSpanItem(localFullSpanItem);
        m = i2;
        n = i;
        break;
      }
      label601:
      if (mLayoutDirection == 1)
      {
        if (!areAllEndsEqual()) {}
        for (i = 1;; i = 0)
        {
          label619:
          if (i == 0) {
            break label671;
          }
          localFullSpanItem = mLazySpanLookup.getFullSpanItem(i3);
          if (localFullSpanItem != null) {
            mHasUnwantedGapAfter = true;
          }
          mLaidOutInvalidFullSpan = true;
          break;
        }
      }
      if (!areAllStartsEqual()) {}
      for (i = 1;; i = 0)
      {
        break label619;
        label671:
        break;
      }
      label679:
      i = mIndex * mSizePerSpan + mSecondaryOrientation.getStartAfterPadding();
      break label341;
      label702:
      layoutDecoratedWithMargins(localView, m, i, n, i1);
      break label377;
      label719:
      updateRemainingSpans(localSpan, mLayoutState.mLayoutDirection, j);
    }
    label737:
    if (i == 0) {
      recycle(paramRecycler, mLayoutState);
    }
    if (mLayoutState.mLayoutDirection == -1) {
      i = getMinStart(mPrimaryOrientation.getStartAfterPadding());
    }
    for (int i = mPrimaryOrientation.getStartAfterPadding() - i; i > 0; i = getMaxEnd(mPrimaryOrientation.getEndAfterPadding()) - mPrimaryOrientation.getEndAfterPadding()) {
      return Math.min(mAvailable, i);
    }
    return 0;
  }
  
  private int findFirstReferenceChildPosition(int paramInt)
  {
    int j = getChildCount();
    int i = 0;
    while (i < j)
    {
      int k = getPosition(getChildAt(i));
      if ((k >= 0) && (k < paramInt)) {
        return k;
      }
      i += 1;
    }
    return 0;
  }
  
  private int findLastReferenceChildPosition(int paramInt)
  {
    int i = getChildCount() - 1;
    while (i >= 0)
    {
      int j = getPosition(getChildAt(i));
      if ((j >= 0) && (j < paramInt)) {
        return j;
      }
      i -= 1;
    }
    return 0;
  }
  
  private void fixEndGap(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, boolean paramBoolean)
  {
    int i = getMaxEnd(mPrimaryOrientation.getEndAfterPadding());
    i = mPrimaryOrientation.getEndAfterPadding() - i;
    if (i > 0)
    {
      i -= -scrollBy(-i, paramRecycler, paramState);
      if ((paramBoolean) && (i > 0)) {
        mPrimaryOrientation.offsetChildren(i);
      }
    }
  }
  
  private void fixStartGap(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, boolean paramBoolean)
  {
    int i = getMinStart(mPrimaryOrientation.getStartAfterPadding()) - mPrimaryOrientation.getStartAfterPadding();
    if (i > 0)
    {
      i -= scrollBy(i, paramRecycler, paramState);
      if ((paramBoolean) && (i > 0)) {
        mPrimaryOrientation.offsetChildren(-i);
      }
    }
  }
  
  private int getFirstChildPosition()
  {
    if (getChildCount() == 0) {
      return 0;
    }
    return getPosition(getChildAt(0));
  }
  
  private int getLastChildPosition()
  {
    int i = getChildCount();
    if (i == 0) {
      return 0;
    }
    return getPosition(getChildAt(i - 1));
  }
  
  private int getMaxEnd(int paramInt)
  {
    int j = mSpans[0].getEndLine(paramInt);
    int i = 1;
    while (i < mSpanCount)
    {
      int m = mSpans[i].getEndLine(paramInt);
      int k = j;
      if (m > j) {
        k = m;
      }
      i += 1;
      j = k;
    }
    return j;
  }
  
  private int getMaxStart(int paramInt)
  {
    int j = mSpans[0].getStartLine(paramInt);
    int i = 1;
    while (i < mSpanCount)
    {
      int m = mSpans[i].getStartLine(paramInt);
      int k = j;
      if (m > j) {
        k = m;
      }
      i += 1;
      j = k;
    }
    return j;
  }
  
  private int getMinEnd(int paramInt)
  {
    int j = mSpans[0].getEndLine(paramInt);
    int i = 1;
    while (i < mSpanCount)
    {
      int m = mSpans[i].getEndLine(paramInt);
      int k = j;
      if (m < j) {
        k = m;
      }
      i += 1;
      j = k;
    }
    return j;
  }
  
  private int getMinStart(int paramInt)
  {
    int j = mSpans[0].getStartLine(paramInt);
    int i = 1;
    while (i < mSpanCount)
    {
      int m = mSpans[i].getStartLine(paramInt);
      int k = j;
      if (m < j) {
        k = m;
      }
      i += 1;
      j = k;
    }
    return j;
  }
  
  private Span getNextSpan(LayoutState paramLayoutState)
  {
    int i;
    int k;
    if (preferLastSpan(mLayoutDirection))
    {
      i = mSpanCount - 1;
      k = -1;
    }
    int i1;
    int n;
    for (int j = -1; mLayoutDirection == 1; j = 1)
    {
      paramLayoutState = null;
      m = Integer.MAX_VALUE;
      i2 = mPrimaryOrientation.getStartAfterPadding();
      for (;;)
      {
        localObject = paramLayoutState;
        if (i == k) {
          break;
        }
        localObject = mSpans[i];
        i1 = ((Span)localObject).getEndLine(i2);
        n = m;
        if (i1 < m)
        {
          paramLayoutState = (LayoutState)localObject;
          n = i1;
        }
        i += j;
        m = n;
      }
      i = 0;
      k = mSpanCount;
    }
    paramLayoutState = null;
    int m = Integer.MIN_VALUE;
    int i2 = mPrimaryOrientation.getEndAfterPadding();
    while (i != k)
    {
      localObject = mSpans[i];
      i1 = ((Span)localObject).getStartLine(i2);
      n = m;
      if (i1 > m)
      {
        paramLayoutState = (LayoutState)localObject;
        n = i1;
      }
      i += j;
      m = n;
    }
    Object localObject = paramLayoutState;
    return localObject;
  }
  
  private int getSpecForDimension(int paramInt1, int paramInt2)
  {
    if (paramInt1 < 0) {
      return paramInt2;
    }
    return View.MeasureSpec.makeMeasureSpec(paramInt1, 1073741824);
  }
  
  private void handleUpdate(int paramInt1, int paramInt2, int paramInt3)
  {
    int k;
    int j;
    int i;
    if (mShouldReverseLayout)
    {
      k = getLastChildPosition();
      if (paramInt3 != 3) {
        break label100;
      }
      if (paramInt1 >= paramInt2) {
        break label89;
      }
      j = paramInt2 + 1;
      i = paramInt1;
      label31:
      mLazySpanLookup.invalidateAfter(i);
      switch (paramInt3)
      {
      case 2: 
      default: 
        label72:
        if (j > k) {
          break;
        }
      }
    }
    for (;;)
    {
      return;
      k = getFirstChildPosition();
      break;
      label89:
      j = paramInt1 + 1;
      i = paramInt2;
      break label31;
      label100:
      i = paramInt1;
      j = paramInt1 + paramInt2;
      break label31;
      mLazySpanLookup.offsetForAddition(paramInt1, paramInt2);
      break label72;
      mLazySpanLookup.offsetForRemoval(paramInt1, paramInt2);
      break label72;
      mLazySpanLookup.offsetForRemoval(paramInt1, 1);
      mLazySpanLookup.offsetForAddition(paramInt2, 1);
      break label72;
      if (mShouldReverseLayout) {}
      for (paramInt1 = getFirstChildPosition(); i <= paramInt1; paramInt1 = getLastChildPosition())
      {
        requestLayout();
        return;
      }
    }
  }
  
  private void layoutDecoratedWithMargins(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    layoutDecorated(paramView, paramInt1 + leftMargin, paramInt2 + topMargin, paramInt3 - rightMargin, paramInt4 - bottomMargin);
  }
  
  private void measureChildWithDecorationsAndMargin(View paramView, int paramInt1, int paramInt2)
  {
    calculateItemDecorationsForChild(paramView, mTmpRect);
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    paramView.measure(updateSpecWithExtra(paramInt1, leftMargin + mTmpRect.left, rightMargin + mTmpRect.right), updateSpecWithExtra(paramInt2, topMargin + mTmpRect.top, bottomMargin + mTmpRect.bottom));
  }
  
  private void measureChildWithDecorationsAndMargin(View paramView, LayoutParams paramLayoutParams)
  {
    if (mFullSpan)
    {
      if (mOrientation == 1)
      {
        measureChildWithDecorationsAndMargin(paramView, mFullSizeSpec, getSpecForDimension(height, mHeightSpec));
        return;
      }
      measureChildWithDecorationsAndMargin(paramView, getSpecForDimension(width, mWidthSpec), mFullSizeSpec);
      return;
    }
    if (mOrientation == 1)
    {
      measureChildWithDecorationsAndMargin(paramView, mWidthSpec, getSpecForDimension(height, mHeightSpec));
      return;
    }
    measureChildWithDecorationsAndMargin(paramView, getSpecForDimension(width, mWidthSpec), mHeightSpec);
  }
  
  private boolean preferLastSpan(int paramInt)
  {
    int i;
    if (mOrientation == 0) {
      if (paramInt == -1)
      {
        i = 1;
        if (i == mShouldReverseLayout) {
          break label29;
        }
      }
    }
    label29:
    label63:
    label66:
    for (;;)
    {
      return true;
      i = 0;
      break;
      return false;
      if (paramInt == -1)
      {
        i = 1;
        if (i != mShouldReverseLayout) {
          break label63;
        }
      }
      for (i = 1;; i = 0)
      {
        if (i == isLayoutRTL()) {
          break label66;
        }
        return false;
        i = 0;
        break;
      }
    }
  }
  
  private void prependViewToAllSpans(View paramView)
  {
    int i = mSpanCount - 1;
    while (i >= 0)
    {
      mSpans[i].prependToSpan(paramView);
      i -= 1;
    }
  }
  
  private void recycle(RecyclerView.Recycler paramRecycler, LayoutState paramLayoutState)
  {
    if (mAvailable == 0)
    {
      if (mLayoutDirection == -1)
      {
        recycleFromEnd(paramRecycler, mEndLine);
        return;
      }
      recycleFromStart(paramRecycler, mStartLine);
      return;
    }
    if (mLayoutDirection == -1)
    {
      i = mStartLine - getMaxStart(mStartLine);
      if (i < 0) {}
      for (i = mEndLine;; i = mEndLine - Math.min(i, mAvailable))
      {
        recycleFromEnd(paramRecycler, i);
        return;
      }
    }
    int i = getMinEnd(mEndLine) - mEndLine;
    if (i < 0) {}
    for (i = mStartLine;; i = mStartLine + Math.min(i, mAvailable))
    {
      recycleFromStart(paramRecycler, i);
      return;
    }
  }
  
  private void recycleFromEnd(RecyclerView.Recycler paramRecycler, int paramInt)
  {
    int i = getChildCount() - 1;
    for (;;)
    {
      View localView;
      LayoutParams localLayoutParams;
      if (i >= 0)
      {
        localView = getChildAt(i);
        if (mPrimaryOrientation.getDecoratedStart(localView) >= paramInt)
        {
          localLayoutParams = (LayoutParams)localView.getLayoutParams();
          if (!mFullSpan) {
            break label119;
          }
          j = 0;
          if (j >= mSpanCount) {
            break label88;
          }
          if (mSpans[j].mViews.size() != 1) {
            break label79;
          }
        }
      }
      label79:
      label88:
      label119:
      while (mSpan.mViews.size() == 1)
      {
        for (;;)
        {
          return;
          j += 1;
        }
        int j = 0;
        while (j < mSpanCount)
        {
          mSpans[j].popEnd();
          j += 1;
        }
      }
      mSpan.popEnd();
      removeAndRecycleView(localView, paramRecycler);
      i -= 1;
    }
  }
  
  private void recycleFromStart(RecyclerView.Recycler paramRecycler, int paramInt)
  {
    for (;;)
    {
      View localView;
      LayoutParams localLayoutParams;
      if (getChildCount() > 0)
      {
        localView = getChildAt(0);
        if (mPrimaryOrientation.getDecoratedEnd(localView) <= paramInt)
        {
          localLayoutParams = (LayoutParams)localView.getLayoutParams();
          if (!mFullSpan) {
            break label105;
          }
          i = 0;
          if (i >= mSpanCount) {
            break label79;
          }
          if (mSpans[i].mViews.size() != 1) {
            break label72;
          }
        }
      }
      label72:
      label79:
      label105:
      while (mSpan.mViews.size() == 1)
      {
        for (;;)
        {
          return;
          i += 1;
        }
        int i = 0;
        while (i < mSpanCount)
        {
          mSpans[i].popStart();
          i += 1;
        }
      }
      mSpan.popStart();
      removeAndRecycleView(localView, paramRecycler);
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
  
  private void setLayoutStateDirection(int paramInt)
  {
    int i = 1;
    mLayoutState.mLayoutDirection = paramInt;
    LayoutState localLayoutState = mLayoutState;
    boolean bool2 = mShouldReverseLayout;
    boolean bool1;
    if (paramInt == -1)
    {
      bool1 = true;
      if (bool2 != bool1) {
        break label49;
      }
    }
    label49:
    for (paramInt = i;; paramInt = -1)
    {
      mItemDirection = paramInt;
      return;
      bool1 = false;
      break;
    }
  }
  
  private void updateAllRemainingSpans(int paramInt1, int paramInt2)
  {
    int i = 0;
    if (i < mSpanCount)
    {
      if (mSpans[i].mViews.isEmpty()) {}
      for (;;)
      {
        i += 1;
        break;
        updateRemainingSpans(mSpans[i], paramInt1, paramInt2);
      }
    }
  }
  
  private boolean updateAnchorFromChildren(RecyclerView.State paramState, AnchorInfo paramAnchorInfo)
  {
    if (mLastLayoutFromEnd) {}
    for (int i = findLastReferenceChildPosition(paramState.getItemCount());; i = findFirstReferenceChildPosition(paramState.getItemCount()))
    {
      mPosition = i;
      mOffset = Integer.MIN_VALUE;
      return true;
    }
  }
  
  private void updateLayoutState(int paramInt, RecyclerView.State paramState)
  {
    boolean bool1 = false;
    mLayoutState.mAvailable = 0;
    mLayoutState.mCurrentPosition = paramInt;
    int k = 0;
    int m = 0;
    int i = m;
    int j = k;
    if (isSmoothScrolling())
    {
      int n = paramState.getTargetScrollPosition();
      i = m;
      j = k;
      if (n != -1)
      {
        boolean bool2 = mShouldReverseLayout;
        if (n < paramInt) {
          bool1 = true;
        }
        if (bool2 != bool1) {
          break label133;
        }
        i = mPrimaryOrientation.getTotalSpace();
        j = k;
      }
    }
    while (getClipToPadding())
    {
      mLayoutState.mStartLine = (mPrimaryOrientation.getStartAfterPadding() - j);
      mLayoutState.mEndLine = (mPrimaryOrientation.getEndAfterPadding() + i);
      return;
      label133:
      j = mPrimaryOrientation.getTotalSpace();
      i = m;
    }
    mLayoutState.mEndLine = (mPrimaryOrientation.getEnd() + i);
    mLayoutState.mStartLine = (-j);
  }
  
  private void updateRemainingSpans(Span paramSpan, int paramInt1, int paramInt2)
  {
    int i = paramSpan.getDeletedSize();
    if (paramInt1 == -1) {
      if (paramSpan.getStartLine() + i <= paramInt2) {
        mRemainingSpans.set(mIndex, false);
      }
    }
    while (paramSpan.getEndLine() - i < paramInt2) {
      return;
    }
    mRemainingSpans.set(mIndex, false);
  }
  
  private int updateSpecWithExtra(int paramInt1, int paramInt2, int paramInt3)
  {
    if ((paramInt2 == 0) && (paramInt3 == 0)) {}
    int i;
    do
    {
      return paramInt1;
      i = View.MeasureSpec.getMode(paramInt1);
    } while ((i != Integer.MIN_VALUE) && (i != 1073741824));
    return View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(paramInt1) - paramInt2 - paramInt3, i);
  }
  
  boolean areAllEndsEqual()
  {
    int j = mSpans[0].getEndLine(Integer.MIN_VALUE);
    int i = 1;
    while (i < mSpanCount)
    {
      if (mSpans[i].getEndLine(Integer.MIN_VALUE) != j) {
        return false;
      }
      i += 1;
    }
    return true;
  }
  
  boolean areAllStartsEqual()
  {
    int j = mSpans[0].getStartLine(Integer.MIN_VALUE);
    int i = 1;
    while (i < mSpanCount)
    {
      if (mSpans[i].getStartLine(Integer.MIN_VALUE) != j) {
        return false;
      }
      i += 1;
    }
    return true;
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
  
  public boolean checkLayoutParams(RecyclerView.LayoutParams paramLayoutParams)
  {
    return paramLayoutParams instanceof LayoutParams;
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
  
  View findFirstVisibleItemClosestToEnd(boolean paramBoolean1, boolean paramBoolean2)
  {
    ensureOrientationHelper();
    int j = mPrimaryOrientation.getStartAfterPadding();
    int k = mPrimaryOrientation.getEndAfterPadding();
    Object localObject1 = null;
    int i = getChildCount() - 1;
    if (i >= 0)
    {
      View localView = getChildAt(i);
      int m = mPrimaryOrientation.getDecoratedStart(localView);
      int n = mPrimaryOrientation.getDecoratedEnd(localView);
      Object localObject2 = localObject1;
      if (n > j)
      {
        if (m < k) {
          break label98;
        }
        localObject2 = localObject1;
      }
      for (;;)
      {
        i -= 1;
        localObject1 = localObject2;
        break;
        label98:
        if ((n <= k) || (!paramBoolean1)) {
          return localView;
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
    return localObject1;
  }
  
  View findFirstVisibleItemClosestToStart(boolean paramBoolean1, boolean paramBoolean2)
  {
    ensureOrientationHelper();
    int j = mPrimaryOrientation.getStartAfterPadding();
    int k = mPrimaryOrientation.getEndAfterPadding();
    int m = getChildCount();
    Object localObject1 = null;
    int i = 0;
    if (i < m)
    {
      View localView = getChildAt(i);
      int n = mPrimaryOrientation.getDecoratedStart(localView);
      Object localObject2 = localObject1;
      if (mPrimaryOrientation.getDecoratedEnd(localView) > j)
      {
        if (n < k) {
          break label97;
        }
        localObject2 = localObject1;
      }
      for (;;)
      {
        i += 1;
        localObject1 = localObject2;
        break;
        label97:
        if ((n >= j) || (!paramBoolean1)) {
          return localView;
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
    return localObject1;
  }
  
  int findFirstVisibleItemPositionInt()
  {
    if (mShouldReverseLayout) {}
    for (View localView = findFirstVisibleItemClosestToEnd(true, true); localView == null; localView = findFirstVisibleItemClosestToStart(true, true)) {
      return -1;
    }
    return getPosition(localView);
  }
  
  public int[] findFirstVisibleItemPositions(int[] paramArrayOfInt)
  {
    int[] arrayOfInt;
    if (paramArrayOfInt == null) {
      arrayOfInt = new int[mSpanCount];
    }
    do
    {
      int i = 0;
      while (i < mSpanCount)
      {
        arrayOfInt[i] = mSpans[i].findFirstVisibleItemPosition();
        i += 1;
      }
      arrayOfInt = paramArrayOfInt;
    } while (paramArrayOfInt.length >= mSpanCount);
    throw new IllegalArgumentException("Provided int[]'s size must be more than or equal to span count. Expected:" + mSpanCount + ", array size:" + paramArrayOfInt.length);
    return arrayOfInt;
  }
  
  public RecyclerView.LayoutParams generateDefaultLayoutParams()
  {
    return new LayoutParams(-2, -2);
  }
  
  public RecyclerView.LayoutParams generateLayoutParams(Context paramContext, AttributeSet paramAttributeSet)
  {
    return new LayoutParams(paramContext, paramAttributeSet);
  }
  
  public RecyclerView.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    if ((paramLayoutParams instanceof ViewGroup.MarginLayoutParams)) {
      return new LayoutParams((ViewGroup.MarginLayoutParams)paramLayoutParams);
    }
    return new LayoutParams(paramLayoutParams);
  }
  
  public int getColumnCountForAccessibility(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    if (mOrientation == 1) {
      return mSpanCount;
    }
    return super.getColumnCountForAccessibility(paramRecycler, paramState);
  }
  
  public int getRowCountForAccessibility(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    if (mOrientation == 0) {
      return mSpanCount;
    }
    return super.getRowCountForAccessibility(paramRecycler, paramState);
  }
  
  public int getSpanCount()
  {
    return mSpanCount;
  }
  
  View hasGapsToFix()
  {
    int i = getChildCount() - 1;
    BitSet localBitSet = new BitSet(mSpanCount);
    localBitSet.set(0, mSpanCount, true);
    int j;
    int k;
    if ((mOrientation == 1) && (isLayoutRTL()))
    {
      j = 1;
      if (!mShouldReverseLayout) {
        break label130;
      }
      k = 0 - 1;
      label59:
      if (i >= k) {
        break label143;
      }
    }
    int n;
    View localView;
    LayoutParams localLayoutParams;
    label122:
    label130:
    label143:
    for (int m = 1;; m = -1)
    {
      n = i;
      if (n == k) {
        break label351;
      }
      localView = getChildAt(n);
      localLayoutParams = (LayoutParams)localView.getLayoutParams();
      if (!localBitSet.get(mSpan.mIndex)) {
        break label162;
      }
      if (!checkSpanForGap(mSpan)) {
        break label149;
      }
      return localView;
      j = -1;
      break;
      m = 0;
      k = i + 1;
      i = m;
      break label59;
    }
    label149:
    localBitSet.clear(mSpan.mIndex);
    label162:
    if (mFullSpan) {}
    label170:
    label247:
    label283:
    label338:
    label340:
    label345:
    label349:
    for (;;)
    {
      n += m;
      break;
      if (n + m != k)
      {
        Object localObject = getChildAt(n + m);
        i = 0;
        int i2;
        if (mShouldReverseLayout)
        {
          i1 = mPrimaryOrientation.getDecoratedEnd(localView);
          i2 = mPrimaryOrientation.getDecoratedEnd((View)localObject);
          if (i1 < i2) {
            break label122;
          }
          if (i1 == i2) {
            i = 1;
          }
          if (i == 0) {
            break label338;
          }
          localObject = (LayoutParams)((View)localObject).getLayoutParams();
          if (mSpan.mIndex - mSpan.mIndex >= 0) {
            break label340;
          }
          i = 1;
          if (j >= 0) {
            break label345;
          }
        }
        for (int i1 = 1;; i1 = 0)
        {
          if (i == i1) {
            break label349;
          }
          return localView;
          i1 = mPrimaryOrientation.getDecoratedStart(localView);
          i2 = mPrimaryOrientation.getDecoratedStart((View)localObject);
          if (i1 > i2) {
            break;
          }
          if (i1 != i2) {
            break label247;
          }
          i = 1;
          break label247;
          break label170;
          i = 0;
          break label283;
        }
      }
    }
    label351:
    return null;
  }
  
  public void invalidateSpanAssignments()
  {
    mLazySpanLookup.clear();
    requestLayout();
  }
  
  boolean isLayoutRTL()
  {
    return getLayoutDirection() == 1;
  }
  
  public void offsetChildrenHorizontal(int paramInt)
  {
    super.offsetChildrenHorizontal(paramInt);
    int i = 0;
    while (i < mSpanCount)
    {
      mSpans[i].onOffset(paramInt);
      i += 1;
    }
  }
  
  public void offsetChildrenVertical(int paramInt)
  {
    super.offsetChildrenVertical(paramInt);
    int i = 0;
    while (i < mSpanCount)
    {
      mSpans[i].onOffset(paramInt);
      i += 1;
    }
  }
  
  public void onDetachedFromWindow(RecyclerView paramRecyclerView, RecyclerView.Recycler paramRecycler)
  {
    removeCallbacks(mCheckForGapsRunnable);
    int i = 0;
    while (i < mSpanCount)
    {
      mSpans[i].clear();
      i += 1;
    }
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    View localView1;
    View localView2;
    if (getChildCount() > 0)
    {
      paramAccessibilityEvent = AccessibilityEventCompat.asRecord(paramAccessibilityEvent);
      localView1 = findFirstVisibleItemClosestToStart(false, true);
      localView2 = findFirstVisibleItemClosestToEnd(false, true);
      if ((localView1 != null) && (localView2 != null)) {}
    }
    else
    {
      return;
    }
    int i = getPosition(localView1);
    int j = getPosition(localView2);
    if (i < j)
    {
      paramAccessibilityEvent.setFromIndex(i);
      paramAccessibilityEvent.setToIndex(j);
      return;
    }
    paramAccessibilityEvent.setFromIndex(j);
    paramAccessibilityEvent.setToIndex(i);
  }
  
  public void onInitializeAccessibilityNodeInfoForItem(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, View paramView, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
  {
    paramRecycler = paramView.getLayoutParams();
    if (!(paramRecycler instanceof LayoutParams))
    {
      super.onInitializeAccessibilityNodeInfoForItem(paramView, paramAccessibilityNodeInfoCompat);
      return;
    }
    paramRecycler = (LayoutParams)paramRecycler;
    if (mOrientation == 0)
    {
      j = paramRecycler.getSpanIndex();
      if (mFullSpan) {}
      for (i = mSpanCount;; i = 1)
      {
        paramAccessibilityNodeInfoCompat.setCollectionItemInfo(AccessibilityNodeInfoCompat.CollectionItemInfoCompat.obtain(j, i, -1, -1, mFullSpan, false));
        return;
      }
    }
    int j = paramRecycler.getSpanIndex();
    if (mFullSpan) {}
    for (int i = mSpanCount;; i = 1)
    {
      paramAccessibilityNodeInfoCompat.setCollectionItemInfo(AccessibilityNodeInfoCompat.CollectionItemInfoCompat.obtain(-1, -1, j, i, mFullSpan, false));
      return;
    }
  }
  
  public void onItemsAdded(RecyclerView paramRecyclerView, int paramInt1, int paramInt2)
  {
    handleUpdate(paramInt1, paramInt2, 0);
  }
  
  public void onItemsChanged(RecyclerView paramRecyclerView)
  {
    mLazySpanLookup.clear();
    requestLayout();
  }
  
  public void onItemsMoved(RecyclerView paramRecyclerView, int paramInt1, int paramInt2, int paramInt3)
  {
    handleUpdate(paramInt1, paramInt2, 3);
  }
  
  public void onItemsRemoved(RecyclerView paramRecyclerView, int paramInt1, int paramInt2)
  {
    handleUpdate(paramInt1, paramInt2, 1);
  }
  
  public void onItemsUpdated(RecyclerView paramRecyclerView, int paramInt1, int paramInt2)
  {
    handleUpdate(paramInt1, paramInt2, 2);
  }
  
  public void onLayoutChildren(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    int j = 1;
    ensureOrientationHelper();
    AnchorInfo localAnchorInfo = mAnchorInfo;
    localAnchorInfo.reset();
    if (mPendingSavedState != null) {
      applyPendingSavedState(localAnchorInfo);
    }
    for (;;)
    {
      updateAnchorInfoForLayout(paramState, localAnchorInfo);
      if ((mPendingSavedState == null) && ((mLayoutFromEnd != mLastLayoutFromEnd) || (isLayoutRTL() != mLastLayoutRTL)))
      {
        mLazySpanLookup.clear();
        mInvalidateOffsets = true;
      }
      if ((getChildCount() <= 0) || ((mPendingSavedState != null) && (mPendingSavedState.mSpanOffsetsSize >= 1))) {
        break label215;
      }
      if (!mInvalidateOffsets) {
        break;
      }
      i = 0;
      while (i < mSpanCount)
      {
        mSpans[i].clear();
        if (mOffset != Integer.MIN_VALUE) {
          mSpans[i].setLine(mOffset);
        }
        i += 1;
      }
      resolveShouldLayoutReverse();
      mLayoutFromEnd = mShouldReverseLayout;
    }
    int i = 0;
    while (i < mSpanCount)
    {
      mSpans[i].cacheReferenceLineAndClear(mShouldReverseLayout, mOffset);
      i += 1;
    }
    label215:
    detachAndScrapAttachedViews(paramRecycler);
    mLaidOutInvalidFullSpan = false;
    updateMeasureSpecs();
    updateLayoutState(mPosition, paramState);
    if (mLayoutFromEnd)
    {
      setLayoutStateDirection(-1);
      fill(paramRecycler, mLayoutState, paramState);
      setLayoutStateDirection(1);
      mLayoutState.mCurrentPosition = (mPosition + mLayoutState.mItemDirection);
      fill(paramRecycler, mLayoutState, paramState);
      if (getChildCount() > 0)
      {
        if (!mShouldReverseLayout) {
          break label478;
        }
        fixEndGap(paramRecycler, paramState, true);
        fixStartGap(paramRecycler, paramState, false);
      }
      label327:
      if (!paramState.isPreLayout())
      {
        if ((mGapStrategy == 0) || (getChildCount() <= 0)) {
          break label495;
        }
        i = j;
        if (!mLaidOutInvalidFullSpan) {
          if (hasGapsToFix() == null) {
            break label495;
          }
        }
      }
    }
    label478:
    label495:
    for (i = j;; i = 0)
    {
      if (i != 0)
      {
        removeCallbacks(mCheckForGapsRunnable);
        postOnAnimation(mCheckForGapsRunnable);
      }
      mPendingScrollPosition = -1;
      mPendingScrollPositionOffset = Integer.MIN_VALUE;
      mLastLayoutFromEnd = mLayoutFromEnd;
      mLastLayoutRTL = isLayoutRTL();
      mPendingSavedState = null;
      return;
      setLayoutStateDirection(1);
      fill(paramRecycler, mLayoutState, paramState);
      setLayoutStateDirection(-1);
      mLayoutState.mCurrentPosition = (mPosition + mLayoutState.mItemDirection);
      fill(paramRecycler, mLayoutState, paramState);
      break;
      fixStartGap(paramRecycler, paramState, true);
      fixEndGap(paramRecycler, paramState, false);
      break label327;
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
    Object localObject;
    if (mPendingSavedState != null) {
      localObject = new SavedState(mPendingSavedState);
    }
    SavedState localSavedState;
    int i;
    label134:
    int j;
    label171:
    do
    {
      return localObject;
      localSavedState = new SavedState();
      mReverseLayout = mReverseLayout;
      mAnchorLayoutFromEnd = mLastLayoutFromEnd;
      mLastLayoutRTL = mLastLayoutRTL;
      if ((mLazySpanLookup == null) || (mLazySpanLookup.mData == null)) {
        break;
      }
      mSpanLookup = mLazySpanLookup.mData;
      mSpanLookupSize = mSpanLookup.length;
      mFullSpanItems = mLazySpanLookup.mFullSpanItems;
      if (getChildCount() <= 0) {
        break label285;
      }
      ensureOrientationHelper();
      if (!mLastLayoutFromEnd) {
        break label244;
      }
      i = getLastChildPosition();
      mAnchorPosition = i;
      mVisibleAnchorPosition = findFirstVisibleItemPositionInt();
      mSpanOffsetsSize = mSpanCount;
      mSpanOffsets = new int[mSpanCount];
      j = 0;
      localObject = localSavedState;
    } while (j >= mSpanCount);
    int k;
    if (mLastLayoutFromEnd)
    {
      k = mSpans[j].getEndLine(Integer.MIN_VALUE);
      i = k;
      if (k != Integer.MIN_VALUE) {
        i = k - mPrimaryOrientation.getEndAfterPadding();
      }
    }
    for (;;)
    {
      mSpanOffsets[j] = i;
      j += 1;
      break label171;
      mSpanLookupSize = 0;
      break;
      label244:
      i = getFirstChildPosition();
      break label134;
      k = mSpans[j].getStartLine(Integer.MIN_VALUE);
      i = k;
      if (k != Integer.MIN_VALUE) {
        i = k - mPrimaryOrientation.getStartAfterPadding();
      }
    }
    label285:
    mAnchorPosition = -1;
    mVisibleAnchorPosition = -1;
    mSpanOffsetsSize = 0;
    return localSavedState;
  }
  
  public void onScrollStateChanged(int paramInt)
  {
    if (paramInt == 0) {
      checkForGaps();
    }
  }
  
  int scrollBy(int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    ensureOrientationHelper();
    int i;
    int j;
    if (paramInt > 0)
    {
      i = 1;
      j = getLastChildPosition();
      updateLayoutState(j, paramState);
      setLayoutStateDirection(i);
      mLayoutState.mCurrentPosition = (mLayoutState.mItemDirection + j);
      j = Math.abs(paramInt);
      mLayoutState.mAvailable = j;
      i = fill(paramRecycler, mLayoutState, paramState);
      if (j >= i) {
        break label112;
      }
    }
    for (;;)
    {
      mPrimaryOrientation.offsetChildren(-paramInt);
      mLastLayoutFromEnd = mShouldReverseLayout;
      return paramInt;
      i = -1;
      j = getFirstChildPosition();
      break;
      label112:
      if (paramInt < 0) {
        paramInt = -i;
      } else {
        paramInt = i;
      }
    }
  }
  
  public int scrollHorizontallyBy(int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    return scrollBy(paramInt, paramRecycler, paramState);
  }
  
  public void scrollToPosition(int paramInt)
  {
    if ((mPendingSavedState != null) && (mPendingSavedState.mAnchorPosition != paramInt)) {
      mPendingSavedState.invalidateAnchorPositionInfo();
    }
    mPendingScrollPosition = paramInt;
    mPendingScrollPositionOffset = Integer.MIN_VALUE;
    requestLayout();
  }
  
  public int scrollVerticallyBy(int paramInt, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    return scrollBy(paramInt, paramRecycler, paramState);
  }
  
  public void setGapStrategy(int paramInt)
  {
    assertNotInLayoutOrScroll(null);
    if (paramInt == mGapStrategy) {
      return;
    }
    if ((paramInt != 0) && (paramInt != 2)) {
      throw new IllegalArgumentException("invalid gap strategy. Must be GAP_HANDLING_NONE or GAP_HANDLING_MOVE_ITEMS_BETWEEN_SPANS");
    }
    mGapStrategy = paramInt;
    requestLayout();
  }
  
  public void setReverseLayout(boolean paramBoolean)
  {
    assertNotInLayoutOrScroll(null);
    if ((mPendingSavedState != null) && (mPendingSavedState.mReverseLayout != paramBoolean)) {
      mPendingSavedState.mReverseLayout = paramBoolean;
    }
    mReverseLayout = paramBoolean;
    requestLayout();
  }
  
  public void setSpanCount(int paramInt)
  {
    assertNotInLayoutOrScroll(null);
    if (paramInt != mSpanCount)
    {
      invalidateSpanAssignments();
      mSpanCount = paramInt;
      mRemainingSpans = new BitSet(mSpanCount);
      mSpans = new Span[mSpanCount];
      paramInt = 0;
      while (paramInt < mSpanCount)
      {
        mSpans[paramInt] = new Span(paramInt, null);
        paramInt += 1;
      }
      requestLayout();
    }
  }
  
  public void smoothScrollToPosition(RecyclerView paramRecyclerView, RecyclerView.State paramState, int paramInt)
  {
    paramRecyclerView = new LinearSmoothScroller(paramRecyclerView.getContext())
    {
      public PointF computeScrollVectorForPosition(int paramAnonymousInt)
      {
        paramAnonymousInt = StaggeredGridLayoutManager.this.calculateScrollDirectionForPosition(paramAnonymousInt);
        if (paramAnonymousInt == 0) {
          return null;
        }
        if (mOrientation == 0) {
          return new PointF(paramAnonymousInt, 0.0F);
        }
        return new PointF(0.0F, paramAnonymousInt);
      }
    };
    paramRecyclerView.setTargetPosition(paramInt);
    startSmoothScroll(paramRecyclerView);
  }
  
  public boolean supportsPredictiveItemAnimations()
  {
    return mPendingSavedState == null;
  }
  
  boolean updateAnchorFromPendingData(RecyclerView.State paramState, AnchorInfo paramAnchorInfo)
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
    if ((mPendingSavedState == null) || (mPendingSavedState.mAnchorPosition == -1) || (mPendingSavedState.mSpanOffsetsSize < 1))
    {
      paramState = findViewByPosition(mPendingScrollPosition);
      if (paramState != null)
      {
        if (mShouldReverseLayout) {}
        for (int i = getLastChildPosition();; i = getFirstChildPosition())
        {
          mPosition = i;
          if (mPendingScrollPositionOffset == Integer.MIN_VALUE) {
            break label188;
          }
          if (!mLayoutFromEnd) {
            break;
          }
          mOffset = (mPrimaryOrientation.getEndAfterPadding() - mPendingScrollPositionOffset - mPrimaryOrientation.getDecoratedEnd(paramState));
          return true;
        }
        mOffset = (mPrimaryOrientation.getStartAfterPadding() + mPendingScrollPositionOffset - mPrimaryOrientation.getDecoratedStart(paramState));
        return true;
        label188:
        if (mPrimaryOrientation.getDecoratedMeasurement(paramState) > mPrimaryOrientation.getTotalSpace())
        {
          if (mLayoutFromEnd) {}
          for (i = mPrimaryOrientation.getEndAfterPadding();; i = mPrimaryOrientation.getStartAfterPadding())
          {
            mOffset = i;
            return true;
          }
        }
        i = mPrimaryOrientation.getDecoratedStart(paramState) - mPrimaryOrientation.getStartAfterPadding();
        if (i < 0)
        {
          mOffset = (-i);
          return true;
        }
        i = mPrimaryOrientation.getEndAfterPadding() - mPrimaryOrientation.getDecoratedEnd(paramState);
        if (i < 0)
        {
          mOffset = i;
          return true;
        }
        mOffset = Integer.MIN_VALUE;
        return true;
      }
      mPosition = mPendingScrollPosition;
      if (mPendingScrollPositionOffset == Integer.MIN_VALUE)
      {
        if (calculateScrollDirectionForPosition(mPosition) == 1) {
          bool = true;
        }
        mLayoutFromEnd = bool;
        paramAnchorInfo.assignCoordinateFromPadding();
      }
      for (;;)
      {
        mInvalidateOffsets = true;
        return true;
        paramAnchorInfo.assignCoordinateFromPadding(mPendingScrollPositionOffset);
      }
    }
    mOffset = Integer.MIN_VALUE;
    mPosition = mPendingScrollPosition;
    return true;
  }
  
  void updateAnchorInfoForLayout(RecyclerView.State paramState, AnchorInfo paramAnchorInfo)
  {
    if (updateAnchorFromPendingData(paramState, paramAnchorInfo)) {}
    while (updateAnchorFromChildren(paramState, paramAnchorInfo)) {
      return;
    }
    paramAnchorInfo.assignCoordinateFromPadding();
    mPosition = 0;
  }
  
  void updateMeasureSpecs()
  {
    mSizePerSpan = (mSecondaryOrientation.getTotalSpace() / mSpanCount);
    mFullSizeSpec = View.MeasureSpec.makeMeasureSpec(mSecondaryOrientation.getTotalSpace(), 1073741824);
    if (mOrientation == 1)
    {
      mWidthSpec = View.MeasureSpec.makeMeasureSpec(mSizePerSpan, 1073741824);
      mHeightSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
      return;
    }
    mHeightSpec = View.MeasureSpec.makeMeasureSpec(mSizePerSpan, 1073741824);
    mWidthSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
  }
  
  private class AnchorInfo
  {
    boolean mInvalidateOffsets;
    boolean mLayoutFromEnd;
    int mOffset;
    int mPosition;
    
    private AnchorInfo() {}
    
    void assignCoordinateFromPadding()
    {
      if (mLayoutFromEnd) {}
      for (int i = mPrimaryOrientation.getEndAfterPadding();; i = mPrimaryOrientation.getStartAfterPadding())
      {
        mOffset = i;
        return;
      }
    }
    
    void assignCoordinateFromPadding(int paramInt)
    {
      if (mLayoutFromEnd)
      {
        mOffset = (mPrimaryOrientation.getEndAfterPadding() - paramInt);
        return;
      }
      mOffset = (mPrimaryOrientation.getStartAfterPadding() + paramInt);
    }
    
    void reset()
    {
      mPosition = -1;
      mOffset = Integer.MIN_VALUE;
      mLayoutFromEnd = false;
      mInvalidateOffsets = false;
    }
  }
  
  public static class LayoutParams
    extends RecyclerView.LayoutParams
  {
    boolean mFullSpan;
    StaggeredGridLayoutManager.Span mSpan;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
    
    public LayoutParams(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      super();
    }
    
    public final int getSpanIndex()
    {
      if (mSpan == null) {
        return -1;
      }
      return mSpan.mIndex;
    }
  }
  
  static class LazySpanLookup
  {
    int[] mData;
    List<FullSpanItem> mFullSpanItems;
    
    LazySpanLookup() {}
    
    private int invalidateFullSpansAfter(int paramInt)
    {
      if (mFullSpanItems == null) {
        return -1;
      }
      FullSpanItem localFullSpanItem = getFullSpanItem(paramInt);
      if (localFullSpanItem != null) {
        mFullSpanItems.remove(localFullSpanItem);
      }
      int k = -1;
      int m = mFullSpanItems.size();
      int i = 0;
      for (;;)
      {
        int j = k;
        if (i < m)
        {
          if (mFullSpanItems.get(i)).mPosition >= paramInt) {
            j = i;
          }
        }
        else
        {
          if (j == -1) {
            break;
          }
          localFullSpanItem = (FullSpanItem)mFullSpanItems.get(j);
          mFullSpanItems.remove(j);
          return mPosition;
        }
        i += 1;
      }
    }
    
    private void offsetFullSpansForAddition(int paramInt1, int paramInt2)
    {
      if (mFullSpanItems == null) {
        return;
      }
      int i = mFullSpanItems.size() - 1;
      label20:
      FullSpanItem localFullSpanItem;
      if (i >= 0)
      {
        localFullSpanItem = (FullSpanItem)mFullSpanItems.get(i);
        if (mPosition >= paramInt1) {
          break label55;
        }
      }
      for (;;)
      {
        i -= 1;
        break label20;
        break;
        label55:
        mPosition += paramInt2;
      }
    }
    
    private void offsetFullSpansForRemoval(int paramInt1, int paramInt2)
    {
      if (mFullSpanItems == null) {
        return;
      }
      int i = mFullSpanItems.size() - 1;
      label20:
      FullSpanItem localFullSpanItem;
      if (i >= 0)
      {
        localFullSpanItem = (FullSpanItem)mFullSpanItems.get(i);
        if (mPosition >= paramInt1) {
          break label55;
        }
      }
      for (;;)
      {
        i -= 1;
        break label20;
        break;
        label55:
        if (mPosition < paramInt1 + paramInt2) {
          mFullSpanItems.remove(i);
        } else {
          mPosition -= paramInt2;
        }
      }
    }
    
    public void addFullSpanItem(FullSpanItem paramFullSpanItem)
    {
      if (mFullSpanItems == null) {
        mFullSpanItems = new ArrayList();
      }
      int j = mFullSpanItems.size();
      int i = 0;
      while (i < j)
      {
        FullSpanItem localFullSpanItem = (FullSpanItem)mFullSpanItems.get(i);
        if (mPosition == mPosition) {
          mFullSpanItems.remove(i);
        }
        if (mPosition >= mPosition)
        {
          mFullSpanItems.add(i, paramFullSpanItem);
          return;
        }
        i += 1;
      }
      mFullSpanItems.add(paramFullSpanItem);
    }
    
    void clear()
    {
      if (mData != null) {
        Arrays.fill(mData, -1);
      }
      mFullSpanItems = null;
    }
    
    void ensureSize(int paramInt)
    {
      if (mData == null)
      {
        mData = new int[Math.max(paramInt, 10) + 1];
        Arrays.fill(mData, -1);
      }
      while (paramInt < mData.length) {
        return;
      }
      int[] arrayOfInt = mData;
      mData = new int[sizeForPosition(paramInt)];
      System.arraycopy(arrayOfInt, 0, mData, 0, arrayOfInt.length);
      Arrays.fill(mData, arrayOfInt.length, mData.length, -1);
    }
    
    int forceInvalidateAfter(int paramInt)
    {
      if (mFullSpanItems != null)
      {
        int i = mFullSpanItems.size() - 1;
        while (i >= 0)
        {
          if (mFullSpanItems.get(i)).mPosition >= paramInt) {
            mFullSpanItems.remove(i);
          }
          i -= 1;
        }
      }
      return invalidateAfter(paramInt);
    }
    
    public FullSpanItem getFirstFullSpanItemInRange(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    {
      Object localObject;
      if (mFullSpanItems == null)
      {
        localObject = null;
        return localObject;
      }
      int j = mFullSpanItems.size();
      int i = 0;
      for (;;)
      {
        if (i >= j) {
          break label117;
        }
        FullSpanItem localFullSpanItem = (FullSpanItem)mFullSpanItems.get(i);
        if (mPosition >= paramInt2) {
          return null;
        }
        if (mPosition >= paramInt1)
        {
          localObject = localFullSpanItem;
          if (paramInt3 == 0) {
            break;
          }
          localObject = localFullSpanItem;
          if (mGapDir == paramInt3) {
            break;
          }
          if (paramBoolean)
          {
            localObject = localFullSpanItem;
            if (mHasUnwantedGapAfter) {
              break;
            }
          }
        }
        i += 1;
      }
      label117:
      return null;
    }
    
    public FullSpanItem getFullSpanItem(int paramInt)
    {
      Object localObject;
      if (mFullSpanItems == null)
      {
        localObject = null;
        return localObject;
      }
      int i = mFullSpanItems.size() - 1;
      for (;;)
      {
        if (i < 0) {
          break label61;
        }
        FullSpanItem localFullSpanItem = (FullSpanItem)mFullSpanItems.get(i);
        localObject = localFullSpanItem;
        if (mPosition == paramInt) {
          break;
        }
        i -= 1;
      }
      label61:
      return null;
    }
    
    int getSpan(int paramInt)
    {
      if ((mData == null) || (paramInt >= mData.length)) {
        return -1;
      }
      return mData[paramInt];
    }
    
    int invalidateAfter(int paramInt)
    {
      if (mData == null) {}
      while (paramInt >= mData.length) {
        return -1;
      }
      int i = invalidateFullSpansAfter(paramInt);
      if (i == -1)
      {
        Arrays.fill(mData, paramInt, mData.length, -1);
        return mData.length;
      }
      Arrays.fill(mData, paramInt, i + 1, -1);
      return i + 1;
    }
    
    void offsetForAddition(int paramInt1, int paramInt2)
    {
      if ((mData == null) || (paramInt1 >= mData.length)) {
        return;
      }
      ensureSize(paramInt1 + paramInt2);
      System.arraycopy(mData, paramInt1, mData, paramInt1 + paramInt2, mData.length - paramInt1 - paramInt2);
      Arrays.fill(mData, paramInt1, paramInt1 + paramInt2, -1);
      offsetFullSpansForAddition(paramInt1, paramInt2);
    }
    
    void offsetForRemoval(int paramInt1, int paramInt2)
    {
      if ((mData == null) || (paramInt1 >= mData.length)) {
        return;
      }
      ensureSize(paramInt1 + paramInt2);
      System.arraycopy(mData, paramInt1 + paramInt2, mData, paramInt1, mData.length - paramInt1 - paramInt2);
      Arrays.fill(mData, mData.length - paramInt2, mData.length, -1);
      offsetFullSpansForRemoval(paramInt1, paramInt2);
    }
    
    void setSpan(int paramInt, StaggeredGridLayoutManager.Span paramSpan)
    {
      ensureSize(paramInt);
      mData[paramInt] = mIndex;
    }
    
    int sizeForPosition(int paramInt)
    {
      int i = mData.length;
      while (i <= paramInt) {
        i *= 2;
      }
      return i;
    }
    
    static class FullSpanItem
      implements Parcelable
    {
      public static final Parcelable.Creator<FullSpanItem> CREATOR = new Parcelable.Creator()
      {
        public StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem createFromParcel(Parcel paramAnonymousParcel)
        {
          return new StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem(paramAnonymousParcel);
        }
        
        public StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem[] newArray(int paramAnonymousInt)
        {
          return new StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem[paramAnonymousInt];
        }
      };
      int mGapDir;
      int[] mGapPerSpan;
      boolean mHasUnwantedGapAfter;
      int mPosition;
      
      public FullSpanItem() {}
      
      public FullSpanItem(Parcel paramParcel)
      {
        mPosition = paramParcel.readInt();
        mGapDir = paramParcel.readInt();
        if (paramParcel.readInt() == 1) {}
        for (;;)
        {
          mHasUnwantedGapAfter = bool;
          int i = paramParcel.readInt();
          if (i > 0)
          {
            mGapPerSpan = new int[i];
            paramParcel.readIntArray(mGapPerSpan);
          }
          return;
          bool = false;
        }
      }
      
      public int describeContents()
      {
        return 0;
      }
      
      int getGapForSpan(int paramInt)
      {
        if (mGapPerSpan == null) {
          return 0;
        }
        return mGapPerSpan[paramInt];
      }
      
      public String toString()
      {
        return "FullSpanItem{mPosition=" + mPosition + ", mGapDir=" + mGapDir + ", mHasUnwantedGapAfter=" + mHasUnwantedGapAfter + ", mGapPerSpan=" + Arrays.toString(mGapPerSpan) + '}';
      }
      
      public void writeToParcel(Parcel paramParcel, int paramInt)
      {
        paramParcel.writeInt(mPosition);
        paramParcel.writeInt(mGapDir);
        if (mHasUnwantedGapAfter) {}
        for (paramInt = 1;; paramInt = 0)
        {
          paramParcel.writeInt(paramInt);
          if ((mGapPerSpan == null) || (mGapPerSpan.length <= 0)) {
            break;
          }
          paramParcel.writeInt(mGapPerSpan.length);
          paramParcel.writeIntArray(mGapPerSpan);
          return;
        }
        paramParcel.writeInt(0);
      }
    }
  }
  
  static class SavedState
    implements Parcelable
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public StaggeredGridLayoutManager.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new StaggeredGridLayoutManager.SavedState(paramAnonymousParcel);
      }
      
      public StaggeredGridLayoutManager.SavedState[] newArray(int paramAnonymousInt)
      {
        return new StaggeredGridLayoutManager.SavedState[paramAnonymousInt];
      }
    };
    boolean mAnchorLayoutFromEnd;
    int mAnchorPosition;
    List<StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem> mFullSpanItems;
    boolean mLastLayoutRTL;
    boolean mReverseLayout;
    int[] mSpanLookup;
    int mSpanLookupSize;
    int[] mSpanOffsets;
    int mSpanOffsetsSize;
    int mVisibleAnchorPosition;
    
    public SavedState() {}
    
    SavedState(Parcel paramParcel)
    {
      mAnchorPosition = paramParcel.readInt();
      mVisibleAnchorPosition = paramParcel.readInt();
      mSpanOffsetsSize = paramParcel.readInt();
      if (mSpanOffsetsSize > 0)
      {
        mSpanOffsets = new int[mSpanOffsetsSize];
        paramParcel.readIntArray(mSpanOffsets);
      }
      mSpanLookupSize = paramParcel.readInt();
      if (mSpanLookupSize > 0)
      {
        mSpanLookup = new int[mSpanLookupSize];
        paramParcel.readIntArray(mSpanLookup);
      }
      if (paramParcel.readInt() == 1)
      {
        bool1 = true;
        mReverseLayout = bool1;
        if (paramParcel.readInt() != 1) {
          break label152;
        }
        bool1 = true;
        label113:
        mAnchorLayoutFromEnd = bool1;
        if (paramParcel.readInt() != 1) {
          break label157;
        }
      }
      label152:
      label157:
      for (boolean bool1 = bool2;; bool1 = false)
      {
        mLastLayoutRTL = bool1;
        mFullSpanItems = paramParcel.readArrayList(StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem.class.getClassLoader());
        return;
        bool1 = false;
        break;
        bool1 = false;
        break label113;
      }
    }
    
    public SavedState(SavedState paramSavedState)
    {
      mSpanOffsetsSize = mSpanOffsetsSize;
      mAnchorPosition = mAnchorPosition;
      mVisibleAnchorPosition = mVisibleAnchorPosition;
      mSpanOffsets = mSpanOffsets;
      mSpanLookupSize = mSpanLookupSize;
      mSpanLookup = mSpanLookup;
      mReverseLayout = mReverseLayout;
      mAnchorLayoutFromEnd = mAnchorLayoutFromEnd;
      mLastLayoutRTL = mLastLayoutRTL;
      mFullSpanItems = mFullSpanItems;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    void invalidateAnchorPositionInfo()
    {
      mSpanOffsets = null;
      mSpanOffsetsSize = 0;
      mAnchorPosition = -1;
      mVisibleAnchorPosition = -1;
    }
    
    void invalidateSpanInfo()
    {
      mSpanOffsets = null;
      mSpanOffsetsSize = 0;
      mSpanLookupSize = 0;
      mSpanLookup = null;
      mFullSpanItems = null;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      int i = 1;
      paramParcel.writeInt(mAnchorPosition);
      paramParcel.writeInt(mVisibleAnchorPosition);
      paramParcel.writeInt(mSpanOffsetsSize);
      if (mSpanOffsetsSize > 0) {
        paramParcel.writeIntArray(mSpanOffsets);
      }
      paramParcel.writeInt(mSpanLookupSize);
      if (mSpanLookupSize > 0) {
        paramParcel.writeIntArray(mSpanLookup);
      }
      if (mReverseLayout)
      {
        paramInt = 1;
        paramParcel.writeInt(paramInt);
        if (!mAnchorLayoutFromEnd) {
          break label120;
        }
        paramInt = 1;
        label87:
        paramParcel.writeInt(paramInt);
        if (!mLastLayoutRTL) {
          break label125;
        }
      }
      label120:
      label125:
      for (paramInt = i;; paramInt = 0)
      {
        paramParcel.writeInt(paramInt);
        paramParcel.writeList(mFullSpanItems);
        return;
        paramInt = 0;
        break;
        paramInt = 0;
        break label87;
      }
    }
  }
  
  class Span
  {
    int mCachedEnd = Integer.MIN_VALUE;
    int mCachedStart = Integer.MIN_VALUE;
    int mDeletedSize = 0;
    final int mIndex;
    private ArrayList<View> mViews = new ArrayList();
    
    private Span(int paramInt)
    {
      mIndex = paramInt;
    }
    
    void appendToSpan(View paramView)
    {
      StaggeredGridLayoutManager.LayoutParams localLayoutParams = getLayoutParams(paramView);
      mSpan = this;
      mViews.add(paramView);
      mCachedEnd = Integer.MIN_VALUE;
      if (mViews.size() == 1) {
        mCachedStart = Integer.MIN_VALUE;
      }
      if ((localLayoutParams.isItemRemoved()) || (localLayoutParams.isItemChanged())) {
        mDeletedSize += mPrimaryOrientation.getDecoratedMeasurement(paramView);
      }
    }
    
    void cacheReferenceLineAndClear(boolean paramBoolean, int paramInt)
    {
      int i;
      if (paramBoolean)
      {
        i = getEndLine(Integer.MIN_VALUE);
        clear();
        if (i != Integer.MIN_VALUE) {
          break label32;
        }
      }
      label32:
      while (((paramBoolean) && (i < mPrimaryOrientation.getEndAfterPadding())) || ((!paramBoolean) && (i > mPrimaryOrientation.getStartAfterPadding())))
      {
        return;
        i = getStartLine(Integer.MIN_VALUE);
        break;
      }
      int j = i;
      if (paramInt != Integer.MIN_VALUE) {
        j = i + paramInt;
      }
      mCachedEnd = j;
      mCachedStart = j;
    }
    
    void calculateCachedEnd()
    {
      Object localObject = (View)mViews.get(mViews.size() - 1);
      StaggeredGridLayoutManager.LayoutParams localLayoutParams = getLayoutParams((View)localObject);
      mCachedEnd = mPrimaryOrientation.getDecoratedEnd((View)localObject);
      if (mFullSpan)
      {
        localObject = mLazySpanLookup.getFullSpanItem(localLayoutParams.getViewLayoutPosition());
        if ((localObject != null) && (mGapDir == 1)) {
          mCachedEnd += ((StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem)localObject).getGapForSpan(mIndex);
        }
      }
    }
    
    void calculateCachedStart()
    {
      Object localObject = (View)mViews.get(0);
      StaggeredGridLayoutManager.LayoutParams localLayoutParams = getLayoutParams((View)localObject);
      mCachedStart = mPrimaryOrientation.getDecoratedStart((View)localObject);
      if (mFullSpan)
      {
        localObject = mLazySpanLookup.getFullSpanItem(localLayoutParams.getViewLayoutPosition());
        if ((localObject != null) && (mGapDir == -1)) {
          mCachedStart -= ((StaggeredGridLayoutManager.LazySpanLookup.FullSpanItem)localObject).getGapForSpan(mIndex);
        }
      }
    }
    
    void clear()
    {
      mViews.clear();
      invalidateCache();
      mDeletedSize = 0;
    }
    
    public int findFirstVisibleItemPosition()
    {
      if (mReverseLayout) {
        return findOneVisibleChild(mViews.size() - 1, -1, false);
      }
      return findOneVisibleChild(0, mViews.size(), false);
    }
    
    int findOneVisibleChild(int paramInt1, int paramInt2, boolean paramBoolean)
    {
      int k = -1;
      int m = mPrimaryOrientation.getStartAfterPadding();
      int n = mPrimaryOrientation.getEndAfterPadding();
      int i;
      if (paramInt2 > paramInt1) {
        i = 1;
      }
      for (;;)
      {
        int j = k;
        View localView;
        if (paramInt1 != paramInt2)
        {
          localView = (View)mViews.get(paramInt1);
          j = mPrimaryOrientation.getDecoratedStart(localView);
          int i1 = mPrimaryOrientation.getDecoratedEnd(localView);
          if ((j >= n) || (i1 <= m)) {
            break label147;
          }
          if (paramBoolean)
          {
            if ((j < m) || (i1 > n)) {
              break label147;
            }
            j = getPosition(localView);
          }
        }
        else
        {
          return j;
          i = -1;
          continue;
        }
        return getPosition(localView);
        label147:
        paramInt1 += i;
      }
    }
    
    public int getDeletedSize()
    {
      return mDeletedSize;
    }
    
    int getEndLine()
    {
      if (mCachedEnd != Integer.MIN_VALUE) {
        return mCachedEnd;
      }
      calculateCachedEnd();
      return mCachedEnd;
    }
    
    int getEndLine(int paramInt)
    {
      if (mCachedEnd != Integer.MIN_VALUE) {
        paramInt = mCachedEnd;
      }
      while (mViews.size() == 0) {
        return paramInt;
      }
      calculateCachedEnd();
      return mCachedEnd;
    }
    
    StaggeredGridLayoutManager.LayoutParams getLayoutParams(View paramView)
    {
      return (StaggeredGridLayoutManager.LayoutParams)paramView.getLayoutParams();
    }
    
    int getStartLine()
    {
      if (mCachedStart != Integer.MIN_VALUE) {
        return mCachedStart;
      }
      calculateCachedStart();
      return mCachedStart;
    }
    
    int getStartLine(int paramInt)
    {
      if (mCachedStart != Integer.MIN_VALUE) {
        paramInt = mCachedStart;
      }
      while (mViews.size() == 0) {
        return paramInt;
      }
      calculateCachedStart();
      return mCachedStart;
    }
    
    void invalidateCache()
    {
      mCachedStart = Integer.MIN_VALUE;
      mCachedEnd = Integer.MIN_VALUE;
    }
    
    void onOffset(int paramInt)
    {
      if (mCachedStart != Integer.MIN_VALUE) {
        mCachedStart += paramInt;
      }
      if (mCachedEnd != Integer.MIN_VALUE) {
        mCachedEnd += paramInt;
      }
    }
    
    void popEnd()
    {
      int i = mViews.size();
      View localView = (View)mViews.remove(i - 1);
      StaggeredGridLayoutManager.LayoutParams localLayoutParams = getLayoutParams(localView);
      mSpan = null;
      if ((localLayoutParams.isItemRemoved()) || (localLayoutParams.isItemChanged())) {
        mDeletedSize -= mPrimaryOrientation.getDecoratedMeasurement(localView);
      }
      if (i == 1) {
        mCachedStart = Integer.MIN_VALUE;
      }
      mCachedEnd = Integer.MIN_VALUE;
    }
    
    void popStart()
    {
      View localView = (View)mViews.remove(0);
      StaggeredGridLayoutManager.LayoutParams localLayoutParams = getLayoutParams(localView);
      mSpan = null;
      if (mViews.size() == 0) {
        mCachedEnd = Integer.MIN_VALUE;
      }
      if ((localLayoutParams.isItemRemoved()) || (localLayoutParams.isItemChanged())) {
        mDeletedSize -= mPrimaryOrientation.getDecoratedMeasurement(localView);
      }
      mCachedStart = Integer.MIN_VALUE;
    }
    
    void prependToSpan(View paramView)
    {
      StaggeredGridLayoutManager.LayoutParams localLayoutParams = getLayoutParams(paramView);
      mSpan = this;
      mViews.add(0, paramView);
      mCachedStart = Integer.MIN_VALUE;
      if (mViews.size() == 1) {
        mCachedEnd = Integer.MIN_VALUE;
      }
      if ((localLayoutParams.isItemRemoved()) || (localLayoutParams.isItemChanged())) {
        mDeletedSize += mPrimaryOrientation.getDecoratedMeasurement(paramView);
      }
    }
    
    void setLine(int paramInt)
    {
      mCachedStart = paramInt;
      mCachedEnd = paramInt;
    }
  }
}
