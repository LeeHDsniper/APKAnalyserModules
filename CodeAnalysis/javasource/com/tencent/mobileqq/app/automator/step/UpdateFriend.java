package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import niq;

public class UpdateFriend
  extends AsyncStep
{
  private FriendListObserver a;
  
  public UpdateFriend()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppFriendListObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new niq(this, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    }
    ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(1)).f(0);
  }
  
  private void d()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppFriendListObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new niq(this, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
    }
    ((FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(1)).a(true);
  }
  
  protected int a()
  {
    if (h == 3)
    {
      boolean bool = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a.getBoolean("isFriendlistok", false);
      if (QLog.isColorLevel()) {
        QLog.d("QQInitHandler", 2, "doStep PREF_ISFRIENDLIST_OK=" + bool);
      }
      FriendsManager localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getManager(50);
      if (bool)
      {
        FriendListHandler localFriendListHandler = (FriendListHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(1);
        bool = localFriendsManager.a();
        localFriendsManager.c();
        localFriendListHandler.a(1, bool, Boolean.valueOf(bool));
        jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(3, true, Integer.valueOf(1));
        return 7;
      }
      localFriendsManager.a();
      localFriendsManager.c();
      d();
      return 2;
    }
    if (h == 7)
    {
      d();
      return 2;
    }
    c();
    return 2;
  }
  
  public void a()
  {
    if (h == 3) {
      ((PhoneContactManagerImp)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getManager(10)).d();
    }
    if (h == 8) {}
    for (int i = 0;; i = 2)
    {
      this.i = i;
      return;
    }
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
