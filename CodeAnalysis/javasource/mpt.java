import android.os.Handler;
import android.os.Message;
import android.widget.Toast;
import com.tencent.mobileqq.activity.specialcare.QQSpecialCareSettingActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;

public class mpt
  extends Handler
{
  public mpt(QQSpecialCareSettingActivity paramQQSpecialCareSettingActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
    case 8193: 
    case 8194: 
      do
      {
        do
        {
          do
          {
            return;
            if (QQSpecialCareSettingActivity.a(a) == null)
            {
              QQSpecialCareSettingActivity.a(a, new QQProgressDialog(a, a.getTitleBarHeight()));
              if ((obj != null) && ((obj instanceof String))) {
                QQSpecialCareSettingActivity.a(a).a((String)obj);
              }
            }
          } while ((a.isFinishing()) || (QQSpecialCareSettingActivity.a(a).isShowing()));
          try
          {
            QQSpecialCareSettingActivity.a(a).show();
            return;
          }
          catch (Exception paramMessage) {}
        } while (!QLog.isColorLevel());
        QLog.e("QQSpecialCareSettingActivity", 2, "QQProgressDialog show exception.", paramMessage);
        return;
      } while ((QQSpecialCareSettingActivity.a(a) == null) || (!QQSpecialCareSettingActivity.a(a).isShowing()));
      QQSpecialCareSettingActivity.a(a).dismiss();
      QQSpecialCareSettingActivity.a(a, null);
      return;
    }
    if (QQSpecialCareSettingActivity.a(a) != null) {
      QQSpecialCareSettingActivity.a(a).cancel();
    }
    QQSpecialCareSettingActivity.a(a, QQToast.a(a, arg1, arg2, 0).b(a.getTitleBarHeight()));
  }
}
