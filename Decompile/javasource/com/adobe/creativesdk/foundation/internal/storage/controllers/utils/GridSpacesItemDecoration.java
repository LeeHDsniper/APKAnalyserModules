package com.adobe.creativesdk.foundation.internal.storage.controllers.utils;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.State;
import android.util.DisplayMetrics;
import android.view.View;

public class GridSpacesItemDecoration
  extends RecyclerView.ItemDecoration
{
  private int offset;
  
  public GridSpacesItemDecoration(int paramInt, Context paramContext)
  {
    offset = dpToPx(paramInt, paramContext);
  }
  
  public int dpToPx(int paramInt, Context paramContext)
  {
    paramContext = paramContext.getResources().getDisplayMetrics();
    return Math.round(paramInt * (xdpi / 160.0F));
  }
  
  public void getItemOffsets(Rect paramRect, View paramView, RecyclerView paramRecyclerView, RecyclerView.State paramState)
  {
    super.getItemOffsets(paramRect, paramView, paramRecyclerView, paramState);
    paramRect.set(offset, offset, offset, offset);
  }
}
