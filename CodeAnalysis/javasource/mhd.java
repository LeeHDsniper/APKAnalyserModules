import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.recent.RecentT9SearchActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.t9search.T9SearchResultAdapter.ViewHolder;

public class mhd
  implements View.OnClickListener
{
  public mhd(RecentT9SearchActivity paramRecentT9SearchActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if ((paramView.getTag() instanceof T9SearchResultAdapter.ViewHolder))
    {
      paramView = getTaga;
      RecentT9SearchActivity.a(a, paramView);
    }
  }
}
