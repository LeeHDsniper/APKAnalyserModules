package com.tencent.mobileqq.activity.aio.item;

import android.view.View;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import kwc;

public class FrameAnimationActor
{
  public int a;
  public View a;
  public FrameAnimationActor.Listener a;
  private Runnable a;
  public int[] a;
  public int b;
  public int c;
  
  public FrameAnimationActor(View paramView, int[] paramArrayOfInt, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = 0;
    c = 0;
    jdField_a_of_type_JavaLangRunnable = new kwc(this);
    jdField_a_of_type_AndroidViewView = paramView;
    jdField_a_of_type_ArrayOfInt = paramArrayOfInt;
    c = paramInt;
  }
  
  public void a()
  {
    if (jdField_a_of_type_AndroidViewView != null)
    {
      jdField_a_of_type_AndroidViewView.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
      jdField_a_of_type_AndroidViewView = null;
    }
  }
  
  public void a(int paramInt)
  {
    b = paramInt;
  }
  
  public void a(long paramLong)
  {
    if (jdField_a_of_type_AndroidViewView == null) {
      return;
    }
    jdField_a_of_type_AndroidViewView.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
    jdField_a_of_type_Int = ((int)(paramLong / c));
    if (jdField_a_of_type_Int < jdField_a_of_type_ArrayOfInt.length)
    {
      jdField_a_of_type_AndroidViewView.setBackgroundResource(jdField_a_of_type_ArrayOfInt[jdField_a_of_type_Int]);
      jdField_a_of_type_AndroidViewView.post(jdField_a_of_type_JavaLangRunnable);
      return;
    }
    jdField_a_of_type_AndroidViewView.setBackgroundResource(jdField_a_of_type_ArrayOfInt[b]);
  }
  
  public void a(FrameAnimationActor.Listener paramListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioItemFrameAnimationActor$Listener = paramListener;
  }
}
