package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import com.tencent.mobileqq.app.PublicAccountHandler;
import com.tencent.mobileqq.app.PublicAccountObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import nhi;

public class CheckPublicAccount
  extends AsyncStep
{
  PublicAccountObserver a;
  
  public CheckPublicAccount()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    Object localObject = (PublicAccountHandler)jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(11);
    if (h == 6)
    {
      if (!jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a.getBoolean("isPublicAccountListOK", false))
      {
        c();
        ((PublicAccountHandler)localObject).b();
        ((PublicAccountHandler)localObject).a();
        return 2;
      }
    }
    else
    {
      boolean bool = ((PublicAccountHandler)localObject).c();
      if (bool)
      {
        c();
        ((PublicAccountHandler)localObject).a();
      }
      localObject = jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a().createEntityManager();
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a().a((EntityManager)localObject);
      if (bool) {
        return 2;
      }
    }
    return 7;
  }
  
  public void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.b(jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver);
      jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver = null;
    }
  }
  
  void c()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver = new nhi(this, null);
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b.a(jdField_a_of_type_ComTencentMobileqqAppPublicAccountObserver);
    }
  }
}
