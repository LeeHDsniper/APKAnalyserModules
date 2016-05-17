import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.open.downloadnew.MyAppApi;
import org.json.JSONObject;

public class jlg
  implements DialogInterface.OnClickListener
{
  public jlg(NotificationActivity paramNotificationActivity, String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    try
    {
      paramDialogInterface = new JSONObject();
      paramDialogInterface.put("appid", "100686848");
      paramDialogInterface.put("apkId", "6633");
      paramDialogInterface.put("versionCode", String.valueOf(jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity.getPackageManager().getPackageInfo(jdField_a_of_type_JavaLangString, 16384).versionCode));
      paramDialogInterface.put("via", "ANDROIDQQ.NEICE.OTHER");
      paramDialogInterface.put("appPackageName", jdField_a_of_type_JavaLangString);
      paramDialogInterface.put("channel", "000316053134377c30");
      paramDialogInterface.put("appAuthorizedStr", NotificationActivity.a(jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity));
      paramDialogInterface = paramDialogInterface.toString();
      MyAppApi.a().a(paramDialogInterface, new jlh(this), jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity);
      NotificationActivity.a(jdField_a_of_type_ComTencentMobileqqActivityNotificationActivity, true);
      return;
    }
    catch (Exception paramDialogInterface)
    {
      paramDialogInterface.printStackTrace();
    }
  }
}
