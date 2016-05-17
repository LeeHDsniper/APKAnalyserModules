import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.recent.RecommendCallHelper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class mhq
  implements View.OnClickListener
{
  public mhq(RecommendCallHelper paramRecommendCallHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (a.jdField_a_of_type_AndroidViewView$OnClickListener != null) {
      a.jdField_a_of_type_AndroidViewView$OnClickListener.onClick(paramView);
    }
    a.jdField_a_of_type_AndroidViewView.setVisibility(8);
    RecommendCallHelper.a(a, false);
    RecommendCallHelper.b(a, true);
    ReportController.b(null, "CliOper", "", "", "0X8004C0E", "0X8004C0E", 0, 0, "", "", "", "");
  }
}
