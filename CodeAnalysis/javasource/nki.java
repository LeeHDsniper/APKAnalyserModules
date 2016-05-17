import android.text.TextUtils;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.message.ProfileCardMessageProcessor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nki
  implements Runnable
{
  public nki(ProfileCardMessageProcessor paramProfileCardMessageProcessor)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (!TextUtils.isEmpty(a.a.getAccount())) {
      ((FriendListHandler)a.a.a(1)).b(a.a.getAccount());
    }
  }
}
