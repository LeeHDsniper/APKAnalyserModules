import android.view.View;
import android.view.View.OnClickListener;
import com.tencent.mobileqq.activity.recent.OnRecentUserOpsListener;
import com.tencent.mobileqq.activity.recent.RecommendAdapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mhp
  implements View.OnClickListener
{
  public mhp(RecommendAdapter paramRecommendAdapter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    String str = (String)paramView.getTag();
    if (RecommendAdapter.a(a) != null) {
      RecommendAdapter.a(a).a(paramView, str);
    }
  }
}
