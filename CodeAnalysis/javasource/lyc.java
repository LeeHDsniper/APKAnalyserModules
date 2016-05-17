import android.content.Intent;
import android.widget.TextView;
import com.tencent.mobileqq.activity.phone.BindVerifyActivity;
import com.tencent.mobileqq.activity.phone.DialogBaseActivity;
import com.tencent.mobileqq.activity.phone.MyBusinessActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.ContactUtils;

public class lyc
  extends ContactBindObserver
{
  public lyc(BindVerifyActivity paramBindVerifyActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void c(boolean paramBoolean, int paramInt)
  {
    a.b();
    if (!paramBoolean)
    {
      a.b(2131368362);
      return;
    }
    if ((paramInt == 0) || (paramInt == 106))
    {
      if (1 == a.b) {
        MyBusinessActivity.i(true);
      }
      if (a.getIntent().getBooleanExtra("k_is_block", false)) {
        ReportController.b(a.app, "CliOper", "", "", "0X80053D5", "0X80053D5", 0, 0, "", "", "", "");
      }
      ContactUtils.a(a.app, -1L, -1, 1);
      if (a.getIntent().getBooleanExtra("key_is_from_qqhotspot", false))
      {
        localObject = new Intent();
        ((Intent)localObject).putExtra("bind_mobile", BindVerifyActivity.a(a).getText().toString().trim());
        a.setResult(-1, (Intent)localObject);
        a.finish();
        return;
      }
      DialogBaseActivity.a(a, a);
      return;
    }
    if (paramInt == 213)
    {
      a.a("验证码错误，请重新输入。");
      return;
    }
    Object localObject = "请稍后重试。";
    if (paramInt == 107) {
      localObject = "此手机号已与其他帐号绑定，请返回重试。";
    }
    a.a("请求失败", (String)localObject);
  }
}
