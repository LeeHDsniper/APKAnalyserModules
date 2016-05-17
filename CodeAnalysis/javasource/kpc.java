import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendActivity;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendGrid;
import com.tencent.mobileqq.activity.activateFriend.PositionActivatePage;
import com.tencent.mobileqq.activity.activateFriend.SendBirthdayWishesActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import mqq.util.WeakReference;

public class kpc
  implements View.OnClickListener
{
  public kpc(PositionActivatePage paramPositionActivatePage)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((PositionActivatePage.a(a) != null) && (PositionActivatePage.a(a).get() != null))
    {
      paramView = new Intent((Context)PositionActivatePage.a(a).get(), SendBirthdayWishesActivity.class);
      paramView.putExtra("key_msg_type", 1);
      paramView.putExtra("key_friend_list", a.jdField_a_of_type_ComTencentMobileqqActivityActivateFriendActivateFriendGrid.a());
      paramView.putExtra("key_roam_city", a.jdField_a_of_type_JavaLangString);
      ((ActivateFriendActivity)PositionActivatePage.a(a).get()).startActivityForResult(paramView, 1000);
      ((ActivateFriendActivity)PositionActivatePage.a(a).get()).overridePendingTransition(2130968585, 2130968589);
      ReportController.b(aa).get()).app, "CliOper", "", "", "0X8004E06", "0X8004E06", 0, 0, "", "", "", "");
    }
  }
}
