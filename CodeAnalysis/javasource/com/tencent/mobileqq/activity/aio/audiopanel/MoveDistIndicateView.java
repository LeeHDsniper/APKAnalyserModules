package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class MoveDistIndicateView
  extends ImageView
{
  private static final int d = -6710887;
  private static final int e = -1;
  private static final int f = -2763307;
  public int a;
  private Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  private Matrix jdField_a_of_type_AndroidGraphicsMatrix;
  private Paint jdField_a_of_type_AndroidGraphicsPaint;
  private Rect jdField_a_of_type_AndroidGraphicsRect;
  public int b;
  private Bitmap b;
  private int c;
  
  public MoveDistIndicateView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsMatrix = new Matrix();
    jdField_a_of_type_AndroidGraphicsRect = new Rect();
    a(paramContext);
  }
  
  private void a(Context paramContext)
  {
    jdField_a_of_type_AndroidGraphicsPaint = new Paint();
    jdField_a_of_type_AndroidGraphicsPaint.setAntiAlias(true);
    paramContext = getResources();
    jdField_a_of_type_Int = AIOUtils.a(20.0F, paramContext);
    jdField_b_of_type_Int = AIOUtils.a(34.0F, paramContext);
    c = jdField_a_of_type_Int;
    if (QLog.isDevelopLevel()) {
      QLog.d("AIOAudioPanel", 4, "init(), mRaidusMin:" + jdField_a_of_type_Int + ",mRaidusMax:" + jdField_b_of_type_Int);
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    int i = getWidth();
    int j = getHeight();
    int m = i / 2;
    int n = j / 2;
    int k = paramCanvas.getSaveCount();
    paramCanvas.save();
    float f1;
    if (c == jdField_b_of_type_Int) {
      if (jdField_b_of_type_AndroidGraphicsBitmap != null)
      {
        f1 = jdField_b_of_type_Int / jdField_a_of_type_Int;
        jdField_a_of_type_AndroidGraphicsMatrix.reset();
        m = jdField_b_of_type_AndroidGraphicsBitmap.getWidth();
        n = jdField_b_of_type_AndroidGraphicsBitmap.getHeight();
        jdField_a_of_type_AndroidGraphicsMatrix.setScale(f1, f1);
        jdField_a_of_type_AndroidGraphicsMatrix.postTranslate((i - m * f1) / 2.0F, (j - f1 * n) / 2.0F);
        jdField_a_of_type_AndroidGraphicsRect.set(0, 0, m, n);
        paramCanvas.concat(jdField_a_of_type_AndroidGraphicsMatrix);
        paramCanvas.drawBitmap(jdField_b_of_type_AndroidGraphicsBitmap, null, jdField_a_of_type_AndroidGraphicsRect, null);
      }
    }
    for (;;)
    {
      paramCanvas.restoreToCount(k);
      super.onDraw(paramCanvas);
      return;
      jdField_a_of_type_AndroidGraphicsPaint.setColor(-6710887);
      jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.FILL_AND_STROKE);
      jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(1.0F);
      paramCanvas.drawCircle(m, n, c, jdField_a_of_type_AndroidGraphicsPaint);
      continue;
      if (jdField_a_of_type_AndroidGraphicsBitmap != null)
      {
        f1 = c / jdField_a_of_type_Int;
        jdField_a_of_type_AndroidGraphicsMatrix.reset();
        m = jdField_a_of_type_AndroidGraphicsBitmap.getWidth();
        n = jdField_a_of_type_AndroidGraphicsBitmap.getHeight();
        float f2 = (i - m * f1) * 0.5F + 0.5F;
        float f3 = (j - n * f1) * 0.5F + 0.5F;
        if (QLog.isColorLevel()) {
          QLog.d("AIOAudioPanel", 2, "dx is:" + f2 + ",dy is:" + f3);
        }
        jdField_a_of_type_AndroidGraphicsMatrix.setScale(f1, f1);
        jdField_a_of_type_AndroidGraphicsMatrix.postTranslate(f2, f3);
        jdField_a_of_type_AndroidGraphicsRect.set(0, 0, m, n);
        paramCanvas.concat(jdField_a_of_type_AndroidGraphicsMatrix);
        paramCanvas.drawBitmap(jdField_a_of_type_AndroidGraphicsBitmap, null, jdField_a_of_type_AndroidGraphicsRect, null);
      }
      else
      {
        jdField_a_of_type_AndroidGraphicsPaint.setColor(-1);
        jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.FILL);
        jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(1.0F);
        paramCanvas.drawCircle(m, n, c, jdField_a_of_type_AndroidGraphicsPaint);
        jdField_a_of_type_AndroidGraphicsPaint.setColor(-2763307);
        jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.STROKE);
        jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(2.0F);
        paramCanvas.drawCircle(m, n, c, jdField_a_of_type_AndroidGraphicsPaint);
      }
    }
  }
  
  public void setAfterBitmap(Bitmap paramBitmap)
  {
    jdField_b_of_type_AndroidGraphicsBitmap = paramBitmap;
  }
  
  public void setLevel(int paramInt)
  {
    c = (jdField_a_of_type_Int + (jdField_b_of_type_Int - jdField_a_of_type_Int) * paramInt / 100);
    if (paramInt == 100) {
      setPressed(true);
    }
    for (;;)
    {
      invalidate();
      return;
      setPressed(false);
    }
  }
  
  public void setScaleBitmap(Bitmap paramBitmap)
  {
    jdField_a_of_type_AndroidGraphicsBitmap = paramBitmap;
  }
}
