import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.main.MainAssistObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.pb.getbusiinfo.BusinessInfoCheckUpdate.RedTypeInfo;
import com.tencent.qphone.base.util.QLog;

public class lvb
  extends Handler
{
  public lvb(MainAssistObserver paramMainAssistObserver, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    if ((a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity == null) || (a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app == null) || (!a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.app.isLogin())) {}
    do
    {
      do
      {
        return;
        switch (what)
        {
        default: 
          return;
        case 0: 
          paramMessage = (BusinessInfoCheckUpdate.RedTypeInfo)obj;
          a.a(35, paramMessage);
          return;
        case 28929: 
          paramMessage = paramMessage.getData();
        }
      } while (paramMessage == null);
      int i = paramMessage.getInt("result");
      if ((i == -1) || (i == -2))
      {
        if (i == -1) {
          paramMessage = a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.getString(2131367414);
        }
        for (String str = a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.getString(2131367415);; str = a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.getString(2131367417))
        {
          try
          {
            if (a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog != null)
            {
              if (a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.isShowing()) {
                a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
              }
              a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = null;
            }
            a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog = DialogUtil.a(a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity, 230, paramMessage, str, new lvc(this), null);
            a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setOnCancelListener(new lvd(this));
            a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.setOnDismissListener(new lve(this));
            a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.show();
            return;
          }
          catch (Exception paramMessage) {}
          if (!QLog.isColorLevel()) {
            break;
          }
          paramMessage.printStackTrace();
          return;
          paramMessage = a.jdField_a_of_type_ComTencentMobileqqActivitySplashActivity.getString(2131367416);
        }
      }
    } while (a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog == null);
    a.jdField_a_of_type_ComTencentMobileqqUtilsQQCustomDialog.dismiss();
    return;
    paramMessage = (BusinessInfoCheckUpdate.RedTypeInfo)obj;
    a.a(34, paramMessage);
    return;
    paramMessage = (BusinessInfoCheckUpdate.RedTypeInfo)obj;
    a.a(33, paramMessage);
  }
}
