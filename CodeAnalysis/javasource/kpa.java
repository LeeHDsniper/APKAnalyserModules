import android.widget.Button;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendGrid.GridCallBack;
import com.tencent.mobileqq.activity.activateFriend.BirthdayActivatePage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kpa
  implements ActivateFriendGrid.GridCallBack
{
  public kpa(BirthdayActivatePage paramBirthdayActivatePage)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt)
  {
    if (paramInt > 0)
    {
      a.a.setEnabled(true);
      return;
    }
    a.a.setEnabled(false);
  }
}
