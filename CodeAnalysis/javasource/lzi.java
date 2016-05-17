import android.content.Intent;
import com.tencent.mobileqq.activity.phone.ContactListView;
import com.tencent.mobileqq.activity.phone.PhoneMatchView;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class lzi
  extends ContactBindObserver
{
  public lzi(PhoneMatchView paramPhoneMatchView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, int paramInt)
  {
    if (a.jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver != null)
    {
      a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.unRegistObserver(a.jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
      a.jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = null;
    }
    a.g();
    if (paramBoolean)
    {
      if (a.jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver != null)
      {
        a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.unRegistObserver(a.jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver);
        a.jdField_a_of_type_ComTencentMobileqqPhonecontactContactBindObserver = null;
      }
      if (a.jdField_a_of_type_Int == 2)
      {
        a.jdField_a_of_type_ComTencentMobileqqAppBaseActivity.setResult(-1);
        a.f();
        return;
      }
      Intent localIntent = new Intent(a.getContext(), ContactListView.class);
      a.a(localIntent);
      return;
    }
    a.a("更新失败，请稍后重试。");
  }
}
