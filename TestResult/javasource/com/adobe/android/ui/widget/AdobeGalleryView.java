package com.adobe.android.ui.widget;

import android.content.Context;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.support.v4.widget.EdgeEffectCompat;
import android.util.AttributeSet;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.animation.DecelerateInterpolator;
import android.widget.Adapter;
import com.adobe.android.ui.R.styleable;
import java.util.List;
import java.util.Queue;

public class AdobeGalleryView
  extends AdobeAbsSpinner
  implements GestureDetector.OnGestureListener, ScrollerRunnable.ScrollableView, VibrationWidget
{
  private boolean isDown;
  private int mAnimationDuration;
  private boolean mAutoScrollToCenter = true;
  private boolean mAutoSelectChild = false;
  private int mCenter = 0;
  private AdobeAdapterView.AdapterContextMenuInfo mContextMenuInfo;
  private int mDownTouchPosition;
  private EdgeEffectCompat mEdgeGlowLeft;
  private EdgeEffectCompat mEdgeGlowRight;
  private GestureDetector mGestureDetector;
  private int mGravity = 16;
  private boolean mIsFirstScroll;
  private OnItemsScrollListener mItemsScrollListener = null;
  private int mRealSelectedPosition;
  private boolean mReceivedInvokeKeyDown;
  ScrollCompletedSelectionNotifier mScrollCompletedNotifier;
  ScrollScrollSelectionNotifier mScrollScrollNotifier;
  private ScrollerRunnable mScroller;
  private boolean mShouldCallbackDuringFling = false;
  private boolean mShouldCallbackOnUnselectedItemClick = true;
  private boolean mSuppressSelectionChanged = true;
  private int mTouchSlop;
  private VibrationHelper mVibratorHelper;
  
  public AdobeGalleryView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AdobeGalleryView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public AdobeGalleryView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    paramAttributeSet = paramContext.getTheme().obtainStyledAttributes(paramAttributeSet, R.styleable.AdobeGalleryView, paramInt, 0);
    mAnimationDuration = paramAttributeSet.getInteger(R.styleable.AdobeGalleryView_android_animationDuration, 400);
    paramAttributeSet.recycle();
    mGestureDetector = new GestureDetector(paramContext, this);
    mGestureDetector.setIsLongpressEnabled(false);
    paramAttributeSet = ViewConfiguration.get(paramContext);
    mTouchSlop = paramAttributeSet.getScaledTouchSlop();
    mScroller = new ScrollerRunnable(this, mAnimationDuration, paramAttributeSet.getScaledOverscrollDistance(), new DecelerateInterpolator(1.0F));
    mVibratorHelper = new VibrationHelper(paramContext, true);
  }
  
  private int calculateTop(View paramView, boolean paramBoolean)
  {
    int i;
    if (paramBoolean)
    {
      i = getMeasuredHeight();
      label9:
      if (!paramBoolean) {
        break label66;
      }
    }
    label66:
    for (int j = paramView.getMeasuredHeight();; j = paramView.getHeight()) {
      switch (mGravity)
      {
      default: 
        return 0;
        i = getHeight();
        break label9;
      }
    }
    return mSpinnerPadding.top;
    int k = mSpinnerPadding.bottom;
    int m = mSpinnerPadding.top;
    return mSpinnerPadding.top + (i - k - m - j) / 2;
    return i - mSpinnerPadding.bottom - j;
  }
  
  private void detachOffScreenChildren(boolean paramBoolean)
  {
    int m = getChildCount();
    int i1 = mFirstPosition;
    int k = 0;
    int j = 0;
    int i = 0;
    View localView;
    int n;
    if (paramBoolean)
    {
      j = 0;
      for (;;)
      {
        if (j < m)
        {
          localView = getChildAt(j);
          if (localView.getRight() < 0) {}
        }
        else
        {
          m = 0;
          n = i;
          detachViewsFromParent(m, n);
          if (paramBoolean) {
            mFirstPosition += n;
          }
          return;
        }
        i += 1;
        k = mAdapter.getItemViewType(i1 + j);
        ((Queue)mRecycleBin.get(k)).add(localView);
        j += 1;
      }
    }
    int i2 = getWidth();
    i = m - 1;
    for (;;)
    {
      n = j;
      m = k;
      if (i < 0) {
        break;
      }
      localView = getChildAt(i);
      n = j;
      m = k;
      if (localView.getLeft() <= i2) {
        break;
      }
      k = i;
      j += 1;
      m = mAdapter.getItemViewType(i1 + i);
      ((Queue)mRecycleBin.get(m)).add(localView);
      i -= 1;
    }
  }
  
  private void dispatchPress(View paramView)
  {
    if (paramView != null) {
      paramView.setPressed(true);
    }
    setPressed(true);
  }
  
  private void dispatchUnpress()
  {
    setPressed(false);
  }
  
  private void drawEdges(Canvas paramCanvas)
  {
    if (mEdgeGlowLeft != null)
    {
      int i;
      int j;
      if (!mEdgeGlowLeft.isFinished())
      {
        i = paramCanvas.save();
        j = getHeight() - getPaddingTop() - getPaddingBottom();
        paramCanvas.rotate(270.0F);
        paramCanvas.translate(-j + getPaddingTop(), 0.0F);
        mEdgeGlowLeft.setSize(j, getWidth());
        if (mEdgeGlowLeft.draw(paramCanvas)) {
          postInvalidate();
        }
        paramCanvas.restoreToCount(i);
      }
      if (!mEdgeGlowRight.isFinished())
      {
        i = paramCanvas.save();
        j = getWidth();
        int k = getHeight();
        int m = getPaddingTop();
        int n = getPaddingBottom();
        paramCanvas.rotate(90.0F);
        paramCanvas.translate(-getPaddingTop(), -j);
        mEdgeGlowRight.setSize(k - m - n, j);
        if (mEdgeGlowRight.draw(paramCanvas)) {
          postInvalidate();
        }
        paramCanvas.restoreToCount(i);
      }
    }
  }
  
  private void fillToGalleryLeft()
  {
    View localView = getChildAt(0);
    int i;
    int j;
    if (localView != null)
    {
      i = mFirstPosition - 1;
      j = localView.getLeft();
    }
    while (j > 0)
    {
      localView = makeAndAddView(i, i - mSelectedPosition, j, false);
      mFirstPosition = i;
      j = localView.getLeft();
      i -= 1;
      continue;
      i = 0;
      j = getRight() - getLeft();
    }
  }
  
  private void fillToGalleryRight()
  {
    int k = getRight();
    int m = getLeft();
    int i = getChildCount();
    View localView = getChildAt(i - 1);
    int j;
    if (localView != null)
    {
      j = mFirstPosition + i;
      i = localView.getRight();
    }
    while (i < k - m)
    {
      i = makeAndAddView(j, j - mSelectedPosition, i, true).getRight();
      j += 1;
      continue;
      j = mItemCount - 1;
      mFirstPosition = j;
      i = 0;
    }
  }
  
  private void fireOnScrollCompleted()
  {
    if (mItemsScrollListener == null) {}
    int i;
    do
    {
      return;
      i = getSelectedItemPosition();
    } while ((i < 0) || (i >= mItemCount));
    View localView = getSelectedView();
    mItemsScrollListener.onScrollFinished(this, localView, i, getAdapter().getItemId(i));
  }
  
  private void fireVibration()
  {
    mVibratorHelper.vibrate(10);
  }
  
  private int getCenterOfGallery()
  {
    return mCenter;
  }
  
  private static int getCenterOfView(View paramView)
  {
    return paramView.getLeft() + paramView.getWidth() / 2;
  }
  
  private boolean isOverScrolled()
  {
    if (getChildCount() < 2) {}
    int i;
    int j;
    do
    {
      View localView;
      do
      {
        do
        {
          return false;
        } while ((mSelectedPosition != 0) && (mSelectedPosition != mItemCount - 1));
        localView = getChildAt(mSelectedPosition - mFirstPosition);
      } while (localView == null);
      i = getCenterOfView(localView);
      j = getCenterOfGallery();
      if ((mSelectedPosition == 0) && (i > j)) {
        return true;
      }
    } while ((mSelectedPosition != mItemCount - 1) || (i >= j));
    return true;
  }
  
  private View makeAndAddView(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    Object localObject1 = null;
    int i = mAdapter.getItemViewType(paramInt1);
    if (!mDataChanged)
    {
      localObject2 = (View)((Queue)mRecycleBin.get(i)).poll();
      localObject1 = localObject2;
      if (localObject2 != null)
      {
        localObject1 = mAdapter.getView(paramInt1, (View)localObject2, this);
        setUpChild((View)localObject1, paramInt2, paramInt3, paramBoolean);
      }
    }
    Object localObject2 = localObject1;
    if (localObject1 == null)
    {
      localObject2 = mAdapter.getView(paramInt1, null, this);
      setUpChild((View)localObject2, paramInt2, paramInt3, paramBoolean);
    }
    if ((!mAutoSelectChild) && (localObject2 != null)) {
      if (paramInt1 != mRealSelectedPosition) {
        break label146;
      }
    }
    label146:
    for (paramBoolean = true;; paramBoolean = false)
    {
      ((View)localObject2).setSelected(paramBoolean);
      return localObject2;
    }
  }
  
  private void offsetChildrenLeftAndRight(int paramInt)
  {
    int i = getChildCount() - 1;
    while (i >= 0)
    {
      getChildAt(i).offsetLeftAndRight(paramInt);
      i -= 1;
    }
  }
  
  private void onFinishedMovement()
  {
    if (isDown) {
      return;
    }
    if (mSuppressSelectionChanged)
    {
      mSuppressSelectionChanged = false;
      selectionChanged(mSelectedPosition, mSelectedPosition);
    }
    scrollCompleted();
    if (!mAutoSelectChild)
    {
      View localView1 = getSelectedView();
      if (mRealSelectedPosition != mSelectedPosition)
      {
        View localView2 = getChildAt(mRealSelectedPosition - mFirstPosition);
        if (localView2 != null) {
          localView2.setSelected(false);
        }
      }
      mRealSelectedPosition = mSelectedPosition;
      if (localView1 != null) {
        localView1.setSelected(true);
      }
    }
    invalidate();
  }
  
  private boolean scrollToChild(int paramInt)
  {
    View localView1 = getChildAt(paramInt);
    if (localView1 != null)
    {
      if (mItemsScrollListener != null)
      {
        paramInt = getSelectedItemPosition();
        if (paramInt >= 0)
        {
          View localView2 = getSelectedView();
          mItemsScrollListener.onScrollStarted(this, localView2, paramInt, getAdapter().getItemId(paramInt));
        }
      }
      paramInt = getCenterOfGallery() - getCenterOfView(localView1);
      mScroller.startUsingDistance(0, -paramInt);
      return paramInt != 0;
    }
    return false;
  }
  
  private void setSelectionToCenterChild()
  {
    View localView = getChildAt(mSelectedPosition - mFirstPosition);
    if (localView == null) {}
    int i1;
    do
    {
      return;
      i1 = getCenterOfGallery();
    } while ((localView.getLeft() <= i1) && (localView.getRight() >= i1));
    int k = Integer.MAX_VALUE;
    int j = 0;
    int i = getChildCount() - 1;
    for (;;)
    {
      int m = j;
      if (i >= 0)
      {
        localView = getChildAt(i);
        if ((localView.getLeft() <= i1) && (localView.getRight() >= i1)) {
          m = i;
        }
      }
      else
      {
        i = mFirstPosition + m;
        if (i == mSelectedPosition) {
          break;
        }
        i = Math.min(Math.max(i, 0), mItemCount - 1);
        setSelectedPositionInt(i, true);
        setNextSelectedPositionInt(i);
        checkSelectionChanged();
        return;
      }
      int n = Math.min(Math.abs(localView.getLeft() - i1), Math.abs(localView.getRight() - i1));
      m = k;
      if (n < k)
      {
        m = n;
        j = i;
      }
      i -= 1;
      k = m;
    }
  }
  
  private void setUpChild(View paramView, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    ViewGroup.LayoutParams localLayoutParams2 = paramView.getLayoutParams();
    ViewGroup.LayoutParams localLayoutParams1 = localLayoutParams2;
    if (localLayoutParams2 == null) {
      localLayoutParams1 = generateDefaultLayoutParams();
    }
    int i;
    boolean bool;
    label53:
    int j;
    int k;
    if (paramBoolean)
    {
      i = -1;
      addViewInLayout(paramView, i, localLayoutParams1);
      if (mAutoSelectChild)
      {
        if (paramInt1 != 0) {
          break label147;
        }
        bool = true;
        paramView.setSelected(bool);
      }
      paramInt1 = ViewGroup.getChildMeasureSpec(mHeightMeasureSpec, mPaddingTop + mPaddingBottom, height);
      paramView.measure(ViewGroup.getChildMeasureSpec(mWidthMeasureSpec, 0, width), paramInt1);
      j = calculateTop(paramView, true);
      k = paramView.getMeasuredHeight();
      paramInt1 = paramView.getMeasuredWidth();
      if (!paramBoolean) {
        break label153;
      }
      paramInt1 = paramInt2 + paramInt1;
    }
    for (;;)
    {
      paramView.layout(paramInt2, j, paramInt1, j + k);
      return;
      i = 0;
      break;
      label147:
      bool = false;
      break label53;
      label153:
      i = paramInt2 - paramInt1;
      paramInt1 = paramInt2;
      paramInt2 = i;
    }
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return paramLayoutParams != null;
  }
  
  protected int computeHorizontalScrollExtent()
  {
    return 1;
  }
  
  protected int computeHorizontalScrollOffset()
  {
    return mSelectedPosition;
  }
  
  protected int computeHorizontalScrollRange()
  {
    return mItemCount;
  }
  
  protected void dispatchDraw(Canvas paramCanvas)
  {
    super.dispatchDraw(paramCanvas);
    if (getChildCount() > 0) {
      drawEdges(paramCanvas);
    }
  }
  
  public boolean dispatchKeyEvent(KeyEvent paramKeyEvent)
  {
    return paramKeyEvent.dispatch(this, null, null);
  }
  
  protected void dispatchSetPressed(boolean paramBoolean)
  {
    if (!paramBoolean)
    {
      int i = getChildCount() - 1;
      while (i >= 0)
      {
        getChildAt(i).setPressed(false);
        i -= 1;
      }
    }
  }
  
  public void dispatchSetSelected(boolean paramBoolean) {}
  
  protected void fireOnSelected()
  {
    if (mItemsScrollListener == null) {
      return;
    }
    View localView = getSelectedView();
    int i = getSelectedItemPosition();
    mItemsScrollListener.onScroll(this, localView, i, getAdapter().getItemId(i));
  }
  
  public void forceChildLayout(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    int i = ViewGroup.getChildMeasureSpec(mHeightMeasureSpec, getPaddingTop() + getPaddingBottom(), height);
    paramView.measure(ViewGroup.getChildMeasureSpec(mWidthMeasureSpec, getPaddingLeft() + getPaddingRight(), width), i);
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new ViewGroup.LayoutParams(-2, -1);
  }
  
  public ViewGroup.LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new ViewGroup.LayoutParams(getContext(), paramAttributeSet);
  }
  
  protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return new ViewGroup.LayoutParams(paramLayoutParams);
  }
  
  public boolean getAutoSelectChild()
  {
    return mAutoSelectChild;
  }
  
  int getChildHeight(View paramView)
  {
    return paramView.getMeasuredHeight();
  }
  
  protected ContextMenu.ContextMenuInfo getContextMenuInfo()
  {
    return mContextMenuInfo;
  }
  
  public int getCurrentSelectedItemPosition()
  {
    if (!mAutoSelectChild) {
      return mRealSelectedPosition;
    }
    return mSelectedPosition;
  }
  
  int getLimitedMotionScrollAmount(boolean paramBoolean, int paramInt)
  {
    int j = 0;
    int i;
    View localView;
    if (paramBoolean)
    {
      i = mItemCount - 1;
      localView = getChildAt(i - mFirstPosition);
      if (localView != null) {
        break label40;
      }
      i = paramInt;
    }
    label40:
    int k;
    int m;
    do
    {
      return i;
      i = 0;
      break;
      k = getCenterOfView(localView);
      if (!paramBoolean) {
        break label101;
      }
      i = localView.getWidth() / 2;
      k += i;
      m = getCenterOfGallery();
      if (!paramBoolean) {
        break label113;
      }
      i = j;
    } while (k <= m);
    label101:
    label113:
    while (k < m)
    {
      i = m - k;
      if (!paramBoolean) {
        break label122;
      }
      return Math.max(i, paramInt);
      i = -localView.getWidth() / 2;
      break;
    }
    return 0;
    label122:
    return Math.min(i, paramInt);
  }
  
  public int getMaxX()
  {
    return Integer.MAX_VALUE;
  }
  
  public int getMinX()
  {
    return 0;
  }
  
  int getOverScrollDelta(int paramInt)
  {
    int j = 0;
    int i;
    View localView;
    if (paramInt > 0)
    {
      i = 1;
      if (i != 0) {
        j = mItemCount - 1;
      }
      localView = getChildAt(j - mFirstPosition);
      if (localView != null) {
        break label43;
      }
    }
    label43:
    int k;
    label72:
    do
    {
      do
      {
        return paramInt;
        i = 0;
        break;
        j = getCenterOfView(localView);
        k = getCenterOfGallery();
        if (i == 0) {
          break label72;
        }
      } while (j - paramInt >= k);
      return j - k;
    } while (j - paramInt <= k);
    return j - k;
  }
  
  public int getSelectedItemPosition()
  {
    return super.getSelectedItemPosition();
  }
  
  public boolean getVibrationEnabled()
  {
    return mVibratorHelper.enabled();
  }
  
  public void invalidateViews()
  {
    int j = getChildCount();
    int i = 0;
    if (i < j)
    {
      View localView = getChildAt(i);
      mAdapter.getView(mFirstPosition + i, localView, this);
      if (!mAutoSelectChild) {
        if (mFirstPosition + i != mRealSelectedPosition) {
          break label73;
        }
      }
      label73:
      for (boolean bool = true;; bool = false)
      {
        localView.setSelected(bool);
        i += 1;
        break;
      }
    }
  }
  
  void layout(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((!paramBoolean2) && (paramInt == 0))
    {
      layoutChildren();
      return;
    }
    int i = getRight();
    int j = getLeft();
    if (mDataChanged) {
      handleDataChanged();
    }
    if (mItemCount == 0)
    {
      resetList();
      return;
    }
    if (mNextSelectedPosition >= 0)
    {
      mRealSelectedPosition = mNextSelectedPosition;
      setSelectedPositionInt(mNextSelectedPosition, paramBoolean1);
    }
    mFirstPosition = mSelectedPosition;
    if ((getChildCount() == 0) || (paramBoolean2) || (paramInt != 0))
    {
      recycleAllViews();
      emptySubRecycler();
      removeAllViewsInLayout();
      View localView = makeAndAddView(mSelectedPosition, 0, 0, true);
      localView.offsetLeftAndRight((i - j) / 2 + 0 - localView.getWidth() / 2);
      fillToGalleryRight();
      fillToGalleryLeft();
    }
    mDataChanged = false;
    mNeedSync = false;
    mSuppressSelectionChanged = false;
    setNextSelectedPositionInt(mSelectedPosition);
    checkSelectionChanged();
    mSuppressSelectionChanged = true;
    postInvalidate();
  }
  
  public void layoutChildren()
  {
    int i = 0;
    while (i < getChildCount())
    {
      View localView = getChildAt(i);
      forceChildLayout(localView, localView.getLayoutParams());
      localView.layout(localView.getLeft(), localView.getTop(), localView.getRight(), localView.getBottom());
      i += 1;
    }
  }
  
  public boolean moveNext()
  {
    if ((mItemCount > 0) && (mSelectedPosition < mItemCount - 1))
    {
      scrollToChild(mSelectedPosition - mFirstPosition + 1);
      return true;
    }
    return false;
  }
  
  public boolean movePrevious()
  {
    if ((mItemCount > 0) && (mSelectedPosition > 0))
    {
      scrollToChild(mSelectedPosition - mFirstPosition - 1);
      return true;
    }
    return false;
  }
  
  void onCancel()
  {
    onUp();
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    removeCallbacks(mScrollCompletedNotifier);
    removeCallbacks(mScrollScrollNotifier);
  }
  
  public boolean onDown(MotionEvent paramMotionEvent)
  {
    isDown = true;
    mScroller.stop(false);
    mDownTouchPosition = pointToPosition((int)paramMotionEvent.getX(), (int)paramMotionEvent.getY());
    if ((mDownTouchPosition >= 0) && (mDownTouchPosition < mItemCount)) {
      dispatchPress(getChildAt(mDownTouchPosition - mFirstPosition));
    }
    mIsFirstScroll = true;
    return true;
  }
  
  public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    if (!mShouldCallbackDuringFling) {
      mSuppressSelectionChanged = true;
    }
    int k = (int)-paramFloat1 / 2;
    int i;
    if (k < 0)
    {
      i = Integer.MAX_VALUE;
      if (k >= 0) {
        break label68;
      }
    }
    label68:
    for (int j = -2;; j = 2)
    {
      if (j != getOverScrollDelta(j)) {
        break label74;
      }
      mScroller.startUsingVelocity(i, k);
      return true;
      i = 0;
      break;
    }
    label74:
    return false;
  }
  
  protected void onFocusChanged(boolean paramBoolean, int paramInt, Rect paramRect)
  {
    super.onFocusChanged(paramBoolean, paramInt, paramRect);
    paramRect = getChildAt(mSelectedPosition - mFirstPosition);
    if ((paramBoolean) && (paramRect != null) && (mAutoSelectChild)) {
      paramRect.setSelected(true);
    }
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool = true;
    switch (paramInt)
    {
    }
    for (;;)
    {
      bool = false;
      do
      {
        do
        {
          return bool;
        } while (!movePrevious());
        playSoundEffect(1);
        return true;
      } while (!moveNext());
      playSoundEffect(3);
      return true;
      mReceivedInvokeKeyDown = true;
    }
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    switch (paramInt)
    {
    default: 
      return false;
    }
    if ((mReceivedInvokeKeyDown) && (mItemCount > 0))
    {
      paramKeyEvent = getChildAt(mSelectedPosition - mFirstPosition);
      if (paramKeyEvent != null)
      {
        dispatchPress(paramKeyEvent);
        postDelayed(new Runnable()
        {
          public void run()
          {
            AdobeGalleryView.this.dispatchUnpress();
          }
        }, ViewConfiguration.getPressedStateDuration());
        performItemClick(paramKeyEvent, mSelectedPosition, mAdapter.getItemId(mSelectedPosition));
      }
    }
    mReceivedInvokeKeyDown = false;
    return true;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    mInLayout = true;
    layout(0, false, paramBoolean);
    mInLayout = false;
  }
  
  public void onLongPress(MotionEvent paramMotionEvent) {}
  
  protected void onOverScrolled(int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2) {}
  
  public boolean onScroll(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    getParent().requestDisallowInterceptTouchEvent(true);
    mSuppressSelectionChanged = false;
    paramFloat2 = paramFloat1;
    int i;
    int j;
    if (mIsFirstScroll)
    {
      if (mItemsScrollListener != null)
      {
        i = getSelectedItemPosition();
        if (i >= 0)
        {
          paramMotionEvent1 = getSelectedView();
          mItemsScrollListener.onScrollStarted(this, paramMotionEvent1, i, getAdapter().getItemId(i));
        }
      }
      if (paramFloat1 > 0.0F) {
        paramFloat2 = paramFloat1 - mTouchSlop;
      }
    }
    else
    {
      j = (int)paramFloat2;
      i = getOverScrollDelta(j);
      trackMotionScroll(i);
      if (mEdgeGlowLeft != null) {
        if (j != i)
        {
          if (j <= 0) {
            break label226;
          }
          i = 1;
          label128:
          paramMotionEvent1 = getChildAt(0);
          if (paramMotionEvent1 == null) {
            break label232;
          }
          paramFloat1 = paramMotionEvent1.getWidth() * 2;
          label146:
          if (i != 0) {
            break label243;
          }
          mEdgeGlowLeft.onPull(-j / paramFloat1);
          if (!mEdgeGlowRight.isFinished()) {
            mEdgeGlowRight.onRelease();
          }
        }
      }
    }
    for (;;)
    {
      if ((!mEdgeGlowRight.isFinished()) || (!mEdgeGlowLeft.isFinished())) {
        postInvalidate();
      }
      mIsFirstScroll = false;
      return true;
      paramFloat2 = paramFloat1 + mTouchSlop;
      break;
      label226:
      i = 0;
      break label128;
      label232:
      paramFloat1 = getWidth() / 2;
      break label146;
      label243:
      mEdgeGlowRight.onPull(j / paramFloat1);
      if (!mEdgeGlowLeft.isFinished()) {
        mEdgeGlowLeft.onRelease();
      }
    }
  }
  
  public void onShowPress(MotionEvent paramMotionEvent) {}
  
  public boolean onSingleTapUp(MotionEvent paramMotionEvent)
  {
    if ((mDownTouchPosition >= 0) && (mDownTouchPosition < mItemCount) && (!scrollToChild(mDownTouchPosition - mFirstPosition)))
    {
      if ((mShouldCallbackOnUnselectedItemClick) || (mDownTouchPosition == mSelectedPosition)) {
        performItemClick(getChildAt(mDownTouchPosition - mFirstPosition), mDownTouchPosition, mAdapter.getItemId(mDownTouchPosition));
      }
      return true;
    }
    return false;
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    mCenter = (paramInt1 / 2);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool = mGestureDetector.onTouchEvent(paramMotionEvent);
    int i = paramMotionEvent.getAction();
    if (i == 1) {
      onUp();
    }
    while (i != 3) {
      return bool;
    }
    onCancel();
    return bool;
  }
  
  void onUp()
  {
    isDown = false;
    if (mScroller.isFinished()) {
      scrollIntoSlots();
    }
    for (;;)
    {
      if (mEdgeGlowLeft != null)
      {
        mEdgeGlowLeft.onRelease();
        mEdgeGlowRight.onRelease();
      }
      dispatchUnpress();
      return;
      if (isOverScrolled()) {
        scrollIntoSlots();
      }
    }
  }
  
  void scrollCompleted()
  {
    if (mItemsScrollListener != null)
    {
      if ((mInLayout) || (mBlockLayoutRequests))
      {
        if (mScrollCompletedNotifier == null) {
          mScrollCompletedNotifier = new ScrollCompletedSelectionNotifier(null);
        }
        post(mScrollCompletedNotifier);
      }
    }
    else {
      return;
    }
    fireOnScrollCompleted();
  }
  
  public void scrollIntoSlots()
  {
    if (getChildCount() == 0) {}
    View localView;
    do
    {
      return;
      if (!mAutoScrollToCenter) {
        break;
      }
      localView = getChildAt(mSelectedPosition - mFirstPosition);
    } while (localView == null);
    int i = getCenterOfView(localView);
    i = getCenterOfGallery() - i;
    if (i != 0)
    {
      mScroller.startUsingDistance(0, -i);
      return;
    }
    onFinishedMovement();
    return;
    onFinishedMovement();
  }
  
  void selectionChanged(int paramInt1, int paramInt2)
  {
    if ((mAutoSelectChild) && (paramInt1 != paramInt2))
    {
      View localView1 = getChildAt(paramInt1 - mFirstPosition);
      View localView2 = getChildAt(paramInt2 - mFirstPosition);
      if (localView2 != null) {
        localView2.setSelected(true);
      }
      if ((localView1 != null) && (localView1 != localView2)) {
        localView1.setSelected(false);
      }
    }
    if (!mSuppressSelectionChanged) {
      if ((mItemsScrollListener != null) && (!mInLayout) && (!mBlockLayoutRequests)) {
        break label133;
      }
    }
    for (;;)
    {
      if ((mSelectedPosition != -1) && (isShown()) && (!isInTouchMode())) {
        sendAccessibilityEvent(4);
      }
      if ((paramInt1 != paramInt2) && (!mInLayout)) {
        fireVibration();
      }
      return;
      label133:
      fireOnSelected();
    }
  }
  
  public void setAnimationDuration(int paramInt)
  {
    mAnimationDuration = paramInt;
  }
  
  public void setAutoScrollToCenter(boolean paramBoolean)
  {
    mAutoScrollToCenter = paramBoolean;
  }
  
  public void setAutoSelectChild(boolean paramBoolean)
  {
    mAutoSelectChild = paramBoolean;
  }
  
  public void setCallbackDuringFling(boolean paramBoolean)
  {
    mShouldCallbackDuringFling = paramBoolean;
  }
  
  public void setCallbackOnUnselectedItemClick(boolean paramBoolean)
  {
    mShouldCallbackOnUnselectedItemClick = paramBoolean;
  }
  
  public void setGravity(int paramInt)
  {
    if (mGravity != paramInt)
    {
      mGravity = paramInt;
      requestLayout();
    }
  }
  
  public void setOnItemsScrollListener(OnItemsScrollListener paramOnItemsScrollListener)
  {
    mItemsScrollListener = paramOnItemsScrollListener;
  }
  
  public void setOverScrollMode(int paramInt)
  {
    super.setOverScrollMode(paramInt);
    if (paramInt != 2)
    {
      if (mEdgeGlowLeft == null)
      {
        mEdgeGlowLeft = new EdgeEffectCompat(getContext());
        mEdgeGlowRight = new EdgeEffectCompat(getContext());
      }
      return;
    }
    mEdgeGlowLeft = null;
    mEdgeGlowRight = null;
  }
  
  void setSelectedPositionInt(int paramInt, boolean paramBoolean)
  {
    mOldSelectedPosition = mSelectedPosition;
    super.setSelectedPositionInt(paramInt);
  }
  
  public void setVibrationEnabled(boolean paramBoolean)
  {
    mVibratorHelper.setEnabled(paramBoolean);
  }
  
  public void trackMotionScroll(int paramInt)
  {
    if (paramInt == 0) {
      return;
    }
    int j = mScroller.getLastFlingX() - paramInt;
    label27:
    boolean bool;
    if (paramInt > 0)
    {
      mDownTouchPosition = mFirstPosition;
      if (getChildCount() == 0) {
        break label177;
      }
      if (j >= 0) {
        break label179;
      }
      bool = true;
      label41:
      paramInt = j;
      int i = paramInt;
      if (!mScroller.isFinished())
      {
        int k = getLimitedMotionScrollAmount(bool, j);
        i = paramInt;
        if (k != j)
        {
          if (bool) {
            break label185;
          }
          if (mEdgeGlowLeft != null) {
            mEdgeGlowLeft.onAbsorb((int)mScroller.getCurrVelocity());
          }
          label100:
          i = k;
        }
      }
      if (i != j)
      {
        mScroller.endFling(false);
        if (i == 0) {
          onFinishedMovement();
        }
      }
      offsetChildrenLeftAndRight(i);
      detachOffScreenChildren(bool);
      if (!bool) {
        break label211;
      }
      fillToGalleryRight();
    }
    for (;;)
    {
      setSelectionToCenterChild();
      onScrollChanged(0, 0, 0, 0);
      invalidate();
      return;
      mDownTouchPosition = (mFirstPosition + getChildCount() - 1);
      break label27;
      label177:
      break;
      label179:
      bool = false;
      break label41;
      label185:
      if (mEdgeGlowRight == null) {
        break label100;
      }
      mEdgeGlowRight.onAbsorb((int)mScroller.getCurrVelocity());
      break label100;
      label211:
      fillToGalleryLeft();
    }
  }
  
  public static abstract interface OnItemsScrollListener
  {
    public abstract void onScroll(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong);
    
    public abstract void onScrollFinished(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong);
    
    public abstract void onScrollStarted(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong);
  }
  
  private class ScrollCompletedSelectionNotifier
    implements Runnable
  {
    private ScrollCompletedSelectionNotifier() {}
    
    public void run()
    {
      if (mDataChanged)
      {
        if (getAdapter() != null) {
          post(this);
        }
        return;
      }
      AdobeGalleryView.this.fireOnScrollCompleted();
    }
  }
  
  private class ScrollScrollSelectionNotifier
    implements Runnable
  {
    public void run()
    {
      if (this$0.mDataChanged)
      {
        if (this$0.getAdapter() != null) {
          this$0.post(this);
        }
        return;
      }
      this$0.fireOnSelected();
    }
  }
}
