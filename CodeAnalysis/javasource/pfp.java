import android.graphics.drawable.Drawable;
import com.tencent.mobileqq.forward.ForwardBaseOption;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialog;

public class pfp
  implements Runnable
{
  public pfp(ForwardBaseOption paramForwardBaseOption, Drawable paramDrawable, boolean paramBoolean, int paramInt)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a.isShowing())
    {
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.a.setPreviewImage(jdField_a_of_type_AndroidGraphicsDrawableDrawable, jdField_a_of_type_Boolean, jdField_a_of_type_Int);
      jdField_a_of_type_ComTencentMobileqqForwardForwardBaseOption.m();
    }
  }
}
