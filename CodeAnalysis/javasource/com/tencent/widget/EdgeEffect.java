package com.tencent.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class EdgeEffect
{
  private static final float jdField_a_of_type_Float = 0.8F;
  private static final int jdField_a_of_type_Int = 1000;
  private static final String jdField_a_of_type_JavaLangString = "EdgeEffect";
  private static final float jdField_b_of_type_Float = 0.7F;
  private static final int jdField_b_of_type_Int = 167;
  private static final float jdField_c_of_type_Float = 0.5F;
  private static final int jdField_c_of_type_Int = 1000;
  private static final float jdField_d_of_type_Float = 0.5F;
  private static final int jdField_d_of_type_Int = 100;
  private static final float jdField_e_of_type_Float = 0.5F;
  private static final float jdField_f_of_type_Float = 4.0F;
  private static final float jdField_g_of_type_Float = 1.0F;
  private static final float jdField_h_of_type_Float = 0.6F;
  private static final float jdField_i_of_type_Float = 0.001F;
  private static final int jdField_i_of_type_Int = 0;
  private static final int jdField_j_of_type_Int = 1;
  private static final int jdField_k_of_type_Int = 2;
  private static final int jdField_l_of_type_Int = 3;
  private static final int jdField_m_of_type_Int = 4;
  private static final int jdField_n_of_type_Int = 7;
  private static final int jdField_o_of_type_Int = 7;
  private static final int jdField_p_of_type_Int = 8;
  private static final int jdField_q_of_type_Int = 16;
  private static final float w = 1.1F;
  private long jdField_a_of_type_Long;
  private final Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  private final Interpolator jdField_a_of_type_AndroidViewAnimationInterpolator;
  private final Drawable jdField_b_of_type_AndroidGraphicsDrawableDrawable;
  private int jdField_e_of_type_Int;
  private int jdField_f_of_type_Int;
  private final int jdField_g_of_type_Int;
  private final int jdField_h_of_type_Int;
  private float jdField_j_of_type_Float;
  private float jdField_k_of_type_Float;
  private float jdField_l_of_type_Float;
  private float jdField_m_of_type_Float;
  private float jdField_n_of_type_Float;
  private float jdField_o_of_type_Float;
  private float jdField_p_of_type_Float;
  private float jdField_q_of_type_Float;
  private float jdField_r_of_type_Float;
  private int jdField_r_of_type_Int;
  private float s;
  private float t;
  private float u;
  private float v;
  private float x;
  
  public EdgeEffect(Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    g = 300;
    jdField_r_of_type_Int = 0;
    paramContext = paramContext.getResources();
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = paramContext.getDrawable(2130838568);
    b = paramContext.getDrawable(2130838569);
    h = ((int)(getDisplayMetricsdensity * 300.0F + 0.5F));
    jdField_a_of_type_AndroidViewAnimationInterpolator = new DecelerateInterpolator();
  }
  
  private void c()
  {
    float f1 = Math.min((float)(AnimationUtils.currentAnimationTimeMillis() - jdField_a_of_type_Long) / v, 1.0F);
    float f2 = jdField_a_of_type_AndroidViewAnimationInterpolator.getInterpolation(f1);
    j = (n + (o - n) * f2);
    k = (p + (q - p) * f2);
    l = (jdField_r_of_type_Float + (s - jdField_r_of_type_Float) * f2);
    m = (t + (u - t) * f2);
    if (f1 >= 0.999F) {}
    switch (jdField_r_of_type_Int)
    {
    default: 
      return;
    case 2: 
      jdField_r_of_type_Int = 3;
      jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
      v = 1000.0F;
      n = j;
      p = k;
      jdField_r_of_type_Float = l;
      t = m;
      o = 0.0F;
      q = 0.0F;
      s = 0.0F;
      u = 0.0F;
      return;
    case 1: 
      jdField_r_of_type_Int = 4;
      jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
      v = 1000.0F;
      n = j;
      p = k;
      jdField_r_of_type_Float = l;
      t = m;
      o = 0.0F;
      q = 0.0F;
      s = 0.0F;
      u = 0.0F;
      return;
    case 4: 
      if (u != 0.0F) {}
      for (f1 = 1.0F / (u * u);; f1 = Float.MAX_VALUE)
      {
        float f3 = p;
        k = (f1 * (f2 * (q - p)) + f3);
        jdField_r_of_type_Int = 3;
        return;
      }
    }
    jdField_r_of_type_Int = 0;
  }
  
  public void a()
  {
    jdField_r_of_type_Int = 0;
  }
  
  public void a(float paramFloat)
  {
    long l1 = AnimationUtils.currentAnimationTimeMillis();
    if ((jdField_r_of_type_Int == 4) && ((float)(l1 - jdField_a_of_type_Long) < v)) {
      return;
    }
    if (jdField_r_of_type_Int != 1) {
      m = 1.0F;
    }
    jdField_r_of_type_Int = 1;
    jdField_a_of_type_Long = l1;
    v = 167.0F;
    x += paramFloat;
    float f1 = Math.abs(x);
    float f2 = Math.max(0.6F, Math.min(f1, 0.8F));
    n = f2;
    j = f2;
    f1 = Math.max(0.5F, Math.min(f1 * 7.0F, 1.0F));
    p = f1;
    k = f1;
    f1 = Math.min(0.8F, l + Math.abs(paramFloat) * 1.1F);
    jdField_r_of_type_Float = f1;
    l = f1;
    f2 = Math.abs(paramFloat);
    f1 = f2;
    if (paramFloat > 0.0F)
    {
      f1 = f2;
      if (x < 0.0F) {
        f1 = -f2;
      }
    }
    if (x == 0.0F) {
      m = 0.0F;
    }
    paramFloat = Math.min(4.0F, Math.max(0.0F, f1 * 7.0F + m));
    t = paramFloat;
    m = paramFloat;
    o = j;
    q = k;
    s = l;
    u = m;
  }
  
  public void a(int paramInt)
  {
    jdField_r_of_type_Int = 2;
    paramInt = Math.max(100, Math.abs(paramInt));
    jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
    v = (0.1F + paramInt * 0.03F);
    n = 0.0F;
    p = 0.0F;
    k = 0.0F;
    jdField_r_of_type_Float = 0.5F;
    t = 0.0F;
    o = Math.max(0, Math.min(paramInt * 8, 1));
    q = Math.max(0.5F, Math.min(paramInt * 8, 1.0F));
    u = Math.min(0.025F + paramInt / 100 * paramInt * 1.5E-4F, 1.75F);
    s = Math.max(jdField_r_of_type_Float, Math.min(paramInt * 16 * 1.0E-5F, 0.8F));
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    e = paramInt1;
    f = paramInt2;
  }
  
  public boolean a()
  {
    return jdField_r_of_type_Int == 0;
  }
  
  public boolean a(Canvas paramCanvas)
  {
    boolean bool = false;
    c();
    int i1 = jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicHeight();
    jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth();
    int i2 = b.getIntrinsicHeight();
    int i3 = b.getIntrinsicWidth();
    b.setAlpha((int)(Math.max(0.0F, Math.min(l, 1.0F)) * 255.0F));
    i2 = (int)Math.min(i2 * m * i2 / i3 * 0.6F, i2 * 4.0F);
    if (e < h)
    {
      i3 = (e - h) / 2;
      b.setBounds(i3, 0, e - i3, i2);
      b.draw(paramCanvas);
      jdField_a_of_type_AndroidGraphicsDrawableDrawable.setAlpha((int)(Math.max(0.0F, Math.min(j, 1.0F)) * 255.0F));
      i1 = (int)(i1 * k);
      if (e >= h) {
        break label249;
      }
      i2 = (e - h) / 2;
      jdField_a_of_type_AndroidGraphicsDrawableDrawable.setBounds(i2, 0, e - i2, i1);
    }
    for (;;)
    {
      jdField_a_of_type_AndroidGraphicsDrawableDrawable.draw(paramCanvas);
      if (jdField_r_of_type_Int != 0) {
        bool = true;
      }
      return bool;
      b.setBounds(0, 0, e, i2);
      break;
      label249:
      jdField_a_of_type_AndroidGraphicsDrawableDrawable.setBounds(0, 0, e, i1);
    }
  }
  
  public void b()
  {
    x = 0.0F;
    if ((jdField_r_of_type_Int != 1) && (jdField_r_of_type_Int != 4)) {
      return;
    }
    jdField_r_of_type_Int = 3;
    n = j;
    p = k;
    jdField_r_of_type_Float = l;
    t = m;
    o = 0.0F;
    q = 0.0F;
    s = 0.0F;
    u = 0.0F;
    jdField_a_of_type_Long = AnimationUtils.currentAnimationTimeMillis();
    v = 1000.0F;
  }
}
