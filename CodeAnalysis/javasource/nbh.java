import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager.IPhoneContactListener;
import java.util.Iterator;
import java.util.LinkedList;

public class nbh
  implements Runnable
{
  public nbh(PhoneContactManagerImp paramPhoneContactManagerImp, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    synchronized (PhoneContactManagerImp.a(jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp))
    {
      Iterator localIterator = PhoneContactManagerImp.a(jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp).iterator();
      if (localIterator.hasNext()) {
        ((PhoneContactManager.IPhoneContactListener)localIterator.next()).a(jdField_a_of_type_Long);
      }
    }
  }
}
