import android.os.Bundle;
import com.tencent.mobileqq.compatible.ActionListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.service.MobileQQServiceBase;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;

public class rah
  implements Runnable
{
  public rah(MobileQQServiceBase paramMobileQQServiceBase, ToServiceMsg paramToServiceMsg, ActionListener paramActionListener, Class paramClass)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg == null) {}
    for (Object localObject = "";; localObject = jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg.getServiceCmd())
    {
      if (QLog.isColorLevel()) {
        QLog.d(MobileQQServiceBase.b, 2, "req cmd: " + (String)localObject);
      }
      if ((jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg != null) && ("MessageSvc.PbSendMsg".equalsIgnoreCase((String)localObject)))
      {
        long l1 = jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg.extraData.getLong("msg_send_time", 0L);
        if (l1 != 0L)
        {
          long l2 = System.currentTimeMillis();
          jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg.extraData.putLong("msg_request_time", l2);
          jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg.extraData.putLong("msg_send_to_request_cost", l2 - l1);
        }
      }
      try
      {
        jdField_a_of_type_ComTencentMobileqqServiceMobileQQServiceBase.a(jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg, jdField_a_of_type_ComTencentMobileqqCompatibleActionListener, jdField_a_of_type_JavaLangClass);
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.e(MobileQQServiceBase.b, 2, "handleRequest Exception. cmd = " + (String)localObject, localException);
        localObject = new FromServiceMsg(jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg.getUin(), (String)localObject);
        ((FromServiceMsg)localObject).setMsgFail();
        jdField_a_of_type_ComTencentMobileqqServiceMobileQQServiceBase.a(false, jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg, (FromServiceMsg)localObject, localException);
        return;
      }
      catch (OutOfMemoryError localOutOfMemoryError)
      {
        if (!QLog.isColorLevel()) {
          break label262;
        }
        QLog.d(MobileQQServiceBase.b, 2, "handleRequest OutOfMemoryError. cmd = " + (String)localObject);
        localObject = new FromServiceMsg(jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg.getUin(), (String)localObject);
        ((FromServiceMsg)localObject).setMsgFail();
        jdField_a_of_type_ComTencentMobileqqServiceMobileQQServiceBase.a(false, jdField_a_of_type_ComTencentQphoneBaseRemoteToServiceMsg, (FromServiceMsg)localObject, null);
      }
    }
    label262:
  }
}
