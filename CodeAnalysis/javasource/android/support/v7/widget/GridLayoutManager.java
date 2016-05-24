package android.support.v7.widget;

import android.content.Context;
import android.graphics.Rect;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.CollectionItemInfoCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseIntArray;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import java.util.Arrays;

public class GridLayoutManager
  extends LinearLayoutManager
{
  static final int MAIN_DIR_SPEC = View.MeasureSpec.makeMeasureSpec(0, 0);
  int[] mCachedBorders;
  final Rect mDecorInsets = new Rect();
  boolean mPendingSpanCountChange = false;
  final SparseIntArray mPreLayoutSpanIndexCache = new SparseIntArray();
  final SparseIntArray mPreLayoutSpanSizeCache = new SparseIntArray();
  View[] mSet;
  int mSpanCount = -1;
  SpanSizeLookup mSpanSizeLookup = new DefaultSpanSizeLookup();
  
  public GridLayoutManager(Context paramContext, int paramInt)
  {
    super(paramContext);
    setSpanCount(paramInt);
  }
  
  public GridLayoutManager(Context paramContext, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    super(paramContext, paramInt2, paramBoolean);
    setSpanCount(paramInt1);
  }
  
  private void assignSpans(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    int j;
    int i;
    int k;
    label43:
    LayoutParams localLayoutParams;
    if (paramBoolean)
    {
      paramInt2 = 0;
      j = paramInt1;
      i = 1;
      paramInt1 = paramInt2;
      if ((mOrientation != 1) || (!isLayoutRTL())) {
        break label150;
      }
      paramInt2 = mSpanCount - 1;
      k = -1;
      if (paramInt1 == j) {
        return;
      }
      View localView = mSet[paramInt1];
      localLayoutParams = (LayoutParams)localView.getLayoutParams();
      LayoutParams.access$102(localLayoutParams, getSpanSize(paramRecycler, paramState, getPosition(localView)));
      if ((k != -1) || (mSpanSize <= 1)) {
        break label159;
      }
      LayoutParams.access$002(localLayoutParams, paramInt2 - (mSpanSize - 1));
    }
    for (;;)
    {
      paramInt2 += mSpanSize * k;
      paramInt1 += i;
      break label43;
      paramInt1 -= 1;
      j = -1;
      i = -1;
      break;
      label150:
      paramInt2 = 0;
      k = 1;
      break label43;
      label159:
      LayoutParams.access$002(localLayoutParams, paramInt2);
    }
  }
  
  private void cachePreLayoutSpanMapping()
  {
    int j = getChildCount();
    int i = 0;
    while (i < j)
    {
      LayoutParams localLayoutParams = (LayoutParams)getChildAt(i).getLayoutParams();
      int k = localLayoutParams.getViewLayoutPosition();
      mPreLayoutSpanSizeCache.put(k, localLayoutParams.getSpanSize());
      mPreLayoutSpanIndexCache.put(k, localLayoutParams.getSpanIndex());
      i += 1;
    }
  }
  
  private void calculateItemBorders(int paramInt)
  {
    if ((mCachedBorders == null) || (mCachedBorders.length != mSpanCount + 1) || (mCachedBorders[(mCachedBorders.length - 1)] != paramInt)) {
      mCachedBorders = new int[mSpanCount + 1];
    }
    mCachedBorders[0] = 0;
    int n = paramInt / mSpanCount;
    int i2 = paramInt % mSpanCount;
    int j = 0;
    paramInt = 0;
    int i = 1;
    while (i <= mSpanCount)
    {
      int k = n;
      int i1 = paramInt + i2;
      paramInt = i1;
      int m = k;
      if (i1 > 0)
      {
        paramInt = i1;
        m = k;
        if (mSpanCount - i1 < i2)
        {
          m = k + 1;
          paramInt = i1 - mSpanCount;
        }
      }
      j += m;
      mCachedBorders[i] = j;
      i += 1;
    }
  }
  
  private void clearPreLayoutSpanMappingCache()
  {
    mPreLayoutSpanSizeCache.clear();
    mPreLayoutSpanIndexCache.clear();
  }
  
  private void ensureAnchorIsInFirstSpan(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, LinearLayoutManager.AnchorInfo paramAnchorInfo)
  {
    for (int i = getSpanIndex(paramRecycler, paramState, mPosition); (i > 0) && (mPosition > 0); i = getSpanIndex(paramRecycler, paramState, mPosition)) {
      mPosition -= 1;
    }
  }
  
  private int getMainDirSpec(int paramInt)
  {
    if (paramInt < 0) {
      return MAIN_DIR_SPEC;
    }
    return View.MeasureSpec.makeMeasureSpec(paramInt, 1073741824);
  }
  
  private int getSpanGroupIndex(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, int paramInt)
  {
    if (!paramState.isPreLayout()) {
      return mSpanSizeLookup.getSpanGroupIndex(paramInt, mSpanCount);
    }
    int i = paramRecycler.convertPreLayoutPositionToPostLayout(paramInt);
    if (i == -1)
    {
      Log.w("GridLayoutManager", "Cannot find span size for pre layout position. " + paramInt);
      return 0;
    }
    return mSpanSizeLookup.getSpanGroupIndex(i, mSpanCount);
  }
  
  private int getSpanIndex(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, int paramInt)
  {
    if (!paramState.isPreLayout()) {
      i = mSpanSizeLookup.getCachedSpanIndex(paramInt, mSpanCount);
    }
    int j;
    do
    {
      return i;
      j = mPreLayoutSpanIndexCache.get(paramInt, -1);
      i = j;
    } while (j != -1);
    int i = paramRecycler.convertPreLayoutPositionToPostLayout(paramInt);
    if (i == -1)
    {
      Log.w("GridLayoutManager", "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:" + paramInt);
      return 0;
    }
    return mSpanSizeLookup.getCachedSpanIndex(i, mSpanCount);
  }
  
  private int getSpanSize(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, int paramInt)
  {
    if (!paramState.isPreLayout()) {
      i = mSpanSizeLookup.getSpanSize(paramInt);
    }
    int j;
    do
    {
      return i;
      j = mPreLayoutSpanSizeCache.get(paramInt, -1);
      i = j;
    } while (j != -1);
    int i = paramRecycler.convertPreLayoutPositionToPostLayout(paramInt);
    if (i == -1)
    {
      Log.w("GridLayoutManager", "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:" + paramInt);
      return 1;
    }
    return mSpanSizeLookup.getSpanSize(i);
  }
  
  private void measureChildWithDecorationsAndMargin(View paramView, int paramInt1, int paramInt2)
  {
    calculateItemDecorationsForChild(paramView, mDecorInsets);
    RecyclerView.LayoutParams localLayoutParams = (RecyclerView.LayoutParams)paramView.getLayoutParams();
    paramView.measure(updateSpecWithExtra(paramInt1, leftMargin + mDecorInsets.left, rightMargin + mDecorInsets.right), updateSpecWithExtra(paramInt2, topMargin + mDecorInsets.top, bottomMargin + mDecorInsets.bottom));
  }
  
  private void updateMeasurements()
  {
    if (getOrientation() == 1) {}
    for (int i = getWidth() - getPaddingRight() - getPaddingLeft();; i = getHeight() - getPaddingBottom() - getPaddingTop())
    {
      calculateItemBorders(i);
      return;
    }
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
  
  public boolean checkLayoutParams(RecyclerView.LayoutParams paramLayoutParams)
  {
    return paramLayoutParams instanceof LayoutParams;
  }
  
  View findReferenceChild(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, int paramInt1, int paramInt2, int paramInt3)
  {
    ensureLayoutState();
    Object localObject2 = null;
    Object localObject1 = null;
    int j = mOrientationHelper.getStartAfterPadding();
    int k = mOrientationHelper.getEndAfterPadding();
    int i;
    View localView;
    Object localObject3;
    Object localObject4;
    if (paramInt2 > paramInt1)
    {
      i = 1;
      if (paramInt1 == paramInt2) {
        break label221;
      }
      localView = getChildAt(paramInt1);
      int m = getPosition(localView);
      localObject3 = localObject2;
      localObject4 = localObject1;
      if (m >= 0)
      {
        localObject3 = localObject2;
        localObject4 = localObject1;
        if (m < paramInt3)
        {
          if (getSpanIndex(paramRecycler, paramState, m) == 0) {
            break label127;
          }
          localObject4 = localObject1;
          localObject3 = localObject2;
        }
      }
    }
    for (;;)
    {
      paramInt1 += i;
      localObject2 = localObject3;
      localObject1 = localObject4;
      break;
      i = -1;
      break;
      label127:
      if (((RecyclerView.LayoutParams)localView.getLayoutParams()).isItemRemoved())
      {
        localObject3 = localObject2;
        localObject4 = localObject1;
        if (localObject2 == null)
        {
          localObject3 = localView;
          localObject4 = localObject1;
        }
      }
      else
      {
        if (mOrientationHelper.getDecoratedStart(localView) < k)
        {
          localObject3 = localView;
          if (mOrientationHelper.getDecoratedEnd(localView) >= j) {
            break label230;
          }
        }
        localObject3 = localObject2;
        localObject4 = localObject1;
        if (localObject1 == null)
        {
          localObject3 = localObject2;
          localObject4 = localView;
        }
      }
    }
    label221:
    if (localObject1 != null) {}
    for (;;)
    {
      localObject3 = localObject1;
      label230:
      return localObject3;
      localObject1 = localObject2;
    }
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
    if (paramState.getItemCount() < 1) {
      return 0;
    }
    return getSpanGroupIndex(paramRecycler, paramState, paramState.getItemCount() - 1);
  }
  
  public int getRowCountForAccessibility(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    if (mOrientation == 0) {
      return mSpanCount;
    }
    if (paramState.getItemCount() < 1) {
      return 0;
    }
    return getSpanGroupIndex(paramRecycler, paramState, paramState.getItemCount() - 1);
  }
  
  void layoutChunk(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, LinearLayoutManager.LayoutState paramLayoutState, LinearLayoutManager.LayoutChunkResult paramLayoutChunkResult)
  {
    boolean bool;
    int n;
    if (mItemDirection == 1)
    {
      bool = true;
      k = 0;
      m = 0;
      i = mSpanCount;
      n = k;
      j = m;
      if (!bool)
      {
        i = getSpanIndex(paramRecycler, paramState, mCurrentPosition) + getSpanSize(paramRecycler, paramState, mCurrentPosition);
        j = m;
        n = k;
      }
    }
    for (;;)
    {
      if ((n < mSpanCount) && (paramLayoutState.hasMore(paramState)) && (i > 0))
      {
        m = mCurrentPosition;
        k = getSpanSize(paramRecycler, paramState, m);
        if (k > mSpanCount)
        {
          throw new IllegalArgumentException("Item at position " + m + " requires " + k + " spans but GridLayoutManager has only " + mSpanCount + " spans.");
          bool = false;
          break;
        }
        i -= k;
        if (i >= 0) {
          break label203;
        }
      }
      label203:
      View localView;
      do
      {
        if (n != 0) {
          break;
        }
        mFinished = true;
        return;
        localView = paramLayoutState.next(paramRecycler);
      } while (localView == null);
      j += k;
      mSet[n] = localView;
      n += 1;
    }
    int i = 0;
    assignSpans(paramRecycler, paramState, n, j, bool);
    int j = 0;
    if (j < n)
    {
      paramRecycler = mSet[j];
      if (mScrapList == null) {
        if (bool)
        {
          addView(paramRecycler);
          label290:
          paramState = (LayoutParams)paramRecycler.getLayoutParams();
          k = View.MeasureSpec.makeMeasureSpec(mCachedBorders[(mSpanIndex + mSpanSize)] - mCachedBorders[mSpanIndex], 1073741824);
          if (mOrientation != 1) {
            break label421;
          }
          measureChildWithDecorationsAndMargin(paramRecycler, k, getMainDirSpec(height));
        }
      }
      for (;;)
      {
        m = mOrientationHelper.getDecoratedMeasurement(paramRecycler);
        k = i;
        if (m > i) {
          k = m;
        }
        j += 1;
        i = k;
        break;
        addView(paramRecycler, 0);
        break label290;
        if (bool)
        {
          addDisappearingView(paramRecycler);
          break label290;
        }
        addDisappearingView(paramRecycler, 0);
        break label290;
        label421:
        measureChildWithDecorationsAndMargin(paramRecycler, getMainDirSpec(width), k);
      }
    }
    int k = getMainDirSpec(i);
    j = 0;
    if (j < n)
    {
      paramRecycler = mSet[j];
      if (mOrientationHelper.getDecoratedMeasurement(paramRecycler) != i)
      {
        paramState = (LayoutParams)paramRecycler.getLayoutParams();
        m = View.MeasureSpec.makeMeasureSpec(mCachedBorders[(mSpanIndex + mSpanSize)] - mCachedBorders[mSpanIndex], 1073741824);
        if (mOrientation != 1) {
          break label543;
        }
        measureChildWithDecorationsAndMargin(paramRecycler, m, k);
      }
      for (;;)
      {
        j += 1;
        break;
        label543:
        measureChildWithDecorationsAndMargin(paramRecycler, k, m);
      }
    }
    mConsumed = i;
    j = 0;
    k = 0;
    int m = 0;
    int i1 = 0;
    if (mOrientation == 1) {
      if (mLayoutDirection == -1)
      {
        i1 = mOffset;
        m = i1 - i;
        i = i1;
        int i2 = 0;
        i1 = m;
        m = j;
        j = i2;
        label622:
        if (j >= n) {
          break label855;
        }
        paramRecycler = mSet[j];
        paramState = (LayoutParams)paramRecycler.getLayoutParams();
        if (mOrientation != 1) {
          break label823;
        }
        m = getPaddingLeft() + mCachedBorders[mSpanIndex];
        k = m + mOrientationHelper.getDecoratedMeasurementInOther(paramRecycler);
      }
    }
    for (;;)
    {
      layoutDecorated(paramRecycler, m + leftMargin, i1 + topMargin, k - rightMargin, i - bottomMargin);
      if ((paramState.isItemRemoved()) || (paramState.isItemChanged())) {
        mIgnoreConsumed = true;
      }
      mFocusable |= paramRecycler.isFocusable();
      j += 1;
      break label622;
      m = mOffset;
      i = m + i;
      break;
      if (mLayoutDirection == -1)
      {
        k = mOffset;
        j = k - i;
        i = i1;
        break;
      }
      j = mOffset;
      k = j + i;
      i = i1;
      break;
      label823:
      i1 = getPaddingTop() + mCachedBorders[mSpanIndex];
      i = i1 + mOrientationHelper.getDecoratedMeasurementInOther(paramRecycler);
    }
    label855:
    Arrays.fill(mSet, null);
  }
  
  void onAnchorReady(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, LinearLayoutManager.AnchorInfo paramAnchorInfo)
  {
    super.onAnchorReady(paramRecycler, paramState, paramAnchorInfo);
    updateMeasurements();
    if ((paramState.getItemCount() > 0) && (!paramState.isPreLayout())) {
      ensureAnchorIsInFirstSpan(paramRecycler, paramState, paramAnchorInfo);
    }
    if ((mSet == null) || (mSet.length != mSpanCount)) {
      mSet = new View[mSpanCount];
    }
  }
  
  public void onInitializeAccessibilityNodeInfoForItem(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState, View paramView, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
  {
    ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
    if (!(localLayoutParams instanceof LayoutParams))
    {
      super.onInitializeAccessibilityNodeInfoForItem(paramView, paramAccessibilityNodeInfoCompat);
      return;
    }
    paramView = (LayoutParams)localLayoutParams;
    int i = getSpanGroupIndex(paramRecycler, paramState, paramView.getViewLayoutPosition());
    if (mOrientation == 0)
    {
      j = paramView.getSpanIndex();
      k = paramView.getSpanSize();
      if ((mSpanCount > 1) && (paramView.getSpanSize() == mSpanCount)) {}
      for (bool = true;; bool = false)
      {
        paramAccessibilityNodeInfoCompat.setCollectionItemInfo(AccessibilityNodeInfoCompat.CollectionItemInfoCompat.obtain(j, k, i, 1, bool, false));
        return;
      }
    }
    int j = paramView.getSpanIndex();
    int k = paramView.getSpanSize();
    if ((mSpanCount > 1) && (paramView.getSpanSize() == mSpanCount)) {}
    for (boolean bool = true;; bool = false)
    {
      paramAccessibilityNodeInfoCompat.setCollectionItemInfo(AccessibilityNodeInfoCompat.CollectionItemInfoCompat.obtain(i, 1, j, k, bool, false));
      return;
    }
  }
  
  public void onItemsAdded(RecyclerView paramRecyclerView, int paramInt1, int paramInt2)
  {
    mSpanSizeLookup.invalidateSpanIndexCache();
  }
  
  public void onItemsChanged(RecyclerView paramRecyclerView)
  {
    mSpanSizeLookup.invalidateSpanIndexCache();
  }
  
  public void onItemsMoved(RecyclerView paramRecyclerView, int paramInt1, int paramInt2, int paramInt3)
  {
    mSpanSizeLookup.invalidateSpanIndexCache();
  }
  
  public void onItemsRemoved(RecyclerView paramRecyclerView, int paramInt1, int paramInt2)
  {
    mSpanSizeLookup.invalidateSpanIndexCache();
  }
  
  public void onItemsUpdated(RecyclerView paramRecyclerView, int paramInt1, int paramInt2)
  {
    mSpanSizeLookup.invalidateSpanIndexCache();
  }
  
  public void onLayoutChildren(RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    if (paramState.isPreLayout()) {
      cachePreLayoutSpanMapping();
    }
    super.onLayoutChildren(paramRecycler, paramState);
    clearPreLayoutSpanMappingCache();
    if (!paramState.isPreLayout()) {
      mPendingSpanCountChange = false;
    }
  }
  
  public void setSpanCount(int paramInt)
  {
    if (paramInt == mSpanCount) {
      return;
    }
    mPendingSpanCountChange = true;
    if (paramInt < 1) {
      throw new IllegalArgumentException("Span count should be at least 1. Provided " + paramInt);
    }
    mSpanCount = paramInt;
    mSpanSizeLookup.invalidateSpanIndexCache();
  }
  
  public boolean supportsPredictiveItemAnimations()
  {
    return (mPendingSavedState == null) && (!mPendingSpanCountChange);
  }
  
  public static final class DefaultSpanSizeLookup
    extends GridLayoutManager.SpanSizeLookup
  {
    public DefaultSpanSizeLookup() {}
    
    public int getSpanIndex(int paramInt1, int paramInt2)
    {
      return paramInt1 % paramInt2;
    }
    
    public int getSpanSize(int paramInt)
    {
      return 1;
    }
  }
  
  public static class LayoutParams
    extends RecyclerView.LayoutParams
  {
    private int mSpanIndex = -1;
    private int mSpanSize = 0;
    
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
    
    public int getSpanIndex()
    {
      return mSpanIndex;
    }
    
    public int getSpanSize()
    {
      return mSpanSize;
    }
  }
  
  public static abstract class SpanSizeLookup
  {
    private boolean mCacheSpanIndices = false;
    final SparseIntArray mSpanIndexCache = new SparseIntArray();
    
    public SpanSizeLookup() {}
    
    int findReferenceIndexFromCache(int paramInt)
    {
      int i = 0;
      int j = mSpanIndexCache.size() - 1;
      while (i <= j)
      {
        int k = i + j >>> 1;
        if (mSpanIndexCache.keyAt(k) < paramInt) {
          i = k + 1;
        } else {
          j = k - 1;
        }
      }
      paramInt = i - 1;
      if ((paramInt >= 0) && (paramInt < mSpanIndexCache.size())) {
        return mSpanIndexCache.keyAt(paramInt);
      }
      return -1;
    }
    
    int getCachedSpanIndex(int paramInt1, int paramInt2)
    {
      int i;
      if (!mCacheSpanIndices) {
        i = getSpanIndex(paramInt1, paramInt2);
      }
      int j;
      do
      {
        return i;
        j = mSpanIndexCache.get(paramInt1, -1);
        i = j;
      } while (j != -1);
      paramInt2 = getSpanIndex(paramInt1, paramInt2);
      mSpanIndexCache.put(paramInt1, paramInt2);
      return paramInt2;
    }
    
    public int getSpanGroupIndex(int paramInt1, int paramInt2)
    {
      int i = 0;
      int j = 0;
      int i2 = getSpanSize(paramInt1);
      int m = 0;
      if (m < paramInt1)
      {
        int n = getSpanSize(m);
        int i1 = i + n;
        int k;
        if (i1 == paramInt2)
        {
          i = 0;
          k = j + 1;
        }
        for (;;)
        {
          m += 1;
          j = k;
          break;
          k = j;
          i = i1;
          if (i1 > paramInt2)
          {
            i = n;
            k = j + 1;
          }
        }
      }
      paramInt1 = j;
      if (i + i2 > paramInt2) {
        paramInt1 = j + 1;
      }
      return paramInt1;
    }
    
    public int getSpanIndex(int paramInt1, int paramInt2)
    {
      int n = getSpanSize(paramInt1);
      if (n == paramInt2) {
        paramInt1 = 0;
      }
      int i;
      do
      {
        return paramInt1;
        int k = 0;
        int m = 0;
        i = k;
        int j = m;
        if (mCacheSpanIndices)
        {
          i = k;
          j = m;
          if (mSpanIndexCache.size() > 0)
          {
            int i1 = findReferenceIndexFromCache(paramInt1);
            i = k;
            j = m;
            if (i1 >= 0)
            {
              i = mSpanIndexCache.get(i1) + getSpanSize(i1);
              j = i1 + 1;
            }
          }
        }
        if (j < paramInt1)
        {
          k = getSpanSize(j);
          m = i + k;
          if (m == paramInt2) {
            i = 0;
          }
          for (;;)
          {
            j += 1;
            break;
            i = m;
            if (m > paramInt2) {
              i = k;
            }
          }
        }
        paramInt1 = i;
      } while (i + n <= paramInt2);
      return 0;
    }
    
    public abstract int getSpanSize(int paramInt);
    
    public void invalidateSpanIndexCache()
    {
      mSpanIndexCache.clear();
    }
  }
}
