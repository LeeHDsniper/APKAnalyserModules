package com.tencent.mobileqq.activity.aio.anim;

import android.content.Context;
import android.graphics.Matrix;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.Transformation;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import com.tencent.widget.ListView;

public class AIOAnimationConatiner
  extends ViewGroup
{
  public static final int a = 100;
  public static final ViewGroup.LayoutParams a;
  public static ClassLoader a;
  public static final int b = 200;
  public static final int c = 300;
  public static final int d = 0;
  public static final int e = 1;
  public static final int f = 2;
  public static final int g = 3;
  public static final int h = 4;
  private AIOAnimationConatiner.AIOAnimator a;
  public ListView a;
  private int i;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewViewGroup$LayoutParams = new ViewGroup.LayoutParams(-2, -2);
    jdField_a_of_type_JavaLangClassLoader = AIOAnimationConatiner.class.getClassLoader();
  }
  
  public AIOAnimationConatiner(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AIOAnimationConatiner(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  private AIOAnimationConatiner.AIOAnimator a(int paramInt)
  {
    if (paramInt == 2) {
      return new FloorJumperSet(paramInt, this, jdField_a_of_type_ComTencentWidgetListView);
    }
    if (paramInt == 1) {
      return new ComboAnimation3(paramInt, this, jdField_a_of_type_ComTencentWidgetListView);
    }
    if (paramInt == 0) {
      return new BubbleAnimation(paramInt, this, jdField_a_of_type_ComTencentWidgetListView);
    }
    if (paramInt == 4) {
      return new PathAnimation(paramInt, this, jdField_a_of_type_ComTencentWidgetListView);
    }
    if (paramInt == 3) {}
    return null;
  }
  
  private void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAnimationContainer", 2, "animation end");
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator = null;
    removeAllViewsInLayout();
    invalidate();
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.c();
    }
    d();
  }
  
  public void a(int paramInt)
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator != null) && (paramInt == i)) {
      a();
    }
  }
  
  public void a(int paramInt1, int paramInt2, Object... paramVarArgs)
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator != null) && (paramInt2 < jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a)) {}
    do
    {
      do
      {
        return;
        if ((jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator != null) && (paramInt2 == jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a) && (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a(paramInt1)))
        {
          jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a(paramVarArgs);
          return;
        }
        a();
        i = paramInt1;
        jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator = a(paramInt1);
      } while (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator == null);
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a = paramInt2;
    } while (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a(paramVarArgs));
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator = null;
  }
  
  public boolean addViewInLayout(View paramView, int paramInt, ViewGroup.LayoutParams paramLayoutParams, boolean paramBoolean)
  {
    return super.addViewInLayout(paramView, paramInt, paramLayoutParams, paramBoolean);
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a();
    }
  }
  
  public void b(int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a(paramInt);
    }
  }
  
  public void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.b();
    }
  }
  
  protected boolean getChildStaticTransformation(View paramView, Transformation paramTransformation)
  {
    Object localObject = paramView.getTag();
    if ((VersionUtils.e()) && ((localObject instanceof AnimationPath.Values)) && (b))
    {
      localObject = (AnimationPath.Values)localObject;
      Matrix localMatrix = paramTransformation.getMatrix();
      localMatrix.reset();
      int j = paramView.getWidth() / 2;
      int k = paramView.getHeight() / 2;
      localMatrix.preRotate(a, j, k);
      localMatrix.preScale(d, e, k, k);
      paramTransformation.setAlpha(f);
      return true;
    }
    return false;
  }
  
  public boolean isInEditMode()
  {
    return true;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    }
  }
}
