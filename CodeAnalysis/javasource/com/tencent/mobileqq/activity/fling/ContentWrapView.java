package com.tencent.mobileqq.activity.fling;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.util.AttributeSet;
import android.widget.RelativeLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import luk;

public class ContentWrapView
  extends RelativeLayout
{
  private Matrix jdField_a_of_type_AndroidGraphicsMatrix;
  private luk jdField_a_of_type_Luk;
  
  public ContentWrapView(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsMatrix = new Matrix();
    a(paramContext);
  }
  
  public ContentWrapView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public ContentWrapView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_AndroidGraphicsMatrix = new Matrix();
    a(paramContext);
  }
  
  private void a()
  {
    luk localLuk = jdField_a_of_type_Luk;
    if (localLuk == null) {}
    while (!jdField_a_of_type_Boolean) {
      return;
    }
    luk.a(localLuk).setTranslate(jdField_a_of_type_Float, b);
    jdField_a_of_type_Boolean = false;
  }
  
  private void a(Context paramContext)
  {
    setWillNotDraw(false);
  }
  
  public void draw(Canvas paramCanvas)
  {
    luk localLuk = jdField_a_of_type_Luk;
    if (localLuk != null)
    {
      a();
      paramCanvas.concat(luk.a(localLuk));
    }
    super.draw(paramCanvas);
  }
  
  public void ensureTransformationInfo()
  {
    if (jdField_a_of_type_Luk == null) {
      jdField_a_of_type_Luk = new luk();
    }
  }
  
  public float getTransX()
  {
    if (jdField_a_of_type_Luk != null) {
      return jdField_a_of_type_Luk.jdField_a_of_type_Float;
    }
    return 0.0F;
  }
  
  public float getTransY()
  {
    if (jdField_a_of_type_Luk != null) {
      return jdField_a_of_type_Luk.b;
    }
    return 0.0F;
  }
  
  public void transX(float paramFloat)
  {
    ensureTransformationInfo();
    luk localLuk = jdField_a_of_type_Luk;
    if (jdField_a_of_type_Float != paramFloat)
    {
      jdField_a_of_type_Float = paramFloat;
      jdField_a_of_type_Boolean = true;
      invalidate();
    }
  }
  
  public void transXBy(float paramFloat)
  {
    if (paramFloat != 0.0F) {
      transX(getTransX() + paramFloat);
    }
  }
  
  public void transY(float paramFloat)
  {
    ensureTransformationInfo();
    luk localLuk = jdField_a_of_type_Luk;
    if (b != paramFloat)
    {
      b = paramFloat;
      jdField_a_of_type_Boolean = true;
      invalidate();
    }
  }
  
  public void transYBy(float paramFloat)
  {
    if (paramFloat != 0.0F) {
      transX(getTransX() + paramFloat);
    }
  }
}
