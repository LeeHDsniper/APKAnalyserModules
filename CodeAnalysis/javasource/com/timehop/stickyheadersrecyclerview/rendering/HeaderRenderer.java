package com.timehop.stickyheadersrecyclerview.rendering;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.view.View;
import com.timehop.stickyheadersrecyclerview.calculation.DimensionCalculator;
import com.timehop.stickyheadersrecyclerview.util.OrientationProvider;

public class HeaderRenderer
{
  private final DimensionCalculator mDimensionCalculator;
  private final OrientationProvider mOrientationProvider;
  
  public HeaderRenderer(OrientationProvider paramOrientationProvider)
  {
    this(paramOrientationProvider, new DimensionCalculator());
  }
  
  private HeaderRenderer(OrientationProvider paramOrientationProvider, DimensionCalculator paramDimensionCalculator)
  {
    mOrientationProvider = paramOrientationProvider;
    mDimensionCalculator = paramDimensionCalculator;
  }
  
  private Rect getClipRectForHeader(RecyclerView paramRecyclerView, View paramView)
  {
    paramView = mDimensionCalculator.getMargins(paramView);
    if (mOrientationProvider.getOrientation(paramRecyclerView) == 1) {
      return new Rect(paramRecyclerView.getPaddingLeft(), paramRecyclerView.getPaddingTop(), paramRecyclerView.getWidth() - paramRecyclerView.getPaddingRight() - right, paramRecyclerView.getHeight() - paramRecyclerView.getPaddingBottom());
    }
    return new Rect(paramRecyclerView.getPaddingLeft(), paramRecyclerView.getPaddingTop(), paramRecyclerView.getWidth() - paramRecyclerView.getPaddingRight(), paramRecyclerView.getHeight() - paramRecyclerView.getPaddingBottom() - bottom);
  }
  
  public void drawHeader(RecyclerView paramRecyclerView, Canvas paramCanvas, View paramView, Rect paramRect)
  {
    paramCanvas.save();
    if (paramRecyclerView.getLayoutManager().getClipToPadding()) {
      paramCanvas.clipRect(getClipRectForHeader(paramRecyclerView, paramView));
    }
    paramCanvas.translate(left, top);
    paramView.draw(paramCanvas);
    paramCanvas.restore();
  }
}
