package com.tencent.mobileqq.activity.aio.item;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.view.Gravity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class AIOSendMask
  extends Drawable
{
  private static final Rect jdField_a_of_type_AndroidGraphicsRect = new Rect();
  private static final RectF jdField_a_of_type_AndroidGraphicsRectF;
  private float jdField_a_of_type_Float;
  private Paint jdField_a_of_type_AndroidGraphicsPaint = new Paint(1);
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsRectF = new RectF();
  }
  
  public AIOSendMask(int paramInt, float paramFloat)
  {
    jdField_a_of_type_AndroidGraphicsPaint.setColor(paramInt);
    jdField_a_of_type_Float = paramFloat;
  }
  
  public void draw(Canvas paramCanvas)
  {
    int j = getLevel();
    if (j == 0) {}
    Rect localRect1;
    Rect localRect2;
    int i;
    do
    {
      return;
      localRect1 = jdField_a_of_type_AndroidGraphicsRect;
      localRect2 = getBounds();
      i = localRect2.width();
      int k = localRect2.height();
      j = k - (10000 - j) * k / 10000;
      Gravity.apply(48, i, j, localRect2, localRect1);
    } while ((i <= 0) || (j <= 0));
    paramCanvas.save();
    paramCanvas.clipRect(localRect1);
    jdField_a_of_type_AndroidGraphicsRectF.set(localRect2);
    paramCanvas.drawRoundRect(jdField_a_of_type_AndroidGraphicsRectF, jdField_a_of_type_Float, jdField_a_of_type_Float, jdField_a_of_type_AndroidGraphicsPaint);
    paramCanvas.restore();
  }
  
  public int getOpacity()
  {
    return -3;
  }
  
  public void setAlpha(int paramInt) {}
  
  public void setColorFilter(ColorFilter paramColorFilter) {}
}
