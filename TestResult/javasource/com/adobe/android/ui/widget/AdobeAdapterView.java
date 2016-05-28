package com.adobe.android.ui.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.database.DataSetObserver;
import android.os.Parcelable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.widget.Adapter;

public abstract class AdobeAdapterView<T extends Adapter>
  extends ViewGroup
{
  boolean mBlockLayoutRequests = false;
  boolean mDataChanged;
  private boolean mDesiredFocusableInTouchModeState;
  private boolean mDesiredFocusableState;
  private View mEmptyView;
  int mFirstPosition = 0;
  boolean mInLayout = false;
  int mItemCount;
  private int mLayoutHeight;
  boolean mNeedSync = false;
  int mNextSelectedPosition = -1;
  long mNextSelectedRowId = Long.MIN_VALUE;
  int mOldItemCount;
  int mOldSelectedPosition = -1;
  long mOldSelectedRowId = Long.MIN_VALUE;
  OnItemClickListener mOnItemClickListener;
  OnItemLongClickListener mOnItemLongClickListener;
  OnItemSelectedListener mOnItemSelectedListener;
  int mSelectedPosition = -1;
  long mSelectedRowId = Long.MIN_VALUE;
  private AdobeAdapterView<T>.SelectionNotifier mSelectionNotifier;
  int mSpecificTop;
  long mSyncHeight;
  int mSyncMode;
  int mSyncPosition;
  long mSyncRowId = Long.MIN_VALUE;
  
  public AdobeAdapterView(Context paramContext)
  {
    super(paramContext);
  }
  
  public AdobeAdapterView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public AdobeAdapterView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  @SuppressLint({"WrongCall"})
  private void updateEmptyStatus(boolean paramBoolean)
  {
    if (isInFilterMode()) {
      paramBoolean = false;
    }
    if (paramBoolean)
    {
      if (mEmptyView != null)
      {
        mEmptyView.setVisibility(0);
        setVisibility(8);
      }
      for (;;)
      {
        if (mDataChanged) {
          onLayout(false, getLeft(), getTop(), getRight(), getBottom());
        }
        return;
        setVisibility(0);
      }
    }
    if (mEmptyView != null) {
      mEmptyView.setVisibility(8);
    }
    setVisibility(0);
  }
  
  public void addView(View paramView)
  {
    throw new UnsupportedOperationException("addView(View) is not supported in AviaryAdapterView");
  }
  
  public void addView(View paramView, int paramInt)
  {
    throw new UnsupportedOperationException("addView(View, int) is not supported in AviaryAdapterView");
  }
  
  public void addView(View paramView, int paramInt, ViewGroup.LayoutParams paramLayoutParams)
  {
    throw new UnsupportedOperationException("addView(View, int, LayoutParams) is not supported in AviaryAdapterView");
  }
  
  public void addView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    throw new UnsupportedOperationException("addView(View, LayoutParams) is not supported in AviaryAdapterView");
  }
  
  protected boolean canAnimate()
  {
    return (super.canAnimate()) && (mItemCount > 0);
  }
  
  void checkFocus()
  {
    boolean bool2 = false;
    Adapter localAdapter = getAdapter();
    int i;
    if ((localAdapter == null) || (localAdapter.getCount() == 0))
    {
      i = 1;
      if ((i != 0) && (!isInFilterMode())) {
        break label111;
      }
      i = 1;
      label38:
      if ((i == 0) || (!mDesiredFocusableInTouchModeState)) {
        break label116;
      }
      bool1 = true;
      label51:
      super.setFocusableInTouchMode(bool1);
      if ((i == 0) || (!mDesiredFocusableState)) {
        break label121;
      }
    }
    label111:
    label116:
    label121:
    for (boolean bool1 = true;; bool1 = false)
    {
      super.setFocusable(bool1);
      if (mEmptyView != null)
      {
        if (localAdapter != null)
        {
          bool1 = bool2;
          if (!localAdapter.isEmpty()) {}
        }
        else
        {
          bool1 = true;
        }
        updateEmptyStatus(bool1);
      }
      return;
      i = 0;
      break;
      i = 0;
      break label38;
      bool1 = false;
      break label51;
    }
  }
  
  void checkSelectionChanged()
  {
    if ((mSelectedPosition != mOldSelectedPosition) || (mSelectedRowId != mOldSelectedRowId))
    {
      selectionChanged(mOldSelectedPosition, mSelectedPosition);
      mOldSelectedPosition = mSelectedPosition;
      mOldSelectedRowId = mSelectedRowId;
    }
  }
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    View localView = getSelectedView();
    return (localView != null) && (localView.getVisibility() == 0) && (localView.dispatchPopulateAccessibilityEvent(paramAccessibilityEvent));
  }
  
  protected void dispatchRestoreInstanceState(SparseArray<Parcelable> paramSparseArray)
  {
    dispatchThawSelfOnly(paramSparseArray);
  }
  
  protected void dispatchSaveInstanceState(SparseArray<Parcelable> paramSparseArray)
  {
    dispatchFreezeSelfOnly(paramSparseArray);
  }
  
  int findSyncPosition()
  {
    int i2 = mItemCount;
    int n;
    if (i2 == 0)
    {
      n = -1;
      return n;
    }
    long l1 = mSyncRowId;
    int i = mSyncPosition;
    if (l1 == Long.MIN_VALUE) {
      return -1;
    }
    i = Math.min(i2 - 1, Math.max(0, i));
    long l2 = SystemClock.uptimeMillis();
    int k = i;
    int m = i;
    int j = 0;
    Adapter localAdapter = getAdapter();
    label77:
    int i1;
    if (localAdapter == null)
    {
      return -1;
      if ((i1 == 0) && ((j == 0) || (n != 0))) {
        break label175;
      }
      m += 1;
      i = m;
    }
    for (j = 0;; j = 1)
    {
      label163:
      label169:
      label173:
      label175:
      do
      {
        if (SystemClock.uptimeMillis() <= l2 + 100L)
        {
          n = i;
          if (localAdapter.getItemId(i) == l1) {
            break;
          }
          if (m != i2 - 1) {
            break label163;
          }
          n = 1;
          if (k != 0) {
            break label169;
          }
        }
        for (i1 = 1;; i1 = 0)
        {
          if ((n == 0) || (i1 == 0)) {
            break label173;
          }
          return -1;
          n = 0;
          break;
        }
        break label77;
      } while ((n == 0) && ((j != 0) || (i1 != 0)));
      k -= 1;
      i = k;
    }
  }
  
  protected void fireOnSelected()
  {
    if (mOnItemSelectedListener == null) {
      return;
    }
    int i = getSelectedItemPosition();
    if (i >= 0)
    {
      View localView = getSelectedView();
      mOnItemSelectedListener.onItemSelected(this, localView, i, getAdapter().getItemId(i));
      return;
    }
    mOnItemSelectedListener.onNothingSelected(this);
  }
  
  public abstract T getAdapter();
  
  public int getCount()
  {
    return mItemCount;
  }
  
  public View getEmptyView()
  {
    return mEmptyView;
  }
  
  public int getFirstVisiblePosition()
  {
    return mFirstPosition;
  }
  
  public long getItemIdAtPosition(int paramInt)
  {
    Adapter localAdapter = getAdapter();
    if ((localAdapter == null) || (paramInt < 0)) {
      return Long.MIN_VALUE;
    }
    return localAdapter.getItemId(paramInt);
  }
  
  public int getLastVisiblePosition()
  {
    return mFirstPosition + getChildCount() - 1;
  }
  
  public final OnItemClickListener getOnItemClickListener()
  {
    return mOnItemClickListener;
  }
  
  public final OnItemLongClickListener getOnItemLongClickListener()
  {
    return mOnItemLongClickListener;
  }
  
  public final OnItemSelectedListener getOnItemSelectedListener()
  {
    return mOnItemSelectedListener;
  }
  
  public Object getSelectedItem()
  {
    Adapter localAdapter = getAdapter();
    int i = getSelectedItemPosition();
    if ((localAdapter != null) && (localAdapter.getCount() > 0) && (i >= 0)) {
      return localAdapter.getItem(i);
    }
    return null;
  }
  
  public long getSelectedItemId()
  {
    return mNextSelectedRowId;
  }
  
  public int getSelectedItemPosition()
  {
    return mNextSelectedPosition;
  }
  
  public abstract View getSelectedView();
  
  void handleDataChanged()
  {
    int m = mItemCount;
    int j = 0;
    int k = 0;
    if (m > 0)
    {
      int i = k;
      if (mNeedSync)
      {
        mNeedSync = false;
        j = findSyncPosition();
        i = k;
        if (j >= 0)
        {
          i = k;
          if (lookForSelectablePosition(j, true) == j)
          {
            setNextSelectedPositionInt(j);
            i = 1;
          }
        }
      }
      j = i;
      if (i == 0)
      {
        k = getSelectedItemPosition();
        j = k;
        if (k >= m) {
          j = m - 1;
        }
        k = j;
        if (j < 0) {
          k = 0;
        }
        j = lookForSelectablePosition(k, true);
        m = j;
        if (j < 0) {
          m = lookForSelectablePosition(k, false);
        }
        j = i;
        if (m >= 0)
        {
          setNextSelectedPositionInt(m);
          checkSelectionChanged();
          j = 1;
        }
      }
    }
    if (j == 0)
    {
      mSelectedPosition = -1;
      mSelectedRowId = Long.MIN_VALUE;
      mNextSelectedPosition = -1;
      mNextSelectedRowId = Long.MIN_VALUE;
      mNeedSync = false;
      checkSelectionChanged();
    }
  }
  
  boolean isInFilterMode()
  {
    return false;
  }
  
  int lookForSelectablePosition(int paramInt, boolean paramBoolean)
  {
    return paramInt;
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    removeCallbacks(mSelectionNotifier);
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    mLayoutHeight = getHeight();
  }
  
  public boolean performItemClick(View paramView, int paramInt, long paramLong)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (mOnItemClickListener != null)
    {
      bool1 = bool2;
      if (paramView != null)
      {
        playSoundEffect(0);
        paramView.sendAccessibilityEvent(1);
        mOnItemClickListener.onItemClick(this, paramView, paramInt, paramLong);
        bool1 = true;
      }
    }
    return bool1;
  }
  
  void rememberSyncState()
  {
    if (getChildCount() > 0)
    {
      mNeedSync = true;
      mSyncHeight = mLayoutHeight;
      if (mSelectedPosition >= 0)
      {
        localView = getChildAt(mSelectedPosition - mFirstPosition);
        mSyncRowId = mNextSelectedRowId;
        mSyncPosition = mNextSelectedPosition;
        if (localView != null) {
          mSpecificTop = localView.getTop();
        }
        mSyncMode = 0;
      }
    }
    else
    {
      return;
    }
    View localView = getChildAt(0);
    Adapter localAdapter = getAdapter();
    if ((mFirstPosition >= 0) && (mFirstPosition < localAdapter.getCount())) {}
    for (mSyncRowId = localAdapter.getItemId(mFirstPosition);; mSyncRowId = -1L)
    {
      mSyncPosition = mFirstPosition;
      if (localView != null) {
        mSpecificTop = localView.getTop();
      }
      mSyncMode = 1;
      return;
    }
  }
  
  public void removeAllViews()
  {
    throw new UnsupportedOperationException("removeAllViews() is not supported in AviaryAdapterView");
  }
  
  public void removeView(View paramView)
  {
    throw new UnsupportedOperationException("removeView(View) is not supported in AviaryAdapterView");
  }
  
  public void removeViewAt(int paramInt)
  {
    throw new UnsupportedOperationException("removeViewAt(int) is not supported in AviaryAdapterView");
  }
  
  void selectionChanged(int paramInt1, int paramInt2)
  {
    if (mOnItemSelectedListener != null)
    {
      if ((!mInLayout) && (!mBlockLayoutRequests)) {
        break label78;
      }
      if (mSelectionNotifier == null) {
        mSelectionNotifier = new SelectionNotifier(null);
      }
      post(mSelectionNotifier);
    }
    for (;;)
    {
      if ((mSelectedPosition != -1) && (isShown()) && (!isInTouchMode())) {
        sendAccessibilityEvent(4);
      }
      return;
      label78:
      fireOnSelected();
    }
  }
  
  public abstract void setAdapter(T paramT);
  
  public void setEmptyView(View paramView)
  {
    mEmptyView = paramView;
    paramView = getAdapter();
    if ((paramView == null) || (paramView.isEmpty())) {}
    for (boolean bool = true;; bool = false)
    {
      updateEmptyStatus(bool);
      return;
    }
  }
  
  public void setFocusable(boolean paramBoolean)
  {
    boolean bool = true;
    Adapter localAdapter = getAdapter();
    int i;
    if ((localAdapter == null) || (localAdapter.getCount() == 0))
    {
      i = 1;
      mDesiredFocusableState = paramBoolean;
      if (!paramBoolean) {
        mDesiredFocusableInTouchModeState = false;
      }
      if (!paramBoolean) {
        break label69;
      }
      paramBoolean = bool;
      if (i != 0) {
        if (!isInFilterMode()) {
          break label69;
        }
      }
    }
    label69:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      super.setFocusable(paramBoolean);
      return;
      i = 0;
      break;
    }
  }
  
  public void setFocusableInTouchMode(boolean paramBoolean)
  {
    boolean bool = true;
    Adapter localAdapter = getAdapter();
    int i;
    if ((localAdapter == null) || (localAdapter.getCount() == 0))
    {
      i = 1;
      mDesiredFocusableInTouchModeState = paramBoolean;
      if (paramBoolean) {
        mDesiredFocusableState = true;
      }
      if (!paramBoolean) {
        break label69;
      }
      paramBoolean = bool;
      if (i != 0) {
        if (!isInFilterMode()) {
          break label69;
        }
      }
    }
    label69:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      super.setFocusableInTouchMode(paramBoolean);
      return;
      i = 0;
      break;
    }
  }
  
  void setNextSelectedPositionInt(int paramInt)
  {
    mNextSelectedPosition = paramInt;
    mNextSelectedRowId = getItemIdAtPosition(paramInt);
    if ((mNeedSync) && (mSyncMode == 0) && (paramInt >= 0))
    {
      mSyncPosition = paramInt;
      mSyncRowId = mNextSelectedRowId;
    }
  }
  
  public void setOnClickListener(View.OnClickListener paramOnClickListener)
  {
    throw new RuntimeException("Don't call setOnClickListener for an AviaryAdapterView. You probably want setOnItemClickListener instead");
  }
  
  public void setOnItemClickListener(OnItemClickListener paramOnItemClickListener)
  {
    mOnItemClickListener = paramOnItemClickListener;
  }
  
  public void setOnItemLongClickListener(OnItemLongClickListener paramOnItemLongClickListener)
  {
    if (!isLongClickable()) {
      setLongClickable(true);
    }
    mOnItemLongClickListener = paramOnItemLongClickListener;
  }
  
  public void setOnItemSelectedListener(OnItemSelectedListener paramOnItemSelectedListener)
  {
    mOnItemSelectedListener = paramOnItemSelectedListener;
  }
  
  void setSelectedPositionInt(int paramInt)
  {
    mSelectedPosition = paramInt;
    mSelectedRowId = getItemIdAtPosition(paramInt);
  }
  
  public abstract void setSelection(int paramInt);
  
  public static class AdapterContextMenuInfo
    implements ContextMenu.ContextMenuInfo
  {}
  
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
      if ((getAdapter().hasStableIds()) && (mInstanceState != null) && (mOldItemCount == 0) && (mItemCount > 0))
      {
        onRestoreInstanceState(mInstanceState);
        mInstanceState = null;
      }
      for (;;)
      {
        checkFocus();
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
      mSelectedPosition = -1;
      mSelectedRowId = Long.MIN_VALUE;
      mNextSelectedPosition = -1;
      mNextSelectedRowId = Long.MIN_VALUE;
      mNeedSync = false;
      checkFocus();
      requestLayout();
    }
  }
  
  public static abstract interface OnItemClickListener
  {
    public abstract void onItemClick(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong);
  }
  
  public static abstract interface OnItemLongClickListener {}
  
  public static abstract interface OnItemSelectedListener
  {
    public abstract void onItemSelected(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong);
    
    public abstract void onNothingSelected(AdobeAdapterView<?> paramAdobeAdapterView);
  }
  
  private class SelectionNotifier
    implements Runnable
  {
    private SelectionNotifier() {}
    
    public void run()
    {
      if (mDataChanged)
      {
        if (getAdapter() != null) {
          post(this);
        }
        return;
      }
      fireOnSelected();
    }
  }
}
