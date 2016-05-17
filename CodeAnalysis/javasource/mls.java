import android.os.Message;
import com.tencent.mobileqq.activity.selectmember.PhoneContactTabView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.os.MqqHandler;

public class mls
  extends MqqHandler
{
  public mls(PhoneContactTabView paramPhoneContactTabView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    case 1: 
    case 2: 
    default: 
      return;
    }
    a.d();
  }
}
