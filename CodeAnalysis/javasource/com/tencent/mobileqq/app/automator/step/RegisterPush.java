package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import mqq.observer.AccountObserver;
import nil;

public class RegisterPush
  extends AsyncStep
{
  private AccountObserver a;
  
  public RegisterPush()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    if (jdField_a_of_type_MqqObserverAccountObserver == null)
    {
      jdField_a_of_type_MqqObserverAccountObserver = new nil(this, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.registObserver(jdField_a_of_type_MqqObserverAccountObserver);
    }
    jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a().e();
    jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.m();
    return 2;
  }
  
  public void a()
  {
    if (h == 13)
    {
      i = 0;
      return;
    }
    i = 10;
  }
  
  public void a(int paramInt)
  {
    if (paramInt == 4)
    {
      jdField_a_of_type_Boolean = false;
      if (QLog.isColorLevel()) {
        QLog.d("QQInitHandler", 2, b + " RESULT_NET_CONNECT resend request!");
      }
    }
    super.a(paramInt);
  }
  
  public void b()
  {
    if (jdField_a_of_type_MqqObserverAccountObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.unRegistObserver(jdField_a_of_type_MqqObserverAccountObserver);
      jdField_a_of_type_MqqObserverAccountObserver = null;
    }
    if ((h == 12) && (g == 6)) {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.g();
    }
  }
}
