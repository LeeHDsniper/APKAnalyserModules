package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;
import com.adobe.creativesdk.foundation.assets.R.dimen;

public class MarginDecoration
  extends RecyclerView.ItemDecoration
{
  private int margin;
  
  public MarginDecoration(Context paramContext)
  {
    margin = paramContext.getResources().getDimensionPixelSize(R.dimen.asset_multipage_spacing);
  }
  
  public void getItemOffsets(Rect paramRect, View paramView, RecyclerView paramRecyclerView, RecyclerView.State paramState)
  {
    paramRect.set(margin, margin, margin, margin);
  }
}
