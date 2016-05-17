import android.os.SystemClock;
import com.tencent.mobileqq.app.Job;
import com.tencent.mobileqq.app.ThreadExcutor;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nfu
  implements Runnable
{
  public nfu(ThreadExcutor paramThreadExcutor, Job paramJob)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqAppJob.jdField_b_of_type_Int = 2;
    ThreadExcutor.a(jdField_a_of_type_ComTencentMobileqqAppThreadExcutor, jdField_a_of_type_ComTencentMobileqqAppJob);
    ThreadExcutor.a(jdField_a_of_type_ComTencentMobileqqAppThreadExcutor).a(jdField_a_of_type_ComTencentMobileqqAppJob);
    jdField_a_of_type_ComTencentMobileqqAppJob.f = (SystemClock.uptimeMillis() - jdField_a_of_type_ComTencentMobileqqAppJob.jdField_b_of_type_Long);
  }
}
