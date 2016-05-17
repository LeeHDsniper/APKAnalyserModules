import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.mediadevice.CameraExceptionHandler.Callback;
import com.tencent.qphone.base.util.QLog;

public class min
  implements CameraExceptionHandler.Callback
{
  public min(FlowCameraActivity2 paramFlowCameraActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(Exception paramException)
  {
    if (QLog.isColorLevel()) {
      QLog.i("FlowCameraActivity", 2, "[onCameraException]", paramException);
    }
  }
  
  public void a(RuntimeException paramRuntimeException)
  {
    if (QLog.isColorLevel()) {
      QLog.i("FlowCameraActivity", 2, "[onDispatchThreadException]", paramRuntimeException);
    }
  }
}
