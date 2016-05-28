package com.behance.sdk.mobeta.android.dslv;

import android.graphics.Point;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;

public class DragSortController
  extends SimpleFloatViewManager
  implements GestureDetector.OnGestureListener, View.OnTouchListener
{
  private boolean mCanDrag;
  private int mClickRemoveHitPos = -1;
  private int mClickRemoveId;
  private int mCurrX;
  private int mCurrY;
  private GestureDetector mDetector;
  private int mDragHandleId;
  private int mDragInitMode = 0;
  private boolean mDragging = false;
  private DragSortListView mDslv;
  private int mFlingHandleId;
  private int mFlingHitPos = -1;
  private GestureDetector mFlingRemoveDetector;
  private GestureDetector.OnGestureListener mFlingRemoveListener = new GestureDetector.SimpleOnGestureListener()
  {
    public final boolean onFling(MotionEvent paramAnonymousMotionEvent1, MotionEvent paramAnonymousMotionEvent2, float paramAnonymousFloat1, float paramAnonymousFloat2)
    {
      int i;
      if ((mRemoveEnabled) && (mIsRemoving))
      {
        i = mDslv.getWidth() / 5;
        if (paramAnonymousFloat1 <= mFlingSpeed) {
          break label83;
        }
        if (mPositionX > -i) {
          mDslv.stopDragWithVelocity(true, paramAnonymousFloat1);
        }
      }
      for (;;)
      {
        DragSortController.access$102(DragSortController.this, false);
        return false;
        label83:
        if ((paramAnonymousFloat1 < -mFlingSpeed) && (mPositionX < i)) {
          mDslv.stopDragWithVelocity(true, paramAnonymousFloat1);
        }
      }
    }
  };
  private float mFlingSpeed = 500.0F;
  private int mHitPos = -1;
  private boolean mIsRemoving = false;
  private int mItemX;
  private int mItemY;
  private int mPositionX;
  private boolean mRemoveEnabled = false;
  private int mRemoveMode;
  private boolean mSortEnabled = true;
  private int[] mTempLoc = new int[2];
  private int mTouchSlop;
  
  public DragSortController(DragSortListView paramDragSortListView, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    super(paramDragSortListView);
    mDslv = paramDragSortListView;
    mDetector = new GestureDetector(paramDragSortListView.getContext(), this);
    mFlingRemoveDetector = new GestureDetector(paramDragSortListView.getContext(), mFlingRemoveListener);
    mFlingRemoveDetector.setIsLongpressEnabled(false);
    mTouchSlop = ViewConfiguration.get(paramDragSortListView.getContext()).getScaledTouchSlop();
    mDragHandleId = paramInt1;
    mClickRemoveId = paramInt4;
    mFlingHandleId = paramInt5;
    setRemoveMode(paramInt3);
    setDragInitMode(paramInt2);
  }
  
  public int dragHandleHitPosition(MotionEvent paramMotionEvent)
  {
    return viewIdHitPosition(paramMotionEvent, mDragHandleId);
  }
  
  public int flingHandleHitPosition(MotionEvent paramMotionEvent)
  {
    return viewIdHitPosition(paramMotionEvent, mFlingHandleId);
  }
  
  public boolean onDown(MotionEvent paramMotionEvent)
  {
    if ((mRemoveEnabled) && (mRemoveMode == 0)) {
      mClickRemoveHitPos = viewIdHitPosition(paramMotionEvent, mClickRemoveId);
    }
    mHitPos = startDragPosition(paramMotionEvent);
    if ((mHitPos != -1) && (mDragInitMode == 0)) {
      startDrag(mHitPos, (int)paramMotionEvent.getX() - mItemX, (int)paramMotionEvent.getY() - mItemY);
    }
    mIsRemoving = false;
    mCanDrag = true;
    mPositionX = 0;
    mFlingHitPos = startFlingPosition(paramMotionEvent);
    return true;
  }
  
  public void onDragFloatView(View paramView, Point paramPoint1, Point paramPoint2)
  {
    if ((mRemoveEnabled) && (mIsRemoving)) {
      mPositionX = x;
    }
  }
  
  public final boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    return false;
  }
  
  public void onLongPress(MotionEvent paramMotionEvent)
  {
    if ((mHitPos != -1) && (mDragInitMode == 2))
    {
      mDslv.performHapticFeedback(0);
      startDrag(mHitPos, mCurrX - mItemX, mCurrY - mItemY);
    }
  }
  
  public boolean onScroll(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    int i = (int)paramMotionEvent1.getX();
    int j = (int)paramMotionEvent1.getY();
    int k = (int)paramMotionEvent2.getX();
    int m = (int)paramMotionEvent2.getY();
    int n = k - mItemX;
    int i1 = m - mItemY;
    if ((mCanDrag) && (!mDragging) && ((mHitPos != -1) || (mFlingHitPos != -1)))
    {
      if (mHitPos == -1) {
        break label178;
      }
      if ((mDragInitMode != 1) || (Math.abs(m - j) <= mTouchSlop) || (!mSortEnabled)) {
        break label129;
      }
      startDrag(mHitPos, n, i1);
    }
    label129:
    label178:
    do
    {
      do
      {
        do
        {
          return false;
        } while ((mDragInitMode == 0) || (Math.abs(k - i) <= mTouchSlop) || (!mRemoveEnabled));
        mIsRemoving = true;
        startDrag(mFlingHitPos, n, i1);
        return false;
      } while (mFlingHitPos == -1);
      if ((Math.abs(k - i) > mTouchSlop) && (mRemoveEnabled))
      {
        mIsRemoving = true;
        startDrag(mFlingHitPos, n, i1);
        return false;
      }
    } while (Math.abs(m - j) <= mTouchSlop);
    mCanDrag = false;
    return false;
  }
  
  public void onShowPress(MotionEvent paramMotionEvent) {}
  
  public boolean onSingleTapUp(MotionEvent paramMotionEvent)
  {
    if ((mRemoveEnabled) && (mRemoveMode == 0) && (mClickRemoveHitPos != -1)) {
      mDslv.removeItem(mClickRemoveHitPos - mDslv.getHeaderViewsCount());
    }
    return true;
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if ((!mDslv.isDragEnabled()) || (mDslv.listViewIntercepted())) {
      return false;
    }
    mDetector.onTouchEvent(paramMotionEvent);
    if ((mRemoveEnabled) && (mDragging) && (mRemoveMode == 1)) {
      mFlingRemoveDetector.onTouchEvent(paramMotionEvent);
    }
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    case 2: 
    default: 
      return false;
    case 0: 
      mCurrX = ((int)paramMotionEvent.getX());
      mCurrY = ((int)paramMotionEvent.getY());
      return false;
    case 1: 
      if ((mRemoveEnabled) && (mIsRemoving)) {
        if (mPositionX < 0) {
          break label183;
        }
      }
      break;
    }
    label183:
    for (int i = mPositionX;; i = -mPositionX)
    {
      if (i > mDslv.getWidth() / 2) {
        mDslv.stopDragWithVelocity(true, 0.0F);
      }
      mIsRemoving = false;
      mDragging = false;
      return false;
    }
  }
  
  public void setDragInitMode(int paramInt)
  {
    mDragInitMode = paramInt;
  }
  
  public void setRemoveEnabled(boolean paramBoolean)
  {
    mRemoveEnabled = paramBoolean;
  }
  
  public void setRemoveMode(int paramInt)
  {
    mRemoveMode = paramInt;
  }
  
  public void setSortEnabled(boolean paramBoolean)
  {
    mSortEnabled = paramBoolean;
  }
  
  public boolean startDrag(int paramInt1, int paramInt2, int paramInt3)
  {
    int j = 0;
    int i = j;
    if (mSortEnabled)
    {
      i = j;
      if (!mIsRemoving) {
        i = 0x0 | 0xC;
      }
    }
    j = i;
    if (mRemoveEnabled)
    {
      j = i;
      if (mIsRemoving) {
        j = i | 0x1 | 0x2;
      }
    }
    mDragging = mDslv.startDrag(paramInt1 - mDslv.getHeaderViewsCount(), j, paramInt2, paramInt3);
    return mDragging;
  }
  
  public int startDragPosition(MotionEvent paramMotionEvent)
  {
    return dragHandleHitPosition(paramMotionEvent);
  }
  
  public int startFlingPosition(MotionEvent paramMotionEvent)
  {
    if (mRemoveMode == 1) {
      return flingHandleHitPosition(paramMotionEvent);
    }
    return -1;
  }
  
  public int viewIdHitPosition(MotionEvent paramMotionEvent, int paramInt)
  {
    int i = (int)paramMotionEvent.getX();
    int j = (int)paramMotionEvent.getY();
    i = mDslv.pointToPosition(i, j);
    j = mDslv.getHeaderViewsCount();
    int k = mDslv.getFooterViewsCount();
    int m = mDslv.getCount();
    if ((i != -1) && (i >= j) && (i < m - k))
    {
      View localView = mDslv.getChildAt(i - mDslv.getFirstVisiblePosition());
      j = (int)paramMotionEvent.getRawX();
      k = (int)paramMotionEvent.getRawY();
      if (paramInt == 0) {}
      for (paramMotionEvent = localView; paramMotionEvent != null; paramMotionEvent = localView.findViewById(paramInt))
      {
        paramMotionEvent.getLocationOnScreen(mTempLoc);
        if ((j <= mTempLoc[0]) || (k <= mTempLoc[1]) || (j >= mTempLoc[0] + paramMotionEvent.getWidth()) || (k >= mTempLoc[1] + paramMotionEvent.getHeight())) {
          break;
        }
        mItemX = localView.getLeft();
        mItemY = localView.getTop();
        return i;
      }
    }
    return -1;
  }
}
