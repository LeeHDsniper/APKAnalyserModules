package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopHandler;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.TroopObserver;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.data.QQEntityManagerFactory;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import nis;

public class UpdateTroop
  extends AsyncStep
{
  private TroopObserver a;
  
  public UpdateTroop()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppTroopObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppTroopObserver = new nis(this, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
    }
    ((TroopHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(20)).a();
  }
  
  protected int a()
  {
    if (h == 4)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.e = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a.getBoolean("isTrooplistok", false);
      Object localObject = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a();
      if (((localObject instanceof QQEntityManagerFactory)) && (((QQEntityManagerFactory)localObject).isUpdated())) {
        jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.e = false;
      }
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a();
      localObject = (TroopManager)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.getManager(51);
      if (jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.e)
      {
        if (QLog.isColorLevel()) {
          QLog.d("QQInitHandler", 2, "onCheckTroopList:Done");
        }
        TroopHandler localTroopHandler = (TroopHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(20);
        ((TroopManager)localObject).a();
        localTroopHandler.a(1, true, null);
        jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(3, true, Integer.valueOf(2));
        return 7;
      }
      ((TroopManager)localObject).a();
      c();
    }
    for (;;)
    {
      return 2;
      c();
    }
  }
  
  public void a()
  {
    i = 2;
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppTroopObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_ComTencentMobileqqAppTroopObserver);
      jdField_a_of_type_ComTencentMobileqqAppTroopObserver = null;
    }
  }
}
