import SecurityAccountServer.RespondQueryQQBindingStat;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.phone.SettingActivity2;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.PhoneUnityManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.NetworkUtil;

class lzn
  implements DialogInterface.OnClickListener
{
  lzn(lzl paramLzl)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    if (a.a.c == 2) {
      ReportController.b(a.a.app, "CliOper", "", "", "0X8005B8A", "0X8005B8A", 1, 0, "", "", "", "");
    }
    for (;;)
    {
      paramDialogInterface.dismiss();
      if (NetworkUtil.e(a.a)) {
        break;
      }
      a.a.b(2131368515);
      return;
      if (a.a.c == 6) {
        ReportController.b(a.a.app, "CliOper", "", "", "0X8005B8A", "0X8005B8A", 2, 0, "", "", "", "");
      } else if (a.a.c == 7) {
        ReportController.b(a.a.app, "CliOper", "", "", "0X8005B8A", "0X8005B8A", 3, 0, "", "", "", "");
      }
    }
    paramDialogInterface = a.a.a.a();
    if ((paramDialogInterface == null) || (nationCode == null) || (mobileNo == null))
    {
      a.a.setResult(0);
      a.a.finish();
      return;
    }
    if (a.a.b == null)
    {
      a.a.b = new lzo(this);
      a.a.app.registObserver(a.a.b);
    }
    PhoneUnityManager localPhoneUnityManager = (PhoneUnityManager)a.a.app.getManager(101);
    a.a.a.c(nationCode, mobileNo);
    a.a.a(2131368360, 0L, true);
  }
}
