import android.content.Intent;
import android.view.View;
import com.tencent.mobileqq.activity.ProfileActivity;
import com.tencent.mobileqq.activity.ProfileActivity.AllInOne;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.activity.photo.PhotoUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.ProfileCardUtil;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class lxd
  implements ActionSheet.OnButtonClickListener
{
  public lxd(AvatarPendantActivity paramAvatarPendantActivity, ActionSheet paramActionSheet)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void OnClick(View paramView, int paramInt)
  {
    switch (paramInt)
    {
    }
    for (;;)
    {
      try
      {
        jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
        return;
      }
      catch (Exception paramView)
      {
        paramView.printStackTrace();
      }
      jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity.f();
      jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity.jdField_a_of_type_AndroidNetUri = ProfileActivity.a(jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity, 5);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity.app, "CliOper", "", "", "0X8004176", "0X8004176", jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity.jdField_a_of_type_ComTencentMobileqqActivityProfileActivity$AllInOne.g, 0, "", "", "", "");
      continue;
      jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity.f();
      paramView = new Intent();
      paramInt = Math.min(482, ProfileCardUtil.a(jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity));
      paramView.putExtra("PhotoConst.PHOTO_LIST_SHOW_PREVIEW", true);
      paramView.putExtra("Business_Origin", 100);
      paramView.putExtra("fromWhereClick", 11);
      PhotoUtils.a(paramView, jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity, AvatarPendantActivity.class.getName(), paramInt, paramInt, 640, 640, ProfileCardUtil.a());
      ReportController.b(jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity.app, "CliOper", "", "", "0X8004177", "0X8004177", jdField_a_of_type_ComTencentMobileqqActivityPendantAvatarPendantActivity.jdField_a_of_type_ComTencentMobileqqActivityProfileActivity$AllInOne.g, 0, "", "", "", "");
    }
  }
}
