package com.tencent.common.galleryactivity;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.ViscousFluidInterpolator;

public class AnimationView
  extends View
{
  public static final int a = 0;
  public static final int b = 1;
  public static final int c = 2;
  private static final int jdField_d_of_type_Int = 1;
  private static final int jdField_e_of_type_Int = 2;
  private static final int jdField_f_of_type_Int = 3;
  float jdField_a_of_type_Float;
  long jdField_a_of_type_Long;
  Paint jdField_a_of_type_AndroidGraphicsPaint;
  private Rect jdField_a_of_type_AndroidGraphicsRect;
  private RectF jdField_a_of_type_AndroidGraphicsRectF;
  private Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  AccelerateDecelerateInterpolator jdField_a_of_type_AndroidViewAnimationAccelerateDecelerateInterpolator;
  private AnimationLister jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister;
  ViscousFluidInterpolator jdField_a_of_type_ComTencentUtilViscousFluidInterpolator;
  boolean jdField_a_of_type_Boolean;
  float jdField_b_of_type_Float;
  private long jdField_b_of_type_Long;
  private Rect jdField_b_of_type_AndroidGraphicsRect;
  boolean jdField_b_of_type_Boolean;
  float jdField_c_of_type_Float;
  private long jdField_c_of_type_Long;
  private Rect jdField_c_of_type_AndroidGraphicsRect;
  boolean jdField_c_of_type_Boolean;
  float jdField_d_of_type_Float;
  private Rect jdField_d_of_type_AndroidGraphicsRect;
  private boolean jdField_d_of_type_Boolean;
  float jdField_e_of_type_Float;
  private Rect jdField_e_of_type_AndroidGraphicsRect;
  private boolean jdField_e_of_type_Boolean;
  private Rect jdField_f_of_type_AndroidGraphicsRect;
  private int jdField_g_of_type_Int;
  private Rect jdField_g_of_type_AndroidGraphicsRect;
  private int h;
  private int i;
  private int j;
  private int k;
  
  public AnimationView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_g_of_type_Int = 3;
    h = 3;
    jdField_c_of_type_Long = 350L;
    jdField_a_of_type_ComTencentUtilViscousFluidInterpolator = new ViscousFluidInterpolator();
    jdField_a_of_type_AndroidViewAnimationAccelerateDecelerateInterpolator = new AccelerateDecelerateInterpolator();
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = true;
    jdField_a_of_type_Long = 0L;
    jdField_a_of_type_AndroidGraphicsPaint = new Paint(6);
    f = new Rect();
    jdField_a_of_type_AndroidGraphicsRectF = new RectF();
    jdField_g_of_type_AndroidGraphicsRect = new Rect();
  }
  
  private void a()
  {
    jdField_a_of_type_Long = System.currentTimeMillis();
    jdField_a_of_type_Boolean = true;
    jdField_c_of_type_AndroidGraphicsRect = jdField_a_of_type_AndroidGraphicsDrawableDrawable.copyBounds();
    jdField_g_of_type_AndroidGraphicsRect = new Rect(0, 0, jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth(), jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicHeight());
    jdField_a_of_type_AndroidGraphicsDrawableDrawable.setBounds(jdField_g_of_type_AndroidGraphicsRect);
  }
  
  private void a(Canvas paramCanvas)
  {
    switch (jdField_g_of_type_Int)
    {
    default: 
      return;
    case 1: 
      if ((jdField_a_of_type_AndroidGraphicsRect == null) || (jdField_b_of_type_AndroidGraphicsRect == null) || (jdField_a_of_type_AndroidGraphicsDrawableDrawable == null))
      {
        jdField_g_of_type_Int = 3;
        jdField_d_of_type_Boolean = false;
        if (jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister != null) {
          jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.b();
        }
        super.onDraw(paramCanvas);
        return;
      }
      jdField_b_of_type_Long = SystemClock.uptimeMillis();
      jdField_g_of_type_Int = 2;
    case 2: 
      float f1 = (float)(SystemClock.uptimeMillis() - jdField_b_of_type_Long) / (float)jdField_c_of_type_Long;
      if (f1 >= 1.0F) {
        jdField_g_of_type_Int = 3;
      }
      f1 = Math.min(f1, 1.0F);
      f1 = 1.0F - jdField_a_of_type_AndroidViewAnimationAccelerateDecelerateInterpolator.getInterpolation(f1);
      Rect localRect1 = jdField_a_of_type_AndroidGraphicsRect;
      Rect localRect2 = jdField_b_of_type_AndroidGraphicsRect;
      int[] arrayOfInt = new int[2];
      getLocationInWindow(arrayOfInt);
      localRect2 = new Rect(left + arrayOfInt[0], top + arrayOfInt[1], right + arrayOfInt[0], bottom + arrayOfInt[1]);
      int m = localRect2.width();
      int n = localRect2.height();
      float f2 = localRect1.width();
      float f3 = localRect1.height();
      float f4 = f2 / m;
      float f5 = f3 / n;
      paramCanvas.save();
      if (i == 1)
      {
        paramCanvas.translate((left - arrayOfInt[0] - (left - arrayOfInt[0]) * f5) * f1, (top - arrayOfInt[1] - (top - arrayOfInt[1]) * f5) * f1);
        paramCanvas.scale(1.0F - (1.0F - f5) * f1, 1.0F - (1.0F - f5) * f1);
        paramCanvas.clipRect(left - arrayOfInt[0], top - arrayOfInt[1], right - arrayOfInt[0] - f1 * (m - f2 / f5), bottom - arrayOfInt[1]);
      }
      for (;;)
      {
        jdField_a_of_type_AndroidGraphicsDrawableDrawable.setBounds(jdField_b_of_type_AndroidGraphicsRect);
        jdField_a_of_type_AndroidGraphicsDrawableDrawable.draw(paramCanvas);
        paramCanvas.restore();
        invalidate();
        return;
        if (i == 2)
        {
          paramCanvas.translate((left - arrayOfInt[0] - (left - arrayOfInt[0]) * f4) * f1, (top - arrayOfInt[1] - (top - arrayOfInt[1]) * f4) * f1);
          paramCanvas.scale(1.0F - (1.0F - f4) * f1, 1.0F - (1.0F - f4) * f1);
          paramCanvas.clipRect(left - arrayOfInt[0], top - arrayOfInt[1], right - arrayOfInt[0], bottom - arrayOfInt[1] - f1 * (n - f3 / f4));
        }
        else
        {
          paramCanvas.translate((left - arrayOfInt[0] - (left - arrayOfInt[0]) * f4) * f1, (top - arrayOfInt[1] - (top - arrayOfInt[1]) * f5) * f1);
          paramCanvas.scale(1.0F - (1.0F - f4) * f1, 1.0F - f1 * (1.0F - f5));
        }
      }
    }
    jdField_d_of_type_Boolean = false;
    if (jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.b();
    }
    jdField_a_of_type_AndroidGraphicsDrawableDrawable.setBounds(jdField_b_of_type_AndroidGraphicsRect);
    jdField_a_of_type_AndroidGraphicsDrawableDrawable.draw(paramCanvas);
    paramCanvas.restore();
    jdField_a_of_type_AndroidGraphicsDrawableDrawable.setBounds(jdField_c_of_type_AndroidGraphicsRect);
  }
  
  private void b(Canvas paramCanvas)
  {
    switch (h)
    {
    default: 
    case 1: 
      do
      {
        return;
        if ((jdField_a_of_type_AndroidGraphicsRect != null) && (jdField_b_of_type_AndroidGraphicsRect != null) && (jdField_a_of_type_AndroidGraphicsDrawableDrawable != null)) {
          break;
        }
        h = 3;
        jdField_e_of_type_Boolean = false;
        super.onDraw(paramCanvas);
      } while (jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister == null);
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.e();
      return;
      jdField_b_of_type_Long = SystemClock.uptimeMillis();
      h = 2;
    case 2: 
      float f1 = (float)(SystemClock.uptimeMillis() - jdField_b_of_type_Long) / (float)jdField_c_of_type_Long;
      if (f1 >= 1.0F) {
        h = 3;
      }
      f1 = Math.min(f1, 1.0F);
      f1 = jdField_a_of_type_ComTencentUtilViscousFluidInterpolator.getInterpolation(f1);
      Rect localRect1 = jdField_a_of_type_AndroidGraphicsRect;
      Rect localRect2 = jdField_b_of_type_AndroidGraphicsRect;
      int[] arrayOfInt = new int[2];
      getLocationInWindow(arrayOfInt);
      localRect2 = new Rect(left + arrayOfInt[0], top + arrayOfInt[1], right + arrayOfInt[0], bottom + arrayOfInt[1]);
      int m = right - left;
      int n = bottom - top;
      float f2 = right - left + j;
      float f3 = bottom - top + k;
      float f4 = f2 / m;
      float f5 = f3 / n;
      paramCanvas.save();
      if (i == 1)
      {
        paramCanvas.translate((left - arrayOfInt[0] - j - (left - arrayOfInt[0]) * f5) * f1, (top - arrayOfInt[1] - k - (top - arrayOfInt[1]) * f5) * f1);
        paramCanvas.scale(1.0F - (1.0F - f5) * f1, 1.0F - (1.0F - f5) * f1);
        paramCanvas.clipRect(left - arrayOfInt[0] + j / (1.0F - (1.0F - f5) * f1) * f1, top - arrayOfInt[1] + k / (1.0F - (1.0F - f5) * f1) * f1, right - arrayOfInt[0] - f1 * (m - f2 / f5), bottom - arrayOfInt[1]);
      }
      for (;;)
      {
        jdField_a_of_type_AndroidGraphicsDrawableDrawable.setBounds(jdField_b_of_type_AndroidGraphicsRect);
        jdField_a_of_type_AndroidGraphicsDrawableDrawable.draw(paramCanvas);
        paramCanvas.restore();
        invalidate();
        return;
        if (i == 2)
        {
          paramCanvas.translate((left - arrayOfInt[0] - j - (left - arrayOfInt[0]) * f4) * f1, (top - arrayOfInt[1] - k - (top - arrayOfInt[1]) * f4) * f1);
          paramCanvas.scale(1.0F - (1.0F - f4) * f1, 1.0F - (1.0F - f4) * f1);
          paramCanvas.clipRect(left - arrayOfInt[0] + j / (1.0F - (1.0F - f4) * f1) * f1, top - arrayOfInt[1] + k / (1.0F - (1.0F - f4) * f1) * f1, right - arrayOfInt[0], bottom - arrayOfInt[1] - f1 * (n - f3 / f4));
        }
        else
        {
          paramCanvas.translate((left - arrayOfInt[0] - (left - arrayOfInt[0]) * f4) * f1, (top - arrayOfInt[1] - (top - arrayOfInt[1]) * f5) * f1);
          paramCanvas.scale(1.0F - (1.0F - f4) * f1, 1.0F - f1 * (1.0F - f5));
        }
      }
    }
    if (jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.e();
    }
    jdField_e_of_type_Boolean = false;
    paramCanvas.restore();
    jdField_a_of_type_AndroidGraphicsDrawableDrawable.setBounds(jdField_c_of_type_AndroidGraphicsRect);
  }
  
  private void c(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    paramCanvas.save();
    float f1;
    if (jdField_a_of_type_Long > 0L)
    {
      long l = System.currentTimeMillis() - jdField_a_of_type_Long;
      jdField_e_of_type_Float = ((float)l / (float)jdField_c_of_type_Long);
      if (!jdField_c_of_type_Boolean) {
        break label468;
      }
      jdField_e_of_type_Float = jdField_a_of_type_AndroidViewAnimationAccelerateDecelerateInterpolator.getInterpolation(jdField_e_of_type_Float);
      f1 = 1.0F - jdField_e_of_type_Float;
      if (jdField_a_of_type_Boolean)
      {
        if (l > jdField_c_of_type_Long) {
          break label486;
        }
        jdField_a_of_type_Float = (jdField_d_of_type_AndroidGraphicsRect.top * f1 + jdField_e_of_type_AndroidGraphicsRect.top * jdField_e_of_type_Float);
        jdField_b_of_type_Float = (jdField_d_of_type_AndroidGraphicsRect.bottom * f1 + jdField_e_of_type_AndroidGraphicsRect.bottom * jdField_e_of_type_Float);
        jdField_c_of_type_Float = (jdField_d_of_type_AndroidGraphicsRect.left * f1 + jdField_e_of_type_AndroidGraphicsRect.left * jdField_e_of_type_Float);
        jdField_d_of_type_Float = (jdField_d_of_type_AndroidGraphicsRect.right * f1 + jdField_e_of_type_AndroidGraphicsRect.right * jdField_e_of_type_Float);
        f.set((int)jdField_c_of_type_Float, (int)jdField_a_of_type_Float, (int)jdField_d_of_type_Float, (int)jdField_b_of_type_Float);
        jdField_a_of_type_Float = (jdField_a_of_type_AndroidGraphicsRect.top * f1 + jdField_b_of_type_AndroidGraphicsRect.top * jdField_e_of_type_Float);
        jdField_b_of_type_Float = (jdField_a_of_type_AndroidGraphicsRect.bottom * f1 + jdField_b_of_type_AndroidGraphicsRect.bottom * jdField_e_of_type_Float);
        jdField_c_of_type_Float = (jdField_a_of_type_AndroidGraphicsRect.left * f1 + jdField_b_of_type_AndroidGraphicsRect.left * jdField_e_of_type_Float);
        jdField_d_of_type_Float = (jdField_a_of_type_AndroidGraphicsRect.right * f1 + jdField_b_of_type_AndroidGraphicsRect.right * jdField_e_of_type_Float);
        jdField_a_of_type_AndroidGraphicsRectF.set(jdField_c_of_type_Float, jdField_a_of_type_Float, jdField_d_of_type_Float, jdField_b_of_type_Float);
      }
    }
    for (;;)
    {
      f1 = jdField_a_of_type_AndroidGraphicsRectF.width() / f.width();
      float f2 = jdField_a_of_type_AndroidGraphicsRectF.height() / f.height();
      paramCanvas.translate(jdField_a_of_type_AndroidGraphicsRectF.left - f.left * f1, jdField_a_of_type_AndroidGraphicsRectF.top - f.top * f2);
      paramCanvas.scale(f1, f2);
      paramCanvas.clipRect(f);
      jdField_a_of_type_AndroidGraphicsDrawableDrawable.draw(paramCanvas);
      invalidate();
      paramCanvas.restore();
      return;
      label468:
      jdField_e_of_type_Float = jdField_a_of_type_ComTencentUtilViscousFluidInterpolator.getInterpolation(jdField_e_of_type_Float);
      break;
      label486:
      jdField_a_of_type_Boolean = false;
      if (jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister != null) {
        if (jdField_c_of_type_Boolean) {
          jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.b();
        } else {
          jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.e();
        }
      }
    }
  }
  
  public void a(Drawable paramDrawable, Rect paramRect1, Rect paramRect2, int paramInt1, int paramInt2, int paramInt3, long paramLong)
  {
    h = 1;
    jdField_e_of_type_Boolean = true;
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = paramDrawable;
    jdField_c_of_type_AndroidGraphicsRect = paramDrawable.copyBounds();
    jdField_a_of_type_AndroidGraphicsRect = paramRect1;
    jdField_b_of_type_AndroidGraphicsRect = paramRect2;
    i = paramInt1;
    j = paramInt2;
    k = paramInt3;
    jdField_c_of_type_Long = paramLong;
    if (jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.d();
    }
    invalidate();
  }
  
  public void a(Drawable paramDrawable, Rect paramRect1, Rect paramRect2, int paramInt, long paramLong)
  {
    jdField_g_of_type_Int = 1;
    jdField_d_of_type_Boolean = true;
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = paramDrawable;
    jdField_c_of_type_AndroidGraphicsRect = paramDrawable.copyBounds();
    jdField_a_of_type_AndroidGraphicsRect = paramRect1;
    jdField_b_of_type_AndroidGraphicsRect = paramRect2;
    i = paramInt;
    jdField_c_of_type_Long = paramLong;
    if (jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.c();
    }
    invalidate();
  }
  
  public void a(Drawable paramDrawable, Rect paramRect1, Rect paramRect2, Rect paramRect3, Rect paramRect4, long paramLong)
  {
    jdField_b_of_type_Boolean = true;
    jdField_c_of_type_Boolean = true;
    int[] arrayOfInt = new int[2];
    getLocationInWindow(arrayOfInt);
    paramRect3 = new Rect(paramRect3);
    paramRect3.offset(arrayOfInt[0], -arrayOfInt[1]);
    jdField_d_of_type_AndroidGraphicsRect = paramRect1;
    jdField_e_of_type_AndroidGraphicsRect = paramRect2;
    jdField_a_of_type_AndroidGraphicsRect = paramRect3;
    jdField_b_of_type_AndroidGraphicsRect = paramRect4;
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = paramDrawable;
    jdField_c_of_type_Long = paramLong;
    a();
    if (jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.c();
    }
  }
  
  public void b(Drawable paramDrawable, Rect paramRect1, Rect paramRect2, Rect paramRect3, Rect paramRect4, long paramLong)
  {
    jdField_b_of_type_Boolean = true;
    jdField_c_of_type_Boolean = false;
    int[] arrayOfInt = new int[2];
    getLocationInWindow(arrayOfInt);
    paramRect3 = new Rect(paramRect3);
    paramRect3.offset(arrayOfInt[0], -arrayOfInt[1]);
    jdField_d_of_type_AndroidGraphicsRect = paramRect2;
    jdField_e_of_type_AndroidGraphicsRect = paramRect1;
    jdField_a_of_type_AndroidGraphicsRect = paramRect4;
    jdField_b_of_type_AndroidGraphicsRect = paramRect3;
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = paramDrawable;
    jdField_c_of_type_Long = paramLong;
    a();
    if (jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister != null) {
      jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister.d();
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    if (jdField_b_of_type_Boolean)
    {
      c(paramCanvas);
      return;
    }
    if (jdField_d_of_type_Boolean)
    {
      a(paramCanvas);
      return;
    }
    if (jdField_e_of_type_Boolean)
    {
      b(paramCanvas);
      return;
    }
    super.onDraw(paramCanvas);
  }
  
  public void setAnimationListener(AnimationLister paramAnimationLister)
  {
    jdField_a_of_type_ComTencentCommonGalleryactivityAnimationLister = paramAnimationLister;
  }
}
