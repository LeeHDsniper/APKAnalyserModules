import android.view.View;
import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.fpsreport.FPSSwipListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mgt
  implements Runnable
{
  public mgt(RecentCallHelper paramRecentCallHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    View localView;
    if (RecentCallHelper.a(a) != null)
    {
      if (!RecentCallHelper.a(a)) {
        break label63;
      }
      localView = RecentCallHelper.a(a).findViewById(2131301094);
      if ((localView != null) && (a.a != null)) {
        RecentCallHelper.a(a, a.a, localView);
      }
    }
    label63:
    do
    {
      return;
      localView = RecentCallHelper.a(a).findViewById(2131301091);
    } while ((localView == null) || (a.a == null));
    RecentCallHelper.b(a, a.a, localView);
  }
}
