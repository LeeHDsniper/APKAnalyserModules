package com.timehop.stickyheadersrecyclerview;

import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.view.View;
import com.timehop.stickyheadersrecyclerview.caching.HeaderProvider;
import com.timehop.stickyheadersrecyclerview.calculation.DimensionCalculator;
import com.timehop.stickyheadersrecyclerview.util.OrientationProvider;

public class HeaderPositionCalculator
{
  private final StickyRecyclerHeadersAdapter mAdapter;
  private final DimensionCalculator mDimensionCalculator;
  private final HeaderProvider mHeaderProvider;
  private final OrientationProvider mOrientationProvider;
  
  public HeaderPositionCalculator(StickyRecyclerHeadersAdapter paramStickyRecyclerHeadersAdapter, HeaderProvider paramHeaderProvider, OrientationProvider paramOrientationProvider, DimensionCalculator paramDimensionCalculator)
  {
    mAdapter = paramStickyRecyclerHeadersAdapter;
    mHeaderProvider = paramHeaderProvider;
    mOrientationProvider = paramOrientationProvider;
    mDimensionCalculator = paramDimensionCalculator;
  }
  
  private Rect getDefaultHeaderOffset(RecyclerView paramRecyclerView, View paramView1, View paramView2, int paramInt)
  {
    Rect localRect = mDimensionCalculator.getMargins(paramView1);
    int i;
    if (paramInt == 1)
    {
      paramInt = paramView2.getLeft() + left;
      i = Math.max(paramView2.getTop() - paramView1.getHeight() - bottom, getListTop(paramRecyclerView) + top);
    }
    for (;;)
    {
      return new Rect(paramInt, i, paramView1.getWidth() + paramInt, paramView1.getHeight() + i);
      i = paramView2.getTop() + top;
      paramInt = Math.max(paramView2.getLeft() - paramView1.getWidth() - right, getListLeft(paramRecyclerView) + left);
    }
  }
  
  private View getFirstViewUnobscuredByHeader(RecyclerView paramRecyclerView, View paramView)
  {
    int i = 0;
    while (i < paramRecyclerView.getChildCount())
    {
      View localView = paramRecyclerView.getChildAt(i);
      if (!itemIsObscuredByHeader(paramRecyclerView, localView, paramView, mOrientationProvider.getOrientation(paramRecyclerView))) {
        return localView;
      }
      i += 1;
    }
    return null;
  }
  
  private int getListLeft(RecyclerView paramRecyclerView)
  {
    if (paramRecyclerView.getLayoutManager().getClipToPadding()) {
      return paramRecyclerView.getPaddingLeft();
    }
    return 0;
  }
  
  private int getListTop(RecyclerView paramRecyclerView)
  {
    if (paramRecyclerView.getLayoutManager().getClipToPadding()) {
      return paramRecyclerView.getPaddingTop();
    }
    return 0;
  }
  
  private boolean indexOutOfBounds(int paramInt)
  {
    return (paramInt < 0) || (paramInt >= mAdapter.getItemCount());
  }
  
  private boolean isStickyHeaderBeingPushedOffscreen(RecyclerView paramRecyclerView, View paramView)
  {
    View localView1 = getFirstViewUnobscuredByHeader(paramRecyclerView, paramView);
    int i = paramRecyclerView.getChildAdapterPosition(localView1);
    if (i == -1) {}
    View localView2;
    Rect localRect1;
    Rect localRect2;
    do
    {
      do
      {
        do
        {
          return false;
        } while ((i <= 0) || (!hasNewHeader(i)));
        localView2 = mHeaderProvider.getHeader(paramRecyclerView, i);
        localRect1 = mDimensionCalculator.getMargins(localView2);
        localRect2 = mDimensionCalculator.getMargins(paramView);
        if (mOrientationProvider.getOrientation(paramRecyclerView) != 1) {
          break;
        }
      } while (localView1.getTop() - bottom - localView2.getHeight() - top >= paramRecyclerView.getPaddingTop() + paramView.getBottom() + top + bottom);
      return true;
    } while (localView1.getLeft() - right - localView2.getWidth() - left >= paramRecyclerView.getPaddingLeft() + paramView.getRight() + left + right);
    return true;
  }
  
  private boolean itemIsObscuredByHeader(RecyclerView paramRecyclerView, View paramView1, View paramView2, int paramInt)
  {
    RecyclerView.LayoutParams localLayoutParams = (RecyclerView.LayoutParams)paramView1.getLayoutParams();
    Rect localRect = mDimensionCalculator.getMargins(paramView2);
    int i = paramRecyclerView.getChildAdapterPosition(paramView1);
    if ((i == -1) || (mHeaderProvider.getHeader(paramRecyclerView, i) != paramView2)) {}
    do
    {
      return false;
      if (paramInt != 1) {
        break;
      }
    } while (paramView1.getTop() - topMargin > paramView2.getBottom() + bottom + top);
    while (paramView1.getLeft() - leftMargin <= paramView2.getRight() + right + left) {
      return true;
    }
    return false;
  }
  
  private void translateHeaderWithNextHeader(RecyclerView paramRecyclerView, int paramInt, Rect paramRect, View paramView1, View paramView2, View paramView3)
  {
    Rect localRect1 = mDimensionCalculator.getMargins(paramView3);
    Rect localRect2 = mDimensionCalculator.getMargins(paramView1);
    int i;
    if (paramInt == 1)
    {
      paramInt = getListTop(paramRecyclerView) + top + bottom;
      i = paramView2.getTop() - paramView3.getHeight() - bottom - top - paramView1.getHeight() - paramInt;
      if (i < paramInt) {
        top += i;
      }
    }
    do
    {
      return;
      paramInt = getListLeft(paramRecyclerView) + left + right;
      i = paramView2.getLeft() - paramView3.getWidth() - right - left - paramView1.getWidth() - paramInt;
    } while (i >= paramInt);
    left += i;
  }
  
  public Rect getHeaderBounds(RecyclerView paramRecyclerView, View paramView1, View paramView2, boolean paramBoolean)
  {
    paramView2 = getDefaultHeaderOffset(paramRecyclerView, paramView1, paramView2, mOrientationProvider.getOrientation(paramRecyclerView));
    if ((paramBoolean) && (isStickyHeaderBeingPushedOffscreen(paramRecyclerView, paramView1)))
    {
      View localView1 = getFirstViewUnobscuredByHeader(paramRecyclerView, paramView1);
      int i = paramRecyclerView.getChildAdapterPosition(localView1);
      View localView2 = mHeaderProvider.getHeader(paramRecyclerView, i);
      translateHeaderWithNextHeader(paramRecyclerView, mOrientationProvider.getOrientation(paramRecyclerView), paramView2, paramView1, localView1, localView2);
    }
    return paramView2;
  }
  
  public boolean hasNewHeader(int paramInt)
  {
    if (indexOutOfBounds(paramInt)) {}
    long l;
    do
    {
      return false;
      l = mAdapter.getHeaderId(paramInt);
    } while ((l < 0L) || ((paramInt != 0) && (l == mAdapter.getHeaderId(paramInt - 1))));
    return true;
  }
  
  public boolean hasStickyHeader(View paramView, int paramInt1, int paramInt2)
  {
    int i;
    if (paramInt1 == 1) {
      i = paramView.getTop();
    }
    for (paramInt1 = mDimensionCalculator.getMargins(paramView).top; (i <= paramInt1) && (mAdapter.getHeaderId(paramInt2) >= 0L); paramInt1 = mDimensionCalculator.getMargins(paramView).left)
    {
      return true;
      i = paramView.getLeft();
    }
    return false;
  }
}
