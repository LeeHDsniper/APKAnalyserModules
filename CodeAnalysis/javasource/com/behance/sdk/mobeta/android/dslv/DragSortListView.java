package com.behance.sdk.mobeta.android.dslv;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.os.Environment;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseBooleanArray;
import android.util.SparseIntArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.widget.AbsListView.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.Checkable;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.behance.sdk.R.styleable;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class DragSortListView
  extends ListView
{
  private AdapterWrapper mAdapterWrapper;
  private boolean mAnimate = false;
  private boolean mBlockLayoutRequests = false;
  private MotionEvent mCancelEvent;
  private int mCancelMethod = 0;
  private HeightCache mChildHeightCache = new HeightCache(3);
  private float mCurrFloatAlpha = 1.0F;
  private int mDownScrollStartY;
  private float mDownScrollStartYF;
  private int mDragDeltaX;
  private int mDragDeltaY;
  private float mDragDownScrollHeight;
  private float mDragDownScrollStartFrac = 0.33333334F;
  private boolean mDragEnabled = true;
  private int mDragFlags = 0;
  private DragListener mDragListener;
  private DragScroller mDragScroller;
  private DragSortTracker mDragSortTracker;
  private int mDragState = 0;
  private float mDragUpScrollHeight;
  private float mDragUpScrollStartFrac = 0.33333334F;
  private DropAnimator mDropAnimator;
  private DropListener mDropListener;
  private int mFirstExpPos;
  private float mFloatAlpha = 1.0F;
  private Point mFloatLoc = new Point();
  private int mFloatPos;
  private View mFloatView;
  private int mFloatViewHeight;
  private int mFloatViewHeightHalf;
  private FloatViewManager mFloatViewManager = null;
  private int mFloatViewMid;
  private boolean mFloatViewOnMeasured = false;
  private boolean mIgnoreTouchEvent = false;
  private boolean mInTouchEvent = false;
  private int mItemHeightCollapsed = 1;
  private boolean mLastCallWasIntercept = false;
  private int mLastY;
  private LiftAnimator mLiftAnimator;
  private boolean mListViewIntercepted = false;
  private float mMaxScrollSpeed = 0.5F;
  private DataSetObserver mObserver;
  private RemoveAnimator mRemoveAnimator;
  private RemoveListener mRemoveListener;
  private float mRemoveVelocityX = 0.0F;
  private View[] mSampleViewTypes = new View[1];
  private DragScrollProfile mScrollProfile = new DragScrollProfile()
  {
    public float getSpeed(float paramAnonymousFloat, long paramAnonymousLong)
    {
      return mMaxScrollSpeed * paramAnonymousFloat;
    }
  };
  private int mSecondExpPos;
  private float mSlideFrac = 0.0F;
  private float mSlideRegionFrac = 0.25F;
  private int mSrcPos;
  private Point mTouchLoc = new Point();
  private boolean mTrackDragSort = false;
  private int mUpScrollStartY;
  private float mUpScrollStartYF;
  private boolean mUseRemoveVelocity;
  private int mWidthMeasureSpec = 0;
  private int mX;
  private int mY;
  
  @SuppressLint({"Recycle"})
  public DragSortListView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    int m = 150;
    int k = 150;
    int j = k;
    int i = m;
    if (paramAttributeSet != null)
    {
      paramContext = getContext().obtainStyledAttributes(paramAttributeSet, R.styleable.DragSortListView, 0, 0);
      mItemHeightCollapsed = Math.max(1, paramContext.getDimensionPixelSize(R.styleable.DragSortListView_collapsed_height, 1));
      mTrackDragSort = paramContext.getBoolean(R.styleable.DragSortListView_track_drag_sort, false);
      if (mTrackDragSort) {
        mDragSortTracker = new DragSortTracker();
      }
      mFloatAlpha = paramContext.getFloat(R.styleable.DragSortListView_float_alpha, mFloatAlpha);
      mCurrFloatAlpha = mFloatAlpha;
      mDragEnabled = paramContext.getBoolean(R.styleable.DragSortListView_drag_enabled, mDragEnabled);
      mSlideRegionFrac = Math.max(0.0F, Math.min(1.0F, 1.0F - paramContext.getFloat(R.styleable.DragSortListView_slide_shuffle_speed, 0.75F)));
      if (mSlideRegionFrac <= 0.0F) {
        break label621;
      }
    }
    label621:
    for (boolean bool1 = true;; bool1 = false)
    {
      mAnimate = bool1;
      setDragScrollStart(paramContext.getFloat(R.styleable.DragSortListView_drag_scroll_start, mDragUpScrollStartFrac));
      mMaxScrollSpeed = paramContext.getFloat(R.styleable.DragSortListView_max_drag_scroll_speed, mMaxScrollSpeed);
      i = paramContext.getInt(R.styleable.DragSortListView_remove_animation_duration, m);
      j = paramContext.getInt(R.styleable.DragSortListView_drop_animation_duration, k);
      if (paramContext.getBoolean(R.styleable.DragSortListView_use_default_controller, true))
      {
        bool1 = paramContext.getBoolean(R.styleable.DragSortListView_remove_enabled, false);
        k = paramContext.getInt(R.styleable.DragSortListView_remove_mode, 1);
        boolean bool2 = paramContext.getBoolean(R.styleable.DragSortListView_sort_enabled, true);
        m = paramContext.getInt(R.styleable.DragSortListView_drag_start_mode, 0);
        int n = paramContext.getResourceId(R.styleable.DragSortListView_drag_handle_id, 0);
        int i1 = paramContext.getResourceId(R.styleable.DragSortListView_fling_handle_id, 0);
        int i2 = paramContext.getResourceId(R.styleable.DragSortListView_click_remove_id, 0);
        int i3 = paramContext.getColor(R.styleable.DragSortListView_float_background_color, -16777216);
        paramAttributeSet = new DragSortController(this, n, m, k, i2, i1);
        paramAttributeSet.setRemoveEnabled(bool1);
        paramAttributeSet.setSortEnabled(bool2);
        paramAttributeSet.setBackgroundColor(i3);
        mFloatViewManager = paramAttributeSet;
        setOnTouchListener(paramAttributeSet);
      }
      paramContext.recycle();
      mDragScroller = new DragScroller();
      if (i > 0) {
        mRemoveAnimator = new RemoveAnimator(0.5F, i);
      }
      if (j > 0) {
        mDropAnimator = new DropAnimator(0.5F, j);
      }
      mCancelEvent = MotionEvent.obtain(0L, 0L, 3, 0.0F, 0.0F, 0.0F, 0.0F, 0, 0.0F, 0.0F, 0, 0);
      mObserver = new DataSetObserver()
      {
        private void cancel()
        {
          if (mDragState == 4) {
            cancelDrag();
          }
        }
        
        public void onChanged()
        {
          cancel();
        }
        
        public void onInvalidated()
        {
          cancel();
        }
      };
      return;
    }
  }
  
  private void adjustAllItems()
  {
    int j = getFirstVisiblePosition();
    int k = getLastVisiblePosition();
    int i = Math.max(0, getHeaderViewsCount() - j);
    k = Math.min(k - j, getCount() - 1 - getFooterViewsCount() - j);
    while (i <= k)
    {
      View localView = getChildAt(i);
      if (localView != null) {
        adjustItem(j + i, localView, false);
      }
      i += 1;
    }
  }
  
  private void adjustItem(int paramInt, View paramView, boolean paramBoolean)
  {
    ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
    int i;
    if ((paramInt != mSrcPos) && (paramInt != mFirstExpPos) && (paramInt != mSecondExpPos))
    {
      i = -2;
      if (i != height)
      {
        height = i;
        paramView.setLayoutParams(localLayoutParams);
      }
      if ((paramInt == mFirstExpPos) || (paramInt == mSecondExpPos))
      {
        if (paramInt >= mSrcPos) {
          break label151;
        }
        ((DragSortItemView)paramView).setGravity(80);
      }
    }
    for (;;)
    {
      int k = paramView.getVisibility();
      int j = 0;
      i = j;
      if (paramInt == mSrcPos)
      {
        i = j;
        if (mFloatView != null) {
          i = 4;
        }
      }
      if (i != k) {
        paramView.setVisibility(i);
      }
      return;
      i = calcItemHeight(paramInt, paramView, paramBoolean);
      break;
      label151:
      if (paramInt > mSrcPos) {
        ((DragSortItemView)paramView).setGravity(48);
      }
    }
  }
  
  private void adjustOnReorder()
  {
    int j = getFirstVisiblePosition();
    if (mSrcPos < j)
    {
      View localView = getChildAt(0);
      int i = 0;
      if (localView != null) {
        i = localView.getTop();
      }
      setSelectionFromTop(j - 1, i - getPaddingTop());
    }
  }
  
  private int adjustScroll(int paramInt1, View paramView, int paramInt2, int paramInt3)
  {
    int n = 0;
    int i3 = getChildHeight(paramInt1);
    int i1 = paramView.getHeight();
    int i2 = calcItemHeight(paramInt1, i3);
    int m = i1;
    int k = i2;
    int i = k;
    int j = m;
    if (paramInt1 != mSrcPos)
    {
      j = m - i3;
      i = k - i3;
    }
    m = mFloatViewHeight;
    k = m;
    if (mSrcPos != mFirstExpPos)
    {
      k = m;
      if (mSrcPos != mSecondExpPos) {
        k = m - mItemHeightCollapsed;
      }
    }
    if (paramInt1 <= paramInt2)
    {
      paramInt2 = n;
      if (paramInt1 > mFirstExpPos) {
        paramInt2 = 0 + (k - i);
      }
    }
    do
    {
      return paramInt2;
      if (paramInt1 == paramInt3)
      {
        if (paramInt1 <= mFirstExpPos) {
          return 0 + (j - k);
        }
        if (paramInt1 == mSecondExpPos) {
          return 0 + (i1 - i2);
        }
        return 0 + j;
      }
      if (paramInt1 <= mFirstExpPos) {
        return 0 - k;
      }
      paramInt2 = n;
    } while (paramInt1 != mSecondExpPos);
    return 0 - i;
  }
  
  private static int buildRunList(SparseBooleanArray paramSparseBooleanArray, int paramInt1, int paramInt2, int[] paramArrayOfInt1, int[] paramArrayOfInt2)
  {
    int k = 0;
    int j = findFirstSetIndex(paramSparseBooleanArray, paramInt1, paramInt2);
    if (j == -1) {
      return 0;
    }
    int m = paramSparseBooleanArray.keyAt(j);
    int i = m + 1;
    j += 1;
    if (j < paramSparseBooleanArray.size())
    {
      int n = paramSparseBooleanArray.keyAt(j);
      if (n < paramInt2)
      {
        if (!paramSparseBooleanArray.valueAt(j)) {}
        for (;;)
        {
          j += 1;
          break;
          if (n == i)
          {
            i += 1;
          }
          else
          {
            paramArrayOfInt1[k] = m;
            paramArrayOfInt2[k] = i;
            k += 1;
            m = n;
            i = n + 1;
          }
        }
      }
    }
    j = i;
    if (i == paramInt2) {
      j = paramInt1;
    }
    paramArrayOfInt1[k] = m;
    paramArrayOfInt2[k] = j;
    i = k + 1;
    paramInt2 = i;
    if (i > 1)
    {
      paramInt2 = i;
      if (paramArrayOfInt1[0] == paramInt1)
      {
        paramInt2 = i;
        if (paramArrayOfInt2[(i - 1)] == paramInt1)
        {
          paramArrayOfInt1[0] = paramArrayOfInt1[(i - 1)];
          paramInt2 = i - 1;
        }
      }
    }
    return paramInt2;
  }
  
  private int calcItemHeight(int paramInt1, int paramInt2)
  {
    if ((mAnimate) && (mFirstExpPos != mSecondExpPos)) {}
    int j;
    int k;
    for (int i = 1;; i = 0)
    {
      j = mFloatViewHeight - mItemHeightCollapsed;
      k = (int)(mSlideFrac * j);
      if (paramInt1 != mSrcPos) {
        break label107;
      }
      if (mSrcPos != mFirstExpPos) {
        break label83;
      }
      if (i == 0) {
        break;
      }
      return k + mItemHeightCollapsed;
    }
    return mFloatViewHeight;
    label83:
    if (mSrcPos == mSecondExpPos) {
      return mFloatViewHeight - k;
    }
    return mItemHeightCollapsed;
    label107:
    if (paramInt1 == mFirstExpPos)
    {
      if (i != 0) {
        return paramInt2 + k;
      }
      return paramInt2 + j;
    }
    if (paramInt1 == mSecondExpPos) {
      return paramInt2 + j - k;
    }
    return paramInt2;
  }
  
  private int calcItemHeight(int paramInt, View paramView, boolean paramBoolean)
  {
    return calcItemHeight(paramInt, getChildHeight(paramInt, paramView, paramBoolean));
  }
  
  private void clearPositions()
  {
    mSrcPos = -1;
    mFirstExpPos = -1;
    mSecondExpPos = -1;
    mFloatPos = -1;
  }
  
  private void continueDrag(int paramInt1, int paramInt2)
  {
    mFloatLoc.x = (paramInt1 - mDragDeltaX);
    mFloatLoc.y = (paramInt2 - mDragDeltaY);
    doDragFloatView(true);
    paramInt1 = Math.min(paramInt2, mFloatViewMid + mFloatViewHeightHalf);
    paramInt2 = Math.max(paramInt2, mFloatViewMid - mFloatViewHeightHalf);
    int i = mDragScroller.getScrollDir();
    if ((paramInt1 > mLastY) && (paramInt1 > mDownScrollStartY) && (i != 1))
    {
      if (i != -1) {
        mDragScroller.stopScrolling(true);
      }
      mDragScroller.startScrolling(1);
    }
    do
    {
      return;
      if ((paramInt2 < mLastY) && (paramInt2 < mUpScrollStartY) && (i != 0))
      {
        if (i != -1) {
          mDragScroller.stopScrolling(true);
        }
        mDragScroller.startScrolling(0);
        return;
      }
    } while ((paramInt2 < mUpScrollStartY) || (paramInt1 > mDownScrollStartY) || (!mDragScroller.isScrolling()));
    mDragScroller.stopScrolling(true);
  }
  
  private void destroyFloatView()
  {
    if (mFloatView != null)
    {
      mFloatView.setVisibility(8);
      if (mFloatViewManager != null) {
        mFloatViewManager.onDestroyFloatView(mFloatView);
      }
      mFloatView = null;
      invalidate();
    }
  }
  
  private void doActionUpOrCancel()
  {
    mCancelMethod = 0;
    mInTouchEvent = false;
    if (mDragState == 3) {
      mDragState = 0;
    }
    mCurrFloatAlpha = mFloatAlpha;
    mListViewIntercepted = false;
    mChildHeightCache.clear();
  }
  
  private void doDragFloatView(int paramInt, View paramView, boolean paramBoolean)
  {
    mBlockLayoutRequests = true;
    updateFloatView();
    int i = mFirstExpPos;
    int j = mSecondExpPos;
    boolean bool = updatePositions();
    if (bool)
    {
      adjustAllItems();
      i = adjustScroll(paramInt, paramView, i, j);
      setSelectionFromTop(paramInt, paramView.getTop() + i - getPaddingTop());
      layoutChildren();
    }
    if ((bool) || (paramBoolean)) {
      invalidate();
    }
    mBlockLayoutRequests = false;
  }
  
  private void doDragFloatView(boolean paramBoolean)
  {
    int i = getFirstVisiblePosition();
    int j = getChildCount() / 2;
    View localView = getChildAt(getChildCount() / 2);
    if (localView == null) {
      return;
    }
    doDragFloatView(i + j, localView, paramBoolean);
  }
  
  private void doRemoveItem()
  {
    doRemoveItem(mSrcPos - getHeaderViewsCount());
  }
  
  private void doRemoveItem(int paramInt)
  {
    mDragState = 1;
    if (mRemoveListener != null) {
      mRemoveListener.remove(paramInt);
    }
    destroyFloatView();
    adjustOnReorder();
    clearPositions();
    if (mInTouchEvent)
    {
      mDragState = 3;
      return;
    }
    mDragState = 0;
  }
  
  private void drawDivider(int paramInt, Canvas paramCanvas)
  {
    Drawable localDrawable = getDivider();
    int m = getDividerHeight();
    ViewGroup localViewGroup;
    int j;
    int k;
    int i;
    if ((localDrawable != null) && (m != 0))
    {
      localViewGroup = (ViewGroup)getChildAt(paramInt - getFirstVisiblePosition());
      if (localViewGroup != null)
      {
        j = getPaddingLeft();
        k = getWidth() - getPaddingRight();
        i = localViewGroup.getChildAt(0).getHeight();
        if (paramInt <= mSrcPos) {
          break label128;
        }
        i = localViewGroup.getTop() + i;
        paramInt = i + m;
      }
    }
    for (;;)
    {
      paramCanvas.save();
      paramCanvas.clipRect(j, i, k, paramInt);
      localDrawable.setBounds(j, i, k, paramInt);
      localDrawable.draw(paramCanvas);
      paramCanvas.restore();
      return;
      label128:
      paramInt = localViewGroup.getBottom() - i;
      i = paramInt - m;
    }
  }
  
  private void dropFloatView()
  {
    mDragState = 2;
    if ((mDropListener != null) && (mFloatPos >= 0) && (mFloatPos < getCount()))
    {
      int i = getHeaderViewsCount();
      mDropListener.drop(mSrcPos - i, mFloatPos - i);
    }
    destroyFloatView();
    adjustOnReorder();
    clearPositions();
    adjustAllItems();
    if (mInTouchEvent)
    {
      mDragState = 3;
      return;
    }
    mDragState = 0;
  }
  
  private static int findFirstSetIndex(SparseBooleanArray paramSparseBooleanArray, int paramInt1, int paramInt2)
  {
    int i = paramSparseBooleanArray.size();
    paramInt1 = insertionIndexForKey(paramSparseBooleanArray, paramInt1);
    while ((paramInt1 < i) && (paramSparseBooleanArray.keyAt(paramInt1) < paramInt2) && (!paramSparseBooleanArray.valueAt(paramInt1))) {
      paramInt1 += 1;
    }
    if (paramInt1 != i)
    {
      i = paramInt1;
      if (paramSparseBooleanArray.keyAt(paramInt1) < paramInt2) {}
    }
    else
    {
      i = -1;
    }
    return i;
  }
  
  private int getChildHeight(int paramInt)
  {
    int i = 0;
    if (paramInt == mSrcPos) {}
    do
    {
      return i;
      localObject = getChildAt(paramInt - getFirstVisiblePosition());
      if (localObject != null) {
        return getChildHeight(paramInt, (View)localObject, false);
      }
      j = mChildHeightCache.get(paramInt);
      i = j;
    } while (j != -1);
    Object localObject = getAdapter();
    i = ((ListAdapter)localObject).getItemViewType(paramInt);
    int j = ((ListAdapter)localObject).getViewTypeCount();
    if (j != mSampleViewTypes.length) {
      mSampleViewTypes = new View[j];
    }
    if (i >= 0) {
      if (mSampleViewTypes[i] == null)
      {
        localObject = ((ListAdapter)localObject).getView(paramInt, null, this);
        mSampleViewTypes[i] = localObject;
      }
    }
    for (;;)
    {
      i = getChildHeight(paramInt, (View)localObject, true);
      mChildHeightCache.add(paramInt, i);
      return i;
      localObject = ((ListAdapter)localObject).getView(paramInt, mSampleViewTypes[i], this);
      continue;
      localObject = ((ListAdapter)localObject).getView(paramInt, null, this);
    }
  }
  
  private int getChildHeight(int paramInt, View paramView, boolean paramBoolean)
  {
    int i = 0;
    if (paramInt == mSrcPos) {
      paramInt = i;
    }
    do
    {
      return paramInt;
      if ((paramInt < getHeaderViewsCount()) || (paramInt >= getCount() - getFooterViewsCount())) {}
      for (;;)
      {
        ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
        if ((localLayoutParams == null) || (height <= 0)) {
          break;
        }
        return height;
        paramView = ((ViewGroup)paramView).getChildAt(0);
      }
      paramInt = paramView.getHeight();
    } while ((paramInt != 0) && (!paramBoolean));
    measureItem(paramView);
    return paramView.getMeasuredHeight();
  }
  
  private int getItemHeight(int paramInt)
  {
    View localView = getChildAt(paramInt - getFirstVisiblePosition());
    if (localView != null) {
      return localView.getHeight();
    }
    return calcItemHeight(paramInt, getChildHeight(paramInt));
  }
  
  private int getShuffleEdge(int paramInt1, int paramInt2)
  {
    int i = getHeaderViewsCount();
    int j = getFooterViewsCount();
    if ((paramInt1 <= i) || (paramInt1 >= getCount() - j)) {
      return paramInt2;
    }
    int k = getDividerHeight();
    int n = mFloatViewHeight - mItemHeightCollapsed;
    int m = getChildHeight(paramInt1);
    int i1 = getItemHeight(paramInt1);
    j = paramInt2;
    if (mSecondExpPos <= mSrcPos) {
      if ((paramInt1 == mSecondExpPos) && (mFirstExpPos != mSecondExpPos)) {
        if (paramInt1 == mSrcPos) {
          i = paramInt2 + i1 - mFloatViewHeight;
        }
      }
    }
    while (paramInt1 <= mSrcPos)
    {
      return i + (mFloatViewHeight - k - getChildHeight(paramInt1 - 1)) / 2;
      i = paramInt2 + (i1 - m) - n;
      continue;
      i = j;
      if (paramInt1 > mSecondExpPos)
      {
        i = j;
        if (paramInt1 <= mSrcPos)
        {
          i = paramInt2 - n;
          continue;
          if ((paramInt1 > mSrcPos) && (paramInt1 <= mFirstExpPos))
          {
            i = paramInt2 + n;
          }
          else
          {
            i = j;
            if (paramInt1 == mSecondExpPos)
            {
              i = j;
              if (mFirstExpPos != mSecondExpPos) {
                i = paramInt2 + (i1 - m);
              }
            }
          }
        }
      }
    }
    return i + (m - k - mFloatViewHeight) / 2;
  }
  
  private static int insertionIndexForKey(SparseBooleanArray paramSparseBooleanArray, int paramInt)
  {
    int i = 0;
    int j = paramSparseBooleanArray.size();
    while (j - i > 0)
    {
      int k = i + j >> 1;
      if (paramSparseBooleanArray.keyAt(k) < paramInt) {
        i = k + 1;
      } else {
        j = k;
      }
    }
    return i;
  }
  
  private void measureFloatView()
  {
    if (mFloatView != null)
    {
      measureItem(mFloatView);
      mFloatViewHeight = mFloatView.getMeasuredHeight();
      mFloatViewHeightHalf = (mFloatViewHeight / 2);
    }
  }
  
  private void measureItem(View paramView)
  {
    ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
    Object localObject = localLayoutParams;
    if (localLayoutParams == null)
    {
      localObject = new AbsListView.LayoutParams(-1, -2);
      paramView.setLayoutParams((ViewGroup.LayoutParams)localObject);
    }
    int j = ViewGroup.getChildMeasureSpec(mWidthMeasureSpec, getListPaddingLeft() + getListPaddingRight(), width);
    if (height > 0) {}
    for (int i = View.MeasureSpec.makeMeasureSpec(height, 1073741824);; i = View.MeasureSpec.makeMeasureSpec(0, 0))
    {
      paramView.measure(j, i);
      return;
    }
  }
  
  private static int rotate(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = paramInt4 - paramInt3;
    paramInt2 = paramInt1 + paramInt2;
    if (paramInt2 < paramInt3) {
      paramInt1 = paramInt2 + i;
    }
    do
    {
      return paramInt1;
      paramInt1 = paramInt2;
    } while (paramInt2 < paramInt4);
    return paramInt2 - i;
  }
  
  private void saveTouchCoords(MotionEvent paramMotionEvent)
  {
    int i = paramMotionEvent.getAction() & 0xFF;
    if (i != 0) {
      mLastY = mY;
    }
    mX = ((int)paramMotionEvent.getX());
    mY = ((int)paramMotionEvent.getY());
    if (i == 0) {
      mLastY = mY;
    }
  }
  
  private void updateFloatView()
  {
    if (mFloatViewManager != null)
    {
      mTouchLoc.set(mX, mY);
      mFloatViewManager.onDragFloatView(mFloatView, mFloatLoc, mTouchLoc);
    }
    int i = mFloatLoc.x;
    int m = mFloatLoc.y;
    int j = getPaddingLeft();
    int k;
    if (((mDragFlags & 0x1) == 0) && (i > j))
    {
      mFloatLoc.x = j;
      j = getHeaderViewsCount();
      k = getFooterViewsCount();
      int n = getFirstVisiblePosition();
      int i1 = getLastVisiblePosition();
      i = getPaddingTop();
      if (n < j) {
        i = getChildAt(j - n - 1).getBottom();
      }
      j = i;
      if ((mDragFlags & 0x8) == 0)
      {
        j = i;
        if (n <= mSrcPos) {
          j = Math.max(getChildAt(mSrcPos - n).getTop(), i);
        }
      }
      i = getHeight() - getPaddingBottom();
      if (i1 >= getCount() - k - 1) {
        i = getChildAt(getCount() - k - 1 - n).getBottom();
      }
      k = i;
      if ((mDragFlags & 0x4) == 0)
      {
        k = i;
        if (i1 >= mSrcPos) {
          k = Math.min(getChildAt(mSrcPos - n).getBottom(), i);
        }
      }
      if (m >= j) {
        break label315;
      }
      mFloatLoc.y = j;
    }
    for (;;)
    {
      mFloatViewMid = (mFloatLoc.y + mFloatViewHeightHalf);
      return;
      if (((mDragFlags & 0x2) != 0) || (i >= j)) {
        break;
      }
      mFloatLoc.x = j;
      break;
      label315:
      if (mFloatViewHeight + m > k) {
        mFloatLoc.y = (k - mFloatViewHeight);
      }
    }
  }
  
  private boolean updatePositions()
  {
    int i = getFirstVisiblePosition();
    int n = mFirstExpPos;
    View localView2 = getChildAt(n - i);
    View localView1 = localView2;
    if (localView2 == null)
    {
      n = i + getChildCount() / 2;
      localView1 = getChildAt(n - i);
    }
    int j = localView1.getTop();
    int i1 = localView1.getHeight();
    i = getShuffleEdge(n, j);
    int m = i;
    int i4 = getDividerHeight();
    int k;
    int i2;
    label141:
    int i3;
    boolean bool;
    float f1;
    label197:
    float f2;
    if (mFloatViewMid < i)
    {
      i1 = j;
      j = n;
      k = m;
      if (n >= 0)
      {
        i2 = n - 1;
        i = getItemHeight(i2);
        if (i2 == 0)
        {
          i = i1 - i4 - i;
          k = m;
          j = i2;
        }
      }
      else
      {
        n = getHeaderViewsCount();
        i3 = getFooterViewsCount();
        bool = false;
        i1 = mFirstExpPos;
        i2 = mSecondExpPos;
        f1 = mSlideFrac;
        if (!mAnimate) {
          break label619;
        }
        i4 = Math.abs(i - k);
        if (mFloatViewMid >= i) {
          break label545;
        }
        m = (int)(0.5F * mSlideRegionFrac * i4);
        f2 = m;
        k += m;
        if (mFloatViewMid >= k) {
          break label558;
        }
        mFirstExpPos = (j - 1);
        mSecondExpPos = j;
        mSlideFrac = (0.5F * (k - mFloatViewMid) / f2);
        label262:
        if (mFirstExpPos >= n) {
          break label634;
        }
        j = n;
        mFirstExpPos = j;
        mSecondExpPos = j;
      }
    }
    for (;;)
    {
      if ((mFirstExpPos != i1) || (mSecondExpPos != i2) || (mSlideFrac != f1)) {
        bool = true;
      }
      if (j != mFloatPos)
      {
        if (mDragListener != null) {
          mDragListener.drag(mFloatPos - n, j - n);
        }
        mFloatPos = j;
        bool = true;
      }
      return bool;
      i1 -= i + i4;
      n = getShuffleEdge(i2, i1);
      i = n;
      j = i2;
      k = m;
      if (mFloatViewMid >= n) {
        break label141;
      }
      m = n;
      i = n;
      n = i2;
      break;
      int i5 = getCount();
      i2 = j;
      for (;;)
      {
        j = n;
        k = m;
        if (n >= i5) {
          break;
        }
        if (n == i5 - 1)
        {
          i = i2 + i4 + i1;
          j = n;
          k = m;
          break;
        }
        i2 += i4 + i1;
        i3 = getItemHeight(n + 1);
        i1 = getShuffleEdge(n + 1, i2);
        i = i1;
        j = n;
        k = m;
        if (mFloatViewMid < i1) {
          break;
        }
        m = i1;
        n += 1;
        i = i1;
        i1 = i3;
      }
      label545:
      m = i;
      i = k;
      k = m;
      break label197;
      label558:
      if (mFloatViewMid < i - m)
      {
        mFirstExpPos = j;
        mSecondExpPos = j;
        break label262;
      }
      mFirstExpPos = j;
      mSecondExpPos = (j + 1);
      mSlideFrac = (0.5F * (1.0F + (i - mFloatViewMid) / f2));
      break label262;
      label619:
      mFirstExpPos = j;
      mSecondExpPos = j;
      break label262;
      label634:
      if (mSecondExpPos >= getCount() - i3)
      {
        j = getCount() - i3 - 1;
        mFirstExpPos = j;
        mSecondExpPos = j;
      }
    }
  }
  
  private void updateScrollStarts()
  {
    int i = getPaddingTop();
    int j = getHeight() - i - getPaddingBottom();
    float f = j;
    mUpScrollStartYF = (i + mDragUpScrollStartFrac * f);
    mDownScrollStartYF = (i + (1.0F - mDragDownScrollStartFrac) * f);
    mUpScrollStartY = ((int)mUpScrollStartYF);
    mDownScrollStartY = ((int)mDownScrollStartYF);
    mDragUpScrollHeight = (mUpScrollStartYF - i);
    mDragDownScrollHeight = (i + j - mDownScrollStartYF);
  }
  
  public void cancelDrag()
  {
    if (mDragState == 4)
    {
      mDragScroller.stopScrolling(true);
      destroyFloatView();
      clearPositions();
      adjustAllItems();
      if (mInTouchEvent) {
        mDragState = 3;
      }
    }
    else
    {
      return;
    }
    mDragState = 0;
  }
  
  protected void dispatchDraw(Canvas paramCanvas)
  {
    super.dispatchDraw(paramCanvas);
    if (mDragState != 0)
    {
      if (mFirstExpPos != mSrcPos) {
        drawDivider(mFirstExpPos, paramCanvas);
      }
      if ((mSecondExpPos != mFirstExpPos) && (mSecondExpPos != mSrcPos)) {
        drawDivider(mSecondExpPos, paramCanvas);
      }
    }
    int k;
    int m;
    int i;
    float f;
    if (mFloatView != null)
    {
      k = mFloatView.getWidth();
      m = mFloatView.getHeight();
      int j = mFloatLoc.x;
      int n = getWidth();
      i = j;
      if (j < 0) {
        i = -j;
      }
      if (i >= n) {
        break label216;
      }
      f = (n - i) / n;
    }
    label216:
    for (f *= f;; f = 0.0F)
    {
      i = (int)(255.0F * mCurrFloatAlpha * f);
      paramCanvas.save();
      paramCanvas.translate(mFloatLoc.x, mFloatLoc.y);
      paramCanvas.clipRect(0, 0, k, m);
      paramCanvas.saveLayerAlpha(0.0F, 0.0F, k, m, i, 31);
      mFloatView.draw(paramCanvas);
      paramCanvas.restore();
      paramCanvas.restore();
      return;
    }
  }
  
  public float getFloatAlpha()
  {
    return mCurrFloatAlpha;
  }
  
  public ListAdapter getInputAdapter()
  {
    if (mAdapterWrapper == null) {
      return null;
    }
    return mAdapterWrapper.getAdapter();
  }
  
  public boolean isDragEnabled()
  {
    return mDragEnabled;
  }
  
  protected void layoutChildren()
  {
    super.layoutChildren();
    if (mFloatView != null)
    {
      if ((mFloatView.isLayoutRequested()) && (!mFloatViewOnMeasured)) {
        measureFloatView();
      }
      mFloatView.layout(0, 0, mFloatView.getMeasuredWidth(), mFloatView.getMeasuredHeight());
      mFloatViewOnMeasured = false;
    }
  }
  
  public boolean listViewIntercepted()
  {
    return mListViewIntercepted;
  }
  
  public void moveCheckState(int paramInt1, int paramInt2)
  {
    SparseBooleanArray localSparseBooleanArray = getCheckedItemPositions();
    int i = paramInt1;
    int j = paramInt2;
    if (paramInt2 < paramInt1)
    {
      i = paramInt2;
      j = paramInt1;
    }
    int k = j + 1;
    int[] arrayOfInt1 = new int[localSparseBooleanArray.size()];
    int[] arrayOfInt2 = new int[localSparseBooleanArray.size()];
    j = buildRunList(localSparseBooleanArray, i, k, arrayOfInt1, arrayOfInt2);
    if ((j == 1) && (arrayOfInt1[0] == arrayOfInt2[0])) {}
    for (;;)
    {
      return;
      if (paramInt1 < paramInt2)
      {
        paramInt1 = 0;
        while (paramInt1 != j)
        {
          setItemChecked(rotate(arrayOfInt1[paramInt1], -1, i, k), true);
          setItemChecked(rotate(arrayOfInt2[paramInt1], -1, i, k), false);
          paramInt1 += 1;
        }
      }
      else
      {
        paramInt1 = 0;
        while (paramInt1 != j)
        {
          setItemChecked(arrayOfInt1[paramInt1], false);
          setItemChecked(arrayOfInt2[paramInt1], true);
          paramInt1 += 1;
        }
      }
    }
  }
  
  protected boolean onDragTouchEvent(MotionEvent paramMotionEvent)
  {
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    }
    for (;;)
    {
      return true;
      if (mDragState == 4) {
        cancelDrag();
      }
      doActionUpOrCancel();
      continue;
      if (mDragState == 4) {
        stopDrag(false);
      }
      doActionUpOrCancel();
      continue;
      continueDrag((int)paramMotionEvent.getX(), (int)paramMotionEvent.getY());
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (mTrackDragSort) {
      mDragSortTracker.appendState();
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool2;
    if (!mDragEnabled)
    {
      bool2 = super.onInterceptTouchEvent(paramMotionEvent);
      return bool2;
    }
    saveTouchCoords(paramMotionEvent);
    mLastCallWasIntercept = true;
    int i = paramMotionEvent.getAction() & 0xFF;
    if (i == 0)
    {
      if (mDragState != 0)
      {
        mIgnoreTouchEvent = true;
        return true;
      }
      mInTouchEvent = true;
    }
    boolean bool1 = false;
    if (mFloatView != null) {
      bool1 = true;
    }
    for (;;)
    {
      if (i != 1)
      {
        bool2 = bool1;
        if (i != 3) {
          break;
        }
      }
      mInTouchEvent = false;
      return bool1;
      if (super.onInterceptTouchEvent(paramMotionEvent))
      {
        mListViewIntercepted = true;
        bool1 = true;
      }
      switch (i)
      {
      case 2: 
      default: 
        if (bool1) {
          mCancelMethod = 1;
        }
        break;
      case 1: 
      case 3: 
        doActionUpOrCancel();
        continue;
        mCancelMethod = 2;
      }
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    if (mFloatView != null)
    {
      if (mFloatView.isLayoutRequested()) {
        measureFloatView();
      }
      mFloatViewOnMeasured = true;
    }
    mWidthMeasureSpec = paramInt1;
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    updateScrollStarts();
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool2;
    if (mIgnoreTouchEvent)
    {
      mIgnoreTouchEvent = false;
      bool2 = false;
    }
    boolean bool1;
    do
    {
      return bool2;
      if (!mDragEnabled) {
        return super.onTouchEvent(paramMotionEvent);
      }
      bool2 = false;
      bool1 = mLastCallWasIntercept;
      mLastCallWasIntercept = false;
      if (!bool1) {
        saveTouchCoords(paramMotionEvent);
      }
      if (mDragState == 4)
      {
        onDragTouchEvent(paramMotionEvent);
        return true;
      }
      bool1 = bool2;
      if (mDragState == 0)
      {
        bool1 = bool2;
        if (super.onTouchEvent(paramMotionEvent)) {
          bool1 = true;
        }
      }
      switch (paramMotionEvent.getAction() & 0xFF)
      {
      case 2: 
      default: 
        bool2 = bool1;
      }
    } while (!bool1);
    mCancelMethod = 1;
    return bool1;
    doActionUpOrCancel();
    return bool1;
  }
  
  public void removeItem(int paramInt)
  {
    mUseRemoveVelocity = false;
    removeItem(paramInt, 0.0F);
  }
  
  public void removeItem(int paramInt, float paramFloat)
  {
    if ((mDragState == 0) || (mDragState == 4))
    {
      if (mDragState == 0)
      {
        mSrcPos = (getHeaderViewsCount() + paramInt);
        mFirstExpPos = mSrcPos;
        mSecondExpPos = mSrcPos;
        mFloatPos = mSrcPos;
        View localView = getChildAt(mSrcPos - getFirstVisiblePosition());
        if (localView != null) {
          localView.setVisibility(4);
        }
      }
      mDragState = 1;
      mRemoveVelocityX = paramFloat;
      if (mInTouchEvent) {
        switch (mCancelMethod)
        {
        }
      }
    }
    while (mRemoveAnimator != null)
    {
      mRemoveAnimator.start();
      return;
      super.onTouchEvent(mCancelEvent);
      continue;
      super.onInterceptTouchEvent(mCancelEvent);
    }
    doRemoveItem(paramInt);
  }
  
  public void requestLayout()
  {
    if (!mBlockLayoutRequests) {
      super.requestLayout();
    }
  }
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (paramListAdapter != null)
    {
      mAdapterWrapper = new AdapterWrapper(paramListAdapter);
      paramListAdapter.registerDataSetObserver(mObserver);
      if ((paramListAdapter instanceof DropListener)) {
        setDropListener((DropListener)paramListAdapter);
      }
      if ((paramListAdapter instanceof DragListener)) {
        setDragListener((DragListener)paramListAdapter);
      }
      if ((paramListAdapter instanceof RemoveListener)) {
        setRemoveListener((RemoveListener)paramListAdapter);
      }
    }
    for (;;)
    {
      super.setAdapter(mAdapterWrapper);
      return;
      mAdapterWrapper = null;
    }
  }
  
  public void setDragEnabled(boolean paramBoolean)
  {
    mDragEnabled = paramBoolean;
  }
  
  public void setDragListener(DragListener paramDragListener)
  {
    mDragListener = paramDragListener;
  }
  
  public void setDragScrollProfile(DragScrollProfile paramDragScrollProfile)
  {
    if (paramDragScrollProfile != null) {
      mScrollProfile = paramDragScrollProfile;
    }
  }
  
  public void setDragScrollStart(float paramFloat)
  {
    setDragScrollStarts(paramFloat, paramFloat);
  }
  
  public void setDragScrollStarts(float paramFloat1, float paramFloat2)
  {
    if (paramFloat2 > 0.5F)
    {
      mDragDownScrollStartFrac = 0.5F;
      if (paramFloat1 <= 0.5F) {
        break label46;
      }
    }
    label46:
    for (mDragUpScrollStartFrac = 0.5F;; mDragUpScrollStartFrac = paramFloat1)
    {
      if (getHeight() != 0) {
        updateScrollStarts();
      }
      return;
      mDragDownScrollStartFrac = paramFloat2;
      break;
    }
  }
  
  public void setDragSortListener(DragSortListener paramDragSortListener)
  {
    setDropListener(paramDragSortListener);
    setDragListener(paramDragSortListener);
    setRemoveListener(paramDragSortListener);
  }
  
  public void setDropListener(DropListener paramDropListener)
  {
    mDropListener = paramDropListener;
  }
  
  public void setFloatAlpha(float paramFloat)
  {
    mCurrFloatAlpha = paramFloat;
  }
  
  public void setFloatViewManager(FloatViewManager paramFloatViewManager)
  {
    mFloatViewManager = paramFloatViewManager;
  }
  
  public void setMaxScrollSpeed(float paramFloat)
  {
    mMaxScrollSpeed = paramFloat;
  }
  
  public void setRemoveListener(RemoveListener paramRemoveListener)
  {
    mRemoveListener = paramRemoveListener;
  }
  
  public boolean startDrag(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if ((!mInTouchEvent) || (mFloatViewManager == null)) {}
    View localView;
    do
    {
      return false;
      localView = mFloatViewManager.onCreateFloatView(paramInt1);
    } while (localView == null);
    return startDrag(paramInt1, localView, paramInt2, paramInt3, paramInt4);
  }
  
  public boolean startDrag(int paramInt1, View paramView, int paramInt2, int paramInt3, int paramInt4)
  {
    boolean bool = true;
    if ((mDragState != 0) || (!mInTouchEvent) || (mFloatView != null) || (paramView == null) || (!mDragEnabled))
    {
      bool = false;
      return bool;
    }
    if (getParent() != null) {
      getParent().requestDisallowInterceptTouchEvent(true);
    }
    paramInt1 += getHeaderViewsCount();
    mFirstExpPos = paramInt1;
    mSecondExpPos = paramInt1;
    mSrcPos = paramInt1;
    mFloatPos = paramInt1;
    mDragState = 4;
    mDragFlags = 0;
    mDragFlags |= paramInt2;
    mFloatView = paramView;
    measureFloatView();
    mDragDeltaX = paramInt3;
    mDragDeltaY = paramInt4;
    mFloatLoc.x = (mX - mDragDeltaX);
    mFloatLoc.y = (mY - mDragDeltaY);
    paramView = getChildAt(mSrcPos - getFirstVisiblePosition());
    if (paramView != null) {
      paramView.setVisibility(4);
    }
    if (mTrackDragSort) {
      mDragSortTracker.startTracking();
    }
    switch (mCancelMethod)
    {
    }
    for (;;)
    {
      requestLayout();
      if (mLiftAnimator == null) {
        break;
      }
      mLiftAnimator.start();
      return true;
      super.onTouchEvent(mCancelEvent);
      continue;
      super.onInterceptTouchEvent(mCancelEvent);
    }
  }
  
  public boolean stopDrag(boolean paramBoolean)
  {
    mUseRemoveVelocity = false;
    return stopDrag(paramBoolean, 0.0F);
  }
  
  public boolean stopDrag(boolean paramBoolean, float paramFloat)
  {
    if (mFloatView != null)
    {
      mDragScroller.stopScrolling(true);
      if (paramBoolean) {
        removeItem(mSrcPos - getHeaderViewsCount(), paramFloat);
      }
      for (;;)
      {
        if (mTrackDragSort) {
          mDragSortTracker.stopTracking();
        }
        return true;
        if (mDropAnimator != null) {
          mDropAnimator.start();
        } else {
          dropFloatView();
        }
      }
    }
    return false;
  }
  
  public boolean stopDragWithVelocity(boolean paramBoolean, float paramFloat)
  {
    mUseRemoveVelocity = true;
    return stopDrag(paramBoolean, paramFloat);
  }
  
  private class AdapterWrapper
    extends BaseAdapter
  {
    private ListAdapter mAdapter;
    
    public AdapterWrapper(ListAdapter paramListAdapter)
    {
      mAdapter = paramListAdapter;
      mAdapter.registerDataSetObserver(new DataSetObserver()
      {
        public void onChanged()
        {
          notifyDataSetChanged();
        }
        
        public void onInvalidated()
        {
          notifyDataSetInvalidated();
        }
      });
    }
    
    public boolean areAllItemsEnabled()
    {
      return mAdapter.areAllItemsEnabled();
    }
    
    public ListAdapter getAdapter()
    {
      return mAdapter;
    }
    
    public int getCount()
    {
      return mAdapter.getCount();
    }
    
    public Object getItem(int paramInt)
    {
      return mAdapter.getItem(paramInt);
    }
    
    public long getItemId(int paramInt)
    {
      return mAdapter.getItemId(paramInt);
    }
    
    public int getItemViewType(int paramInt)
    {
      return mAdapter.getItemViewType(paramInt);
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if (paramView != null)
      {
        paramViewGroup = (DragSortItemView)paramView;
        View localView1 = paramViewGroup.getChildAt(0);
        View localView2 = mAdapter.getView(paramInt, localView1, DragSortListView.this);
        paramView = paramViewGroup;
        if (localView2 != localView1)
        {
          if (localView1 != null) {
            paramViewGroup.removeViewAt(0);
          }
          paramViewGroup.addView(localView2);
          paramView = paramViewGroup;
        }
        DragSortListView.this.adjustItem(getHeaderViewsCount() + paramInt, paramView, true);
        return paramView;
      }
      paramViewGroup = mAdapter.getView(paramInt, null, DragSortListView.this);
      if ((paramViewGroup instanceof Checkable)) {}
      for (paramView = new DragSortItemViewCheckable(getContext());; paramView = new DragSortItemView(getContext()))
      {
        paramView.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
        paramView.addView(paramViewGroup);
        break;
      }
    }
    
    public int getViewTypeCount()
    {
      return mAdapter.getViewTypeCount();
    }
    
    public boolean hasStableIds()
    {
      return mAdapter.hasStableIds();
    }
    
    public boolean isEmpty()
    {
      return mAdapter.isEmpty();
    }
    
    public boolean isEnabled(int paramInt)
    {
      return mAdapter.isEnabled(paramInt);
    }
  }
  
  public static abstract interface DragListener
  {
    public abstract void drag(int paramInt1, int paramInt2);
  }
  
  public static abstract interface DragScrollProfile
  {
    public abstract float getSpeed(float paramFloat, long paramLong);
  }
  
  private class DragScroller
    implements Runnable
  {
    private float dt;
    private int dy;
    private boolean mAbort;
    private long mCurrTime;
    private long mPrevTime;
    private float mScrollSpeed;
    private boolean mScrolling = false;
    private int scrollDir;
    private long tStart;
    
    public DragScroller() {}
    
    public int getScrollDir()
    {
      if (mScrolling) {
        return scrollDir;
      }
      return -1;
    }
    
    public boolean isScrolling()
    {
      return mScrolling;
    }
    
    public void run()
    {
      if (mAbort)
      {
        mScrolling = false;
        return;
      }
      int j = getFirstVisiblePosition();
      int i = getLastVisiblePosition();
      int m = getCount();
      int k = getPaddingTop();
      int n = getHeight() - k - getPaddingBottom();
      int i1 = Math.min(mY, mFloatViewMid + mFloatViewHeightHalf);
      int i2 = Math.max(mY, mFloatViewMid - mFloatViewHeightHalf);
      View localView;
      if (scrollDir == 0)
      {
        localView = getChildAt(0);
        if (localView == null)
        {
          mScrolling = false;
          return;
        }
        if ((j == 0) && (localView.getTop() == k))
        {
          mScrolling = false;
          return;
        }
        mScrollSpeed = mScrollProfile.getSpeed((mUpScrollStartYF - i2) / mDragUpScrollHeight, mPrevTime);
        mCurrTime = SystemClock.uptimeMillis();
        dt = ((float)(mCurrTime - mPrevTime));
        dy = Math.round(mScrollSpeed * dt);
        if (dy < 0) {
          break label470;
        }
        dy = Math.min(n, dy);
        i = j;
      }
      for (;;)
      {
        localView = getChildAt(i - j);
        m = localView.getTop() + dy;
        j = m;
        if (i == 0)
        {
          j = m;
          if (m > k) {
            j = k;
          }
        }
        DragSortListView.access$2602(DragSortListView.this, true);
        setSelectionFromTop(i, j - k);
        layoutChildren();
        invalidate();
        DragSortListView.access$2602(DragSortListView.this, false);
        DragSortListView.this.doDragFloatView(i, localView, false);
        mPrevTime = mCurrTime;
        post(this);
        return;
        localView = getChildAt(i - j);
        if (localView == null)
        {
          mScrolling = false;
          return;
        }
        if ((i == m - 1) && (localView.getBottom() <= n + k))
        {
          mScrolling = false;
          return;
        }
        mScrollSpeed = (-mScrollProfile.getSpeed((i1 - mDownScrollStartYF) / mDragDownScrollHeight, mPrevTime));
        break;
        label470:
        dy = Math.max(-n, dy);
      }
    }
    
    public void startScrolling(int paramInt)
    {
      if (!mScrolling)
      {
        mAbort = false;
        mScrolling = true;
        tStart = SystemClock.uptimeMillis();
        mPrevTime = tStart;
        scrollDir = paramInt;
        post(this);
      }
    }
    
    public void stopScrolling(boolean paramBoolean)
    {
      if (paramBoolean)
      {
        removeCallbacks(this);
        mScrolling = false;
        return;
      }
      mAbort = true;
    }
  }
  
  public static abstract interface DragSortListener
    extends DragSortListView.DragListener, DragSortListView.DropListener, DragSortListView.RemoveListener
  {}
  
  private class DragSortTracker
  {
    StringBuilder mBuilder = new StringBuilder();
    File mFile = new File(Environment.getExternalStorageDirectory(), "dslv_state.txt");
    private int mNumFlushes = 0;
    private int mNumInBuffer = 0;
    private boolean mTracking = false;
    
    public DragSortTracker()
    {
      if (!mFile.exists()) {}
      try
      {
        mFile.createNewFile();
        Log.d("mobeta", "file created");
        return;
      }
      catch (IOException this$1)
      {
        Log.w("mobeta", "Could not create dslv_state.txt");
        Log.d("mobeta", getMessage());
      }
    }
    
    public void appendState()
    {
      if (!mTracking) {}
      do
      {
        return;
        mBuilder.append("<DSLVState>\n");
        int j = getChildCount();
        int k = getFirstVisiblePosition();
        mBuilder.append("    <Positions>");
        int i = 0;
        while (i < j)
        {
          mBuilder.append(k + i).append(",");
          i += 1;
        }
        mBuilder.append("</Positions>\n");
        mBuilder.append("    <Tops>");
        i = 0;
        while (i < j)
        {
          mBuilder.append(getChildAt(i).getTop()).append(",");
          i += 1;
        }
        mBuilder.append("</Tops>\n");
        mBuilder.append("    <Bottoms>");
        i = 0;
        while (i < j)
        {
          mBuilder.append(getChildAt(i).getBottom()).append(",");
          i += 1;
        }
        mBuilder.append("</Bottoms>\n");
        mBuilder.append("    <FirstExpPos>").append(mFirstExpPos).append("</FirstExpPos>\n");
        mBuilder.append("    <FirstExpBlankHeight>").append(DragSortListView.this.getItemHeight(mFirstExpPos) - DragSortListView.this.getChildHeight(mFirstExpPos)).append("</FirstExpBlankHeight>\n");
        mBuilder.append("    <SecondExpPos>").append(mSecondExpPos).append("</SecondExpPos>\n");
        mBuilder.append("    <SecondExpBlankHeight>").append(DragSortListView.this.getItemHeight(mSecondExpPos) - DragSortListView.this.getChildHeight(mSecondExpPos)).append("</SecondExpBlankHeight>\n");
        mBuilder.append("    <SrcPos>").append(mSrcPos).append("</SrcPos>\n");
        mBuilder.append("    <SrcHeight>").append(mFloatViewHeight + getDividerHeight()).append("</SrcHeight>\n");
        mBuilder.append("    <ViewHeight>").append(getHeight()).append("</ViewHeight>\n");
        mBuilder.append("    <LastY>").append(mLastY).append("</LastY>\n");
        mBuilder.append("    <FloatY>").append(mFloatViewMid).append("</FloatY>\n");
        mBuilder.append("    <ShuffleEdges>");
        i = 0;
        while (i < j)
        {
          mBuilder.append(DragSortListView.this.getShuffleEdge(k + i, getChildAt(i).getTop())).append(",");
          i += 1;
        }
        mBuilder.append("</ShuffleEdges>\n");
        mBuilder.append("</DSLVState>\n");
        mNumInBuffer += 1;
      } while (mNumInBuffer <= 1000);
      flush();
      mNumInBuffer = 0;
    }
    
    public void flush()
    {
      if (!mTracking) {
        return;
      }
      boolean bool = true;
      try
      {
        if (mNumFlushes == 0) {
          bool = false;
        }
        FileWriter localFileWriter = new FileWriter(mFile, bool);
        localFileWriter.write(mBuilder.toString());
        mBuilder.delete(0, mBuilder.length());
        localFileWriter.flush();
        localFileWriter.close();
        mNumFlushes += 1;
        return;
      }
      catch (IOException localIOException) {}
    }
    
    public void startTracking()
    {
      mBuilder.append("<DSLVStates>\n");
      mNumFlushes = 0;
      mTracking = true;
    }
    
    public void stopTracking()
    {
      if (mTracking)
      {
        mBuilder.append("</DSLVStates>\n");
        flush();
        mTracking = false;
      }
    }
  }
  
  private class DropAnimator
    extends DragSortListView.SmoothAnimator
  {
    private int mDropPos;
    private float mInitDeltaX;
    private float mInitDeltaY;
    private int srcPos;
    
    public DropAnimator(float paramFloat, int paramInt)
    {
      super(paramFloat, paramInt);
    }
    
    private int getTargetY()
    {
      int i = getFirstVisiblePosition();
      int j = (mItemHeightCollapsed + getDividerHeight()) / 2;
      View localView = getChildAt(mDropPos - i);
      if (localView != null)
      {
        if (mDropPos == srcPos) {
          return localView.getTop();
        }
        if (mDropPos < srcPos) {
          return localView.getTop() - j;
        }
        return localView.getBottom() + j - mFloatViewHeight;
      }
      cancel();
      return -1;
    }
    
    public void onStart()
    {
      mDropPos = mFloatPos;
      srcPos = mSrcPos;
      DragSortListView.access$102(DragSortListView.this, 2);
      mInitDeltaY = (mFloatLoc.y - getTargetY());
      mInitDeltaX = (mFloatLoc.x - getPaddingLeft());
    }
    
    public void onStop()
    {
      DragSortListView.this.dropFloatView();
    }
    
    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      int i = getTargetY();
      int j = getPaddingLeft();
      paramFloat1 = mFloatLoc.y - i;
      float f = mFloatLoc.x - j;
      paramFloat2 = 1.0F - paramFloat2;
      if ((paramFloat2 < Math.abs(paramFloat1 / mInitDeltaY)) || (paramFloat2 < Math.abs(f / mInitDeltaX)))
      {
        mFloatLoc.y = ((int)(mInitDeltaY * paramFloat2) + i);
        mFloatLoc.x = (getPaddingLeft() + (int)(mInitDeltaX * paramFloat2));
        DragSortListView.this.doDragFloatView(true);
      }
    }
  }
  
  public static abstract interface DropListener
  {
    public abstract void drop(int paramInt1, int paramInt2);
  }
  
  public static abstract interface FloatViewManager
  {
    public abstract View onCreateFloatView(int paramInt);
    
    public abstract void onDestroyFloatView(View paramView);
    
    public abstract void onDragFloatView(View paramView, Point paramPoint1, Point paramPoint2);
  }
  
  private class HeightCache
  {
    private SparseIntArray mMap;
    private int mMaxSize;
    private ArrayList<Integer> mOrder;
    
    public HeightCache(int paramInt)
    {
      mMap = new SparseIntArray(paramInt);
      mOrder = new ArrayList(paramInt);
      mMaxSize = paramInt;
    }
    
    public void add(int paramInt1, int paramInt2)
    {
      int i = mMap.get(paramInt1, -1);
      if (i != paramInt2)
      {
        if (i != -1) {
          break label77;
        }
        if (mMap.size() == mMaxSize) {
          mMap.delete(((Integer)mOrder.remove(0)).intValue());
        }
      }
      for (;;)
      {
        mMap.put(paramInt1, paramInt2);
        mOrder.add(Integer.valueOf(paramInt1));
        return;
        label77:
        mOrder.remove(Integer.valueOf(paramInt1));
      }
    }
    
    public void clear()
    {
      mMap.clear();
      mOrder.clear();
    }
    
    public int get(int paramInt)
    {
      return mMap.get(paramInt, -1);
    }
  }
  
  private class LiftAnimator
    extends DragSortListView.SmoothAnimator
  {
    private float mFinalDragDeltaY;
    private float mInitDragDeltaY;
    
    public void onStart()
    {
      mInitDragDeltaY = this$0.mDragDeltaY;
      mFinalDragDeltaY = this$0.mFloatViewHeightHalf;
    }
    
    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      if (this$0.mDragState != 4)
      {
        cancel();
        return;
      }
      DragSortListView.access$302(this$0, (int)(mFinalDragDeltaY * paramFloat2 + (1.0F - paramFloat2) * mInitDragDeltaY));
      this$0.mFloatLoc.y = (this$0.mY - this$0.mDragDeltaY);
      this$0.doDragFloatView(true);
    }
  }
  
  private class RemoveAnimator
    extends DragSortListView.SmoothAnimator
  {
    private int mFirstChildHeight = -1;
    private int mFirstPos;
    private float mFirstStartBlank;
    private float mFloatLocX;
    private int mSecondChildHeight = -1;
    private int mSecondPos;
    private float mSecondStartBlank;
    
    public RemoveAnimator(float paramFloat, int paramInt)
    {
      super(paramFloat, paramInt);
    }
    
    public void onStart()
    {
      int i = -1;
      mFirstChildHeight = -1;
      mSecondChildHeight = -1;
      mFirstPos = mFirstExpPos;
      mSecondPos = mSecondExpPos;
      DragSortListView.access$102(DragSortListView.this, 1);
      mFloatLocX = mFloatLoc.x;
      if (mUseRemoveVelocity)
      {
        float f = 2.0F * getWidth();
        if (mRemoveVelocityX == 0.0F)
        {
          DragSortListView localDragSortListView = DragSortListView.this;
          if (mFloatLocX < 0.0F) {
            DragSortListView.access$1602(localDragSortListView, i * f);
          }
        }
        do
        {
          return;
          i = 1;
          break;
          f *= 2.0F;
          if ((mRemoveVelocityX < 0.0F) && (mRemoveVelocityX > -f))
          {
            DragSortListView.access$1602(DragSortListView.this, -f);
            return;
          }
        } while ((mRemoveVelocityX <= 0.0F) || (mRemoveVelocityX >= f));
        DragSortListView.access$1602(DragSortListView.this, f);
        return;
      }
      DragSortListView.this.destroyFloatView();
    }
    
    public void onStop()
    {
      DragSortListView.this.doRemoveItem();
    }
    
    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      paramFloat1 = 1.0F - paramFloat2;
      int j = getFirstVisiblePosition();
      View localView = getChildAt(mFirstPos - j);
      if (mUseRemoveVelocity)
      {
        paramFloat2 = (float)(SystemClock.uptimeMillis() - mStartTime) / 1000.0F;
        if (paramFloat2 != 0.0F) {}
      }
      do
      {
        do
        {
          return;
          float f1 = mRemoveVelocityX;
          int k = getWidth();
          localObject = DragSortListView.this;
          float f2 = mRemoveVelocityX;
          if (mRemoveVelocityX > 0.0F) {}
          for (i = 1;; i = -1)
          {
            DragSortListView.access$1602((DragSortListView)localObject, i * paramFloat2 * k + f2);
            mFloatLocX += f1 * paramFloat2;
            mFloatLoc.x = ((int)mFloatLocX);
            if ((mFloatLocX >= k) || (mFloatLocX <= -k)) {
              break;
            }
            mStartTime = SystemClock.uptimeMillis();
            DragSortListView.this.doDragFloatView(true);
            return;
          }
          if (localView != null)
          {
            if (mFirstChildHeight == -1)
            {
              mFirstChildHeight = DragSortListView.this.getChildHeight(mFirstPos, localView, false);
              mFirstStartBlank = (localView.getHeight() - mFirstChildHeight);
            }
            i = Math.max((int)(mFirstStartBlank * paramFloat1), 1);
            localObject = localView.getLayoutParams();
            height = (mFirstChildHeight + i);
            localView.setLayoutParams((ViewGroup.LayoutParams)localObject);
          }
        } while (mSecondPos == mFirstPos);
        localView = getChildAt(mSecondPos - j);
      } while (localView == null);
      if (mSecondChildHeight == -1)
      {
        mSecondChildHeight = DragSortListView.this.getChildHeight(mSecondPos, localView, false);
        mSecondStartBlank = (localView.getHeight() - mSecondChildHeight);
      }
      int i = Math.max((int)(mSecondStartBlank * paramFloat1), 1);
      Object localObject = localView.getLayoutParams();
      height = (mSecondChildHeight + i);
      localView.setLayoutParams((ViewGroup.LayoutParams)localObject);
    }
  }
  
  public static abstract interface RemoveListener
  {
    public abstract void remove(int paramInt);
  }
  
  private class SmoothAnimator
    implements Runnable
  {
    private float mA;
    private float mAlpha;
    private float mB;
    private float mC;
    private boolean mCanceled;
    private float mD;
    private float mDurationF;
    protected long mStartTime;
    
    public SmoothAnimator(float paramFloat, int paramInt)
    {
      mAlpha = paramFloat;
      mDurationF = paramInt;
      paramFloat = 1.0F / (mAlpha * 2.0F * (1.0F - mAlpha));
      mD = paramFloat;
      mA = paramFloat;
      mB = (mAlpha / ((mAlpha - 1.0F) * 2.0F));
      mC = (1.0F / (1.0F - mAlpha));
    }
    
    public void cancel()
    {
      mCanceled = true;
    }
    
    public void onStart() {}
    
    public void onStop() {}
    
    public void onUpdate(float paramFloat1, float paramFloat2) {}
    
    public void run()
    {
      if (mCanceled) {
        return;
      }
      float f = (float)(SystemClock.uptimeMillis() - mStartTime) / mDurationF;
      if (f >= 1.0F)
      {
        onUpdate(1.0F, 1.0F);
        onStop();
        return;
      }
      onUpdate(f, transform(f));
      post(this);
    }
    
    public void start()
    {
      mStartTime = SystemClock.uptimeMillis();
      mCanceled = false;
      onStart();
      post(this);
    }
    
    public float transform(float paramFloat)
    {
      if (paramFloat < mAlpha) {
        return mA * paramFloat * paramFloat;
      }
      if (paramFloat < 1.0F - mAlpha) {
        return mB + mC * paramFloat;
      }
      return 1.0F - mD * (paramFloat - 1.0F) * (paramFloat - 1.0F);
    }
  }
}
