package org.lucasr.twowayview.widget;

import android.support.v7.widget.RecyclerView.Recycler;
import android.support.v7.widget.RecyclerView.State;
import org.lucasr.twowayview.TwoWayLayoutManager.Direction;
import org.lucasr.twowayview.TwoWayLayoutManager.Orientation;

public class GridLayoutManager
  extends BaseLayoutManager
{
  private int mNumColumns;
  private int mNumRows;
  
  public GridLayoutManager(TwoWayLayoutManager.Orientation paramOrientation, int paramInt1, int paramInt2)
  {
    super(paramOrientation);
    mNumColumns = paramInt1;
    mNumRows = paramInt2;
    if (mNumColumns < 1) {
      throw new IllegalArgumentException("GridLayoutManager must have at least 1 column");
    }
    if (mNumRows < 1) {
      throw new IllegalArgumentException("GridLayoutManager must have at least 1 row");
    }
  }
  
  int getLaneCount()
  {
    if (isVertical()) {
      return mNumColumns;
    }
    return mNumRows;
  }
  
  void getLaneForPosition(Lanes.LaneInfo paramLaneInfo, int paramInt, TwoWayLayoutManager.Direction paramDirection)
  {
    paramInt %= getLaneCount();
    paramLaneInfo.set(paramInt, paramInt);
  }
  
  public int getNumColumns()
  {
    return mNumColumns;
  }
  
  void moveLayoutToPosition(int paramInt1, int paramInt2, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    paramState = getLanes();
    paramState.reset(paramInt2);
    getLaneForPosition(mTempLaneInfo, paramInt1, TwoWayLayoutManager.Direction.END);
    paramInt2 = mTempLaneInfo.startLane;
    if (paramInt2 == 0) {
      return;
    }
    paramRecycler = paramRecycler.getViewForPosition(paramInt1);
    measureChild(paramRecycler, TwoWayLayoutManager.Direction.END);
    if (isVertical()) {}
    for (paramInt1 = getDecoratedMeasuredHeight(paramRecycler);; paramInt1 = getDecoratedMeasuredWidth(paramRecycler))
    {
      paramInt2 -= 1;
      while (paramInt2 >= 0)
      {
        paramState.offset(paramInt2, paramInt1);
        paramInt2 -= 1;
      }
      break;
    }
  }
}
