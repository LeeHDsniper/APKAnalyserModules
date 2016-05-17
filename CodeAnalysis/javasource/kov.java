import com.tencent.mobileqq.activity.activateFriend.ActivateFriendActivity;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendsObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class kov
  extends ActivateFriendsObserver
{
  public kov(ActivateFriendActivity paramActivateFriendActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("ActivateFriends.MainActivity", 2, "onReceiveBirthDayPushUpdate");
    }
    ActivateFriendActivity.b(a);
  }
}
