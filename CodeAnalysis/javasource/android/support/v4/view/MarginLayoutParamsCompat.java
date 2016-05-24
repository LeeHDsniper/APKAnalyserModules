package android.support.v4.view;

import android.os.Build.VERSION;
import android.view.ViewGroup.MarginLayoutParams;

public class MarginLayoutParamsCompat
{
  static final MarginLayoutParamsCompatImpl IMPL = new MarginLayoutParamsCompatImplBase();
  
  static
  {
    if (Build.VERSION.SDK_INT >= 17)
    {
      IMPL = new MarginLayoutParamsCompatImplJbMr1();
      return;
    }
  }
  
  public static int getMarginEnd(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
  {
    return IMPL.getMarginEnd(paramMarginLayoutParams);
  }
  
  public static int getMarginStart(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
  {
    return IMPL.getMarginStart(paramMarginLayoutParams);
  }
  
  static abstract interface MarginLayoutParamsCompatImpl
  {
    public abstract int getMarginEnd(ViewGroup.MarginLayoutParams paramMarginLayoutParams);
    
    public abstract int getMarginStart(ViewGroup.MarginLayoutParams paramMarginLayoutParams);
  }
  
  static class MarginLayoutParamsCompatImplBase
    implements MarginLayoutParamsCompat.MarginLayoutParamsCompatImpl
  {
    MarginLayoutParamsCompatImplBase() {}
    
    public int getMarginEnd(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      return rightMargin;
    }
    
    public int getMarginStart(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      return leftMargin;
    }
  }
  
  static class MarginLayoutParamsCompatImplJbMr1
    implements MarginLayoutParamsCompat.MarginLayoutParamsCompatImpl
  {
    MarginLayoutParamsCompatImplJbMr1() {}
    
    public int getMarginEnd(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      return MarginLayoutParamsCompatJellybeanMr1.getMarginEnd(paramMarginLayoutParams);
    }
    
    public int getMarginStart(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      return MarginLayoutParamsCompatJellybeanMr1.getMarginStart(paramMarginLayoutParams);
    }
  }
}
