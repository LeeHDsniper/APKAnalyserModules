import android.os.MessageQueue.IdleHandler;
import android.widget.Button;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.activity.richmedia.view.CameraGLSurfaceView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraCompatibleList;
import com.tencent.qphone.base.util.QLog;

public class miv
  implements MessageQueue.IdleHandler
{
  public miv(FlowCameraActivity2 paramFlowCameraActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean queueIdle()
  {
    if (CameraCompatibleList.c(CameraCompatibleList.b)) {
      a.b(true);
    }
    for (;;)
    {
      if ((a.f) && (a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView != null)) {
        a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraGLSurfaceView.onResume();
      }
      a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a();
      a.c.setEnabled(false);
      if (QLog.isColorLevel()) {
        QLog.i("PEAK_CAMERA", 2, "Added camera view.");
      }
      return false;
      a.s();
    }
  }
}
