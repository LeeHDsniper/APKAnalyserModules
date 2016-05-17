import SecurityAccountServer.RespondQueryQQBindingStat;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class nbk
  implements Runnable
{
  public nbk(PhoneContactManagerImp paramPhoneContactManagerImp, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d();
    Object localObject = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.a();
    if (QLog.isColorLevel())
    {
      StringBuilder localStringBuilder = new StringBuilder().append("checkListState, bindState = ").append(i);
      if (localObject == null)
      {
        localObject = ",getSelfBindInfo is null";
        QLog.d("PhoneContact.Manager", 2, (String)localObject + ", changed = " + jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.g + ", firstQuery = " + jdField_a_of_type_Boolean);
      }
    }
    else
    {
      if ((i == 5) || (!jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d())) {
        break label136;
      }
      jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.h();
    }
    label136:
    while ((!jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.c()) || ((!jdField_a_of_type_Boolean) && (!jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.g)))
    {
      return;
      localObject = ", lastFlag = " + lastUsedFlag;
      break;
    }
    PhoneContactManagerImp.d(jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp);
  }
}
