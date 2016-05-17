import android.widget.TextView;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;

public class kow
  implements Runnable
{
  public kow(ActivateFriendActivity paramActivateFriendActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = a.app.a().e();
    Object localObject2 = a.app.a().getString(2131367297);
    Object localObject1 = localObject2;
    if (i > 0)
    {
      localObject2 = new StringBuilder().append((String)localObject2).append("(");
      if (i <= 99) {
        break label88;
      }
    }
    label88:
    for (localObject1 = "99+";; localObject1 = Integer.valueOf(i))
    {
      localObject1 = localObject1 + ")";
      ActivateFriendActivity.a(a).setText((CharSequence)localObject1);
      return;
    }
  }
}
