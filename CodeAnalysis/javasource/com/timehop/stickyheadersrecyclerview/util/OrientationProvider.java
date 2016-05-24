package com.timehop.stickyheadersrecyclerview.util;

import android.support.v7.widget.RecyclerView;

public abstract interface OrientationProvider
{
  public abstract int getOrientation(RecyclerView paramRecyclerView);
}
