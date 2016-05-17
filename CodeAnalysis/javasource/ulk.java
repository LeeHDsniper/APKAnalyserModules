import android.app.Activity;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import cooperation.qlink.QQProxyForQlink;
import cooperation.qlink.QlAndQQInterface.WorkState;
import java.util.ArrayList;

public class ulk
  implements DialogInterface.OnClickListener
{
  public ulk(QQProxyForQlink paramQQProxyForQlink, ArrayList paramArrayList, Activity paramActivity, int paramInt, boolean paramBoolean)
  {
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    jdField_a_of_type_CooperationQlinkQQProxyForQlink.a("0X8004855", 1);
    jdField_a_of_type_CooperationQlinkQQProxyForQlink.a(ajdField_a_of_type_CooperationQlinkQQProxyForQlink).mPeerUin, jdField_a_of_type_JavaUtilArrayList);
    Bundle localBundle = new Bundle();
    localBundle.putStringArrayList("string_filepaths", jdField_a_of_type_JavaUtilArrayList);
    localBundle.putBoolean("STRING_CONTINUE_SEND_TO_", true);
    QQProxyForQlink.a(jdField_a_of_type_AndroidAppActivity, jdField_a_of_type_Int, localBundle);
    paramDialogInterface.dismiss();
    if (jdField_a_of_type_Boolean) {
      jdField_a_of_type_AndroidAppActivity.finish();
    }
  }
}
