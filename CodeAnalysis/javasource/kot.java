import android.content.res.Resources;
import android.view.View;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendsManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class kot
  implements ActionSheet.OnButtonClickListener
{
  public kot(ActivateFriendActivity paramActivateFriendActivity, ActionSheet paramActionSheet)
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
      jdField_a_of_type_ComTencentWidgetActionSheet.dismiss();
      return;
      if (ActivateFriendActivity.a(jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendActivity) == null) {
        ActivateFriendActivity.a(jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendActivity, (ActivateFriendsManager)jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendActivity.app.getManager(84));
      }
      if (NetworkUtil.e(jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendActivity))
      {
        paramView = ActivateFriendActivity.a(jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendActivity);
        if (!ActivateFriendActivity.a(jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendActivity)) {}
        for (boolean bool = true;; bool = false)
        {
          paramView.a(bool, true);
          break;
        }
      }
      if ((!jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendActivity.isFinishing()) && (jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendActivity != null)) {
        QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendActivity, 1, jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendActivity.getResources().getString(2131368714), 0).b(jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendActivity.getTitleBarHeight());
      }
    }
  }
}
