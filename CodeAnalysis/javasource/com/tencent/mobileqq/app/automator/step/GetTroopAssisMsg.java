package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import nid;

public class GetTroopAssisMsg
  extends AsyncStep
{
  private MessageObserver a;
  
  public GetTroopAssisMsg()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a().a(3, true);
    return 2;
  }
  
  public void a()
  {
    super.a();
    if (jdField_a_of_type_ComTencentMobileqqAppMessageObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new nid(this, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.c(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    }
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMessageObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
      jdField_a_of_type_ComTencentMobileqqAppMessageObserver = null;
    }
  }
}
