import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.NearbyBaseActivity;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendActivity;
import com.tencent.mobileqq.activity.activateFriend.PositionActivatePage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import mqq.util.WeakReference;

public class kpd
  implements View.OnClickListener
{
  public kpd(PositionActivatePage paramPositionActivatePage)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((PositionActivatePage.a(a) != null) && (PositionActivatePage.a(a).get() != null))
    {
      paramView = new Intent((Context)PositionActivatePage.a(a).get(), NearbyBaseActivity.class);
      paramView.putExtra("ENTER_TIME", System.currentTimeMillis());
      paramView.putExtra("FROM_WHERE", 1002);
      paramView.putExtra("is_skip_nearby_guide", true);
      paramView.setFlags(67108864);
      ((ActivateFriendActivity)PositionActivatePage.a(a).get()).startActivity(paramView);
      ReportController.b(aa).get()).app, "CliOper", "", "", "0X8004E07", "0X8004E07", 0, 0, "", "", "", "");
    }
  }
}
