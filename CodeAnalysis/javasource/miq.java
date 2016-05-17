import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class miq
  implements Runnable
{
  public miq(FlowCameraActivity2 paramFlowCameraActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (!a.b)
    {
      a.a.a(2002, "抱歉，摄像头可能被禁止了", false);
      if (QLog.isColorLevel()) {
        QLog.d("FlowCameraActivity", 2, "[@] ERR_CODE_CAMERA_CREATE  黑名单机型,2秒还没有获取到预览帧,可能没有权限");
      }
    }
  }
}
