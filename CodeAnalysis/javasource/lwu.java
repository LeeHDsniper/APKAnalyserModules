import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.pendant.AvatarPendantActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;

class lwu
  implements DialogInterface.OnClickListener
{
  lwu(lws paramLws, String paramString1, String paramString2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    jdField_a_of_type_Lws.a.a(jdField_a_of_type_JavaLangString, b, false, 3);
    ReportController.b(jdField_a_of_type_Lws.a.app, "CliOper", "", "", "0X8005FD9", "0X8005FD9", 0, 0, "", "", "", "");
  }
}
