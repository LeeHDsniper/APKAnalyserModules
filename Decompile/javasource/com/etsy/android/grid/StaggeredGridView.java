package com.etsy.android.grid;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.widget.ListAdapter;
import com.adobe.creativesdk.foundation.assets.R.styleable;
import java.util.Arrays;

public class StaggeredGridView
  extends ExtendableListView
{
  private int[] mColumnBottoms;
  private int mColumnCount;
  private int mColumnCountLandscape = 3;
  private int mColumnCountPortrait = 2;
  private int[] mColumnLefts;
  private int[] mColumnTops;
  private int mColumnWidth;
  private int mDistanceToTop;
  private int mGridPaddingBottom;
  private int mGridPaddingLeft;
  private int mGridPaddingRight;
  private int mGridPaddingTop;
  private int mItemMargin;
  private boolean mNeedSync;
  private SparseArray<GridItemRecord> mPositionData;
  
  public StaggeredGridView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public StaggeredGridView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public StaggeredGridView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    if (paramAttributeSet != null)
    {
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.StaggeredGridView, paramInt, 0);
      mColumnCount = paramContext.getInteger(R.styleable.StaggeredGridView_column_count, 0);
      if (mColumnCount <= 0) {
        break label169;
      }
      mColumnCountPortrait = mColumnCount;
    }
    for (mColumnCountLandscape = mColumnCount;; mColumnCountLandscape = paramContext.getInteger(R.styleable.StaggeredGridView_column_count_landscape, 3))
    {
      mItemMargin = paramContext.getDimensionPixelSize(R.styleable.StaggeredGridView_item_margin, 0);
      mGridPaddingLeft = paramContext.getDimensionPixelSize(R.styleable.StaggeredGridView_grid_paddingLeft, 0);
      mGridPaddingRight = paramContext.getDimensionPixelSize(R.styleable.StaggeredGridView_grid_paddingRight, 0);
      mGridPaddingTop = paramContext.getDimensionPixelSize(R.styleable.StaggeredGridView_grid_paddingTop, 0);
      mGridPaddingBottom = paramContext.getDimensionPixelSize(R.styleable.StaggeredGridView_grid_paddingBottom, 0);
      paramContext.recycle();
      mColumnCount = 0;
      mColumnTops = new int[0];
      mColumnBottoms = new int[0];
      mColumnLefts = new int[0];
      mPositionData = new SparseArray();
      return;
      label169:
      mColumnCountPortrait = paramContext.getInteger(R.styleable.StaggeredGridView_column_count_portrait, 2);
    }
  }
  
  private void alignTops()
  {
    int[] arrayOfInt;
    int n;
    int k;
    int j;
    if (mFirstPosition == getHeaderViewsCount())
    {
      arrayOfInt = getHighestNonHeaderTops();
      n = 1;
      k = -1;
      j = Integer.MAX_VALUE;
      i = 0;
    }
    for (;;)
    {
      if (i >= arrayOfInt.length)
      {
        if (n == 0) {
          break;
        }
        return;
      }
      int m = n;
      if (n != 0)
      {
        m = n;
        if (i > 0)
        {
          m = n;
          if (arrayOfInt[i] != j) {
            m = 0;
          }
        }
      }
      n = j;
      if (arrayOfInt[i] < j)
      {
        n = arrayOfInt[i];
        k = i;
      }
      i += 1;
      j = n;
      n = m;
    }
    int i = 0;
    for (;;)
    {
      if (i >= arrayOfInt.length)
      {
        invalidate();
        return;
      }
      if (i != k) {
        offsetChildrenTopAndBottom(j - arrayOfInt[i], i);
      }
      i += 1;
    }
  }
  
  private int calculateColumnLeft(int paramInt)
  {
    return getRowPaddingLeft() + mItemMargin + (mItemMargin + mColumnWidth) * paramInt;
  }
  
  private int calculateColumnWidth(int paramInt)
  {
    return (paramInt - (getRowPaddingLeft() + getRowPaddingRight()) - mItemMargin * (mColumnCount + 1)) / mColumnCount;
  }
  
  private int getChildBottomMargin()
  {
    return mItemMargin;
  }
  
  private int getChildColumn(int paramInt, boolean paramBoolean)
  {
    int i = getPositionColumn(paramInt);
    int j = mColumnCount;
    if (i >= 0)
    {
      paramInt = i;
      if (i < j) {}
    }
    else
    {
      if (!paramBoolean) {
        break label35;
      }
      paramInt = getHighestPositionedBottomColumn();
    }
    return paramInt;
    label35:
    return getLowestPositionedTopColumn();
  }
  
  private int getChildHeight(View paramView)
  {
    return paramView.getMeasuredHeight();
  }
  
  private int getChildTopMargin(int paramInt)
  {
    int i = 0;
    if (paramInt < getHeaderViewsCount() + mColumnCount) {}
    for (paramInt = 1;; paramInt = 0)
    {
      if (paramInt != 0) {
        i = mItemMargin;
      }
      return i;
    }
  }
  
  private int[] getHighestNonHeaderTops()
  {
    int[] arrayOfInt = new int[mColumnCount];
    int j = getChildCount();
    int i;
    if (j > 0) {
      i = 0;
    }
    for (;;)
    {
      if (i >= j) {
        return arrayOfInt;
      }
      View localView = getChildAt(i);
      if ((localView != null) && (localView.getLayoutParams() != null) && ((localView.getLayoutParams() instanceof GridLayoutParams)))
      {
        GridLayoutParams localGridLayoutParams = (GridLayoutParams)localView.getLayoutParams();
        if ((viewType != -2) && (localView.getTop() < arrayOfInt[column])) {
          arrayOfInt[column] = localView.getTop();
        }
      }
      i += 1;
    }
  }
  
  private int getHighestPositionedBottom()
  {
    int i = getHighestPositionedBottomColumn();
    return mColumnBottoms[i];
  }
  
  private int getHighestPositionedBottomColumn()
  {
    int m = 0;
    int j = Integer.MAX_VALUE;
    int i = 0;
    for (;;)
    {
      if (i >= getMinColumnCount()) {
        return m;
      }
      int i1 = mColumnBottoms[i];
      int n = m;
      int k = j;
      if (Integer.MIN_VALUE != i1)
      {
        n = m;
        k = j;
        if (i1 < j)
        {
          k = i1;
          n = i;
        }
      }
      i += 1;
      m = n;
      j = k;
    }
  }
  
  private int getHighestPositionedTop()
  {
    int i = getHighestPositionedTopColumn();
    return mColumnTops[i];
  }
  
  private int getHighestPositionedTopColumn()
  {
    int m = 0;
    int j = Integer.MAX_VALUE;
    int i = 0;
    for (;;)
    {
      if (i >= getMinColumnCount()) {
        return m;
      }
      int i1 = mColumnTops[i];
      int n = m;
      int k = j;
      if (Integer.MAX_VALUE != i1)
      {
        n = m;
        k = j;
        if (i1 < j)
        {
          k = i1;
          n = i;
        }
      }
      i += 1;
      m = n;
      j = k;
    }
  }
  
  private int getLowestPositionedBottom()
  {
    int i = getLowestPositionedBottomColumn();
    return mColumnBottoms[i];
  }
  
  private int getLowestPositionedBottomColumn()
  {
    int m = 0;
    int j = Integer.MIN_VALUE;
    int i = 0;
    for (;;)
    {
      if (i >= getMinColumnCount()) {
        return m;
      }
      int i1 = mColumnBottoms[i];
      int n = m;
      int k = j;
      if (Integer.MIN_VALUE != i1)
      {
        n = m;
        k = j;
        if (i1 > j)
        {
          k = i1;
          n = i;
        }
      }
      i += 1;
      m = n;
      j = k;
    }
  }
  
  private int getLowestPositionedTop()
  {
    int i = getLowestPositionedTopColumn();
    return mColumnTops[i];
  }
  
  private int getLowestPositionedTopColumn()
  {
    int m = 0;
    int j = Integer.MIN_VALUE;
    int i = 0;
    for (;;)
    {
      if (i >= getMinColumnCount()) {
        return m;
      }
      int i1 = mColumnTops[i];
      int n = m;
      int k = j;
      if (Integer.MAX_VALUE != i1)
      {
        n = m;
        k = j;
        if (i1 > j)
        {
          k = i1;
          n = i;
        }
      }
      i += 1;
      m = n;
      j = k;
    }
  }
  
  private int getMinColumnCount()
  {
    return Math.min(getCount(), mColumnCount);
  }
  
  private GridItemRecord getOrCreateRecord(int paramInt)
  {
    GridItemRecord localGridItemRecord2 = (GridItemRecord)mPositionData.get(paramInt, null);
    GridItemRecord localGridItemRecord1 = localGridItemRecord2;
    if (localGridItemRecord2 == null)
    {
      localGridItemRecord1 = new GridItemRecord();
      mPositionData.append(paramInt, localGridItemRecord1);
    }
    return localGridItemRecord1;
  }
  
  private int getPositionColumn(int paramInt)
  {
    GridItemRecord localGridItemRecord = (GridItemRecord)mPositionData.get(paramInt, null);
    if (localGridItemRecord != null) {
      return column;
    }
    return -1;
  }
  
  private int getSafeBottom(int paramInt)
  {
    paramInt = mColumnBottoms[paramInt];
    if (Integer.MIN_VALUE != paramInt) {
      return paramInt;
    }
    return getLowestPositionedBottom();
  }
  
  private int getSafeTop(int paramInt)
  {
    paramInt = mColumnTops[paramInt];
    if (Integer.MAX_VALUE != paramInt) {
      return paramInt;
    }
    return getHighestPositionedTop();
  }
  
  private void initColumnBottoms()
  {
    Arrays.fill(mColumnBottoms, getPaddingTop() + mGridPaddingTop);
  }
  
  private void initColumnLefts()
  {
    int i = 0;
    for (;;)
    {
      if (i >= mColumnCount) {
        return;
      }
      mColumnLefts[i] = calculateColumnLeft(i);
      i += 1;
    }
  }
  
  private void initColumnTops()
  {
    Arrays.fill(mColumnTops, getPaddingTop() + mGridPaddingTop);
  }
  
  private void initColumnTopsAndBottoms()
  {
    initColumnTops();
    initColumnBottoms();
  }
  
  private boolean isHeaderOrFooter(int paramInt)
  {
    return mAdapter.getItemViewType(paramInt) == -2;
  }
  
  private void layoutGridChild(View paramView, int paramInt1, boolean paramBoolean, int paramInt2, int paramInt3)
  {
    int j = getPositionColumn(paramInt1);
    int k = getChildTopMargin(paramInt1);
    int m = getChildBottomMargin();
    int n = k + m;
    int i;
    if (paramBoolean)
    {
      i = getSafeBottom(j);
      paramInt1 = i + (getChildHeight(paramView) + n);
    }
    for (;;)
    {
      getLayoutParamscolumn = j;
      updateColumnBottomIfNeeded(j, paramInt1);
      updateColumnTopIfNeeded(j, i);
      paramView.layout(paramInt2, i + k, paramInt3, paramInt1 - m);
      return;
      paramInt1 = getSafeTop(j);
      i = paramInt1 - (getChildHeight(paramView) + n);
    }
  }
  
  private void layoutGridHeaderFooter(View paramView, int paramInt1, boolean paramBoolean, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    int i;
    if (paramBoolean)
    {
      paramInt3 = getLowestPositionedBottom();
      paramInt5 = paramInt3 + getChildHeight(paramView);
      i = 0;
    }
    for (;;)
    {
      if (i >= mColumnCount)
      {
        super.onLayoutChild(paramView, paramInt1, paramBoolean, paramInt2, paramInt3, paramInt4, paramInt5);
        return;
        paramInt5 = getHighestPositionedTop();
        paramInt3 = paramInt5 - getChildHeight(paramView);
        break;
      }
      updateColumnTopIfNeeded(i, paramInt3);
      updateColumnBottomIfNeeded(i, paramInt5);
      i += 1;
    }
  }
  
  private void offsetAllColumnsTopAndBottom(int paramInt)
  {
    int i;
    if (paramInt != 0) {
      i = 0;
    }
    for (;;)
    {
      if (i >= mColumnCount) {
        return;
      }
      offsetColumnTopAndBottom(paramInt, i);
      i += 1;
    }
  }
  
  private void offsetColumnTopAndBottom(int paramInt1, int paramInt2)
  {
    if (paramInt1 != 0)
    {
      int[] arrayOfInt;
      if (mColumnTops[paramInt2] != Integer.MAX_VALUE)
      {
        arrayOfInt = mColumnTops;
        arrayOfInt[paramInt2] += paramInt1;
      }
      if (mColumnBottoms[paramInt2] != Integer.MIN_VALUE)
      {
        arrayOfInt = mColumnBottoms;
        arrayOfInt[paramInt2] += paramInt1;
      }
    }
  }
  
  private void offsetDistanceToTop(int paramInt)
  {
    mDistanceToTop += paramInt;
  }
  
  private void offsetGridChild(View paramView, int paramInt1, boolean paramBoolean, int paramInt2, int paramInt3)
  {
    int j = getPositionColumn(paramInt1);
    int k = getChildTopMargin(paramInt1);
    int m = k + getChildBottomMargin();
    int i;
    if (paramBoolean)
    {
      i = getSafeBottom(j);
      paramInt3 = i + (getChildHeight(paramView) + m);
    }
    for (;;)
    {
      getLayoutParamscolumn = j;
      updateColumnBottomIfNeeded(j, paramInt3);
      updateColumnTopIfNeeded(j, i);
      super.onOffsetChild(paramView, paramInt1, paramBoolean, paramInt2, i + k);
      return;
      paramInt3 = getSafeTop(j);
      i = paramInt3 - (getChildHeight(paramView) + m);
    }
  }
  
  private void offsetGridHeaderFooter(View paramView, int paramInt1, boolean paramBoolean, int paramInt2, int paramInt3)
  {
    int i;
    int j;
    if (paramBoolean)
    {
      paramInt3 = getLowestPositionedBottom();
      i = paramInt3 + getChildHeight(paramView);
      j = 0;
    }
    for (;;)
    {
      if (j >= mColumnCount)
      {
        super.onOffsetChild(paramView, paramInt1, paramBoolean, paramInt2, paramInt3);
        return;
        i = getHighestPositionedTop();
        paramInt3 = i - getChildHeight(paramView);
        break;
      }
      updateColumnTopIfNeeded(j, paramInt3);
      updateColumnBottomIfNeeded(j, i);
      j += 1;
    }
  }
  
  private void onColumnSync()
  {
    int k = Math.min(mSyncPosition, getCount() - 1);
    SparseArray localSparseArray = new SparseArray(k);
    int i = 0;
    for (;;)
    {
      if (i >= k) {}
      do
      {
        mPositionData.clear();
        i = 0;
        if (i < k) {
          break;
        }
        i = getHighestPositionedBottomColumn();
        setPositionColumn(k, i);
        i = mColumnBottoms[i];
        offsetAllColumnsTopAndBottom(-i + mSpecificTop);
        mDistanceToTop = (-i);
        System.arraycopy(mColumnBottoms, 0, mColumnTops, 0, mColumnCount);
        return;
        localGridItemRecord = (GridItemRecord)mPositionData.get(i);
      } while (localGridItemRecord == null);
      Log.d("StaggeredGridView", "onColumnSync:" + i + " ratio:" + heightRatio);
      localSparseArray.append(i, Double.valueOf(heightRatio));
      i += 1;
    }
    GridItemRecord localGridItemRecord = getOrCreateRecord(i);
    double d = ((Double)localSparseArray.get(i)).doubleValue();
    int m = (int)(mColumnWidth * d);
    heightRatio = d;
    int n;
    int j;
    if (isHeaderOrFooter(i))
    {
      n = getLowestPositionedBottom();
      j = 0;
      label233:
      if (j < mColumnCount) {}
    }
    for (;;)
    {
      i += 1;
      break;
      mColumnTops[j] = n;
      mColumnBottoms[j] = (n + m);
      j += 1;
      break label233;
      j = getHighestPositionedBottomColumn();
      n = mColumnBottoms[j];
      int i1 = getChildTopMargin(i);
      int i2 = getChildBottomMargin();
      mColumnTops[j] = n;
      mColumnBottoms[j] = (n + m + i1 + i2);
      column = j;
    }
  }
  
  private void preLayoutChildren()
  {
    if (!mNeedSync) {
      Arrays.fill(mColumnBottoms, 0);
    }
    for (;;)
    {
      System.arraycopy(mColumnTops, 0, mColumnBottoms, 0, mColumnCount);
      return;
      mNeedSync = false;
    }
  }
  
  private void requestLayoutChildren()
  {
    int j = getChildCount();
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        return;
      }
      View localView = getChildAt(i);
      if (localView != null) {
        localView.requestLayout();
      }
      i += 1;
    }
  }
  
  private void setPositionColumn(int paramInt1, int paramInt2)
  {
    getOrCreateRecordcolumn = paramInt2;
  }
  
  private void setPositionHeightRatio(int paramInt1, int paramInt2)
  {
    getOrCreateRecordheightRatio = (paramInt2 / mColumnWidth);
  }
  
  private void setPositionIsHeaderFooter(int paramInt)
  {
    getOrCreateRecordisHeaderFooter = true;
  }
  
  private void updateColumnBottomIfNeeded(int paramInt1, int paramInt2)
  {
    if (paramInt2 > mColumnBottoms[paramInt1]) {
      mColumnBottoms[paramInt1] = paramInt2;
    }
  }
  
  private void updateColumnTopIfNeeded(int paramInt1, int paramInt2)
  {
    if (paramInt2 < mColumnTops[paramInt1]) {
      mColumnTops[paramInt1] = paramInt2;
    }
  }
  
  protected void adjustViewsAfterFillGap(boolean paramBoolean)
  {
    super.adjustViewsAfterFillGap(paramBoolean);
    if (!paramBoolean) {
      alignTops();
    }
  }
  
  protected ExtendableListView.LayoutParams generateChildLayoutParams(View paramView)
  {
    Object localObject = null;
    ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
    paramView = (View)localObject;
    if (localLayoutParams != null) {
      if (!(localLayoutParams instanceof GridLayoutParams)) {
        break label47;
      }
    }
    label47:
    for (paramView = (GridLayoutParams)localLayoutParams;; paramView = new GridLayoutParams(localLayoutParams))
    {
      localObject = paramView;
      if (paramView == null) {
        localObject = new GridLayoutParams(mColumnWidth, -2);
      }
      return localObject;
    }
  }
  
  protected int getChildBottom(int paramInt)
  {
    if (isHeaderOrFooter(paramInt)) {
      return super.getChildBottom(paramInt);
    }
    paramInt = getPositionColumn(paramInt);
    if (paramInt == -1) {
      return getLowestPositionedTop();
    }
    return mColumnTops[paramInt];
  }
  
  protected int getChildLeft(int paramInt)
  {
    if (isHeaderOrFooter(paramInt)) {
      return super.getChildLeft(paramInt);
    }
    paramInt = getPositionColumn(paramInt);
    return mColumnLefts[paramInt];
  }
  
  protected int getChildTop(int paramInt)
  {
    if (isHeaderOrFooter(paramInt)) {
      return super.getChildTop(paramInt);
    }
    paramInt = getPositionColumn(paramInt);
    if (paramInt == -1) {
      return getHighestPositionedBottom();
    }
    return mColumnBottoms[paramInt];
  }
  
  public int getColumnWidth()
  {
    return mColumnWidth;
  }
  
  public int getDistanceToTop()
  {
    return mDistanceToTop;
  }
  
  protected int getFirstChildTop()
  {
    if (isHeaderOrFooter(mFirstPosition)) {
      return super.getFirstChildTop();
    }
    return getLowestPositionedTop();
  }
  
  protected int getHighestChildTop()
  {
    if (isHeaderOrFooter(mFirstPosition)) {
      return super.getHighestChildTop();
    }
    return getHighestPositionedTop();
  }
  
  protected int getLastChildBottom()
  {
    if (isHeaderOrFooter(mFirstPosition + (getChildCount() - 1))) {
      return super.getLastChildBottom();
    }
    return getHighestPositionedBottom();
  }
  
  protected int getLowestChildBottom()
  {
    if (isHeaderOrFooter(mFirstPosition + (getChildCount() - 1))) {
      return super.getLowestChildBottom();
    }
    return getLowestPositionedBottom();
  }
  
  protected int getNextChildDownsTop(int paramInt)
  {
    if (isHeaderOrFooter(paramInt)) {
      return super.getNextChildDownsTop(paramInt);
    }
    return getHighestPositionedBottom();
  }
  
  protected int getNextChildUpsBottom(int paramInt)
  {
    if (isHeaderOrFooter(paramInt)) {
      return super.getNextChildUpsBottom(paramInt);
    }
    return getLowestPositionedTop();
  }
  
  public int getRowPaddingBottom()
  {
    return getListPaddingBottom() + mGridPaddingBottom;
  }
  
  public int getRowPaddingLeft()
  {
    return getListPaddingLeft() + mGridPaddingLeft;
  }
  
  public int getRowPaddingRight()
  {
    return getListPaddingRight() + mGridPaddingRight;
  }
  
  public int getRowPaddingTop()
  {
    return getListPaddingTop() + mGridPaddingTop;
  }
  
  protected boolean hasSpaceUp()
  {
    boolean bool = false;
    if (mClipToPadding) {}
    for (int i = getRowPaddingTop();; i = 0)
    {
      if (getLowestPositionedTop() > i) {
        bool = true;
      }
      return bool;
    }
  }
  
  protected void layoutChildren()
  {
    preLayoutChildren();
    super.layoutChildren();
  }
  
  protected void offsetChildrenTopAndBottom(int paramInt)
  {
    super.offsetChildrenTopAndBottom(paramInt);
    offsetAllColumnsTopAndBottom(paramInt);
    offsetDistanceToTop(paramInt);
  }
  
  protected void offsetChildrenTopAndBottom(int paramInt1, int paramInt2)
  {
    int j = getChildCount();
    int i = 0;
    for (;;)
    {
      if (i >= j)
      {
        offsetColumnTopAndBottom(paramInt1, paramInt2);
        return;
      }
      View localView = getChildAt(i);
      if ((localView != null) && (localView.getLayoutParams() != null) && ((localView.getLayoutParams() instanceof GridLayoutParams)) && (getLayoutParamscolumn == paramInt2)) {
        localView.offsetTopAndBottom(paramInt1);
      }
      i += 1;
    }
  }
  
  protected void onChildCreated(int paramInt, boolean paramBoolean)
  {
    super.onChildCreated(paramInt, paramBoolean);
    if (!isHeaderOrFooter(paramInt))
    {
      setPositionColumn(paramInt, getChildColumn(paramInt, paramBoolean));
      return;
    }
    setPositionIsHeaderFooter(paramInt);
  }
  
  protected void onChildrenDetached(int paramInt1, int paramInt2)
  {
    super.onChildrenDetached(paramInt1, paramInt2);
    Arrays.fill(mColumnTops, Integer.MAX_VALUE);
    Arrays.fill(mColumnBottoms, Integer.MIN_VALUE);
    paramInt1 = 0;
    if (paramInt1 >= getChildCount()) {
      return;
    }
    View localView = getChildAt(paramInt1);
    int i;
    int j;
    if (localView != null)
    {
      Object localObject = (ExtendableListView.LayoutParams)localView.getLayoutParams();
      if ((viewType == -2) || (!(localObject instanceof GridLayoutParams))) {
        break label161;
      }
      localObject = (GridLayoutParams)localObject;
      paramInt2 = column;
      i = position;
      j = localView.getTop();
      if (j < mColumnTops[paramInt2]) {
        mColumnTops[paramInt2] = (j - getChildTopMargin(i));
      }
      i = localView.getBottom();
      if (i > mColumnBottoms[paramInt2]) {
        mColumnBottoms[paramInt2] = (getChildBottomMargin() + i);
      }
    }
    for (;;)
    {
      paramInt1 += 1;
      break;
      label161:
      i = localView.getTop();
      j = localView.getBottom();
      paramInt2 = 0;
      while (paramInt2 < mColumnCount)
      {
        if (i < mColumnTops[paramInt2]) {
          mColumnTops[paramInt2] = i;
        }
        if (j > mColumnBottoms[paramInt2]) {
          mColumnBottoms[paramInt2] = j;
        }
        paramInt2 += 1;
      }
    }
  }
  
  protected void onLayoutChild(View paramView, int paramInt1, boolean paramBoolean, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    if (isHeaderOrFooter(paramInt1))
    {
      layoutGridHeaderFooter(paramView, paramInt1, paramBoolean, paramInt2, paramInt3, paramInt4, paramInt5);
      return;
    }
    layoutGridChild(paramView, paramInt1, paramBoolean, paramInt2, paramInt4);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    if (mColumnCount <= 0)
    {
      if (getMeasuredWidth() <= getMeasuredHeight()) {
        break label152;
      }
      paramInt1 = 1;
      if (paramInt1 == 0) {
        break label157;
      }
    }
    label152:
    label157:
    for (paramInt1 = mColumnCountLandscape;; paramInt1 = mColumnCountPortrait)
    {
      mColumnCount = paramInt1;
      mColumnWidth = calculateColumnWidth(getMeasuredWidth());
      if ((mColumnTops == null) || (mColumnTops.length != mColumnCount))
      {
        mColumnTops = new int[mColumnCount];
        initColumnTops();
      }
      if ((mColumnBottoms == null) || (mColumnBottoms.length != mColumnCount))
      {
        mColumnBottoms = new int[mColumnCount];
        initColumnBottoms();
      }
      if ((mColumnLefts == null) || (mColumnLefts.length != mColumnCount))
      {
        mColumnLefts = new int[mColumnCount];
        initColumnLefts();
      }
      return;
      paramInt1 = 0;
      break;
    }
  }
  
  protected void onMeasureChild(View paramView, ExtendableListView.LayoutParams paramLayoutParams)
  {
    int i = viewType;
    int j = position;
    if ((i == -2) || (i == -1))
    {
      super.onMeasureChild(paramView, paramLayoutParams);
      setPositionHeightRatio(j, getChildHeight(paramView));
      return;
    }
    int k = View.MeasureSpec.makeMeasureSpec(mColumnWidth, 1073741824);
    if (height > 0) {}
    for (i = View.MeasureSpec.makeMeasureSpec(height, 1073741824);; i = View.MeasureSpec.makeMeasureSpec(-2, 0))
    {
      paramView.measure(k, i);
      break;
    }
  }
  
  protected void onOffsetChild(View paramView, int paramInt1, boolean paramBoolean, int paramInt2, int paramInt3)
  {
    if (isHeaderOrFooter(paramInt1))
    {
      offsetGridHeaderFooter(paramView, paramInt1, paramBoolean, paramInt2, paramInt3);
      return;
    }
    offsetGridChild(paramView, paramInt1, paramBoolean, paramInt2, paramInt3);
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (GridListSavedState)paramParcelable;
    mColumnCount = columnCount;
    mColumnTops = columnTops;
    mColumnBottoms = new int[mColumnCount];
    mPositionData = positionData;
    mNeedSync = true;
    super.onRestoreInstanceState(paramParcelable);
  }
  
  public Parcelable onSaveInstanceState()
  {
    int j = 0;
    ExtendableListView.ListSavedState localListSavedState = (ExtendableListView.ListSavedState)super.onSaveInstanceState();
    GridListSavedState localGridListSavedState = new GridListSavedState(localListSavedState.getSuperState());
    selectedId = selectedId;
    firstId = firstId;
    viewTop = viewTop;
    position = position;
    height = height;
    if ((getChildCount() > 0) && (getCount() > 0)) {}
    for (int i = 1; (i != 0) && (mFirstPosition > 0); i = 0)
    {
      columnCount = mColumnCount;
      columnTops = mColumnTops;
      positionData = mPositionData;
      return localGridListSavedState;
    }
    i = j;
    if (mColumnCount >= 0) {
      i = mColumnCount;
    }
    columnCount = i;
    columnTops = new int[columnCount];
    positionData = new SparseArray();
    return localGridListSavedState;
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2)
  {
    super.onSizeChanged(paramInt1, paramInt2);
    if (paramInt1 > paramInt2)
    {
      paramInt2 = 1;
      if (paramInt2 == 0) {
        break label118;
      }
    }
    label118:
    for (paramInt2 = mColumnCountLandscape;; paramInt2 = mColumnCountPortrait)
    {
      if (mColumnCount != paramInt2)
      {
        mColumnCount = paramInt2;
        mColumnWidth = calculateColumnWidth(paramInt1);
        mColumnTops = new int[mColumnCount];
        mColumnBottoms = new int[mColumnCount];
        mColumnLefts = new int[mColumnCount];
        mDistanceToTop = 0;
        initColumnTopsAndBottoms();
        initColumnLefts();
        if ((getCount() > 0) && (mPositionData.size() > 0)) {
          onColumnSync();
        }
        requestLayout();
      }
      return;
      paramInt2 = 0;
      break;
    }
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    onSizeChanged(paramInt1, paramInt2);
  }
  
  public void resetToTop()
  {
    if (mColumnCount > 0)
    {
      if (mColumnTops == null) {
        mColumnTops = new int[mColumnCount];
      }
      if (mColumnBottoms == null) {
        mColumnBottoms = new int[mColumnCount];
      }
      initColumnTopsAndBottoms();
      mPositionData.clear();
      mNeedSync = false;
      mDistanceToTop = 0;
      setSelection(0);
    }
  }
  
  public void setColumnCount(int paramInt)
  {
    mColumnCountPortrait = paramInt;
    mColumnCountLandscape = paramInt;
    onSizeChanged(getWidth(), getHeight());
    requestLayoutChildren();
  }
  
  public void setColumnCountLandscape(int paramInt)
  {
    mColumnCountLandscape = paramInt;
    onSizeChanged(getWidth(), getHeight());
    requestLayoutChildren();
  }
  
  public void setColumnCountPortrait(int paramInt)
  {
    mColumnCountPortrait = paramInt;
    onSizeChanged(getWidth(), getHeight());
    requestLayoutChildren();
  }
  
  static class GridItemRecord
    implements Parcelable
  {
    public static final Parcelable.Creator<GridItemRecord> CREATOR = new Parcelable.Creator()
    {
      public StaggeredGridView.GridItemRecord createFromParcel(Parcel paramAnonymousParcel)
      {
        return new StaggeredGridView.GridItemRecord(paramAnonymousParcel, null);
      }
      
      public StaggeredGridView.GridItemRecord[] newArray(int paramAnonymousInt)
      {
        return new StaggeredGridView.GridItemRecord[paramAnonymousInt];
      }
    };
    int column;
    double heightRatio;
    boolean isHeaderFooter;
    
    GridItemRecord() {}
    
    private GridItemRecord(Parcel paramParcel)
    {
      column = paramParcel.readInt();
      heightRatio = paramParcel.readDouble();
      if (paramParcel.readByte() == 1) {}
      for (;;)
      {
        isHeaderFooter = bool;
        return;
        bool = false;
      }
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public String toString()
    {
      return "GridItemRecord.ListSavedState{" + Integer.toHexString(System.identityHashCode(this)) + " column:" + column + " heightRatio:" + heightRatio + " isHeaderFooter:" + isHeaderFooter + "}";
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      paramParcel.writeInt(column);
      paramParcel.writeDouble(heightRatio);
      if (isHeaderFooter) {}
      for (paramInt = 1;; paramInt = 0)
      {
        paramParcel.writeByte((byte)paramInt);
        return;
      }
    }
  }
  
  public static class GridLayoutParams
    extends ExtendableListView.LayoutParams
  {
    int column;
    
    public GridLayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
      enforceStaggeredLayout();
    }
    
    public GridLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
      enforceStaggeredLayout();
    }
    
    private void enforceStaggeredLayout()
    {
      if (width != -1) {
        width = -1;
      }
      if (height == -1) {
        height = -2;
      }
    }
  }
  
  public static class GridListSavedState
    extends ExtendableListView.ListSavedState
  {
    public static final Parcelable.Creator<GridListSavedState> CREATOR = new Parcelable.Creator()
    {
      public StaggeredGridView.GridListSavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new StaggeredGridView.GridListSavedState(paramAnonymousParcel);
      }
      
      public StaggeredGridView.GridListSavedState[] newArray(int paramAnonymousInt)
      {
        return new StaggeredGridView.GridListSavedState[paramAnonymousInt];
      }
    };
    int columnCount;
    int[] columnTops;
    SparseArray positionData;
    
    public GridListSavedState(Parcel paramParcel)
    {
      super();
      columnCount = paramParcel.readInt();
      if (columnCount >= 0) {}
      for (int i = columnCount;; i = 0)
      {
        columnTops = new int[i];
        paramParcel.readIntArray(columnTops);
        positionData = paramParcel.readSparseArray(StaggeredGridView.GridItemRecord.class.getClassLoader());
        return;
      }
    }
    
    public GridListSavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public String toString()
    {
      return "StaggeredGridView.GridListSavedState{" + Integer.toHexString(System.identityHashCode(this)) + "}";
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(columnCount);
      paramParcel.writeIntArray(columnTops);
      paramParcel.writeSparseArray(positionData);
    }
  }
}
