import android.telephony.PhoneStateListener;
import com.tencent.av.utils.PhoneStatusMonitor;
import com.tencent.av.utils.PhoneStatusMonitor.PhoneStatusListener;
import com.tencent.av.utils.PhoneStatusTools;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class fyy
  extends PhoneStateListener
{
  public fyy(PhoneStatusMonitor paramPhoneStatusMonitor)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onCallStateChanged(int paramInt, String paramString)
  {
    switch (paramInt)
    {
    }
    for (;;)
    {
      super.onCallStateChanged(paramInt, paramString);
      return;
      if (QLog.isColorLevel()) {
        QLog.d("PhoneStatusMonitor", 2, "onCallStateChanged CALL_STATE_IDLE");
      }
      if ((a.jdField_a_of_type_Boolean) && (!PhoneStatusTools.e(a.jdField_a_of_type_AndroidContentContext)))
      {
        a.jdField_a_of_type_Boolean = false;
        if (a.jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor$PhoneStatusListener != null)
        {
          a.jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor$PhoneStatusListener.a(false);
          continue;
          if (QLog.isColorLevel()) {
            QLog.d("PhoneStatusMonitor", 2, "onCallStateChanged CALL_STATE_RINGING or CALL_STATE_OFFHOOK");
          }
          if (!a.jdField_a_of_type_Boolean)
          {
            a.jdField_a_of_type_Boolean = true;
            if (a.jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor$PhoneStatusListener != null) {
              a.jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor$PhoneStatusListener.a(true);
            }
          }
        }
      }
    }
  }
}
