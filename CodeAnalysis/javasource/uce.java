import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.ViewConfiguration;
import android.view.animation.AnimationUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.AnimateUtils;
import com.tencent.widget.OverScroller;

public class uce
{
  private static final float[] jdField_a_of_type_ArrayOfFloat;
  private static final float[] jdField_b_of_type_ArrayOfFloat;
  private static final float jdField_d_of_type_Float = 2000.0F;
  private static float jdField_e_of_type_Float = 0.0F;
  private static float jdField_f_of_type_Float = 0.0F;
  private static final float jdField_g_of_type_Float = 0.35F;
  private static final float jdField_h_of_type_Float = 0.5F;
  private static final float jdField_i_of_type_Float = 1.0F;
  private static final float jdField_j_of_type_Float = 0.175F;
  private static final int jdField_j_of_type_Int = 100;
  private static final float jdField_k_of_type_Float = 0.35000002F;
  private static final int jdField_k_of_type_Int = 0;
  private static final int jdField_l_of_type_Int = 1;
  private static final int m = 3;
  private static final int n = 4;
  private double jdField_a_of_type_Double;
  private float jdField_a_of_type_Float;
  private int jdField_a_of_type_Int;
  private long jdField_a_of_type_Long;
  private boolean jdField_a_of_type_Boolean = true;
  private float jdField_b_of_type_Float;
  private int jdField_b_of_type_Int;
  private long jdField_b_of_type_Long;
  private float jdField_c_of_type_Float = ViewConfiguration.getScrollFriction();
  private int jdField_c_of_type_Int;
  private int jdField_d_of_type_Int;
  private int jdField_e_of_type_Int;
  private int jdField_f_of_type_Int;
  private int jdField_g_of_type_Int;
  private int jdField_h_of_type_Int;
  private int jdField_i_of_type_Int;
  private float jdField_l_of_type_Float;
  
  static
  {
    float f2 = 0.0F;
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_f_of_type_Float = (float)(Math.log(0.78D) / Math.log(0.9D));
    jdField_a_of_type_ArrayOfFloat = new float[101];
    jdField_b_of_type_ArrayOfFloat = new float[101];
    int i1 = 0;
    float f1 = 0.0F;
    if (i1 < 100)
    {
      float f5 = i1 / 100.0F;
      float f3 = 1.0F;
      label60:
      float f4 = (f3 - f1) / 2.0F + f1;
      float f6 = 3.0F * f4 * (1.0F - f4);
      float f7 = ((1.0F - f4) * 0.175F + 0.35000002F * f4) * f6 + f4 * f4 * f4;
      if (Math.abs(f7 - f5) < 1.0E-5D)
      {
        jdField_a_of_type_ArrayOfFloat[i1] = (f4 * (f4 * f4) + f6 * ((1.0F - f4) * 0.5F + f4));
        f3 = 1.0F;
      }
      for (;;)
      {
        f4 = (f3 - f2) / 2.0F + f2;
        f6 = 3.0F * f4 * (1.0F - f4);
        f7 = ((1.0F - f4) * 0.5F + f4) * f6 + f4 * f4 * f4;
        if (Math.abs(f7 - f5) < 1.0E-5D)
        {
          jdField_b_of_type_ArrayOfFloat[i1] = (f4 * (f4 * f4) + ((1.0F - f4) * 0.175F + 0.35000002F * f4) * f6);
          i1 += 1;
          break;
          if (f7 > f5)
          {
            f3 = f4;
            break label60;
          }
          f1 = f4;
          break label60;
        }
        if (f7 > f5) {
          f3 = f4;
        } else {
          f2 = f4;
        }
      }
    }
    float[] arrayOfFloat = jdField_a_of_type_ArrayOfFloat;
    jdField_b_of_type_ArrayOfFloat[100] = 1.0F;
    arrayOfFloat[100] = 1.0F;
  }
  
  public uce()
  {
    i = 0;
  }
  
  private double a(int paramInt)
  {
    return Math.log(0.35F * Math.abs(paramInt) / (jdField_c_of_type_Float * jdField_e_of_type_Float));
  }
  
  private int a(int paramInt)
  {
    return (int)(Math.exp(a(paramInt) / (jdField_f_of_type_Float - 1.0D)) * 1000.0D);
  }
  
  public static void a(Context paramContext)
  {
    jdField_e_of_type_Float = getResourcesgetDisplayMetricsdensity * 160.0F * 386.0878F * 0.84F;
  }
  
