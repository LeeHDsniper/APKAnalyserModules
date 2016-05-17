import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityTransaction;
import com.tencent.qphone.base.util.QLog;
import java.util.Collection;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import mqq.os.MqqHandler;

public class nbc
  implements Runnable
{
  public nbc(PhoneContactManagerImp paramPhoneContactManagerImp)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    EntityTransaction localEntityTransaction = PhoneContactManagerImp.a(a).a();
    localEntityTransaction.a();
    try
    {
      Iterator localIterator = PhoneContactManagerImp.a(a).values().iterator();
      while (localIterator.hasNext())
      {
        PhoneContact localPhoneContact = (PhoneContact)localIterator.next();
        if (isNewRecommend)
        {
          isNewRecommend = false;
          highLightTimeStamp = System.currentTimeMillis();
          PhoneContactManagerImp.a(a).a(localPhoneContact);
        }
      }
    }
    finally
    {
      localEntityTransaction.b();
    }
    localEntityTransaction.b();
    PhoneContactManagerImp.b(a, false);
    ThreadManager.b().postDelayed(PhoneContactManagerImp.b(a), 180000L);
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "clear recommend badge.");
    }
  }
}
