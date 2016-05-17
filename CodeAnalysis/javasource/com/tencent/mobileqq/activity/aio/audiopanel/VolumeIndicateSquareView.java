package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.util.AttributeSet;
import android.view.View;
import com.tencent.mobileqq.R.styleable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class VolumeIndicateSquareView
  extends View
{
  private int jdField_a_of_type_Int;
  private Paint jdField_a_of_type_AndroidGraphicsPaint;
  private boolean jdField_a_of_type_Boolean;
  public int[] a;
  private int b;
  private int c;
  private int d;
  private int e;
  
  public VolumeIndicateSquareView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_Int = 0;
    b = 0;
    c = 0;
    d = 0;
    e = 0;
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.aB);
    a(paramContext);
    paramContext.recycle();
  }
  
  private void a(TypedArray paramTypedArray)
  {
    boolean bool = false;
    if (paramTypedArray.getInt(0, 0) == 0) {
      bool = true;
    }
    jdField_a_of_type_Boolean = bool;
    jdField_a_of_type_Int = paramTypedArray.getInt(1, 5);
    b = ((int)paramTypedArray.getDimension(4, 8.0F));
    c = paramTypedArray.getColor(2, -16776961);
    jdField_a_of_type_ArrayOfInt = new int[jdField_a_of_type_Int];
  }
  
  public void a()
  {
    if (jdField_a_of_type_ArrayOfInt != null)
    {
      int i = 0;
      while (i < jdField_a_of_type_ArrayOfInt.length)
      {
        jdField_a_of_type_ArrayOfInt[i] = 0;
        i += 1;
      }
      d = 0;
    }
    invalidate();
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_ArrayOfInt[d] = paramInt;
    d += 1;
    if (d >= jdField_a_of_type_Int) {
      d = 0;
    }
    invalidate();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    int i = d;
    int j = 0;
    i -= 1;
    if (j < jdField_a_of_type_Int)
    {
      if (i >= 0) {
        break label176;
      }
      i = jdField_a_of_type_Int - 1;
    }
    label176:
    for (;;)
    {
      float f2 = jdField_a_of_type_ArrayOfInt[i];
      float f1 = f2;
      if (f2 < 1.0F) {
        f1 = 1.0F;
      }
      f2 = f1;
      if (f1 > 8.0F) {
        f2 = 8.0F;
      }
      f2 = f2 / 2.0F * b;
      if (jdField_a_of_type_Boolean) {}
      for (f1 = j * 2.0F * b;; f1 = (jdField_a_of_type_Int - 1 - j) * 2.0F * b + b)
      {
        paramCanvas.drawRect(f1, e - f2, b + f1, e + f2, jdField_a_of_type_AndroidGraphicsPaint);
        j += 1;
        i -= 1;
        break;
      }
      return;
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    paramInt1 = jdField_a_of_type_Int;
    paramInt2 = b;
    int i = b;
    setMeasuredDimension(paramInt1 * 2 * paramInt2 + getPaddingLeft() + getPaddingRight(), i * 8 + getPaddingTop() + getPaddingBottom());
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    e = (paramInt2 / 2);
    if (jdField_a_of_type_AndroidGraphicsPaint == null)
    {
      jdField_a_of_type_AndroidGraphicsPaint = new Paint();
      jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.FILL);
      jdField_a_of_type_AndroidGraphicsPaint.setColor(c);
    }
    invalidate();
  }
  
  public void setColor(int paramInt)
  {
    c = paramInt;
    if (jdField_a_of_type_AndroidGraphicsPaint != null) {
      jdField_a_of_type_AndroidGraphicsPaint.setColor(c);
    }
  }
  
  public void setCount(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
    jdField_a_of_type_ArrayOfInt = new int[jdField_a_of_type_Int];
    requestLayout();
  }
  
  public void setSquareWidth(int paramInt)
  {
    b = paramInt;
  }
}
