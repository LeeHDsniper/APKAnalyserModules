import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import com.tencent.mobileqq.activity.contact.newfriend.RecommendListView;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.RecommendContactMsg;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.widget.SlideDetectListView;

public class lsb
  implements View.OnClickListener
{
  public lsb(RecommendListView paramRecommendListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == 2131296706)
    {
      a.jdField_a_of_type_ComTencentMobileqqWidgetSlideDetectListView.c();
      if (a.jdField_a_of_type_Lsj != null) {
        a.jdField_a_of_type_Lsj.a = -1;
      }
      paramView = (Button)paramView;
      if (paramView.getTag() != null)
      {
        int i = ((Integer)paramView.getTag()).intValue();
        paramView = (RecommendContactMsg)a.jdField_a_of_type_Lsj.getItem(i);
        PhoneContactManagerImp localPhoneContactManagerImp = (PhoneContactManagerImp)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
        if ((paramView != null) && (source != null) && (source.length() > 0)) {}
        ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "frd_recommend", "Delete_frd_offer", 0, 0, "0", "", "", "");
      }
    }
  }
}
