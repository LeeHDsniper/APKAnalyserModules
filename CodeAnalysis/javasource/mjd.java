import android.graphics.drawable.Drawable;
import android.widget.TextView;
import com.tencent.mobileqq.activity.richmedia.FlowCameraActivity2;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.concurrent.atomic.AtomicInteger;

public class mjd
  implements Runnable
{
  static final int jdField_a_of_type_Int = 32;
  static final int b = 4;
  boolean jdField_a_of_type_Boolean;
  final int[] jdField_a_of_type_ArrayOfInt;
  int c;
  
  public mjd(FlowCameraActivity2 paramFlowCameraActivity2, boolean paramBoolean)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfInt = new int[] { 255, 191, 127, 63, 0, 63, 127, 191 };
    jdField_a_of_type_Boolean = paramBoolean;
    c = a.a;
    c %= 32;
  }
  
  public void run()
  {
    Drawable[] arrayOfDrawable = jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.b.getCompoundDrawables();
    if (jdField_a_of_type_Boolean) {
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.z();
    }
    if (arrayOfDrawable[0] != null) {
      arrayOfDrawable[0].setAlpha(jdField_a_of_type_ArrayOfInt[(c / 4)]);
    }
    if ((jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.a.b.get() == 2) && (arrayOfDrawable[0] != null))
    {
      arrayOfDrawable[0].setAlpha(255);
      jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowCameraActivity2.a(arrayOfDrawable[0], -1);
    }
  }
}
