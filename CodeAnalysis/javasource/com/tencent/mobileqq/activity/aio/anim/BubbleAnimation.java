package com.tencent.mobileqq.activity.aio.anim;

import com.tencent.mobileqq.bubble.AnimationConfig;
import com.tencent.mobileqq.bubble.BubbleInfo.CommonAttrs;
import com.tencent.mobileqq.bubble.BubbleNewAIOAnim;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.Pair;
import com.tencent.widget.ListView;

public class BubbleAnimation
  extends AIOAnimationConatiner.AIOAnimator
{
  private AIOAnimationConatiner.AIOAnimator jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator;
  private SigTlpAnimation jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation;
  private XBubbleAnimation jdField_a_of_type_ComTencentMobileqqActivityAioAnimXBubbleAnimation;
  
  public BubbleAnimation(int paramInt, AIOAnimationConatiner paramAIOAnimationConatiner, ListView paramListView)
  {
    super(paramInt, paramAIOAnimationConatiner, paramListView);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private boolean b(Object... paramVarArgs)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramVarArgs.length == 4)
    {
      bool1 = bool2;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner != null)
      {
        bool1 = bool2;
        if (jdField_a_of_type_ComTencentWidgetListView != null)
        {
          if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator == null) {
            jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator = new BubbleNewAIOAnim(0, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner, jdField_a_of_type_ComTencentWidgetListView);
          }
          bool1 = jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a(paramVarArgs);
        }
      }
    }
    return bool1;
  }
  
  private boolean c(Object... paramVarArgs)
  {
    boolean bool = ((Boolean)paramVarArgs[4]).booleanValue();
    if (((paramVarArgs[5] != null) || (bool)) && (jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation != null)) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation.a(true);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation = new SigTlpAnimation(jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner, jdField_a_of_type_ComTencentWidgetListView);
    return jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation.a(paramVarArgs);
  }
  
  private boolean d(Object... paramVarArgs)
  {
    Pair localPair = null;
    if (paramVarArgs.length == 3) {
      localPair = (Pair)paramVarArgs[2];
    }
    if ((localPair == null) || (first == null)) {
      return false;
    }
    if (first).a.n == 1)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimXBubbleAnimation != null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioAnimXBubbleAnimation.e();
      }
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimXBubbleAnimation = new XBubbleAnimation(jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner, jdField_a_of_type_ComTencentWidgetListView);
      return jdField_a_of_type_ComTencentMobileqqActivityAioAnimXBubbleAnimation.a(paramVarArgs);
    }
    return false;
  }
  
  protected void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation.a();
    }
  }
  
  protected void a(int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimXBubbleAnimation != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimXBubbleAnimation.a(paramInt);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a(paramInt);
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation.a(paramInt);
    }
  }
  
  protected boolean a(int paramInt)
  {
    return true;
  }
  
  protected boolean a(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    boolean bool1 = false;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator != null) {}
    for (boolean bool2 = jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.a(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);; bool2 = false)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimXBubbleAnimation != null) {
        if ((!jdField_a_of_type_ComTencentMobileqqActivityAioAnimXBubbleAnimation.a(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4)) && (!bool2)) {}
      }
      for (bool1 = true;; bool1 = bool2)
      {
        if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation != null) {
          bool1 = jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation.a(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
        }
        return bool1;
      }
    }
  }
  
  protected boolean a(Object... paramVarArgs)
  {
    int i = ((Integer)paramVarArgs[0]).intValue();
    if ((i == 0) || (i == 1)) {
      return d(paramVarArgs);
    }
    if ((i == 5) || (i == 3) || (i == 2)) {
      return b(paramVarArgs);
    }
    if (i == 4) {
      return c(paramVarArgs);
    }
    return false;
  }
  
  protected void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation.b();
    }
  }
  
  protected void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimXBubbleAnimation != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimXBubbleAnimation.e();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimAIOAnimationConatiner$AIOAnimator.c();
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimSigTlpAnimation.a(true);
    }
  }
}
