package com.timehop.stickyheadersrecyclerview.caching;

import android.support.v7.widget.RecyclerView;
import android.view.View;

public abstract interface HeaderProvider
{
  public abstract View getHeader(RecyclerView paramRecyclerView, int paramInt);
  
  public abstract void invalidate();
}
