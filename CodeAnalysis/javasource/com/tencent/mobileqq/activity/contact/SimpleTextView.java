package com.tencent.mobileqq.activity.contact;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.FontMetrics;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.view.View.MeasureSpec;
import com.tencent.mobileqq.R.styleable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DisplayUtils;

public class SimpleTextView
  extends View
{
  private int jdField_a_of_type_Int;
  private ColorStateList jdField_a_of_type_AndroidContentResColorStateList;
  private Paint.FontMetrics jdField_a_of_type_AndroidGraphicsPaint$FontMetrics;
  private final TextPaint jdField_a_of_type_AndroidTextTextPaint;
  private CharSequence jdField_a_of_type_JavaLangCharSequence;
  private int b;
  
  public SimpleTextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public SimpleTextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangCharSequence = "";
    b = -1;
    Object localObject = getResources();
    jdField_a_of_type_AndroidTextTextPaint = new TextPaint(1);
    jdField_a_of_type_AndroidTextTextPaint.density = getDisplayMetricsdensity;
    if (paramAttributeSet != null)
    {
      paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.al);
      paramInt = paramAttributeSet.getDimensionPixelSize(0, (int)DisplayUtils.a(paramContext, 12.0F));
      paramContext = paramAttributeSet.getColorStateList(1);
      localObject = paramAttributeSet.getString(2);
      jdField_a_of_type_AndroidTextTextPaint.setTextSize(paramInt);
      jdField_a_of_type_AndroidGraphicsPaint$FontMetrics = jdField_a_of_type_AndroidTextTextPaint.getFontMetrics();
      jdField_a_of_type_AndroidContentResColorStateList = paramContext;
      jdField_a_of_type_Int = jdField_a_of_type_AndroidContentResColorStateList.getDefaultColor();
      jdField_a_of_type_AndroidTextTextPaint.setColor(jdField_a_of_type_Int);
      setText((CharSequence)localObject);
      paramAttributeSet.recycle();
    }
  }
  
  private int a(int paramInt1, int paramInt2)
  {
    int j = View.MeasureSpec.getMode(paramInt1);
    int i = View.MeasureSpec.getSize(paramInt1);
    if (j == 1073741824) {
      paramInt1 = i;
    }
    do
    {
      return paramInt1;
      paramInt1 = paramInt2;
    } while (j != Integer.MIN_VALUE);
    return Math.min(i, paramInt2);
  }
  
  private void a()
  {
    int[] arrayOfInt = getDrawableState();
    int i = jdField_a_of_type_AndroidContentResColorStateList.getColorForState(arrayOfInt, 0);
    if (i != jdField_a_of_type_Int)
    {
      jdField_a_of_type_Int = i;
      jdField_a_of_type_AndroidTextTextPaint.setColor(jdField_a_of_type_Int);
      invalidate();
    }
  }
  
  public Paint a()
  {
    return jdField_a_of_type_AndroidTextTextPaint;
  }
  
  public CharSequence a()
  {
    return jdField_a_of_type_JavaLangCharSequence;
  }
  
  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    if ((jdField_a_of_type_AndroidContentResColorStateList != null) && (jdField_a_of_type_AndroidContentResColorStateList.isStateful())) {
      a();
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    int i = getMeasuredHeight();
    float f2 = jdField_a_of_type_AndroidGraphicsPaint$FontMetrics.bottom;
    float f3 = jdField_a_of_type_AndroidGraphicsPaint$FontMetrics.top;
    float f1 = i;
    f2 = (i - (f2 - f3)) / 2.0F;
    f3 = jdField_a_of_type_AndroidGraphicsPaint$FontMetrics.bottom;
    paramCanvas.drawText(jdField_a_of_type_JavaLangCharSequence, 0, jdField_a_of_type_JavaLangCharSequence.length(), getPaddingLeft(), f1 - f2 - f3, jdField_a_of_type_AndroidTextTextPaint);
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (b != -1) {}
    for (int i = b;; i = (int)jdField_a_of_type_AndroidTextTextPaint.measureText(jdField_a_of_type_JavaLangCharSequence, 0, jdField_a_of_type_JavaLangCharSequence.length()))
    {
      setMeasuredDimension(a(paramInt1, i), a(paramInt2, Math.max((int)(jdField_a_of_type_AndroidGraphicsPaint$FontMetrics.top - jdField_a_of_type_AndroidGraphicsPaint$FontMetrics.bottom), getSuggestedMinimumWidth())));
      return;
    }
  }
  
  public void setFixedWidth(int paramInt)
  {
    b = paramInt;
  }
  
  public void setText(CharSequence paramCharSequence)
  {
    Object localObject = paramCharSequence;
    if (paramCharSequence == null) {
      localObject = "";
    }
    if (localObject != jdField_a_of_type_JavaLangCharSequence)
    {
      jdField_a_of_type_JavaLangCharSequence = ((CharSequence)localObject);
      requestLayout();
    }
  }
  
  public void setTextColor(int paramInt)
  {
    jdField_a_of_type_AndroidContentResColorStateList = ColorStateList.valueOf(paramInt);
    a();
    invalidate();
  }
  
  public void setTextSize(float paramFloat)
  {
    Object localObject = getContext();
    if (localObject == null) {}
    for (localObject = Resources.getSystem();; localObject = ((Context)localObject).getResources())
    {
      paramFloat = TypedValue.applyDimension(1, paramFloat, ((Resources)localObject).getDisplayMetrics());
      jdField_a_of_type_AndroidTextTextPaint.setTextSize(paramFloat);
      jdField_a_of_type_AndroidGraphicsPaint$FontMetrics = jdField_a_of_type_AndroidTextTextPaint.getFontMetrics();
      requestLayout();
      return;
    }
  }
}
