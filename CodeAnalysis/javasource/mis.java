import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoSwitchCameraPicMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

class mis
  implements DialogInterface.OnClickListener
{
  mis(mir paramMir)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface = a.a.getIntent();
    paramDialogInterface.putExtra("flow_back", 0);
    a.a.setResult(1001, paramDialogInterface);
    paramDialogInterface = null;
    if (a.a.f) {
      paramDialogInterface = a.a.a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec;
    }
    a.a.a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoSwitchCameraPicMgr.a(a.a.d, a.a.e, a.a.m, a.a.f, paramDialogInterface);
    a.a.finish();
  }
}
