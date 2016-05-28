package android.support.v4.view;

import android.graphics.Paint;
import android.view.View;

class ViewCompatJellybeanMr1
{
  public static int getLayoutDirection(View paramView)
  {
    return paramView.getLayoutDirection();
  }
  
  public static int getPaddingEnd(View paramView)
  {
    return paramView.getPaddingEnd();
  }
  
  public static int getPaddingStart(View paramView)
  {
    return paramView.getPaddingStart();
  }
  
  public static int getWindowSystemUiVisibility(View paramView)
  {
    return paramView.getWindowSystemUiVisibility();
  }
  
  public static boolean isPaddingRelative(View paramView)
  {
    return paramView.isPaddingRelative();
  }
  
  public static void setLayerPaint(View paramView, Paint paramPaint)
  {
    paramView.setLayerPaint(paramPaint);
  }
  
  public static void setPaddingRelative(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    paramView.setPaddingRelative(paramInt1, paramInt2, paramInt3, paramInt4);
  }
}
