import com.tencent.maxvideo.mediadevice.AVCodec;
import com.tencent.mobileqq.activity.richmedia.FlowSendTask;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.mediadevice.RecordManager;
import com.tencent.qphone.base.util.QLog;
import java.util.concurrent.atomic.AtomicBoolean;

public class mje
  implements Runnable
{
  public mje(FlowSendTask paramFlowSendTask)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d(a.h, 2, "FlowSendTask(): isPTV:" + a.jdField_a_of_type_Boolean + ", mVideoFileDir:" + a.b + ",is to call AVideoCodec.recordSubmit()");
      }
      RecordManager.a().a().recordSubmit();
      return;
    }
    catch (UnsatisfiedLinkError localUnsatisfiedLinkError)
    {
      for (;;)
      {
        localUnsatisfiedLinkError.printStackTrace();
        a.o = -6;
        synchronized (a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a)
        {
          a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a.set(true);
          a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a.notifyAll();
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.d(a.h, 2, "FlowSendTask(): isPTV:" + a.jdField_a_of_type_Boolean + ", mVideoFileDir:" + a.b + ", call AVideoCodec.recordSubmit() fail, error = " + localUnsatisfiedLinkError.getMessage());
          return;
        }
      }
    }
  }
}
