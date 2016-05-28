package android.support.v4.view;

import android.graphics.Rect;
import android.view.Gravity;

class GravityCompatJellybeanMr1
{
  public static void apply(int paramInt1, int paramInt2, int paramInt3, Rect paramRect1, Rect paramRect2, int paramInt4)
  {
    Gravity.apply(paramInt1, paramInt2, paramInt3, paramRect1, paramRect2, paramInt4);
  }
  
  public static int getAbsoluteGravity(int paramInt1, int paramInt2)
  {
    return Gravity.getAbsoluteGravity(paramInt1, paramInt2);
  }
}
