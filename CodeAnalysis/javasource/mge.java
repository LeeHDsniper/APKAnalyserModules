import android.content.SharedPreferences;
import com.tencent.mobileqq.activity.recent.LightTalkTipsData;
import com.tencent.mobileqq.activity.recent.RecentCallHelper;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.jumplightalk.CallRedDotLightalkLis;
import com.tencent.mobileqq.troop.widget.RedDotRadioButton;
import com.tencent.mobileqq.utils.SharedPreUtils;

public class mge
  implements CallRedDotLightalkLis
{
  public mge(RecentCallHelper paramRecentCallHelper)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    int k = 0;
    if (a.a != null) {}
    for (int i = SharedPreUtils.a(a.a.a()).getInt("show_tab_lightalk_tips", 0);; i = 0)
    {
      int j = k;
      if (i >= 0)
      {
        j = k;
        if (i < 3)
        {
          j = k;
          if (LightTalkTipsData.a() != null) {
            j = 1;
          }
        }
      }
      a.i = (j | a.i);
      if (RecentCallHelper.a(a) != null) {
        RecentCallHelper.a(a).a(a.i);
      }
      return;
    }
  }
}
