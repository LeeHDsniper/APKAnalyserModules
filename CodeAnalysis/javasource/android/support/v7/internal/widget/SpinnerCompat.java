package android.support.v7.internal.widget;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.pm.ApplicationInfo;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.widget.ListPopupWindow;
import android.support.v7.widget.ListPopupWindow.ForwardingListener;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListAdapter;
import android.widget.SpinnerAdapter;

class SpinnerCompat
  extends AbsSpinnerCompat
  implements DialogInterface.OnClickListener
{
  private boolean mDisableChildrenWhenDisabled;
  int mDropDownWidth;
  private ListPopupWindow.ForwardingListener mForwardingListener;
  private int mGravity;
  private SpinnerPopup mPopup;
  private DropDownAdapter mTempAdapter;
  private Rect mTempRect = new Rect();
  private final TintManager mTintManager;
  
  SpinnerCompat(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    this(paramContext, paramAttributeSet, paramInt, -1);
  }
  
  SpinnerCompat(final Context paramContext, AttributeSet paramAttributeSet, int paramInt1, int paramInt2)
  {
    super(paramContext, paramAttributeSet, paramInt1);
    TintTypedArray localTintTypedArray = TintTypedArray.obtainStyledAttributes(paramContext, paramAttributeSet, R.styleable.Spinner, paramInt1, 0);
    if (localTintTypedArray.hasValue(R.styleable.Spinner_android_background)) {
      setBackgroundDrawable(localTintTypedArray.getDrawable(R.styleable.Spinner_android_background));
    }
    int i = paramInt2;
    if (paramInt2 == -1) {
      i = localTintTypedArray.getInt(R.styleable.Spinner_spinnerMode, 0);
    }
    switch (i)
    {
    }
    for (;;)
    {
      mGravity = localTintTypedArray.getInt(R.styleable.Spinner_android_gravity, 17);
      mPopup.setPromptText(localTintTypedArray.getString(R.styleable.Spinner_prompt));
      mDisableChildrenWhenDisabled = localTintTypedArray.getBoolean(R.styleable.Spinner_disableChildrenWhenDisabled, false);
      localTintTypedArray.recycle();
      if (mTempAdapter != null)
      {
        mPopup.setAdapter(mTempAdapter);
        mTempAdapter = null;
      }
      mTintManager = localTintTypedArray.getTintManager();
      return;
      mPopup = new DialogPopup(null);
      continue;
      paramContext = new DropdownPopup(paramContext, paramAttributeSet, paramInt1);
      mDropDownWidth = localTintTypedArray.getLayoutDimension(R.styleable.Spinner_android_dropDownWidth, -2);
      paramContext.setBackgroundDrawable(localTintTypedArray.getDrawable(R.styleable.Spinner_android_popupBackground));
      mPopup = paramContext;
      mForwardingListener = new ListPopupWindow.ForwardingListener(this)
      {
        public ListPopupWindow getPopup()
        {
          return paramContext;
        }
        
        public boolean onForwardingStarted()
        {
          if (!mPopup.isShowing()) {
            mPopup.show();
          }
          return true;
        }
      };
    }
  }
  
  private View makeView(int paramInt, boolean paramBoolean)
  {
    if (!mDataChanged)
    {
      localView = mRecycler.get(paramInt);
      if (localView != null)
      {
        setUpChild(localView, paramBoolean);
        return localView;
      }
    }
    View localView = mAdapter.getView(paramInt, null, this);
    setUpChild(localView, paramBoolean);
    return localView;
  }
  
  private void setUpChild(View paramView, boolean paramBoolean)
  {
    ViewGroup.LayoutParams localLayoutParams2 = paramView.getLayoutParams();
    ViewGroup.LayoutParams localLayoutParams1 = localLayoutParams2;
    if (localLayoutParams2 == null) {
      localLayoutParams1 = generateDefaultLayoutParams();
    }
    if (paramBoolean) {
      addViewInLayout(paramView, 0, localLayoutParams1);
    }
    paramView.setSelected(hasFocus());
    if (mDisableChildrenWhenDisabled) {
      paramView.setEnabled(isEnabled());
    }
    int i = ViewGroup.getChildMeasureSpec(mHeightMeasureSpec, mSpinnerPadding.top + mSpinnerPadding.bottom, height);
    paramView.measure(ViewGroup.getChildMeasureSpec(mWidthMeasureSpec, mSpinnerPadding.left + mSpinnerPadding.right, width), i);
    i = mSpinnerPadding.top + (getMeasuredHeight() - mSpinnerPadding.bottom - mSpinnerPadding.top - paramView.getMeasuredHeight()) / 2;
    int j = paramView.getMeasuredHeight();
    paramView.layout(0, i, 0 + paramView.getMeasuredWidth(), i + j);
  }
  
  public int getBaseline()
  {
    int j = -1;
    Object localObject2 = null;
    Object localObject1;
    if (getChildCount() > 0) {
      localObject1 = getChildAt(0);
    }
    for (;;)
    {
      int i = j;
      if (localObject1 != null)
      {
        int k = ((View)localObject1).getBaseline();
        i = j;
        if (k >= 0) {
          i = ((View)localObject1).getTop() + k;
        }
      }
      return i;
      localObject1 = localObject2;
      if (mAdapter != null)
      {
        localObject1 = localObject2;
        if (mAdapter.getCount() > 0)
        {
          localObject1 = makeView(0, false);
          mRecycler.put(0, (View)localObject1);
        }
      }
    }
  }
  
  void layout(int paramInt, boolean paramBoolean)
  {
    int i = mSpinnerPadding.left;
    int j = getRight() - getLeft() - mSpinnerPadding.left - mSpinnerPadding.right;
    if (mDataChanged) {
      handleDataChanged();
    }
    if (mItemCount == 0)
    {
      resetList();
      return;
    }
    if (mNextSelectedPosition >= 0) {
      setSelectedPositionInt(mNextSelectedPosition);
    }
    recycleAllViews();
    removeAllViewsInLayout();
    mFirstPosition = mSelectedPosition;
    View localView;
    int k;
    if (mAdapter != null)
    {
      localView = makeView(mSelectedPosition, true);
      k = localView.getMeasuredWidth();
      paramInt = i;
      int m = ViewCompat.getLayoutDirection(this);
      switch (GravityCompat.getAbsoluteGravity(mGravity, m) & 0x7)
      {
      }
    }
    for (;;)
    {
      localView.offsetLeftAndRight(paramInt);
      mRecycler.clear();
      invalidate();
      checkSelectionChanged();
      mDataChanged = false;
      mNeedSync = false;
      setNextSelectedPositionInt(mSelectedPosition);
      return;
      paramInt = j / 2 + i - k / 2;
      continue;
      paramInt = i + j - k;
    }
  }
  
  int measureContentWidth(SpinnerAdapter paramSpinnerAdapter, Drawable paramDrawable)
  {
    int j;
    if (paramSpinnerAdapter == null) {
      j = 0;
    }
    int i;
    do
    {
      return j;
      i = 0;
      View localView = null;
      int k = 0;
      int i1 = View.MeasureSpec.makeMeasureSpec(0, 0);
      int i2 = View.MeasureSpec.makeMeasureSpec(0, 0);
      j = Math.max(0, getSelectedItemPosition());
      int i3 = Math.min(paramSpinnerAdapter.getCount(), j + 15);
      j = Math.max(0, j - (15 - (i3 - j)));
      while (j < i3)
      {
        int n = paramSpinnerAdapter.getItemViewType(j);
        int m = k;
        if (n != k)
        {
          m = n;
          localView = null;
        }
        localView = paramSpinnerAdapter.getView(j, localView, this);
        if (localView.getLayoutParams() == null) {
          localView.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
        }
        localView.measure(i1, i2);
        i = Math.max(i, localView.getMeasuredWidth());
        j += 1;
        k = m;
      }
      j = i;
    } while (paramDrawable == null);
    paramDrawable.getPadding(mTempRect);
    return i + (mTempRect.left + mTempRect.right);
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    setSelection(paramInt);
    paramDialogInterface.dismiss();
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if ((mPopup != null) && (mPopup.isShowing())) {
      mPopup.dismiss();
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    mInLayout = true;
    layout(0, false);
    mInLayout = false;
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    if ((mPopup != null) && (View.MeasureSpec.getMode(paramInt1) == Integer.MIN_VALUE)) {
      setMeasuredDimension(Math.min(Math.max(getMeasuredWidth(), measureContentWidth(getAdapter(), getBackground())), View.MeasureSpec.getSize(paramInt1)), getMeasuredHeight());
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    if (showDropdown)
    {
      paramParcelable = getViewTreeObserver();
      if (paramParcelable != null) {
        paramParcelable.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
        {
          public void onGlobalLayout()
          {
            if (!mPopup.isShowing()) {
              mPopup.show();
            }
            ViewTreeObserver localViewTreeObserver = getViewTreeObserver();
            if (localViewTreeObserver != null) {
              localViewTreeObserver.removeGlobalOnLayoutListener(this);
            }
          }
        });
      }
    }
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    if ((mPopup != null) && (mPopup.isShowing())) {}
    for (boolean bool = true;; bool = false)
    {
      showDropdown = bool;
      return localSavedState;
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((mForwardingListener != null) && (mForwardingListener.onTouch(this, paramMotionEvent))) {
      return true;
    }
    return super.onTouchEvent(paramMotionEvent);
  }
  
  public boolean performClick()
  {
    boolean bool2 = super.performClick();
    boolean bool1 = bool2;
    if (!bool2)
    {
      bool2 = true;
      bool1 = bool2;
      if (!mPopup.isShowing())
      {
        mPopup.show();
        bool1 = bool2;
      }
    }
    return bool1;
  }
  
  public void setAdapter(SpinnerAdapter paramSpinnerAdapter)
  {
    super.setAdapter(paramSpinnerAdapter);
    mRecycler.clear();
    if ((getContextgetApplicationInfotargetSdkVersion >= 21) && (paramSpinnerAdapter != null) && (paramSpinnerAdapter.getViewTypeCount() != 1)) {
      throw new IllegalArgumentException("Spinner adapter view type count must be 1");
    }
    if (mPopup != null)
    {
      mPopup.setAdapter(new DropDownAdapter(paramSpinnerAdapter));
      return;
    }
    mTempAdapter = new DropDownAdapter(paramSpinnerAdapter);
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    super.setEnabled(paramBoolean);
    if (mDisableChildrenWhenDisabled)
    {
      int j = getChildCount();
      int i = 0;
      while (i < j)
      {
        getChildAt(i).setEnabled(paramBoolean);
        i += 1;
      }
    }
  }
  
  public void setOnItemClickListener(AdapterViewCompat.OnItemClickListener paramOnItemClickListener)
  {
    throw new RuntimeException("setOnItemClickListener cannot be used with a spinner.");
  }
  
  void setOnItemClickListenerInt(AdapterViewCompat.OnItemClickListener paramOnItemClickListener)
  {
    super.setOnItemClickListener(paramOnItemClickListener);
  }
  
  private class DialogPopup
    implements DialogInterface.OnClickListener, SpinnerCompat.SpinnerPopup
  {
    private ListAdapter mListAdapter;
    private AlertDialog mPopup;
    private CharSequence mPrompt;
    
    private DialogPopup() {}
    
    public void dismiss()
    {
      if (mPopup != null)
      {
        mPopup.dismiss();
        mPopup = null;
      }
    }
    
    public boolean isShowing()
    {
      if (mPopup != null) {
        return mPopup.isShowing();
      }
      return false;
    }
    
    public void onClick(DialogInterface paramDialogInterface, int paramInt)
    {
      setSelection(paramInt);
      if (mOnItemClickListener != null) {
        performItemClick(null, paramInt, mListAdapter.getItemId(paramInt));
      }
      dismiss();
    }
    
    public void setAdapter(ListAdapter paramListAdapter)
    {
      mListAdapter = paramListAdapter;
    }
    
    public void setPromptText(CharSequence paramCharSequence)
    {
      mPrompt = paramCharSequence;
    }
    
    public void show()
    {
      if (mListAdapter == null) {
        return;
      }
      AlertDialog.Builder localBuilder = new AlertDialog.Builder(getContext());
      if (mPrompt != null) {
        localBuilder.setTitle(mPrompt);
      }
      mPopup = localBuilder.setSingleChoiceItems(mListAdapter, getSelectedItemPosition(), this).create();
      mPopup.show();
    }
  }
  
  private static class DropDownAdapter
    implements ListAdapter, SpinnerAdapter
  {
    private SpinnerAdapter mAdapter;
    private ListAdapter mListAdapter;
    
    public DropDownAdapter(SpinnerAdapter paramSpinnerAdapter)
    {
      mAdapter = paramSpinnerAdapter;
      if ((paramSpinnerAdapter instanceof ListAdapter)) {
        mListAdapter = ((ListAdapter)paramSpinnerAdapter);
      }
    }
    
    public boolean areAllItemsEnabled()
    {
      ListAdapter localListAdapter = mListAdapter;
      if (localListAdapter != null) {
        return localListAdapter.areAllItemsEnabled();
      }
      return true;
    }
    
    public int getCount()
    {
      if (mAdapter == null) {
        return 0;
      }
      return mAdapter.getCount();
    }
    
    public View getDropDownView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if (mAdapter == null) {
        return null;
      }
      return mAdapter.getDropDownView(paramInt, paramView, paramViewGroup);
    }
    
    public Object getItem(int paramInt)
    {
      if (mAdapter == null) {
        return null;
      }
      return mAdapter.getItem(paramInt);
    }
    
    public long getItemId(int paramInt)
    {
      if (mAdapter == null) {
        return -1L;
      }
      return mAdapter.getItemId(paramInt);
    }
    
    public int getItemViewType(int paramInt)
    {
      return 0;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      return getDropDownView(paramInt, paramView, paramViewGroup);
    }
    
    public int getViewTypeCount()
    {
      return 1;
    }
    
    public boolean hasStableIds()
    {
      return (mAdapter != null) && (mAdapter.hasStableIds());
    }
    
    public boolean isEmpty()
    {
      return getCount() == 0;
    }
    
    public boolean isEnabled(int paramInt)
    {
      ListAdapter localListAdapter = mListAdapter;
      if (localListAdapter != null) {
        return localListAdapter.isEnabled(paramInt);
      }
      return true;
    }
    
    public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
    {
      if (mAdapter != null) {
        mAdapter.registerDataSetObserver(paramDataSetObserver);
      }
    }
    
    public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
    {
      if (mAdapter != null) {
        mAdapter.unregisterDataSetObserver(paramDataSetObserver);
      }
    }
  }
  
  private class DropdownPopup
    extends ListPopupWindow
    implements SpinnerCompat.SpinnerPopup
  {
    private ListAdapter mAdapter;
    private CharSequence mHintText;
    
    public DropdownPopup(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
    {
      super(paramAttributeSet, paramInt);
      setAnchorView(SpinnerCompat.this);
      setModal(true);
      setPromptPosition(0);
      setOnItemClickListener(new AdapterView.OnItemClickListener()
      {
        public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
        {
          setSelection(paramAnonymousInt);
          if (mOnItemClickListener != null) {
            performItemClick(paramAnonymousView, paramAnonymousInt, mAdapter.getItemId(paramAnonymousInt));
          }
          dismiss();
        }
      });
    }
    
    public void setAdapter(ListAdapter paramListAdapter)
    {
      super.setAdapter(paramListAdapter);
      mAdapter = paramListAdapter;
    }
    
    public void setPromptText(CharSequence paramCharSequence)
    {
      mHintText = paramCharSequence;
    }
  }
  
  static class SavedState
    extends AbsSpinnerCompat.SavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public SpinnerCompat.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new SpinnerCompat.SavedState(paramAnonymousParcel, null);
      }
      
      public SpinnerCompat.SavedState[] newArray(int paramAnonymousInt)
      {
        return new SpinnerCompat.SavedState[paramAnonymousInt];
      }
    };
    boolean showDropdown;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      if (paramParcel.readByte() != 0) {}
      for (boolean bool = true;; bool = false)
      {
        showDropdown = bool;
        return;
      }
    }
    
    SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      if (showDropdown) {}
      for (paramInt = 1;; paramInt = 0)
      {
        paramParcel.writeByte((byte)paramInt);
        return;
      }
    }
  }
  
  private static abstract interface SpinnerPopup
  {
    public abstract void dismiss();
    
    public abstract boolean isShowing();
    
    public abstract void setAdapter(ListAdapter paramListAdapter);
    
    public abstract void setPromptText(CharSequence paramCharSequence);
    
    public abstract void show();
  }
}
