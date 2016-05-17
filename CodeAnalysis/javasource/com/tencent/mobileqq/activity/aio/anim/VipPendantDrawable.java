package com.tencent.mobileqq.activity.aio.anim;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.Arrays;
import ksg;

public class VipPendantDrawable
  extends Drawable
{
  static final int jdField_a_of_type_Int = -1;
  private static final String jdField_a_of_type_JavaLangString = "VipPendantDrawable";
  static final int b = 50;
  protected static final int c = 1;
  private static final int f = 0;
  Resources jdField_a_of_type_AndroidContentResResources;
  private Paint jdField_a_of_type_AndroidGraphicsPaint;
  Handler jdField_a_of_type_AndroidOsHandler;
  VipPendantDrawable.MutilePlayInfo jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPendantDrawable$MutilePlayInfo;
  protected Object a;
  protected int d;
  protected int e;
  private int g;
  private int h;
  
  public VipPendantDrawable(Resources paramResources)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    d = -1;
    e = 50;
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
    jdField_a_of_type_AndroidGraphicsPaint = new Paint(6);
    jdField_a_of_type_AndroidContentResResources = paramResources;
  }
  
  public void a()
  {
    d = -1;
    e = 50;
  }
  
  public void a(VipPendantDrawable.MutilePlayInfo paramMutilePlayInfo)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPendantDrawable$MutilePlayInfo = paramMutilePlayInfo;
  }
  
  public void a(String paramString)
  {
    if ((jdField_a_of_type_JavaLangObject != null) && ((jdField_a_of_type_JavaLangObject instanceof ksg)) && (jdField_a_of_type_JavaLangObject).a != null) && (d == 1) && (jdField_a_of_type_JavaLangObject).a.equals(paramString))) {
      return;
    }
    a();
    d = 1;
    jdField_a_of_type_JavaLangObject = new ksg(this, paramString);
  }
  
  public void a(String[] paramArrayOfString, int paramInt)
  {
    if (paramArrayOfString == null) {}
    for (;;)
    {
      return;
      try
      {
        if ((d == 0) && (jdField_a_of_type_JavaLangObject != null) && (!(jdField_a_of_type_JavaLangObject instanceof ksg)))
        {
          boolean bool = Arrays.equals((String[])jdField_a_of_type_JavaLangObject, paramArrayOfString);
          if (bool) {
            continue;
          }
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          QLog.e("VipPendantDrawable", 1, "setPngPaths, exception=" + MsfSdkUtils.getStackTraceString(localException));
        }
      }
    }
    a();
    d = 0;
    jdField_a_of_type_JavaLangObject = paramArrayOfString;
    e = paramInt;
  }
  
  public void draw(Canvas paramCanvas)
  {
    if (d == -1) {}
    Bitmap localBitmap;
    do
    {
      do
      {
        return;
      } while (jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPendantDrawable$MutilePlayInfo == null);
      localBitmap = jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPendantDrawable$MutilePlayInfo.a();
    } while ((localBitmap == null) || (localBitmap.isRecycled()));
    paramCanvas.drawBitmap(localBitmap, null, getBounds(), jdField_a_of_type_AndroidGraphicsPaint);
  }
  
  public int getOpacity()
  {
    return -3;
  }
  
  public void setAlpha(int paramInt)
  {
    if (paramInt != jdField_a_of_type_AndroidGraphicsPaint.getAlpha())
    {
      jdField_a_of_type_AndroidGraphicsPaint.setAlpha(paramInt);
      invalidateSelf();
    }
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    jdField_a_of_type_AndroidGraphicsPaint.setColorFilter(paramColorFilter);
    invalidateSelf();
  }
  
  public void setDither(boolean paramBoolean)
  {
    jdField_a_of_type_AndroidGraphicsPaint.setDither(paramBoolean);
    invalidateSelf();
  }
}
