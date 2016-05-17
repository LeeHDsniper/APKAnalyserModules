import android.animation.Animator;
import android.view.View;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.activity.richmedia.FlowPlusPanel;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMViewSTInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mie
  extends mja
{
  public mie(FlowCameraActivity2 paramFlowCameraActivity2)
  {
    super(paramFlowCameraActivity2);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animator paramAnimator)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "startExitPtvModeAnimation: onAnimationEnd <<===");
    }
    if (a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowPlusPanel != null) {
      a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowPlusPanel.a();
    }
    a.u();
    a.e.setVisibility(4);
    a.e.setPadding(0, 0, 0, 0);
    if ((a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr != null) && (a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a != null)) {
      a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a.m();
    }
  }
  
  public void onAnimationStart(Animator paramAnimator)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "startExitPtvModeAnimation: onAnimationStart ===>>");
    }
  }
}
