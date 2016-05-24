package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;

public class AutofitRecyclerView
  extends RecyclerView
{
  private int columnWidth = -1;
  private GridLayoutManager manager;
  
  public AutofitRecyclerView(Context paramContext)
  {
    super(paramContext);
    init(paramContext, null);
  }
  
  public AutofitRecyclerView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext, paramAttributeSet);
  }
  
  public AutofitRecyclerView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext, paramAttributeSet);
  }
  
  private void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    if (paramAttributeSet != null)
    {
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, new int[] { 16843031 });
      columnWidth = paramContext.getDimensionPixelSize(0, -1);
      paramContext.recycle();
    }
    manager = new GridLayoutManager(getContext(), 1);
    setLayoutManager(manager);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    if (columnWidth > 0)
    {
      paramInt1 = Math.max(1, getMeasuredWidth() / columnWidth);
      manager.setSpanCount(paramInt1);
    }
  }
}
