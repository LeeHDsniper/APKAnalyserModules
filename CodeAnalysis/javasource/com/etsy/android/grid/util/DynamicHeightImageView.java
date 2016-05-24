package com.etsy.android.grid.util;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.Path.Direction;
import android.graphics.RectF;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import android.widget.ImageView;

public class DynamicHeightImageView
  extends ImageView
{
  public static float radius = 2.0F;
  Path clipPath = new Path();
  private double mHeightRatio;
  RectF rect = new RectF(0.0F, 0.0F, getWidth(), getHeight());
  
  @TargetApi(11)
  public DynamicHeightImageView(Context paramContext)
  {
    super(paramContext);
    if (Build.VERSION.SDK_INT < 18) {
      setLayerType(1, null);
    }
  }
  
  @TargetApi(11)
  public DynamicHeightImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    if (Build.VERSION.SDK_INT < 18) {
      setLayerType(1, null);
    }
  }
  
  public double getHeightRatio()
  {
    return mHeightRatio;
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    rect.left = 0.0F;
    rect.top = 0.0F;
    rect.right = getWidth();
    rect.bottom = getHeight();
    clipPath.addRoundRect(rect, radius, radius, Path.Direction.CW);
    paramCanvas.clipPath(clipPath);
    super.onDraw(paramCanvas);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (mHeightRatio > 0.0D)
    {
      paramInt1 = View.MeasureSpec.getSize(paramInt1);
      setMeasuredDimension(paramInt1, (int)(paramInt1 * mHeightRatio));
      return;
    }
    super.onMeasure(paramInt1, paramInt2);
  }
  
  public void setHeightRatio(double paramDouble)
  {
    if (paramDouble != mHeightRatio)
    {
      mHeightRatio = paramDouble;
      requestLayout();
    }
  }
}
