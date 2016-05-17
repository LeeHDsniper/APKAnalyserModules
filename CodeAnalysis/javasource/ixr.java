import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.forward.ForwardAbility.ForwardAbilityType;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

public class ixr
  implements View.OnClickListener
{
  public ixr(ForwardRecentActivity paramForwardRecentActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    paramView = new Bundle();
    paramView.putString("uin", String.valueOf(AppConstants.aj));
    paramView.putInt("uintype", -1);
    a.a.a(ForwardAbility.ForwardAbilityType.l.intValue(), paramView);
    ReportController.b(a.app, "CliOper", "", "", "0X8004051", "0X8004051", 0, 0, "", "", "", "");
  }
}
