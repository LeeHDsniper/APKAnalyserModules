import android.animation.Animator;
import android.content.res.Resources;
import android.view.View;
import android.widget.Button;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.activity.richmedia.FlowPlusPanel;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMViewSTInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class mip
  extends mja
{
  public mip(FlowCameraActivity2 paramFlowCameraActivity2)
  {
    super(paramFlowCameraActivity2);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAnimationEnd(Animator paramAnimator)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "enterPtvModeAnimation: onAnimationEnd <<===");
    }
    a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr.a.l();
    a.w();
    if (!a.jdField_f_of_type_Boolean) {
      a.f(false);
    }
  }
  
  public void onAnimationStart(Animator paramAnimator)
  {
    if (QLog.isColorLevel()) {
      QLog.d("FlowCameraActivity", 2, "enterPtvModeAnimation: onAnimationStart ===>>");
    }
    a.e.setVisibility(0);
    a.jdField_f_of_type_AndroidViewView.setBackgroundColor(a.getResources().getColor(2131427667));
    a.c = true;
    if (a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowPlusPanel != null) {
      a.jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowPlusPanel.b();
    }
    if (a.jdField_f_of_type_Boolean)
    {
      a.b.setOnTouchListener(a.jdField_a_of_type_AndroidViewView$OnTouchListener);
      a.b.setLongClickable(false);
    }
  }
}
