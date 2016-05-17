import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import mqq.os.MqqHandler;

public class ncb
  implements Runnable
{
  private static final long jdField_a_of_type_Long = 20L;
  private static final long jdField_b_of_type_Long = 100L;
  int jdField_a_of_type_Int;
  volatile boolean jdField_a_of_type_Boolean;
  volatile int jdField_b_of_type_Int;
  volatile boolean jdField_b_of_type_Boolean;
  volatile int c;
  
  private ncb(PhoneContactManagerImp paramPhoneContactManagerImp)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Int = 0;
    c = 5;
    jdField_b_of_type_Boolean = false;
  }
  
  public void a()
  {
    jdField_a_of_type_Boolean = false;
    BaseApplicationImpl.a.postDelayed(this, 100L);
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "set progress, actual = " + paramInt1 + ", expected = " + paramInt2);
    }
    jdField_b_of_type_Boolean = true;
    jdField_b_of_type_Int = paramInt1;
    c = paramInt2;
    BaseApplicationImpl.a.removeCallbacks(this);
    BaseApplicationImpl.a.postDelayed(this, 20L);
  }
  
  public void b()
  {
    jdField_a_of_type_Boolean = true;
    BaseApplicationImpl.a.removeCallbacks(this);
  }
  
  public void run()
  {
    if (QLog.isColorLevel()) {
      QLog.d("PhoneContact.Manager", 2, "run progress, isCanceled = " + jdField_a_of_type_Boolean + ", bindState = " + jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.jdField_a_of_type_Int);
    }
    Object localObject;
    if ((!jdField_a_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp.jdField_a_of_type_Int == 5) && (jdField_a_of_type_Int + 1 < c))
    {
      localObject = jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp;
      int i = jdField_a_of_type_Int;
      jdField_a_of_type_Int = (i + 1);
      PhoneContactManagerImp.b((PhoneContactManagerImp)localObject, i);
      if (jdField_b_of_type_Boolean)
      {
        PhoneContactManagerImp.a(jdField_a_of_type_ComTencentMobileqqAppPhoneContactManagerImp, 7);
        jdField_b_of_type_Boolean = false;
      }
      localObject = BaseApplicationImpl.a;
      if (jdField_a_of_type_Int >= jdField_b_of_type_Int) {
        break label154;
      }
    }
    label154:
    for (long l = 20L;; l = 100L)
    {
      ((MqqHandler)localObject).postDelayed(this, l);
      return;
    }
  }
}
