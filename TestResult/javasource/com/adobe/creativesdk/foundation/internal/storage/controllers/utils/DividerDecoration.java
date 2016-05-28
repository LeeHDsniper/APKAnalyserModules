package com.adobe.creativesdk.foundation.internal.storage.controllers.utils;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;

public class DividerDecoration
  extends RecyclerView.ItemDecoration
{
  private static final int[] ATTRS = { 16843284 };
  private Drawable mDivider;
  
  public DividerDecoration(Context paramContext)
  {
    paramContext = paramContext.obtainStyledAttributes(ATTRS);
    mDivider = paramContext.getDrawable(0);
    paramContext.recycle();
  }
  
  private int getOrientation(RecyclerView paramRecyclerView)
  {
    try
    {
      paramRecyclerView = (LinearLayoutManager)paramRecyclerView.getLayoutManager();
      return paramRecyclerView.getOrientation();
    }
    catch (ClassCastException paramRecyclerView)
    {
      throw new IllegalStateException("DividerDecoration can only be used with a LinearLayoutManager.", paramRecyclerView);
    }
  }
  
  public void drawHorizontal(Canvas paramCanvas, RecyclerView paramRecyclerView)
  {
    int j = paramRecyclerView.getPaddingTop();
    int k = paramRecyclerView.getHeight();
    int m = paramRecyclerView.getPaddingBottom();
    int n = paramRecyclerView.getPaddingLeft();
    int i1 = paramRecyclerView.getWidth();
    int i2 = paramRecyclerView.getPaddingRight();
    int i3 = paramRecyclerView.getChildCount();
    int i = 0;
    while (i < i3)
    {
      View localView = paramRecyclerView.getChildAt(i);
      RecyclerView.LayoutParams localLayoutParams = (RecyclerView.LayoutParams)localView.getLayoutParams();
      int i4 = Math.max(n, localView.getRight() + rightMargin);
      int i5 = Math.min(i1 - i2, mDivider.getIntrinsicHeight() + i4);
      mDivider.setBounds(i4, j, i5, k - m);
      mDivider.draw(paramCanvas);
      i += 1;
    }
  }
  
  public void drawVertical(Canvas paramCanvas, RecyclerView paramRecyclerView)
  {
    int j = paramRecyclerView.getPaddingLeft();
    int k = paramRecyclerView.getWidth();
    int m = paramRecyclerView.getPaddingRight();
    int n = paramRecyclerView.getPaddingTop();
    int i1 = paramRecyclerView.getHeight();
    int i2 = paramRecyclerView.getPaddingBottom();
    int i3 = paramRecyclerView.getChildCount();
    int i = 0;
    while (i < i3)
    {
      View localView = paramRecyclerView.getChildAt(i);
      RecyclerView.LayoutParams localLayoutParams = (RecyclerView.LayoutParams)localView.getLayoutParams();
      int i4 = Math.max(n, localView.getBottom() + bottomMargin);
      int i5 = Math.min(i1 - i2, mDivider.getIntrinsicHeight() + i4);
      mDivider.setBounds(j, i4, k - m, i5);
      mDivider.draw(paramCanvas);
      i += 1;
    }
  }
  
  public void getItemOffsets(Rect paramRect, View paramView, RecyclerView paramRecyclerView, RecyclerView.State paramState)
  {
    super.getItemOffsets(paramRect, paramView, paramRecyclerView, paramState);
    if (getOrientation(paramRecyclerView) == 1)
    {
      paramRect.set(0, 0, 0, mDivider.getIntrinsicHeight());
      return;
    }
    paramRect.set(0, 0, mDivider.getIntrinsicWidth(), 0);
  }
  
  public void onDraw(Canvas paramCanvas, RecyclerView paramRecyclerView, RecyclerView.State paramState)
  {
    super.onDraw(paramCanvas, paramRecyclerView, paramState);
    if (getOrientation(paramRecyclerView) == 1)
    {
      drawVertical(paramCanvas, paramRecyclerView);
      return;
    }
    drawHorizontal(paramCanvas, paramRecyclerView);
  }
}
