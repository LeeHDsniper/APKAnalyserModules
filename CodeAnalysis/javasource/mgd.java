import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.tencent.mobileqq.activity.recent.RecentAdapter;
import com.tencent.mobileqq.activity.recent.RecentBaseData;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mgd
  implements View.OnClickListener
{
  public mgd(RecentAdapter paramRecentAdapter)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (paramView == null) {}
    Object localObject1;
    RecentBaseData localRecentBaseData;
    do
    {
      do
      {
        int i;
        do
        {
          return;
          i = paramView.getId();
        } while ((i < 0) || (i >= a.getCount()));
        localObject1 = a.getItem(i);
      } while ((localObject1 == null) || (!(localObject1 instanceof RecentBaseData)));
      localRecentBaseData = (RecentBaseData)localObject1;
      Object localObject2 = null;
      localObject1 = localObject2;
      if ((paramView instanceof TextView))
      {
        paramView = ((TextView)paramView).getText();
        localObject1 = localObject2;
        if (paramView != null) {
          localObject1 = paramView.toString();
        }
      }
    } while (TextUtils.isEmpty((CharSequence)localObject1));
    a.a(localRecentBaseData, (String)localObject1, "1");
  }
}
