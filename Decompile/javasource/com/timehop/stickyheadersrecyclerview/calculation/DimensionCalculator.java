package com.timehop.stickyheadersrecyclerview.calculation;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup.MarginLayoutParams;

public class DimensionCalculator
{
  public DimensionCalculator() {}
  
  private Rect getMarginRect(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
  {
    return new Rect(leftMargin, topMargin, rightMargin, bottomMargin);
  }
  
  public Rect getMargins(View paramView)
  {
    paramView = paramView.getLayoutParams();
    if ((paramView instanceof ViewGroup.MarginLayoutParams)) {
      return getMarginRect((ViewGroup.MarginLayoutParams)paramView);
    }
    return new Rect();
  }
}
