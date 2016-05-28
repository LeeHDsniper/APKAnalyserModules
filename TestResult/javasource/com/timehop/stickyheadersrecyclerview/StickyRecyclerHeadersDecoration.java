package com.timehop.stickyheadersrecyclerview;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.State;
import android.util.SparseArray;
import android.view.View;
import com.timehop.stickyheadersrecyclerview.caching.HeaderProvider;
import com.timehop.stickyheadersrecyclerview.caching.HeaderViewCache;
import com.timehop.stickyheadersrecyclerview.calculation.DimensionCalculator;
import com.timehop.stickyheadersrecyclerview.rendering.HeaderRenderer;
import com.timehop.stickyheadersrecyclerview.util.LinearLayoutOrientationProvider;
import com.timehop.stickyheadersrecyclerview.util.OrientationProvider;

public class StickyRecyclerHeadersDecoration
  extends RecyclerView.ItemDecoration
{
  private final StickyRecyclerHeadersAdapter mAdapter;
  private final DimensionCalculator mDimensionCalculator;
  private final HeaderPositionCalculator mHeaderPositionCalculator;
  private final HeaderProvider mHeaderProvider;
  private final SparseArray<Rect> mHeaderRects = new SparseArray();
  private final OrientationProvider mOrientationProvider;
  private final HeaderRenderer mRenderer;
  
  public StickyRecyclerHeadersDecoration(StickyRecyclerHeadersAdapter paramStickyRecyclerHeadersAdapter)
  {
    this(paramStickyRecyclerHeadersAdapter, new LinearLayoutOrientationProvider(), new DimensionCalculator());
  }
  
  private StickyRecyclerHeadersDecoration(StickyRecyclerHeadersAdapter paramStickyRecyclerHeadersAdapter, HeaderRenderer paramHeaderRenderer, OrientationProvider paramOrientationProvider, DimensionCalculator paramDimensionCalculator, HeaderProvider paramHeaderProvider, HeaderPositionCalculator paramHeaderPositionCalculator)
  {
    mAdapter = paramStickyRecyclerHeadersAdapter;
    mHeaderProvider = paramHeaderProvider;
    mOrientationProvider = paramOrientationProvider;
    mRenderer = paramHeaderRenderer;
    mDimensionCalculator = paramDimensionCalculator;
    mHeaderPositionCalculator = paramHeaderPositionCalculator;
  }
  
  private StickyRecyclerHeadersDecoration(StickyRecyclerHeadersAdapter paramStickyRecyclerHeadersAdapter, OrientationProvider paramOrientationProvider, DimensionCalculator paramDimensionCalculator)
  {
    this(paramStickyRecyclerHeadersAdapter, paramOrientationProvider, paramDimensionCalculator, new HeaderRenderer(paramOrientationProvider), new HeaderViewCache(paramStickyRecyclerHeadersAdapter, paramOrientationProvider));
  }
  
  private StickyRecyclerHeadersDecoration(StickyRecyclerHeadersAdapter paramStickyRecyclerHeadersAdapter, OrientationProvider paramOrientationProvider, DimensionCalculator paramDimensionCalculator, HeaderRenderer paramHeaderRenderer, HeaderProvider paramHeaderProvider)
  {
    this(paramStickyRecyclerHeadersAdapter, paramHeaderRenderer, paramOrientationProvider, paramDimensionCalculator, paramHeaderProvider, new HeaderPositionCalculator(paramStickyRecyclerHeadersAdapter, paramHeaderProvider, paramOrientationProvider, paramDimensionCalculator));
  }
  
  private void setItemOffsetsForHeader(Rect paramRect, View paramView, int paramInt)
  {
    Rect localRect = mDimensionCalculator.getMargins(paramView);
    if (paramInt == 1)
    {
      top = (paramView.getHeight() + top + bottom);
      return;
    }
    left = (paramView.getWidth() + left + right);
  }
  
  public View getHeaderView(RecyclerView paramRecyclerView, int paramInt)
  {
    return mHeaderProvider.getHeader(paramRecyclerView, paramInt);
  }
  
  public void getItemOffsets(Rect paramRect, View paramView, RecyclerView paramRecyclerView, RecyclerView.State paramState)
  {
    super.getItemOffsets(paramRect, paramView, paramRecyclerView, paramState);
    int i = paramRecyclerView.getChildAdapterPosition(paramView);
    if (i == -1) {}
    while (!mHeaderPositionCalculator.hasNewHeader(i)) {
      return;
    }
    setItemOffsetsForHeader(paramRect, getHeaderView(paramRecyclerView, i), mOrientationProvider.getOrientation(paramRecyclerView));
  }
  
  public void invalidateHeaders()
  {
    mHeaderProvider.invalidate();
  }
  
  public void onDrawOver(Canvas paramCanvas, RecyclerView paramRecyclerView, RecyclerView.State paramState)
  {
    super.onDrawOver(paramCanvas, paramRecyclerView, paramState);
    mHeaderRects.clear();
    if ((paramRecyclerView.getChildCount() <= 0) || (mAdapter.getItemCount() <= 0)) {
      return;
    }
    int i = 0;
    label37:
    Object localObject;
    int j;
    if (i < paramRecyclerView.getChildCount())
    {
      localObject = paramRecyclerView.getChildAt(i);
      j = paramRecyclerView.getChildAdapterPosition((View)localObject);
      if (j != -1) {
        break label77;
      }
    }
    for (;;)
    {
      i += 1;
      break label37;
      break;
      label77:
      boolean bool = mHeaderPositionCalculator.hasStickyHeader((View)localObject, mOrientationProvider.getOrientation(paramRecyclerView), j);
      if ((bool) || (mHeaderPositionCalculator.hasNewHeader(j)))
      {
        paramState = mHeaderProvider.getHeader(paramRecyclerView, j);
        localObject = mHeaderPositionCalculator.getHeaderBounds(paramRecyclerView, paramState, (View)localObject, bool);
        mRenderer.drawHeader(paramRecyclerView, paramCanvas, paramState, (Rect)localObject);
        mHeaderRects.put(j, localObject);
      }
    }
  }
}
