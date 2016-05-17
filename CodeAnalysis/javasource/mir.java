import android.view.WindowManager.BadTokenException;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.qphone.base.util.QLog;

public class mir
  implements Runnable
{
  public mir(FlowCameraActivity2 paramFlowCameraActivity2, String paramString, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    String str = jdField_a_of_type_JavaLangString;
    if (jdField_a_of_type_Int == 2002) {
      str = jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.getString(2131362890);
    }
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.a = DialogUtil.a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2, 230).setMessage(str).setPositiveButton(jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.getString(2131362889), new mis(this));
    try
    {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.a.setCancelable(false);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.a.show();
      return;
    }
    catch (WindowManager.BadTokenException localBadTokenException)
    {
      while (!QLog.isColorLevel()) {}
      QLog.i("FlowCameraActivity", 2, "", localBadTokenException);
    }
  }
}
