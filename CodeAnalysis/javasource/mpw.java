import android.os.Handler;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.specialcare.QQSpecialFriendSettingActivity;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.FormSwitchItem;
import com.tencent.qphone.base.util.QLog;

public class mpw
  implements View.OnClickListener
{
  public mpw(QQSpecialFriendSettingActivity paramQQSpecialFriendSettingActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQSpecialFriendSettingActivity", 2, "finish all setings");
    }
    if (NetworkUtil.g(a))
    {
      boolean bool1 = QQSpecialFriendSettingActivity.a(a).a();
      boolean bool2 = QQSpecialFriendSettingActivity.b(a).a();
      paramView = QQSpecialFriendSettingActivity.a(a);
      String str = QQSpecialFriendSettingActivity.a(a);
      int i = QQSpecialFriendSettingActivity.a(a);
      paramView.a(str, new int[] { 2, 3 }, new boolean[] { bool1, bool2 }, new String[] { String.valueOf(i), null });
      paramView = a.a.obtainMessage(8193);
      obj = a.getString(2131370697);
      a.a.sendMessage(paramView);
      if ((bool1) && (bool2)) {}
      for (paramView = "0";; paramView = "1")
      {
        ReportController.b(null, "CliOper", "", "", "0X80050E2", "0X80050E2", 0, 0, paramView, "", "", "");
        return;
      }
    }
    paramView = a.a.obtainMessage(8195);
    arg1 = 0;
    arg2 = 2131366990;
    a.a.sendMessage(paramView);
  }
}
