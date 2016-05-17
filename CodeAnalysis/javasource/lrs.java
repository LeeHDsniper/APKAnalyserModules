import android.content.res.Resources;
import com.tencent.mobileqq.activity.contact.newfriend.NewFriendActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.circle.ISwitchObserver;

public class lrs
  implements ISwitchObserver
{
  public lrs(NewFriendActivity paramNewFriendActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (!a.isFinishing())
    {
      if (!paramBoolean1) {
        break label77;
      }
      a.b = paramBoolean2;
      if (!paramBoolean2) {
        break label64;
      }
    }
    label64:
    for (String str = a.getString(2131368034);; str = a.getString(2131368035))
    {
      str = a.getString(2131368033, new Object[] { str });
      a.a(str, 2);
      return;
    }
    label77:
    a.a(a.getResources().getString(2131369926), 1);
  }
  
  public void b(boolean paramBoolean1, boolean paramBoolean2) {}
}
