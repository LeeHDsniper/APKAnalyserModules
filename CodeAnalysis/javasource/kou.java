import android.content.res.Resources;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendActivity;
import com.tencent.mobileqq.app.CardObserver;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendServlet;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQToast;

public class kou
  extends CardObserver
{
  public kou(ActivateFriendActivity paramActivateFriendActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void onGetAllowActivateFriend(boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((ActivateFriendActivity.a(a) != paramBoolean2) && (paramBoolean2 == true))
    {
      ActivateFriendServlet.a(a.app, false);
      a.a();
    }
    ActivateFriendActivity.a(a, paramBoolean2);
  }
  
  protected void onSetAllowActivateFriend(boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((ActivateFriendActivity.a(a) != paramBoolean2) && (paramBoolean2 == true))
    {
      ActivateFriendServlet.a(a.app, false);
      a.a();
    }
    if (!a.isFinishing())
    {
      if (!paramBoolean1) {
        break label130;
      }
      ActivateFriendActivity.a(a, paramBoolean2);
      if (!ActivateFriendActivity.a(a)) {
        break label117;
      }
    }
    label117:
    for (String str = a.getString(2131371043);; str = a.getString(2131371044))
    {
      str = a.getString(2131371046, new Object[] { str });
      QQToast.a(a, 2, str, 0).b(a.getTitleBarHeight());
      return;
    }
    label130:
    QQToast.a(a, 1, a.getResources().getString(2131369926), 0).b(a.getTitleBarHeight());
  }
}
