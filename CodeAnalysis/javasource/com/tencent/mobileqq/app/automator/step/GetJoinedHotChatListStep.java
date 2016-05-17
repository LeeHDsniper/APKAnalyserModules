package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.HotChatHandler;
import com.tencent.mobileqq.app.HotChatManager;
import com.tencent.mobileqq.app.HotChatObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import nhx;

public class GetJoinedHotChatListStep
  extends AsyncStep
{
  private HotChatObserver a;
  
  public GetJoinedHotChatListStep()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    if (!HotChatManager.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b)) {
      return 7;
    }
    HotChatHandler localHotChatHandler = (HotChatHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(35);
    localHotChatHandler.b();
    jdField_a_of_type_ComTencentMobileqqAppHotChatObserver = new nhx(this, null);
    jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(jdField_a_of_type_ComTencentMobileqqAppHotChatObserver);
    localHotChatHandler.a();
    return 2;
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppHotChatObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_ComTencentMobileqqAppHotChatObserver);
      jdField_a_of_type_ComTencentMobileqqAppHotChatObserver = null;
    }
  }
}
