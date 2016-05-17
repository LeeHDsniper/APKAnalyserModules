import android.media.ExifInterface;
import android.widget.Button;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.activity.richmedia.view.CameraCover.PictureCallback;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.lang.reflect.Field;
import java.util.HashMap;

public class miz
  implements CameraCover.PictureCallback
{
  public miz(FlowCameraActivity2 paramFlowCameraActivity2, File paramFile)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.i("FlowCameraActivity", 2, "onPictureToken path " + paramString);
    }
    ImageUtil.a(paramString, jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.a, jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.jdField_b_of_type_Double);
    if (QLog.isColorLevel()) {}
    try
    {
      Object localObject = Class.forName("android.media.ExifInterface").getDeclaredField("mAttributes");
      ((Field)localObject).setAccessible(true);
      localObject = (HashMap)((Field)localObject).get(new ExifInterface(paramString));
      QLog.i("FlowCameraActivity", 2, "exif " + localObject);
      if (paramString != null)
      {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.a(jdField_a_of_type_JavaIoFile);
        return;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.jdField_b_of_type_AndroidWidgetButton.setClickable(true);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.jdField_b_of_type_AndroidWidgetButton.setOnLongClickListener(jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.c.setEnabled(true);
    }
  }
}
