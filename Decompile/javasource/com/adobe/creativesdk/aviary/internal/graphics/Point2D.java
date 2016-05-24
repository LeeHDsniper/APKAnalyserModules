package com.adobe.creativesdk.aviary.internal.graphics;

import android.graphics.PointF;
import android.graphics.RectF;

public final class Point2D
{
  public static double angle360(double paramDouble)
  {
    if (paramDouble < 0.0D) {
      return paramDouble % -360.0D + 360.0D;
    }
    return paramDouble % 360.0D;
  }
  
  public static double angleBetweenPoints(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5)
  {
    if ((paramFloat1 == paramFloat3) && (paramFloat2 == paramFloat4)) {
      return 0.0D;
    }
    double d = Math.atan2(paramFloat1 - paramFloat3, paramFloat2 - paramFloat4);
    if (paramFloat5 > 0.0F) {
      return (float)Math.round(d / paramFloat5) * paramFloat5;
    }
    return angle360(degrees(d));
  }
  
  public static double angleBetweenPoints(PointF paramPointF1, PointF paramPointF2)
  {
    return angleBetweenPoints(paramPointF1, paramPointF2, 0.0F);
  }
  
  public static double angleBetweenPoints(PointF paramPointF1, PointF paramPointF2, float paramFloat)
  {
    return angleBetweenPoints(x, y, x, y, paramFloat);
  }
  
  public static double angleBetweenPoints(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2)
  {
    return angleBetweenPoints(paramArrayOfFloat1[0], paramArrayOfFloat1[1], paramArrayOfFloat2[0], paramArrayOfFloat2[1], 0.0F);
  }
  
  public static double degrees(double paramDouble)
  {
    return 57.29577951308232D * paramDouble;
  }
  
  public static double distance(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return Math.sqrt(Math.pow(paramFloat1 - paramFloat3, 2.0D) + Math.pow(paramFloat2 - paramFloat4, 2.0D));
  }
  
  public static double distance(PointF paramPointF1, PointF paramPointF2)
  {
    return distance(x, y, x, y);
  }
  
  public static double distance(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2)
  {
    return distance(paramArrayOfFloat1[0], paramArrayOfFloat1[1], paramArrayOfFloat2[0], paramArrayOfFloat2[1]);
  }
  
  public static void getLerp(PointF paramPointF1, PointF paramPointF2, float paramFloat, PointF paramPointF3)
  {
    paramPointF3.set(x + (x - x) * paramFloat, y + (y - y) * paramFloat);
  }
  
  public static void grow(RectF paramRectF, float paramFloat1, float paramFloat2)
  {
    left -= paramFloat1 / 2.0F;
    top -= paramFloat2 / 2.0F;
    right += paramFloat1 / 2.0F;
    bottom += paramFloat2 / 2.0F;
  }
  
  public static double hypotenuse(RectF paramRectF)
  {
    return Math.sqrt(Math.pow(right - left, 2.0D) + Math.pow(bottom - top, 2.0D));
  }
  
  public static PointF intersection(PointF[] paramArrayOfPointF1, PointF[] paramArrayOfPointF2)
  {
    float f1 = 0x;
    float f2 = 0y;
    float f3 = 1x;
    float f4 = 1y;
    float f5 = 0x;
    float f6 = 0y;
    float f7 = 1x;
    float f8 = 1y;
    return new PointF(((f1 * f4 - f2 * f3) * (f5 - f7) - (f1 - f3) * (f5 * f8 - f6 * f7)) / ((f1 - f3) * (f6 - f8) - (f2 - f4) * (f5 - f7)), ((f1 * f4 - f2 * f3) * (f6 - f8) - (f2 - f4) * (f5 * f8 - f6 * f7)) / ((f1 - f3) * (f6 - f8) - (f2 - f4) * (f5 - f7)));
  }
  
  public static double radians(double paramDouble)
  {
    return 0.017453292519943295D * paramDouble;
  }
  
  public static void rotate(PointF paramPointF, double paramDouble)
  {
    float f1 = x;
    float f2 = y;
    double d = Math.cos(paramDouble);
    paramDouble = Math.sin(paramDouble);
    x = ((float)(f1 * d - f2 * paramDouble));
    y = ((float)(f1 * paramDouble + f2 * d));
  }
  
  public static void rotate(PointF[] paramArrayOfPointF, double paramDouble)
  {
    int i = 0;
    while (i < paramArrayOfPointF.length)
    {
      rotate(paramArrayOfPointF[i], paramDouble);
      i += 1;
    }
  }
  
  public static void translate(PointF paramPointF, float paramFloat1, float paramFloat2)
  {
    x += paramFloat1;
    y += paramFloat2;
  }
  
  public static void translate(PointF[] paramArrayOfPointF, float paramFloat1, float paramFloat2)
  {
    int i = 0;
    while (i < paramArrayOfPointF.length)
    {
      translate(paramArrayOfPointF[i], paramFloat1, paramFloat2);
      i += 1;
    }
  }
}
