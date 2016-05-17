package com.tencent.mobileqq.activity.photo;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.view.View;
import com.tencent.mobileqq.activity.PortraitImageview;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class RegionView
  extends View
{
  int jdField_a_of_type_Int;
  final Paint jdField_a_of_type_AndroidGraphicsPaint;
  final Rect jdField_a_of_type_AndroidGraphicsRect;
  private PortraitImageview jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview;
  Rect[] jdField_a_of_type_ArrayOfAndroidGraphicsRect;
  int jdField_b_of_type_Int;
  Rect jdField_b_of_type_AndroidGraphicsRect;
  int c;
  int d;
  int e;
  
  public RegionView(Context paramContext, PortraitImageview paramPortraitImageview, int paramInt1, int paramInt2, int paramInt3)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsRect = new Rect();
    jdField_a_of_type_AndroidGraphicsPaint = new Paint();
    paramPortraitImageview.setRegionView(this);
    jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview = paramPortraitImageview;
    c = paramInt1;
    d = paramInt2;
    e = paramInt3;
  }
  
  public Bitmap a()
  {
    Matrix localMatrix = jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview.a();
    Object localObject = jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview.a();
    localMatrix.postTranslate(-left, -top);
    localMatrix.postScale(c / ((RectF)localObject).width(), d / ((RectF)localObject).height(), 0.0F, 0.0F);
    localObject = Bitmap.createBitmap(c, d, Bitmap.Config.RGB_565);
    Bitmap localBitmap = jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview.a();
    if ((localObject != null) && (localBitmap != null)) {
      new Canvas((Bitmap)localObject).drawBitmap(localBitmap, localMatrix, new Paint(6));
    }
    return localObject;
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview != null)
    {
      jdField_a_of_type_Int = jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview.a();
      jdField_b_of_type_Int = jdField_a_of_type_ComTencentMobileqqActivityPortraitImageview.b();
    }
    jdField_a_of_type_AndroidGraphicsRect.left = ((getWidth() - jdField_a_of_type_Int) / 2);
    jdField_a_of_type_AndroidGraphicsRect.right = ((getWidth() + jdField_a_of_type_Int) / 2);
    jdField_a_of_type_AndroidGraphicsRect.top = ((getHeight() - jdField_b_of_type_Int) / 2);
    jdField_a_of_type_AndroidGraphicsRect.bottom = ((getHeight() + jdField_b_of_type_Int) / 2);
    if (e == 0)
    {
      jdField_a_of_type_AndroidGraphicsPaint.setColor(1711276032);
      jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.FILL);
      localObject = new Path();
      float f = jdField_a_of_type_AndroidGraphicsRect.top + jdField_a_of_type_AndroidGraphicsRect.height() * 0.5F;
      ((Path)localObject).moveTo(getWidth(), f);
      ((Path)localObject).addArc(new RectF(jdField_a_of_type_AndroidGraphicsRect.left, jdField_a_of_type_AndroidGraphicsRect.top, jdField_a_of_type_AndroidGraphicsRect.right, jdField_a_of_type_AndroidGraphicsRect.bottom), 0.0F, -360.0F);
      ((Path)localObject).moveTo(getWidth(), f);
      ((Path)localObject).lineTo(getWidth(), getHeight());
      ((Path)localObject).lineTo(0.0F, getHeight());
      ((Path)localObject).lineTo(0.0F, 0.0F);
      ((Path)localObject).lineTo(getWidth(), 0.0F);
      ((Path)localObject).moveTo(getWidth(), f);
      ((Path)localObject).close();
      paramCanvas.drawPath((Path)localObject, jdField_a_of_type_AndroidGraphicsPaint);
      jdField_a_of_type_AndroidGraphicsPaint.setAntiAlias(true);
      jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.STROKE);
      jdField_a_of_type_AndroidGraphicsPaint.setColor(1291845632);
      jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(5.0F);
      paramCanvas.drawCircle(jdField_a_of_type_AndroidGraphicsRect.left + jdField_a_of_type_AndroidGraphicsRect.width() * 0.5F, f, jdField_a_of_type_AndroidGraphicsRect.width() * 0.5F, jdField_a_of_type_AndroidGraphicsPaint);
      jdField_a_of_type_AndroidGraphicsPaint.setColor(-1);
      jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(3.0F);
      paramCanvas.drawCircle(jdField_a_of_type_AndroidGraphicsRect.left + jdField_a_of_type_AndroidGraphicsRect.width() * 0.5F, f, jdField_a_of_type_AndroidGraphicsRect.width() * 0.5F, jdField_a_of_type_AndroidGraphicsPaint);
      return;
    }
    jdField_a_of_type_ArrayOfAndroidGraphicsRect = new Rect[] { new Rect(0, 0, jdField_a_of_type_AndroidGraphicsRect.left, jdField_a_of_type_AndroidGraphicsRect.top), new Rect(jdField_a_of_type_AndroidGraphicsRect.left, 0, jdField_a_of_type_AndroidGraphicsRect.right, jdField_a_of_type_AndroidGraphicsRect.top), new Rect(jdField_a_of_type_AndroidGraphicsRect.right, 0, getWidth(), jdField_a_of_type_AndroidGraphicsRect.top), new Rect(0, jdField_a_of_type_AndroidGraphicsRect.top, jdField_a_of_type_AndroidGraphicsRect.left, jdField_a_of_type_AndroidGraphicsRect.bottom), new Rect(jdField_a_of_type_AndroidGraphicsRect.right, jdField_a_of_type_AndroidGraphicsRect.top, getWidth(), jdField_a_of_type_AndroidGraphicsRect.bottom), new Rect(0, jdField_a_of_type_AndroidGraphicsRect.bottom, jdField_a_of_type_AndroidGraphicsRect.left, getHeight()), new Rect(jdField_a_of_type_AndroidGraphicsRect.left, jdField_a_of_type_AndroidGraphicsRect.bottom, jdField_a_of_type_AndroidGraphicsRect.right, getHeight()), new Rect(jdField_a_of_type_AndroidGraphicsRect.right, jdField_a_of_type_AndroidGraphicsRect.bottom, getWidth(), getHeight()) };
    jdField_b_of_type_AndroidGraphicsRect = new Rect();
    jdField_b_of_type_AndroidGraphicsRect.set(jdField_a_of_type_AndroidGraphicsRect);
    Object localObject = jdField_b_of_type_AndroidGraphicsRect;
    left -= 2;
    localObject = jdField_b_of_type_AndroidGraphicsRect;
    right += 2;
    localObject = jdField_b_of_type_AndroidGraphicsRect;
    top -= 2;
    localObject = jdField_b_of_type_AndroidGraphicsRect;
    bottom += 2;
    jdField_a_of_type_AndroidGraphicsPaint.setColor(1711276032);
    jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.FILL);
    int i = 0;
    while (i < jdField_a_of_type_ArrayOfAndroidGraphicsRect.length)
    {
      paramCanvas.drawRect(jdField_a_of_type_ArrayOfAndroidGraphicsRect[i], jdField_a_of_type_AndroidGraphicsPaint);
      i += 1;
    }
    jdField_a_of_type_AndroidGraphicsPaint.setColor(0);
    paramCanvas.drawRect(jdField_b_of_type_AndroidGraphicsRect, jdField_a_of_type_AndroidGraphicsPaint);
    jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.STROKE);
    jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(5.0F);
    jdField_a_of_type_AndroidGraphicsPaint.setColor(1291845632);
    paramCanvas.drawRect(jdField_b_of_type_AndroidGraphicsRect, jdField_a_of_type_AndroidGraphicsPaint);
    jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.STROKE);
    jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(3.0F);
    jdField_a_of_type_AndroidGraphicsPaint.setColor(-1);
    paramCanvas.drawRect(jdField_b_of_type_AndroidGraphicsRect, jdField_a_of_type_AndroidGraphicsPaint);
  }
}
