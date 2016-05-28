package com.timehop.stickyheadersrecyclerview.util;

import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

public class LinearLayoutOrientationProvider
  implements OrientationProvider
{
  public LinearLayoutOrientationProvider() {}
  
  public int getOrientation(RecyclerView paramRecyclerView)
  {
    paramRecyclerView = paramRecyclerView.getLayoutManager();
    if ((paramRecyclerView instanceof LinearLayoutManager)) {
      return ((LinearLayoutManager)paramRecyclerView).getOrientation();
    }
    throw new IllegalStateException("StickyListHeadersDecoration can only be used with a LinearLayoutManager.");
  }
}
