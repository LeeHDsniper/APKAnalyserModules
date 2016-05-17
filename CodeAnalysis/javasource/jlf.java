import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import com.tencent.mobileqq.activity.LoginActivity;
import com.tencent.mobileqq.activity.NotificationActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonelogin.PhoneNumLoginImpl;
import com.tencent.mobileqq.subaccount.datamanager.SubAccountManager;
import com.tencent.mobileqq.utils.SharedPreUtils;
import java.util.ArrayList;
import java.util.Iterator;
import mqq.app.MobileQQ;

public class jlf
  implements DialogInterface.OnClickListener
{
  public jlf(NotificationActivity paramNotificationActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    a.app.logout(true);
    SharedPreUtils.a(a.app.a(), a.app.a(), false);
    paramDialogInterface = (SubAccountManager)a.app.getManager(60);
    if (paramDialogInterface != null) {}
    for (paramDialogInterface = paramDialogInterface.a();; paramDialogInterface = null)
    {
      if ((paramDialogInterface != null) && (paramDialogInterface.size() > 0))
      {
        paramDialogInterface = paramDialogInterface.iterator();
        while (paramDialogInterface.hasNext())
        {
          String str = (String)paramDialogInterface.next();
          if (!PhoneNumLoginImpl.a().a(a.app, str))
          {
            a.app.updateSubAccountLogin(str, false);
            a.app.getApplication().refreAccountList();
          }
        }
      }
      a.startActivity(new Intent(a, LoginActivity.class).addFlags(67108864));
      a.finish();
      return;
    }
  }
}
