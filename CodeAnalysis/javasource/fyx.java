import com.tencent.av.utils.PhoneStatusMonitor;
import com.tencent.av.utils.PhoneStatusMonitor.PhoneStatusListener;
import com.tencent.av.utils.PhoneStatusTools;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class fyx
  implements Runnable
{
  fyx(fyw paramFyw)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    boolean bool = PhoneStatusTools.e(a.a.jdField_a_of_type_AndroidContentContext);
    if ((a.a.jdField_a_of_type_Boolean) && (!bool))
    {
      a.a.jdField_a_of_type_Boolean = false;
      if (a.a.jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor$PhoneStatusListener != null) {
        a.a.jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor$PhoneStatusListener.a(false);
      }
    }
    do
    {
      do
      {
        return;
      } while ((a.a.jdField_a_of_type_Boolean) || (!bool));
      a.a.jdField_a_of_type_Boolean = true;
    } while (a.a.jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor$PhoneStatusListener == null);
    a.a.jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor$PhoneStatusListener.a(true);
  }
}
