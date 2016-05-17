import android.os.Message;
import com.tencent.mobileqq.activity.selectmember.ContactsInnerFrame;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.os.MqqHandler;

public class mjz
  extends MqqHandler
{
  public mjz(ContactsInnerFrame paramContactsInnerFrame)
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
    ContactsInnerFrame.a(a);
  }
}
