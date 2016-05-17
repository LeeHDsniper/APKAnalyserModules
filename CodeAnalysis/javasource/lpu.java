import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.StringUtil;
import java.util.List;

public class lpu
  implements Runnable
{
  public lpu(AddContactsView paramAddContactsView, String paramString, SharedPreferences paramSharedPreferences)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    List localList = AddContactsView.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView);
    String str = AddContactsView.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView, localList);
    if (!jdField_a_of_type_JavaLangString.equals(str))
    {
      AddContactsView.b(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView, localList);
      jdField_a_of_type_AndroidContentSharedPreferences.edit().putString(AddContactsView.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView), StringUtil.a(AddContactsView.b(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView), ",")).commit();
      AddContactsView.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactAddContactsView).post(new lpv(this, str));
    }
  }
}
