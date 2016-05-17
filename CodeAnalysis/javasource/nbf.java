import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager.IPhoneContactListener;
import java.util.Iterator;
import java.util.LinkedList;

public class nbf
  implements Runnable
{
  public nbf(PhoneContactManagerImp paramPhoneContactManagerImp, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    synchronized (PhoneContactManagerImp.a(jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp))
    {
      Iterator localIterator = PhoneContactManagerImp.a(jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp).iterator();
      if (localIterator.hasNext()) {
        ((PhoneContactManager.IPhoneContactListener)localIterator.next()).b(jdField_a_of_type_Int);
      }
    }
  }
}
