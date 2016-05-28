package com.timehop.stickyheadersrecyclerview.caching;

import android.support.v4.util.LongSparseArray;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import com.timehop.stickyheadersrecyclerview.StickyRecyclerHeadersAdapter;
import com.timehop.stickyheadersrecyclerview.util.OrientationProvider;

public class HeaderViewCache
  implements HeaderProvider
{
  private final StickyRecyclerHeadersAdapter mAdapter;
  private final LongSparseArray<View> mHeaderViews = new LongSparseArray();
  private final OrientationProvider mOrientationProvider;
  
  public HeaderViewCache(StickyRecyclerHeadersAdapter paramStickyRecyclerHeadersAdapter, OrientationProvider paramOrientationProvider)
  {
    mAdapter = paramStickyRecyclerHeadersAdapter;
    mOrientationProvider = paramOrientationProvider;
  }
  
  public View getHeader(RecyclerView paramRecyclerView, int paramInt)
  {
    long l = mAdapter.getHeaderId(paramInt);
    View localView = (View)mHeaderViews.get(l);
    Object localObject = localView;
    int i;
    if (localView == null)
    {
      localObject = mAdapter.onCreateHeaderViewHolder(paramRecyclerView);
      mAdapter.onBindHeaderViewHolder((RecyclerView.ViewHolder)localObject, paramInt);
      localObject = itemView;
      if (((View)localObject).getLayoutParams() == null) {
        ((View)localObject).setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
      }
      if (mOrientationProvider.getOrientation(paramRecyclerView) != 1) {
        break label201;
      }
      i = View.MeasureSpec.makeMeasureSpec(paramRecyclerView.getWidth(), 1073741824);
    }
    for (paramInt = View.MeasureSpec.makeMeasureSpec(paramRecyclerView.getHeight(), 0);; paramInt = View.MeasureSpec.makeMeasureSpec(paramRecyclerView.getHeight(), 1073741824))
    {
      ((View)localObject).measure(ViewGroup.getChildMeasureSpec(i, paramRecyclerView.getPaddingLeft() + paramRecyclerView.getPaddingRight(), getLayoutParamswidth), ViewGroup.getChildMeasureSpec(paramInt, paramRecyclerView.getPaddingTop() + paramRecyclerView.getPaddingBottom(), getLayoutParamsheight));
      ((View)localObject).layout(0, 0, ((View)localObject).getMeasuredWidth(), ((View)localObject).getMeasuredHeight());
      mHeaderViews.put(l, localObject);
      return localObject;
      label201:
      i = View.MeasureSpec.makeMeasureSpec(paramRecyclerView.getWidth(), 0);
    }
  }
  
  public void invalidate()
  {
    mHeaderViews.clear();
  }
}
