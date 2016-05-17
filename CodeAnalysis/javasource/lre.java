import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.biz.addContactTroopView.TroopCardBanner;
import com.tencent.mobileqq.activity.contact.addcontact.ContactBaseView.IAddContactContext;
import com.tencent.mobileqq.activity.contact.addcontact.TroopView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class lre
  implements View.OnClickListener
{
  public lre(TroopView paramTroopView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (TroopView.a(a) != null) {
      TroopView.a(a).d();
    }
    a.jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactBaseView$IAddContactContext.a();
    ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004BEC", "0X8004BEC", 2, 0, "", "", "", "");
  }
}
