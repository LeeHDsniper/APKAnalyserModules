package com.behance.sdk.edmodo.cropper.util;

import android.content.Context;
import android.content.res.Resources;
import android.util.Pair;
import android.util.TypedValue;
import com.behance.sdk.edmodo.cropper.cropwindow.CropOverlayView;
import com.behance.sdk.edmodo.cropper.cropwindow.handle.Handle;

public class HandleUtil
{
  private static boolean focusCenter()
  {
    return !CropOverlayView.showGuidelines();
  }
  
  public static Pair<Float, Float> getOffset(Handle paramHandle, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    if (paramHandle == null) {
      return null;
    }
    float f1 = 0.0F;
    float f2 = 0.0F;
    switch (1.$SwitchMap$com$behance$sdk$edmodo$cropper$cropwindow$handle$Handle[paramHandle.ordinal()])
    {
    default: 
      paramFloat2 = f2;
      paramFloat1 = f1;
    }
    for (;;)
    {
      return new Pair(Float.valueOf(paramFloat1), Float.valueOf(paramFloat2));
      paramFloat1 = paramFloat3 - paramFloat1;
      paramFloat2 = paramFloat4 - paramFloat2;
      continue;
      paramFloat1 = paramFloat5 - paramFloat1;
      paramFloat2 = paramFloat4 - paramFloat2;
      continue;
      paramFloat1 = paramFloat3 - paramFloat1;
      paramFloat2 = paramFloat6 - paramFloat2;
      continue;
      paramFloat1 = paramFloat5 - paramFloat1;
      paramFloat2 = paramFloat6 - paramFloat2;
      continue;
      paramFloat1 = paramFloat3 - paramFloat1;
      paramFloat2 = 0.0F;
      continue;
      paramFloat1 = 0.0F;
      paramFloat2 = paramFloat4 - paramFloat2;
      continue;
      paramFloat1 = paramFloat5 - paramFloat1;
      paramFloat2 = 0.0F;
      continue;
      paramFloat1 = 0.0F;
      paramFloat2 = paramFloat6 - paramFloat2;
      continue;
      paramFloat3 = (paramFloat5 + paramFloat3) / 2.0F;
      paramFloat4 = (paramFloat4 + paramFloat6) / 2.0F;
      paramFloat1 = paramFloat3 - paramFloat1;
      paramFloat2 = paramFloat4 - paramFloat2;
    }
  }
  
  public static Handle getPressedHandle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7)
  {
    Object localObject2 = null;
    Object localObject1;
    if (isInCornerTargetZone(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat7)) {
      localObject1 = Handle.TOP_LEFT;
    }
    do
    {
      do
      {
        return localObject1;
        if (isInCornerTargetZone(paramFloat1, paramFloat2, paramFloat5, paramFloat4, paramFloat7)) {
          return Handle.TOP_RIGHT;
        }
        if (isInCornerTargetZone(paramFloat1, paramFloat2, paramFloat3, paramFloat6, paramFloat7)) {
          return Handle.BOTTOM_LEFT;
        }
        if (isInCornerTargetZone(paramFloat1, paramFloat2, paramFloat5, paramFloat6, paramFloat7)) {
          return Handle.BOTTOM_RIGHT;
        }
        if ((isInCenterTargetZone(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6)) && (focusCenter())) {
          return Handle.CENTER;
        }
        if (isInHorizontalTargetZone(paramFloat1, paramFloat2, paramFloat3, paramFloat5, paramFloat4, paramFloat7)) {
          return Handle.TOP;
        }
        if (isInHorizontalTargetZone(paramFloat1, paramFloat2, paramFloat3, paramFloat5, paramFloat6, paramFloat7)) {
          return Handle.BOTTOM;
        }
        if (isInVerticalTargetZone(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat6, paramFloat7)) {
          return Handle.LEFT;
        }
        if (isInVerticalTargetZone(paramFloat1, paramFloat2, paramFloat5, paramFloat4, paramFloat6, paramFloat7)) {
          return Handle.RIGHT;
        }
        localObject1 = localObject2;
      } while (!isInCenterTargetZone(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6));
      localObject1 = localObject2;
    } while (focusCenter());
    return Handle.CENTER;
  }
  
  public static float getTargetRadius(Context paramContext)
  {
    return TypedValue.applyDimension(1, 24.0F, paramContext.getResources().getDisplayMetrics());
  }
  
  private static boolean isInCenterTargetZone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    return (paramFloat1 > paramFloat3) && (paramFloat1 < paramFloat5) && (paramFloat2 > paramFloat4) && (paramFloat2 < paramFloat6);
  }
  
  private static boolean isInCornerTargetZone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5)
  {
    return (Math.abs(paramFloat1 - paramFloat3) <= paramFloat5) && (Math.abs(paramFloat2 - paramFloat4) <= paramFloat5);
  }
  
  private static boolean isInHorizontalTargetZone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    return (paramFloat1 > paramFloat3) && (paramFloat1 < paramFloat4) && (Math.abs(paramFloat2 - paramFloat5) <= paramFloat6);
  }
  
  private static boolean isInVerticalTargetZone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6)
  {
    return (Math.abs(paramFloat1 - paramFloat3) <= paramFloat6) && (paramFloat2 > paramFloat4) && (paramFloat2 < paramFloat5);
  }
}
