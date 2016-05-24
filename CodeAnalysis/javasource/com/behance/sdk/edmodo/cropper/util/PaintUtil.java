package com.behance.sdk.edmodo.cropper.util;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.util.TypedValue;

public class PaintUtil
{
  public static float getCornerThickness()
  {
    return 5.0F;
  }
  
  public static float getLineThickness()
  {
    return 3.0F;
  }
  
  public static Paint newBackgroundPaint(Context paramContext)
  {
    paramContext = new Paint();
    paramContext.setColor(Color.parseColor("#97000000"));
    return paramContext;
  }
  
  public static Paint newBorderPaint(Context paramContext)
  {
    float f = TypedValue.applyDimension(1, 3.0F, paramContext.getResources().getDisplayMetrics());
    paramContext = new Paint();
    paramContext.setColor(Color.parseColor("#AAFFFFFF"));
    paramContext.setStrokeWidth(f);
    paramContext.setStyle(Paint.Style.STROKE);
    return paramContext;
  }
  
  public static Paint newCornerPaint(Context paramContext)
  {
    float f = TypedValue.applyDimension(1, 5.0F, paramContext.getResources().getDisplayMetrics());
    paramContext = new Paint();
    paramContext.setColor(-1);
    paramContext.setStrokeWidth(f);
    paramContext.setStyle(Paint.Style.STROKE);
    return paramContext;
  }
  
  public static Paint newGuidelinePaint()
  {
    Paint localPaint = new Paint();
    localPaint.setColor(Color.parseColor("#AAFFFFFF"));
    localPaint.setStrokeWidth(1.0F);
    return localPaint;
  }
}
