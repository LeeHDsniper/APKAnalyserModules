package com.tencent.widget;

import android.content.Context;
import android.util.FloatMath;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.AnimateUtils;
import uce;

public class OverScroller
{
  public static int a = 0;
  private static final int c = 250;
  private static final int d = 0;
  private static final int e = 1;
  private final Interpolator jdField_a_of_type_AndroidViewAnimationInterpolator;
  private final uce jdField_a_of_type_Uce;
  private final boolean jdField_a_of_type_Boolean;
  private int jdField_b_of_type_Int;
  private final uce jdField_b_of_type_Uce;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 400;
  }
  
  public OverScroller(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public OverScroller(Context paramContext, Interpolator paramInterpolator)
  {
    this(paramContext, paramInterpolator, true);
  }
  
  public OverScroller(Context paramContext, Interpolator paramInterpolator, float paramFloat1, float paramFloat2)
  {
    this(paramContext, paramInterpolator, true);
  }
  
  public OverScroller(Context paramContext, Interpolator paramInterpolator, float paramFloat1, float paramFloat2, boolean paramBoolean)
  {
    this(paramContext, paramInterpolator, paramBoolean);
  }
  
  public OverScroller(Context paramContext, Interpolator paramInterpolator, boolean paramBoolean)
  {
    jdField_a_of_type_AndroidViewAnimationInterpolator = paramInterpolator;
    jdField_a_of_type_Boolean = paramBoolean;
    jdField_a_of_type_Uce = new uce();
    jdField_b_of_type_Uce = new uce();
    uce.a(paramContext);
  }
  
  public float a()
  {
    return FloatMath.sqrt(uce.a(jdField_a_of_type_Uce) * uce.a(jdField_a_of_type_Uce) + uce.a(jdField_b_of_type_Uce) * uce.a(jdField_b_of_type_Uce));
  }
  
  public final int a()
  {
    return uce.a(jdField_a_of_type_Uce);
  }
  
  public void a()
  {
    jdField_a_of_type_Uce.a();
    jdField_b_of_type_Uce.a();
  }
  
  public final void a(float paramFloat)
  {
    jdField_a_of_type_Uce.a(paramFloat);
    jdField_b_of_type_Uce.a(paramFloat);
  }
  
  @Deprecated
  public void a(int paramInt)
  {
    jdField_a_of_type_Uce.b(paramInt);
    jdField_b_of_type_Uce.b(paramInt);
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3)
  {
    jdField_a_of_type_Uce.b(paramInt1, paramInt2, paramInt3);
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    a(paramInt1, paramInt2, paramInt3, paramInt4, 250);
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    jdField_b_of_type_Int = 0;
    jdField_a_of_type_Uce.a(paramInt1, paramInt3, paramInt5);
    jdField_b_of_type_Uce.a(paramInt2, paramInt4, paramInt5);
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8)
  {
    a(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, 0, 0);
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10)
  {
    if ((jdField_a_of_type_Boolean) && (!a()))
    {
      float f1 = uce.a(jdField_a_of_type_Uce);
      float f2 = uce.a(jdField_b_of_type_Uce);
      if ((Math.signum(paramInt3) == Math.signum(f1)) && (Math.signum(paramInt4) == Math.signum(f2)))
      {
        paramInt3 = (int)(f1 + paramInt3);
        paramInt4 = (int)(paramInt4 + f2);
      }
    }
    for (;;)
    {
      jdField_b_of_type_Int = 1;
      jdField_a_of_type_Uce.a(paramInt1, paramInt3, paramInt5, paramInt6, paramInt9);
      jdField_b_of_type_Uce.a(paramInt2, paramInt4, paramInt7, paramInt8, paramInt10);
      return;
    }
  }
  
  public void a(long paramLong, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10)
  {
    a(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10);
    uce.a(jdField_a_of_type_Uce, paramLong);
    uce.a(jdField_b_of_type_Uce, paramLong);
  }
  
  public final void a(boolean paramBoolean)
  {
    uce.a(jdField_a_of_type_Uce, uce.a(jdField_b_of_type_Uce, paramBoolean));
  }
  
  public final boolean a()
  {
    return (uce.a(jdField_a_of_type_Uce)) && (uce.a(jdField_b_of_type_Uce));
  }
  
  public boolean a(float paramFloat1, float paramFloat2)
  {
    int i = uce.c(jdField_a_of_type_Uce);
    int j = uce.b(jdField_a_of_type_Uce);
    int k = uce.c(jdField_b_of_type_Uce);
    int m = uce.b(jdField_b_of_type_Uce);
    return (!a()) && (Math.signum(paramFloat1) == Math.signum(i - j)) && (Math.signum(paramFloat2) == Math.signum(k - m));
  }
  
  public boolean a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
  {
    jdField_b_of_type_Int = 1;
    boolean bool1 = jdField_a_of_type_Uce.a(paramInt1, paramInt3, paramInt4);
    boolean bool2 = jdField_b_of_type_Uce.a(paramInt2, paramInt5, paramInt6);
    return (bool1) || (bool2);
  }
  
  public final int b()
  {
    return uce.a(jdField_b_of_type_Uce);
  }
  
  @Deprecated
  public void b(int paramInt)
  {
    jdField_a_of_type_Uce.a(paramInt);
  }
  
  public void b(int paramInt1, int paramInt2, int paramInt3)
  {
    jdField_b_of_type_Uce.b(paramInt1, paramInt2, paramInt3);
  }
  
  public boolean b()
  {
    if (a()) {
      return false;
    }
    switch (jdField_b_of_type_Int)
    {
    }
    for (;;)
    {
      return true;
      long l = AnimationUtils.currentAnimationTimeMillis() - uce.a(jdField_a_of_type_Uce);
      int i = uce.d(jdField_a_of_type_Uce);
      if (l < i)
      {
        float f = (float)l / i;
        if (jdField_a_of_type_AndroidViewAnimationInterpolator == null) {}
        for (f = AnimateUtils.a(f);; f = jdField_a_of_type_AndroidViewAnimationInterpolator.getInterpolation(f))
        {
          if (!uce.a(jdField_a_of_type_Uce)) {
            jdField_a_of_type_Uce.b(f);
          }
          if (uce.a(jdField_b_of_type_Uce)) {
            break;
          }
          jdField_b_of_type_Uce.b(f);
          break;
        }
      }
      a();
      continue;
      if ((!uce.a(jdField_a_of_type_Uce)) && (!jdField_a_of_type_Uce.b()) && (!jdField_a_of_type_Uce.a())) {
        jdField_a_of_type_Uce.a();
      }
      if ((!uce.a(jdField_b_of_type_Uce)) && (!jdField_b_of_type_Uce.b()) && (!jdField_b_of_type_Uce.a())) {
        jdField_b_of_type_Uce.a();
      }
    }
  }
  
  public final int c()
  {
    return uce.b(jdField_a_of_type_Uce);
  }
  
  @Deprecated
  public void c(int paramInt)
  {
    jdField_b_of_type_Uce.a(paramInt);
  }
  
  public boolean c()
  {
    return ((!uce.a(jdField_a_of_type_Uce)) && (uce.e(jdField_a_of_type_Uce) != 0)) || ((!uce.a(jdField_b_of_type_Uce)) && (uce.e(jdField_b_of_type_Uce) != 0));
  }
  
  public final int d()
  {
    return uce.b(jdField_b_of_type_Uce);
  }
  
  public final int e()
  {
    return uce.c(jdField_a_of_type_Uce);
  }
  
  public final int f()
  {
    return uce.c(jdField_b_of_type_Uce);
  }
  
  @Deprecated
  public final int g()
  {
    return Math.max(uce.d(jdField_a_of_type_Uce), uce.d(jdField_b_of_type_Uce));
  }
  
  public int h()
  {
    return (int)(AnimationUtils.currentAnimationTimeMillis() - Math.min(uce.a(jdField_a_of_type_Uce), uce.a(jdField_b_of_type_Uce)));
  }
}
