package com.timehop.stickyheadersrecyclerview;

import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.ViewGroup;

public abstract interface StickyRecyclerHeadersAdapter<VH extends RecyclerView.ViewHolder>
{
  public abstract long getHeaderId(int paramInt);
  
  public abstract int getItemCount();
  
  public abstract void onBindHeaderViewHolder(VH paramVH, int paramInt);
  
  public abstract VH onCreateHeaderViewHolder(ViewGroup paramViewGroup);
}
