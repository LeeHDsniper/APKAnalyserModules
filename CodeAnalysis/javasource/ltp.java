import android.view.View;
import android.widget.TextView;
import com.tencent.mobileqq.activity.contact.troop.RecommendTroopView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.activity.RecommendTroopAdapter;
import com.tencent.widget.SwipListView;
import java.util.ArrayList;
import java.util.List;

public class ltp
  implements Runnable
{
  public ltp(RecommendTroopView paramRecommendTroopView, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0)) {
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopRecommendTroopView.jdField_a_of_type_ComTencentMobileqqTroopActivityRecommendTroopAdapter.a(jdField_a_of_type_JavaUtilList);
    }
    for (;;)
    {
      RecommendTroopView.b(jdField_a_of_type_ComTencentMobileqqActivityContactTroopRecommendTroopView);
      if (!jdField_a_of_type_ComTencentMobileqqActivityContactTroopRecommendTroopView.d)
      {
        jdField_a_of_type_ComTencentMobileqqActivityContactTroopRecommendTroopView.k();
        jdField_a_of_type_ComTencentMobileqqActivityContactTroopRecommendTroopView.d = true;
      }
      return;
      ArrayList localArrayList = new ArrayList();
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopRecommendTroopView.jdField_a_of_type_ComTencentMobileqqTroopActivityRecommendTroopAdapter.a(localArrayList);
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopRecommendTroopView.jdField_a_of_type_ComTencentWidgetSwipListView.setEmptyView(jdField_a_of_type_ComTencentMobileqqActivityContactTroopRecommendTroopView.b);
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopRecommendTroopView.f.setPadding(0, 0, 0, 0);
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopRecommendTroopView.e.setVisibility(8);
      jdField_a_of_type_ComTencentMobileqqActivityContactTroopRecommendTroopView.jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      ReportController.b(null, "P_CliOper", "Grp_recom", "", "msg_page", "exp_blank", 0, 0, "", "", "", "");
    }
  }
}
