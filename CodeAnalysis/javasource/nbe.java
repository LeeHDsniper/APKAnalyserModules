import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager.IPhoneContactListener;
import java.util.Iterator;
import java.util.LinkedList;

public class nbe
  implements Runnable
{
  public nbe(PhoneContactManagerImp paramPhoneContactManagerImp)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    synchronized (PhoneContactManagerImp.a(a))
    {
      Iterator localIterator = PhoneContactManagerImp.a(a).iterator();
      if (localIterator.hasNext()) {
        ((PhoneContactManager.IPhoneContactListener)localIterator.next()).a(a.a);
      }
    }
  }
}
