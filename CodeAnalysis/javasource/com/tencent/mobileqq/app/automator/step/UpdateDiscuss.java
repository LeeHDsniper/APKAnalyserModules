package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import com.tencent.mobileqq.app.DiscussionHandler;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.DiscussionObserver;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import nio;

public class UpdateDiscuss
  extends AsyncStep
{
  private DiscussionObserver a;
  
  public UpdateDiscuss()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver = new nio(this, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver);
    }
    ((DiscussionHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(6)).g(Long.valueOf(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a()).longValue());
  }
  
  protected int a()
  {
    boolean bool = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a.getBoolean("isDiscussionlistok", false);
    DiscussionManager localDiscussionManager = (DiscussionManager)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getManager(52);
    if (bool)
    {
      FriendListHandler localFriendListHandler = (FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(1);
      localDiscussionManager.a();
      localFriendListHandler.a(1000, true, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(3, true, Integer.valueOf(3));
      return 7;
    }
    localDiscussionManager.a();
    c();
    return 2;
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver);
      jdField_a_of_type_ComTencentMobileqqAppDiscussionObserver = null;
    }
  }
}
