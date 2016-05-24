package android.support.v7.internal.widget;

import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.widget.SpinnerAdapter;

abstract class AbsSpinnerCompat
  extends AdapterViewCompat<SpinnerAdapter>
{
  SpinnerAdapter mAdapter;
  private DataSetObserver mDataSetObserver;
  int mHeightMeasureSpec;
  final RecycleBin mRecycler = new RecycleBin();
  int mSelectionBottomPadding = 0;
  int mSelectionLeftPadding = 0;
  int mSelectionRightPadding = 0;
  int mSelectionTopPadding = 0;
  final Rect mSpinnerPadding = new Rect();
  int mWidthMeasureSpec;
  
  AbsSpinnerCompat(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    initAbsSpinner();
  }
  
  private void initAbsSpinner()
  {
    setFocusable(true);
    setWillNotDraw(false);
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new ViewGroup.LayoutParams(-1, -2);
  }
  
  public SpinnerAdapter getAdapter()
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
  
  abstract void layout(int paramInt, boolean paramBoolean);
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i2 = View.MeasureSpec.getMode(paramInt1);
    int i = getPaddingLeft();
    int m = getPaddingTop();
    int k = getPaddingRight();
    int j = getPaddingBottom();
    Object localObject = mSpinnerPadding;
    if (i > mSelectionLeftPadding)
    {
      left = i;
      localObject = mSpinnerPadding;
      if (m <= mSelectionTopPadding) {
        break label474;
      }
      i = m;
      label67:
      top = i;
      localObject = mSpinnerPadding;
      if (k <= mSelectionRightPadding) {
        break label482;
      }
      i = k;
      label91:
      right = i;
      localObject = mSpinnerPadding;
      if (j <= mSelectionBottomPadding) {
        break label490;
      }
    }
    label474:
    label482:
    label490:
    for (i = j;; i = mSelectionBottomPadding)
    {
      bottom = i;
      if (mDataChanged) {
        handleDataChanged();
      }
      m = 0;
      int n = 0;
      int i1 = 1;
      int i3 = getSelectedItemPosition();
      k = i1;
      j = m;
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
            View localView = mRecycler.get(i3);
            localObject = localView;
            if (localView == null) {
              localObject = mAdapter.getView(i3, null, this);
            }
            k = i1;
            j = m;
            i = n;
            if (localObject != null)
            {
              mRecycler.put(i3, (View)localObject);
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
      i = ViewCompat.resolveSizeAndState(i, paramInt2, 0);
      setMeasuredDimension(ViewCompat.resolveSizeAndState(j, paramInt1, 0), i);
      mHeightMeasureSpec = paramInt2;
      mWidthMeasureSpec = paramInt1;
      return;
      i = mSelectionLeftPadding;
      break;
      i = mSelectionTopPadding;
      break label67;
      i = mSelectionRightPadding;
      break label91;
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
  
  void recycleAllViews()
  {
    int j = getChildCount();
    RecycleBin localRecycleBin = mRecycler;
    int k = mFirstPosition;
    int i = 0;
    while (i < j)
    {
      localRecycleBin.put(k + i, getChildAt(i));
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
    mOldSelectedPosition = -1;
    mOldSelectedRowId = Long.MIN_VALUE;
    setSelectedPositionInt(-1);
    setNextSelectedPositionInt(-1);
    invalidate();
  }
  
  public void setAdapter(SpinnerAdapter paramSpinnerAdapter)
  {
    int i = -1;
    if (mAdapter != null)
    {
      mAdapter.unregisterDataSetObserver(mDataSetObserver);
      resetList();
    }
    mAdapter = paramSpinnerAdapter;
    mOldSelectedPosition = -1;
    mOldSelectedRowId = Long.MIN_VALUE;
    if (mAdapter != null)
    {
      mOldItemCount = mItemCount;
      mItemCount = mAdapter.getCount();
      checkFocus();
      mDataSetObserver = new AdapterViewCompat.AdapterDataSetObserver(this);
      mAdapter.registerDataSetObserver(mDataSetObserver);
      if (mItemCount > 0) {
        i = 0;
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
  
  public void setSelection(int paramInt)
  {
    setNextSelectedPositionInt(paramInt);
    requestLayout();
    invalidate();
  }
  
  class RecycleBin
  {
    private final SparseArray<View> mScrapHeap = new SparseArray();
    
    RecycleBin() {}
    
    void clear()
    {
      SparseArray localSparseArray = mScrapHeap;
      int j = localSparseArray.size();
      int i = 0;
      while (i < j)
      {
        View localView = (View)localSparseArray.valueAt(i);
        if (localView != null) {
          removeDetachedView(localView, true);
        }
        i += 1;
      }
      localSparseArray.clear();
    }
    
    View get(int paramInt)
    {
      View localView = (View)mScrapHeap.get(paramInt);
      if (localView != null) {
        mScrapHeap.delete(paramInt);
      }
      return localView;
    }
    
    public void put(int paramInt, View paramView)
    {
      mScrapHeap.put(paramInt, paramView);
    }
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public AbsSpinnerCompat.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new AbsSpinnerCompat.SavedState(paramAnonymousParcel);
      }
      
      public AbsSpinnerCompat.SavedState[] newArray(int paramAnonymousInt)
      {
        return new AbsSpinnerCompat.SavedState[paramAnonymousInt];
      }
    };
    int position;
    long selectedId;
    
    SavedState(Parcel paramParcel)
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
      return "AbsSpinner.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " selectedId=" + selectedId + " position=" + position + "}";
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeLong(selectedId);
      paramParcel.writeInt(position);
    }
  }
}
