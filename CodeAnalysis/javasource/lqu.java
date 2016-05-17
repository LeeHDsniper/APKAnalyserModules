import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseFragment;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lqu
  extends Handler
{
  public lqu(SearchBaseFragment paramSearchBaseFragment)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    if (SearchBaseFragment.a(a) != null) {
      SearchBaseFragment.a(a).sendMessage(Message.obtain(paramMessage));
    }
    switch (what)
    {
    default: 
      return;
    case 0: 
      a.a();
      return;
    case 1: 
      a.a((String)obj);
      return;
    case 2: 
      a.f();
      return;
    }
    a.c();
  }
}
