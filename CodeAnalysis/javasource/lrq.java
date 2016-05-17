import android.view.View;
import com.tencent.mobileqq.activity.contact.newfriend.NewFriendActivity;
import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgListView;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ActionSheet;
import com.tencent.widget.ActionSheet.OnButtonClickListener;

public class lrq
  implements ActionSheet.OnButtonClickListener
{
  public lrq(NewFriendActivity paramNewFriendActivity, ActionSheet paramActionSheet)
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
      if (NewFriendActivity.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendNewFriendActivity) != null) {
        NewFriendActivity.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendNewFriendActivity).k();
      }
      paramView = new lrr(this);
      jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendNewFriendActivity.app.a(paramView);
    }
  }
}
