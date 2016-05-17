import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.aio.rebuild.DeviceMsgChatPie;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;

public class lgc
  implements DialogInterface.OnClickListener
{
  public lgc(DeviceMsgChatPie paramDeviceMsgChatPie, ArrayList paramArrayList, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface.dismiss();
    jdField_a_of_type_ComTencentMobileqqActivityAioRebuildDeviceMsgChatPie.a(jdField_a_of_type_JavaUtilArrayList, jdField_a_of_type_JavaLangString);
  }
}
