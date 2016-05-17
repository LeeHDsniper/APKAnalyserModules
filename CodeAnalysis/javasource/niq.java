import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.automator.step.UpdateFriend;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class niq
  extends FriendListObserver
{
  private niq(UpdateFriend paramUpdateFriend)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((UpdateFriend.a(a) == 7) || (UpdateFriend.b(a) == 3))
    {
      if (paramBoolean1) {
        break label37;
      }
      a.a(6);
    }
    label37:
    while ((!paramBoolean1) || (!paramBoolean2)) {
      return;
    }
    aa).a.edit().putBoolean("isFriendlistok", true).commit();
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "onUpdateFriendList put PREF_ISFRIENDLIST_OK true");
    }
    UpdateFriend.b(a).a(3, true, Integer.valueOf(1));
    a.a(7);
  }
  
  protected void a(boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    if (UpdateFriend.c(a) == 8)
    {
      if (paramBoolean1) {
        break label26;
      }
      a.a(6);
    }
    label26:
    while (!paramBoolean2) {
      return;
    }
    a.a(7);
  }
}
