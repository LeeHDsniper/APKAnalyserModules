import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.tencent.mobileqq.activity.recent.Banner;
import com.tencent.mobileqq.activity.recent.BannerManager;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.struct.PushBanner;
import com.tencent.mobileqq.widget.ADView;
import java.util.LinkedList;
import java.util.List;
import mqq.os.MqqHandler;

public class mfl
  implements View.OnClickListener
{
  public mfl(BannerManager paramBannerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    BannerManager.a(a).getSharedPreferences("mobileQQ", 0).edit().putBoolean("push_banner_display" + aa).app.getAccount(), false).commit();
    paramView = BannerManager.a(a)[16];
    ADView localADView;
    if ((paramView != null) && (a != null))
    {
      localADView = (ADView)a.findViewById(2131298629);
      if (localADView == null) {
        break label225;
      }
    }
    label225:
    for (paramView = localADView.a(0);; paramView = null)
    {
      if (paramView != null)
      {
        int j = paramView.getChildCount();
        LinkedList localLinkedList = new LinkedList();
        int i = 0;
        while (i < j)
        {
          View localView = paramView.getChildAt(i);
          if (localView != null) {
            localLinkedList.add((PushBanner)localView.getTag());
          }
          i += 1;
        }
        ThreadManager.a().post(new mfm(this, j, localLinkedList));
        if (localADView != null) {
          localADView.a();
        }
      }
      a.a(16, 0);
      a.a(-1, null);
      a.b = false;
      return;
    }
  }
}