  private double b(int paramInt)
  {
    double d1 = a(paramInt);
    double d2 = jdField_f_of_type_Float;
    double d3 = jdField_c_of_type_Float * jdField_e_of_type_Float;
    return Math.exp(d1 * (jdField_f_of_type_Float / (d2 - 1.0D))) * d3;
  }
  
  private void b()
  {
    long l1 = jdField_a_of_type_Long + jdField_e_of_type_Int;
    int i1 = (int)(jdField_e_of_type_Int / jdField_f_of_type_Int * 100.0F);
    float f1 = 0.0F;
    if (i1 < 100)
    {
      f1 = i1 / 100.0F;
      float f2 = (i1 + 1) / 100.0F;
      float f3 = jdField_a_of_type_ArrayOfFloat[i1];
      f1 = (jdField_a_of_type_ArrayOfFloat[(i1 + 1)] - f3) / (f2 - f1);
    }
    jdField_a_of_type_Float = (f1 * g / jdField_f_of_type_Int * 1000.0F);
    jdField_b_of_type_Float = ((float)((jdField_a_of_type_Float - jdField_a_of_type_Double) / (l1 - jdField_b_of_type_Long) * 1000.0D));
    a(jdField_c_of_type_Int, h, (int)jdField_a_of_type_Float, OverScroller.jdField_a_of_type_Int);
    jdField_a_of_type_Long = l1;
    b();
  }
  
  private void c(int paramInt1, int paramInt2, int paramInt3)
  {
    float f1 = Math.abs((paramInt3 - paramInt1) / (paramInt2 - paramInt1));
    paramInt1 = (int)(100.0F * f1);
    if (paramInt1 < 100)
    {
      float f2 = paramInt1 / 100.0F;
      float f3 = (paramInt1 + 1) / 100.0F;
      float f4 = jdField_b_of_type_ArrayOfFloat[paramInt1];
      float f5 = jdField_b_of_type_ArrayOfFloat[(paramInt1 + 1)];
      jdField_e_of_type_Int = ((int)(((f1 - f2) / (f3 - f2) * (f5 - f4) + f4) * jdField_e_of_type_Int));
    }
  }
  
  private void d(int paramInt1, int paramInt2, int paramInt3)
  {
    jdField_a_of_type_Boolean = false;
    i = 1;
    jdField_a_of_type_Int = paramInt1;
    jdField_c_of_type_Int = paramInt2;
    h = (paramInt2 - paramInt1);
    jdField_e_of_type_Int = OverScroller.jdField_a_of_type_Int;
  }
  
  public void a()
  {
    jdField_b_of_type_Int = jdField_c_of_type_Int;
    jdField_a_of_type_Boolean = true;
  }
  
  public void a(float paramFloat)
  {
    jdField_c_of_type_Float = paramFloat;
  }
  
  public void a(int paramInt)
  {
    jdField_c_of_type_Int = paramInt;
    jdField_a_of_type_Boolean = false;
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3)
  {
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Int = paramInt1;
    jdField_c_of_type_Int = (paramInt1 + paramInt2);
    jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
    jdField_e_of_type_Int = paramInt3;
    jdField_b_of_type_Float = 0.0F;
    d = 0;
    i = 4;
  }
  
