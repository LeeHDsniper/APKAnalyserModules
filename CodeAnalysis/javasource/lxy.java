import SecurityAccountServer.RespondQueryQQBindingStat;
import android.text.TextUtils;
import com.tencent.mobileqq.activity.phone.BindNumberBusinessActivity;
import com.tencent.mobileqq.activity.phone.BindNumberDialogActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.qphone.base.util.QLog;

public class lxy
  extends ContactBindObserver
{
  public lxy(BindNumberDialogActivity paramBindNumberDialogActivity, PhoneContactManager paramPhoneContactManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    jdField_a_of_type_ComTencentMobileqqActivityPhoneBindNumberDialogActivity.app.unRegistObserver(this);
    jdField_a_of_type_ComTencentMobileqqActivityPhoneBindNumberDialogActivity.a = null;
    jdField_a_of_type_ComTencentMobileqqActivityPhoneBindNumberDialogActivity.b();
    RespondQueryQQBindingStat localRespondQueryQQBindingStat = jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager.a();
    int i = jdField_a_of_type_ComTencentMobileqqModelPhoneContactManager.d();
    if (localRespondQueryQQBindingStat != null)
    {
      if ((type == 0) && (!TextUtils.isEmpty(mobileNo)) && (i != 2))
      {
        jdField_a_of_type_ComTencentMobileqqActivityPhoneBindNumberDialogActivity.c = mobileNo;
        BindNumberDialogActivity.a(jdField_a_of_type_ComTencentMobileqqActivityPhoneBindNumberDialogActivity);
        return;
      }
      if ((1 == type) && (QLog.isColorLevel())) {
        QLog.d("BindNumberBusinessActivity", 2, "already bind mobile = " + mobileNo);
      }
    }
    BindNumberBusinessActivity.a(jdField_a_of_type_ComTencentMobileqqActivityPhoneBindNumberDialogActivity, jdField_a_of_type_ComTencentMobileqqActivityPhoneBindNumberDialogActivity.c, jdField_a_of_type_ComTencentMobileqqActivityPhoneBindNumberDialogActivity.b);
    jdField_a_of_type_ComTencentMobileqqActivityPhoneBindNumberDialogActivity.finish();
  }
}
