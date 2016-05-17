import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.specialcare.QQSpecialFriendSettingActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.QQProgressDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;

public class mpy
  extends Handler
{
  public mpy(QQSpecialFriendSettingActivity paramQQSpecialFriendSettingActivity)
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
            if (QQSpecialFriendSettingActivity.a(a) == null)
            {
              QQSpecialFriendSettingActivity.a(a, new QQProgressDialog(a, a.getTitleBarHeight()));
              if ((obj != null) && ((obj instanceof String))) {
                QQSpecialFriendSettingActivity.a(a).a((String)obj);
              }
            }
          } while ((a.isFinishing()) || (QQSpecialFriendSettingActivity.a(a).isShowing()));
          try
          {
            QQSpecialFriendSettingActivity.a(a).show();
            return;
          }
          catch (Exception paramMessage) {}
        } while (!QLog.isColorLevel());
        QLog.e("QQSpecialFriendSettingActivity", 2, "QQProgressDialog show exception.", paramMessage);
        return;
      } while ((QQSpecialFriendSettingActivity.a(a) == null) || (!QQSpecialFriendSettingActivity.a(a).isShowing()));
      QQSpecialFriendSettingActivity.a(a).dismiss();
      QQSpecialFriendSettingActivity.a(a, null);
      return;
    }
    QQToast.a(a, arg1, arg2, 0).b(a.getTitleBarHeight());
  }
}
