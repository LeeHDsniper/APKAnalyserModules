import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.ForwardRecentActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ixw
  implements View.OnClickListener
{
  public ixw(ForwardRecentActivity paramForwardRecentActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    a.a(ForwardRecentActivity.a(a), paramView, paramView.getId());
  }
}
