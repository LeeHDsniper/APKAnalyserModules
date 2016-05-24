package com.behance.sdk.edmodo.cropper.util;

import android.graphics.Rect;

public class AspectRatioUtil
{
  public static float calculateAspectRatio(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return (paramFloat3 - paramFloat1) / (paramFloat4 - paramFloat2);
  }
  
  public static float calculateAspectRatio(Rect paramRect)
  {
    return paramRect.width() / paramRect.height();
  }
  
  public static float calculateBottom(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return (paramFloat3 - paramFloat1) / paramFloat4 + paramFloat2;
  }
  
  public static float calculateHeight(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    return (paramFloat2 - paramFloat1) / paramFloat3;
  }
  
  public static float calculateLeft(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return paramFloat2 - paramFloat4 * (paramFloat3 - paramFloat1);
  }
  
  public static float calculateRight(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return paramFloat4 * (paramFloat3 - paramFloat2) + paramFloat1;
  }
  
  public static float calculateTop(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    return paramFloat3 - (paramFloat2 - paramFloat1) / paramFloat4;
  }
  
  public static float calculateWidth(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    return paramFloat3 * (paramFloat2 - paramFloat1);
  }
}
