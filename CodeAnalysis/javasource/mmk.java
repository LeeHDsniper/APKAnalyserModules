import android.os.Handler.Callback;
import android.os.Message;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mmk
  implements Handler.Callback
{
  public mmk(SelectMemberActivity paramSelectMemberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    if ((paramMessage != null) && (what == 1))
    {
      a.N = 2;
      a.finish();
    }
    return false;
  }
}
