import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.activity.richmedia.FlowCameraConstant;
import com.tencent.mobileqq.activity.richmedia.FlowCameraMqqAction;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import java.util.ArrayList;

public class mii
  implements View.OnClickListener
{
  public mii(FlowCameraActivity2 paramFlowCameraActivity2, File paramFile, Button paramButton)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(View paramView)
  {
    if (new File(jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.c).exists())
    {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.sendBroadcast(new Intent("android.intent.action.MEDIA_SCANNER_SCAN_FILE", Uri.fromFile(jdField_a_of_type_JavaIoFile)));
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.v();
      paramView = new ArrayList();
      paramView.add(jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.c);
      FlowCameraMqqAction.a(jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2, paramView);
      jdField_a_of_type_AndroidWidgetButton.setClickable(false);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.setResult(1001);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.finish();
      if (FlowCameraConstant.d == 1) {
        FlowCameraMqqAction.a("", "0X8005F5C", "0");
      }
    }
    else
    {
      return;
    }
    FlowCameraMqqAction.a("", "0X8005F5C", "1");
  }
}
