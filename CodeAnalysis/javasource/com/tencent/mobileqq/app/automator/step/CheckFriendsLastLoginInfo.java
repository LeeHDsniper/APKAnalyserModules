package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import nhf;

public class CheckFriendsLastLoginInfo
  extends AsyncStep
{
  private FriendListObserver a;
  
  public CheckFriendsLastLoginInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    if (((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(1)).e())
    {
      if (jdField_a_of_type_ComTencentMobileqqAppFriendListObserver == null)
      {
        jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new nhf(this, null);
        jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
      }
      return 2;
    }
    return 7;
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppFriendListObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
      jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = null;
    }
  }
}
