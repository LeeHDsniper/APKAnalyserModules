import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.activity.richmedia.view.CameraCover;
import com.tencent.mobileqq.activity.shortvideo.ShortVideoOpenGlActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.mediadevice.AudioCapture;
import com.tencent.qphone.base.util.QLog;

public class miu
  extends BroadcastReceiver
{
  public miu(FlowCameraActivity2 paramFlowCameraActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if ("tencent.av.v2q.StartVideoChat".equals(paramIntent.getAction()))
    {
      if (QLog.isColorLevel()) {
        QLog.d("FlowCameraActivity", 2, "receive ACTION_START_VIDEO_CHAT.");
      }
      paramContext = a.a(a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover, 2131296481);
      if (paramContext != null) {
        a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaViewCameraCover.removeView(paramContext);
      }
      if ((a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr != null) && (a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a != null)) {
        a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a.e();
      }
      if (a.e) {
        a.v();
      }
      if ((a.f) && (a.c)) {
        a.d(false);
      }
      a.b();
      if (ShortVideoOpenGlActivity.a != null) {
        ShortVideoOpenGlActivity.a.finish();
      }
    }
  }
}
