package com.tencent.mobileqq.activity.aio.tips;

import android.app.Activity;
import android.content.res.Resources;
import android.view.View;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.TipsBar;
import lmr;

public class CommingRingTipsBar
  implements TipsBarTask
{
  static final String a;
  public Activity a;
  public TipsManager a;
  public QQAppInterface a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = CommingRingTipsBar.class.getSimpleName();
  }
  
  public CommingRingTipsBar(QQAppInterface paramQQAppInterface, TipsManager paramTipsManager, Activity paramActivity)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioTipsTipsManager = paramTipsManager;
    jdField_a_of_type_AndroidAppActivity = paramActivity;
  }
  
  public int a()
  {
    return 11;
  }
  
  public View a(Object... paramVarArgs)
  {
    paramVarArgs = new TipsBar(jdField_a_of_type_AndroidAppActivity);
    paramVarArgs.setTipsText(jdField_a_of_type_AndroidAppActivity.getResources().getString(2131370035));
    paramVarArgs.setTipsIcon(jdField_a_of_type_AndroidAppActivity.getResources().getDrawable(2130840227));
    paramVarArgs.setContentDescription(jdField_a_of_type_AndroidAppActivity.getResources().getString(2131370035));
    paramVarArgs.setOnClickListener(new lmr(this));
    return paramVarArgs;
  }
  
  public void a(int paramInt, Object... paramVarArgs) {}
  
  public int[] a()
  {
    return null;
  }
  
  public int b()
  {
    return 37;
  }
}
