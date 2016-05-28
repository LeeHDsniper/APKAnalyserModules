package android.support.v4.view;

import android.graphics.Rect;
import android.os.Build.VERSION;
import android.view.Gravity;

public class GravityCompat
{
  static final GravityCompatImpl IMPL = new GravityCompatImplBase();
  
  static
  {
    if (Build.VERSION.SDK_INT >= 17)
    {
      IMPL = new GravityCompatImplJellybeanMr1();
      return;
    }
  }
  
  public static void apply(int paramInt1, int paramInt2, int paramInt3, Rect paramRect1, Rect paramRect2, int paramInt4)
  {
    IMPL.apply(paramInt1, paramInt2, paramInt3, paramRect1, paramRect2, paramInt4);
  }
  
  public static int getAbsoluteGravity(int paramInt1, int paramInt2)
  {
    return IMPL.getAbsoluteGravity(paramInt1, paramInt2);
  }
  
  static abstract interface GravityCompatImpl
  {
    public abstract void apply(int paramInt1, int paramInt2, int paramInt3, Rect paramRect1, Rect paramRect2, int paramInt4);
    
    public abstract int getAbsoluteGravity(int paramInt1, int paramInt2);
  }
  
  static class GravityCompatImplBase
    implements GravityCompat.GravityCompatImpl
  {
    GravityCompatImplBase() {}
    
    public void apply(int paramInt1, int paramInt2, int paramInt3, Rect paramRect1, Rect paramRect2, int paramInt4)
    {
      Gravity.apply(paramInt1, paramInt2, paramInt3, paramRect1, paramRect2);
    }
    
    public int getAbsoluteGravity(int paramInt1, int paramInt2)
    {
      return 0xFF7FFFFF & paramInt1;
    }
  }
  
  static class GravityCompatImplJellybeanMr1
    implements GravityCompat.GravityCompatImpl
  {
    GravityCompatImplJellybeanMr1() {}
    
    public void apply(int paramInt1, int paramInt2, int paramInt3, Rect paramRect1, Rect paramRect2, int paramInt4)
    {
      GravityCompatJellybeanMr1.apply(paramInt1, paramInt2, paramInt3, paramRect1, paramRect2, paramInt4);
    }
    
    public int getAbsoluteGravity(int paramInt1, int paramInt2)
    {
      return GravityCompatJellybeanMr1.getAbsoluteGravity(paramInt1, paramInt2);
    }
  }
}
