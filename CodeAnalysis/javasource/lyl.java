import android.widget.TextView;
import com.tencent.mobileqq.activity.phone.ContactListView;
import com.tencent.mobileqq.activity.phone.DialogBaseActivity;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.qphone.base.util.QLog;

public class lyl
  extends ContactBindObserver
{
  private lyl(ContactListView paramContactListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d(ContactListView.a(), 2, "onHideContact isSuccess=" + paramBoolean);
    }
    if ((paramBoolean) && ((a.jdField_a_of_type_Int == 4) || (a.jdField_a_of_type_Int == 5))) {
      a.j();
    }
  }
  
  protected void a(boolean paramBoolean, int paramInt)
  {
    if ((!paramBoolean) || (!NetworkUtil.e(a.getContext())))
    {
      a.i();
      a.g();
    }
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = a.jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d();
    if (!paramBoolean1)
    {
      a.i();
      a.g();
      if (((i == 0) || (i == 4)) && (a.m == 0)) {
        a.a(2131368362, 3000L);
      }
    }
    do
    {
      return;
      a.jdField_a_of_type_AndroidWidgetTextView.setEnabled(true);
      if (a.jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.d())
      {
        a.a(2131368360, 0L, false);
        return;
      }
    } while (i != 4);
    DialogBaseActivity.a(a.jdField_a_of_type_ComTencentMobileqqAppBaseActivity, a);
  }
  
  protected void b(boolean paramBoolean, int paramInt)
  {
    if (paramBoolean)
    {
      a.i();
      ContactListView.a(a, true);
      if ((paramInt & 0x1) == 0) {
        a.g();
      }
    }
    for (;;)
    {
      if (a.jdField_a_of_type_Int == 6) {
        a.f();
      }
      return;
      a.g();
    }
  }
}
