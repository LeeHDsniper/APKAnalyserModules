package com.adobe.android.ui.widget;

import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.widget.Adapter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public abstract class AdobeAbsSpinner
  extends AdobeAdapterView<Adapter>
{
  Adapter mAdapter;
  boolean mBlockLayoutRequests;
  private DataSetObserver mDataSetObserver;
  int mDefaultPosition;
  int mHeightMeasureSpec;
  int mPaddingBottom;
  int mPaddingLeft;
  int mPaddingRight;
  int mPaddingTop;
  protected final List<Queue<View>> mRecycleBin = new ArrayList(10);
  int mSelectionBottomPadding = 0;
  int mSelectionLeftPadding = 0;
  int mSelectionRightPadding = 0;
  int mSelectionTopPadding = 0;
  final Rect mSpinnerPadding = new Rect();
  private Rect mTouchFrame;
  int mWidthMeasureSpec;
  
  public AdobeAbsSpinner(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AdobeAbsSpinner(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public AdobeAbsSpinner(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    initAbsSpinner();
  }
  
  private void emptyRecycler()
  {
    emptySubRecycler();
    if (mRecycleBin != null) {
      mRecycleBin.clear();
    }
  }
  
  private void initAbsSpinner()
  {
    setFocusable(true);
    setWillNotDraw(false);
  }
  
  protected void emptySubRecycler()
  {
    if (mRecycleBin != null)
    {
      int i = 0;
      while (i < mRecycleBin.size())
      {
        ((Queue)mRecycleBin.get(i)).clear();
        i += 1;
      }
    }
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new ViewGroup.LayoutParams(-1, -2);
  }
  
  public Adapter getAdapter()
  {
    return mAdapter;
  }
  
  int getChildHeight(View paramView)
  {
    return paramView.getMeasuredHeight();
  }
  
  int getChildWidth(View paramView)
  {
    return paramView.getMeasuredWidth();
  }
  
  public int getCount()
  {
    return mItemCount;
  }
  
  public View getSelectedView()
  {
    if ((mItemCount > 0) && (mSelectedPosition >= 0)) {
      return getChildAt(mSelectedPosition - mFirstPosition);
    }
    return null;
  }
  
  abstract void layout(int paramInt, boolean paramBoolean1, boolean paramBoolean2);
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i2 = View.MeasureSpec.getMode(paramInt1);
    Object localObject = mSpinnerPadding;
    if (mPaddingLeft > mSelectionLeftPadding)
    {
      i = mPaddingLeft;
      left = i;
      localObject = mSpinnerPadding;
      if (mPaddingTop <= mSelectionTopPadding) {
        break label508;
      }
      i = mPaddingTop;
      label56:
      top = i;
      localObject = mSpinnerPadding;
      if (mPaddingRight <= mSelectionRightPadding) {
        break label516;
      }
      i = mPaddingRight;
      label84:
      right = i;
      localObject = mSpinnerPadding;
      if (mPaddingBottom <= mSelectionBottomPadding) {
        break label524;
      }
    }
    label508:
    label516:
    label524:
    for (int i = mPaddingBottom;; i = mSelectionBottomPadding)
    {
      bottom = i;
      if (mDataChanged) {
        handleDataChanged();
      }
      int m = 0;
      int n = 0;
      int i1 = 1;
      int i3 = getSelectedItemPosition();
      int k = i1;
      int j = m;
      i = n;
      if (i3 >= 0)
      {
        k = i1;
        j = m;
        i = n;
        if (mAdapter != null)
        {
          k = i1;
          j = m;
          i = n;
          if (i3 < mAdapter.getCount())
          {
            i = mAdapter.getItemViewType(i3);
            View localView = (View)((Queue)mRecycleBin.get(i)).poll();
            localObject = localView;
            if (localView == null) {
              localObject = mAdapter.getView(i3, null, this);
            }
            if (localObject != null) {
              ((Queue)mRecycleBin.get(i)).offer(localObject);
            }
            k = i1;
            j = m;
            i = n;
            if (localObject != null)
            {
              if (((View)localObject).getLayoutParams() == null)
              {
                mBlockLayoutRequests = true;
                ((View)localObject).setLayoutParams(generateDefaultLayoutParams());
                mBlockLayoutRequests = false;
              }
              measureChild((View)localObject, paramInt1, paramInt2);
              j = getChildHeight((View)localObject) + mSpinnerPadding.top + mSpinnerPadding.bottom;
              i = getChildWidth((View)localObject) + mSpinnerPadding.left + mSpinnerPadding.right;
              k = 0;
            }
          }
        }
      }
      m = j;
      j = i;
      if (k != 0)
      {
        k = mSpinnerPadding.top + mSpinnerPadding.bottom;
        m = k;
        j = i;
        if (i2 == 0)
        {
          j = mSpinnerPadding.left + mSpinnerPadding.right;
          m = k;
        }
      }
      i = Math.max(m, getSuggestedMinimumHeight());
      j = Math.max(j, getSuggestedMinimumWidth());
      i = View.resolveSize(i, paramInt2);
      setMeasuredDimension(View.resolveSize(j, paramInt1), i);
      mHeightMeasureSpec = paramInt2;
      mWidthMeasureSpec = paramInt1;
      return;
      i = mSelectionLeftPadding;
      break;
      i = mSelectionTopPadding;
      break label56;
      i = mSelectionRightPadding;
      break label84;
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    if (selectedId >= 0L)
    {
      mDataChanged = true;
      mNeedSync = true;
      mSyncRowId = selectedId;
      mSyncPosition = position;
      mSyncMode = 0;
      requestLayout();
    }
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    selectedId = getSelectedItemId();
    if (selectedId >= 0L)
    {
      position = getSelectedItemPosition();
      return localSavedState;
    }
    position = -1;
    return localSavedState;
  }
  
  public int pointToPosition(int paramInt1, int paramInt2)
  {
    Object localObject2 = mTouchFrame;
    Object localObject1 = localObject2;
    if (localObject2 == null)
    {
      mTouchFrame = new Rect();
      localObject1 = mTouchFrame;
    }
    int i = getChildCount() - 1;
    while (i >= 0)
    {
      localObject2 = getChildAt(i);
      if (((View)localObject2).getVisibility() == 0)
      {
        ((View)localObject2).getHitRect((Rect)localObject1);
        if (((Rect)localObject1).contains(paramInt1, paramInt2)) {
          return mFirstPosition + i;
        }
      }
      i -= 1;
    }
    return -1;
  }
  
  void recycleAllViews()
  {
    int j = getChildCount();
    int k = mFirstPosition;
    int i = 0;
    while (i < j)
    {
      View localView = getChildAt(i);
      int m = mAdapter.getItemViewType(k + i);
      ((Queue)mRecycleBin.get(m)).offer(localView);
      i += 1;
    }
  }
  
  public void requestLayout()
  {
    if (!mBlockLayoutRequests) {
      super.requestLayout();
    }
  }
  
  void resetList()
  {
    mDataChanged = false;
    mNeedSync = false;
    removeAllViewsInLayout();
    emptyRecycler();
    mOldSelectedPosition = -1;
    mOldSelectedRowId = Long.MIN_VALUE;
    setSelectedPositionInt(-1);
    setNextSelectedPositionInt(-1);
    invalidate();
  }
  
  public void setAdapter(Adapter paramAdapter)
  {
    int i = -1;
    if (mAdapter != null)
    {
      mAdapter.unregisterDataSetObserver(mDataSetObserver);
      emptyRecycler();
      resetList();
    }
    mAdapter = paramAdapter;
    mOldSelectedPosition = -1;
    mOldSelectedRowId = Long.MIN_VALUE;
    if (mAdapter != null)
    {
      mOldItemCount = mItemCount;
      mItemCount = mAdapter.getCount();
      checkFocus();
      mDataSetObserver = new AdobeAdapterView.AdapterDataSetObserver(this);
      mAdapter.registerDataSetObserver(mDataSetObserver);
      if ((mDefaultPosition >= 0) && (mDefaultPosition < mItemCount)) {
        i = mDefaultPosition;
      }
      for (;;)
      {
        int k = mAdapter.getViewTypeCount();
        int j = 0;
        while (j < k)
        {
          mRecycleBin.add(new LinkedList());
          j += 1;
        }
        if (mItemCount > 0) {
          i = 0;
        }
      }
      setSelectedPositionInt(i);
      setNextSelectedPositionInt(i);
      if (mItemCount == 0) {
        checkSelectionChanged();
      }
    }
    for (;;)
    {
      requestLayout();
      return;
      checkFocus();
      resetList();
      checkSelectionChanged();
    }
  }
  
  public void setDefaultPosition(int paramInt)
  {
    mDefaultPosition = paramInt;
  }
  
  public void setPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.setPadding(paramInt1, paramInt2, paramInt3, paramInt4);
    mPaddingLeft = paramInt1;
    mPaddingBottom = paramInt4;
    mPaddingTop = paramInt2;
    mPaddingRight = paramInt3;
  }
  
  public void setSelection(int paramInt)
  {
    if ((mItemCount > 0) && (paramInt >= 0) && (paramInt < mItemCount))
    {
      setNextSelectedPositionInt(paramInt);
      requestLayout();
      postInvalidate();
    }
  }
  
  public void setSelection(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((paramBoolean1) && (mFirstPosition <= paramInt) && (paramInt <= mFirstPosition + getChildCount() - 1)) {}
    for (paramBoolean1 = true;; paramBoolean1 = false)
    {
      setSelectionInt(paramInt, paramBoolean1, paramBoolean2);
      return;
    }
  }
  
  void setSelectionInt(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramInt != mOldSelectedPosition)
    {
      mBlockLayoutRequests = true;
      int i = mSelectedPosition;
      setNextSelectedPositionInt(paramInt);
      layout(paramInt - i, paramBoolean1, paramBoolean2);
      mBlockLayoutRequests = false;
    }
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public AdobeAbsSpinner.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new AdobeAbsSpinner.SavedState(paramAnonymousParcel, null);
      }
      
      public AdobeAbsSpinner.SavedState[] newArray(int paramAnonymousInt)
      {
        return new AdobeAbsSpinner.SavedState[paramAnonymousInt];
      }
    };
    int position;
    long selectedId;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      selectedId = paramParcel.readLong();
      position = paramParcel.readInt();
    }
    
    SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public String toString()
    {
      return "AviaryAbsSpinner.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " selectedId=" + selectedId + " position=" + position + "}";
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeLong(selectedId);
      paramParcel.writeInt(position);
    }
  }
}
