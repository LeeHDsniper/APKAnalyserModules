import android.os.Bundle;
import android.os.Handler;
import com.tencent.mobileqq.activity.phone.BindNumberBusinessActivity;
import com.tencent.mobileqq.activity.phone.MyBusinessActivity;
import com.tencent.mobileqq.app.PhoneContactManagerImp;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;

public class lxw
  extends ContactBindObserver
{
  public lxw(BindNumberBusinessActivity paramBindNumberBusinessActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void b(boolean paramBoolean, Bundle paramBundle)
  {
    super.b(paramBoolean, paramBundle);
    BindNumberBusinessActivity localBindNumberBusinessActivity = a;
    if (paramBoolean)
    {
      ((PhoneContactManagerImp)a.app.getManager(10)).a(true, true);
      a.a.sendEmptyMessage(4);
      MyBusinessActivity.i(true);
      if (QLog.isColorLevel()) {
        QLog.d("BindNumberBusinessActivity", 2, "rebind successed");
      }
    }
    for (;;)
    {
      a.b();
      a.app.unRegistObserver(BindNumberBusinessActivity.a(a));
      BindNumberBusinessActivity.a(a, null);
      return;
      int i = -1;
      if (paramBundle != null) {
        i = paramBundle.getInt("k_result");
      }
      QQToast.a(localBindNumberBusinessActivity, a(i), 2000).b(localBindNumberBusinessActivity.getTitleBarHeight());
      if (QLog.isColorLevel()) {
        QLog.d("BindNumberBusinessActivity", 2, "rebind failed");
      }
    }
  }
}
