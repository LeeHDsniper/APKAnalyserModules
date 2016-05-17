import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import com.tencent.mobileqq.activity.recent.RecentT9SearchActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mhf
  implements View.OnClickListener
{
  public mhf(RecentT9SearchActivity paramRecentT9SearchActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    RecentT9SearchActivity.a(a).setCursorVisible(true);
    RecentT9SearchActivity.a(a, paramView);
    a.b();
  }
}
