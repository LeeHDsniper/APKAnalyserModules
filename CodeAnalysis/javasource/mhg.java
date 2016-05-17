import android.view.View;
import android.view.View.OnFocusChangeListener;
import com.tencent.mobileqq.activity.recent.RecentT9SearchActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mhg
  implements View.OnFocusChangeListener
{
  public mhg(RecentT9SearchActivity paramRecentT9SearchActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onFocusChange(View paramView, boolean paramBoolean)
  {
    RecentT9SearchActivity.a(a, paramView);
    if (paramBoolean) {
      a.b();
    }
  }
}
