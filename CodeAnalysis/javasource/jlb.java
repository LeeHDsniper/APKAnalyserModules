import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import com.tencent.ims.signature.SignatureKickData;
import com.tencent.mobileqq.activity.LoginActivity;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBStringField;

public class jlb
  implements DialogInterface.OnClickListener
{
  public jlb(NotificationActivity paramNotificationActivity, signature.SignatureKickData paramSignatureKickData)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    paramDialogInterface = new Bundle();
    paramDialogInterface.putString("password", null);
    jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity.startActivity(new Intent(jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity, LoginActivity.class).putExtras(paramDialogInterface).addFlags(67108864));
    try
    {
      paramDialogInterface = new Intent("android.intent.action.VIEW", Uri.parse(jdField_a_of_type_ComTencentImsSignature$SignatureKickData.str_url.get()));
      jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity.startActivity(paramDialogInterface);
      paramDialogInterface = new Intent("qqplayer_exit_action");
      jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity.sendBroadcast(paramDialogInterface);
      jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity.finish();
      return;
    }
    catch (Exception paramDialogInterface)
    {
      for (;;) {}
    }
  }
}
