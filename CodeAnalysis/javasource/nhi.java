import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.PublicAccountObserver;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.automator.step.CheckPublicAccount;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class nhi
  extends PublicAccountObserver
{
  private nhi(CheckPublicAccount paramCheckPublicAccount)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "PublicAccount onUpdateUserFollowList:" + paramBoolean + " " + paramInt);
    }
    if ((paramBoolean) && (paramInt == 0))
    {
      aa).a.edit().putBoolean("isPublicAccountListOK", true).commit();
      a.a(7);
    }
    while (paramInt == 0) {
      return;
    }
    a.a(6);
  }
}