  void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    float f2 = 0.09606F * paramInt2 / (1.0000001E-5F * paramInt4);
    if (paramInt3 > 0) {}
    for (float f1 = 10.0F;; f1 = -10.0F)
    {
      if (Math.abs(paramInt3) < f2) {
        f1 = paramInt3 * 10.0F / f2;
      }
      jdField_a_of_type_Int = paramInt1;
      jdField_c_of_type_Int = paramInt1;
      d = paramInt3;
      h = paramInt2;
      jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
      jdField_e_of_type_Int = paramInt4;
      l = f1;
      jdField_b_of_type_Int = jdField_a_of_type_Int;
      i = 3;
      return;
    }
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    h = paramInt5;
    jdField_a_of_type_Boolean = false;
    d = paramInt2;
    jdField_a_of_type_Float = paramInt2;
    jdField_f_of_type_Int = 0;
    jdField_e_of_type_Int = 0;
    jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
    jdField_a_of_type_Int = paramInt1;
    jdField_b_of_type_Int = paramInt1;
    if ((paramInt1 > paramInt4) || (paramInt1 < paramInt3))
    {
      if (paramInt1 > paramInt4) {}
      for (;;)
      {
        d(paramInt1, paramInt4, paramInt2);
        return;
        paramInt4 = paramInt3;
      }
    }
    i = 0;
    double d1 = 0.0D;
    if (paramInt2 != 0)
    {
      paramInt5 = a(paramInt2);
      jdField_f_of_type_Int = paramInt5;
      jdField_e_of_type_Int = paramInt5;
      jdField_b_of_type_Float = ((float)(a(paramInt2) * 1000.0D));
      d1 = b(paramInt2);
    }
    g = ((int)(d1 * Math.signum(paramInt2)));
    jdField_c_of_type_Int = (g + paramInt1);
    if (jdField_c_of_type_Int < paramInt3)
    {
      c(jdField_a_of_type_Int, jdField_c_of_type_Int, paramInt3);
      jdField_c_of_type_Int = paramInt3;
    }
    if (jdField_c_of_type_Int > paramInt4)
    {
      c(jdField_a_of_type_Int, jdField_c_of_type_Int, paramInt4);
      jdField_c_of_type_Int = paramInt4;
    }
    jdField_a_of_type_Double = paramInt2;
    jdField_b_of_type_Long = jdField_a_of_type_Long;
  }
  
  public boolean a()
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    switch (i)
    {
    }
    for (;;)
    {
      b();
      bool1 = true;
      do
      {
        return bool1;
        bool1 = bool2;
      } while (jdField_e_of_type_Int >= jdField_f_of_type_Int);
      b();
    }
  }
  
  public boolean a(int paramInt1, int paramInt2, int paramInt3)
  {
    jdField_a_of_type_Boolean = true;
    jdField_c_of_type_Int = paramInt1;
    jdField_a_of_type_Int = paramInt1;
    d = 0;
    jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
    jdField_e_of_type_Int = 0;
    if (paramInt1 < paramInt2) {
      d(paramInt1, paramInt2, 0);
    }
    while (!jdField_a_of_type_Boolean)
    {
      return true;
      if (paramInt1 > paramInt3) {
        d(paramInt1, paramInt3, 0);
      }
    }
    return false;
  }
  
  public void b(float paramFloat)
  {
    jdField_b_of_type_Int = (jdField_a_of_type_Int + Math.round((jdField_c_of_type_Int - jdField_a_of_type_Int) * paramFloat));
  }
  
  public void b(int paramInt)
  {
    jdField_e_of_type_Int = ((int)(AnimationUtils.currentAnimationTimeMillis() - jdField_a_of_type_Long) + paramInt);
    jdField_a_of_type_Boolean = false;
  }
  
  public void b(int paramInt1, int paramInt2, int paramInt3)
  {
    if (i == 0) {
      if (paramInt1 == paramInt2) {
        a(paramInt2, paramInt3, d, OverScroller.jdField_a_of_type_Int);
      }
    }
    while (i != 4)
    {
      return;
      c(jdField_a_of_type_Int, jdField_c_of_type_Int, jdField_b_of_type_Int - (paramInt1 - paramInt2));
      h = paramInt3;
      jdField_c_of_type_Int = paramInt2;
      b();
      return;
    }
    jdField_b_of_type_Int = 0;
    jdField_c_of_type_Int = 0;
    jdField_a_of_type_Boolean = true;
  }
  
  public boolean b()
  {
    float f2 = 1.0F;
    long l1 = AnimationUtils.currentAnimationTimeMillis();
    long l2 = l1 - jdField_a_of_type_Long;
    if (l2 > jdField_e_of_type_Int) {
      return false;
    }
    double d1;
    switch (i)
    {
    case 2: 
    default: 
      d1 = 0.0D;
    }
    for (;;)
    {
      int i1 = jdField_a_of_type_Int;
      jdField_b_of_type_Int = ((int)Math.round(d1) + i1);
      return true;
      float f3 = (float)l2 / jdField_f_of_type_Int;
      i1 = (int)(100.0F * f3);
      float f1 = 0.0F;
      if (i1 < 100)
      {
        f2 = i1 / 100.0F;
        f1 = (i1 + 1) / 100.0F;
        float f4 = jdField_a_of_type_ArrayOfFloat[i1];
        f1 = (jdField_a_of_type_ArrayOfFloat[(i1 + 1)] - f4) / (f1 - f2);
        f2 = (f3 - f2) * f1 + f4;
      }
      d1 = f2 * g;
      jdField_a_of_type_Float = (f1 * g / jdField_f_of_type_Int * 1000.0F);
      jdField_b_of_type_Float = ((float)((jdField_a_of_type_Float - jdField_a_of_type_Double) / (l1 - jdField_b_of_type_Long) * 1000.0D));
      continue;
      d1 = AnimateUtils.a((float)l2 / jdField_e_of_type_Int) * h;
      continue;
      f1 = (float)l2 / jdField_e_of_type_Int - 1.0F;
      f2 = h;
      d1 = (f1 * l + l) * (f2 * f1 * f1 * f1 * f1);
    }
  }
}
