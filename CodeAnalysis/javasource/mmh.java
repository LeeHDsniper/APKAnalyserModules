import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.common.app.InnerFrameManager;
import com.tencent.mobileqq.activity.selectmember.RenMaiQuanTeamListInnerFrame;
import com.tencent.mobileqq.data.CircleGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

class mmh
  implements View.OnClickListener
{
  mmh(mmg paramMmg, CircleGroup paramCircleGroup)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Bundle();
    paramView.putInt("group_uin", jdField_a_of_type_ComTencentMobileqqDataCircleGroup.groupId);
    paramView.putString("group_name", jdField_a_of_type_ComTencentMobileqqDataCircleGroup.groupName);
    jdField_a_of_type_Mmg.a.jdField_a_of_type_ComTencentCommonAppInnerFrameManager.a(7, paramView);
    ReportController.b(jdField_a_of_type_Mmg.a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Network_circle", "Mutichat_circle_grp", 0, 0, String.valueOf(jdField_a_of_type_ComTencentMobileqqDataCircleGroup.groupId), "", "", "");
  }
}
