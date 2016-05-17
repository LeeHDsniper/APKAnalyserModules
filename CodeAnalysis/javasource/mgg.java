import android.widget.PopupWindow.OnDismissListener;
import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.fpsreport.FPSSwipListView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mgg
  implements PopupWindow.OnDismissListener
{
  public mgg(RecentCallHelper paramRecentCallHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss()
  {
    if ((!RecentCallHelper.b(a)) && (RecentCallHelper.a(a) != null)) {
      RecentCallHelper.a(a).postDelayed(RecentCallHelper.a(a), 1000L);
    }
  }
}
