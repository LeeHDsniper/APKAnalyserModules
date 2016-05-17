import android.os.Handler;
import android.os.Message;
import com.tencent.biz.pubaccount.util.PADetailReportUtil;
import com.tencent.mobileqq.activity.contact.addcontact.AddContactsActivity;
import com.tencent.mobileqq.activity.contact.addcontact.ContactBaseView.IAddContactContext;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lpq
  extends Handler
{
  public lpq(AddContactsActivity paramAddContactsActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    case 0: 
      a.jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.b();
      a.jdField_a_of_type_Boolean = false;
      return;
    }
    PADetailReportUtil.a().a(300);
  }
}
