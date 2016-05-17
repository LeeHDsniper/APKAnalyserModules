import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mgm
  implements View.OnClickListener
{
  public mgm(RecentCallHelper paramRecentCallHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    a.g();
    paramView = a.a.getPreferences().edit();
    paramView.putInt("funcall_RecentCall_Tipsnum", 4);
    paramView.commit();
  }
}
