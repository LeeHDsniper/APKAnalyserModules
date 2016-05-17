import android.content.Context;
import android.content.Intent;
import android.widget.Button;
import com.tencent.mobileqq.activity.phone.DialogBaseActivity;
import com.tencent.mobileqq.activity.phone.PhoneFrameActivity;
import com.tencent.mobileqq.activity.phone.PhoneLaunchActivity;
import com.tencent.mobileqq.activity.phone.SettingActivity2;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class lze
  extends ContactBindObserver
{
  public lze(PhoneLaunchActivity paramPhoneLaunchActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, int paramInt)
  {
    PhoneLaunchActivity.a(a).setEnabled(true);
    if (a.a != null)
    {
      a.app.unRegistObserver(a.a);
      a.a = null;
    }
    a.b();
    if (paramBoolean)
    {
      Object localObject = a;
      if (PhoneLaunchActivity.a(a))
      {
        Intent localIntent = new Intent((Context)localObject, PhoneFrameActivity.class);
        localIntent.putExtra("key_req_type", 4);
        localIntent.putExtra("kSrouce", 6);
        ((DialogBaseActivity)localObject).startActivity(localIntent);
        return;
      }
      if ((PhoneLaunchActivity.b(a)) || (PhoneLaunchActivity.c(a)))
      {
        a.setResult(-1);
        a.finish();
        return;
      }
      localObject = new Intent((Context)localObject, SettingActivity2.class);
      if (PhoneLaunchActivity.d(a)) {
        ((Intent)localObject).putExtra("kSrouce", 7);
      }
      a.startActivityForResult((Intent)localObject, 2);
      a.setResult(-1);
      a.finish();
      return;
    }
    a.a("启用失败，请重新尝试！");
  }
}
