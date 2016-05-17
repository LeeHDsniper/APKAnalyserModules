import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import com.tencent.mobileqq.activity.phone.BindNumberActivity;
import com.tencent.mobileqq.activity.phone.BindVerifyActivity;
import com.tencent.mobileqq.activity.phone.RebindActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.loginwelcome.LoginWelcomeManager;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.QQCustomDialog;

public class lxs
  extends ContactBindObserver
{
  public lxs(BindNumberActivity paramBindNumberActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Bundle paramBundle)
  {
    a.a.setEnabled(true);
    a.b();
    int i;
    Object localObject;
    if (paramBoolean)
    {
      i = paramBundle.getInt("k_result");
      localObject = a;
      if ((i == 104) || (i == 0))
      {
        paramBundle = new Intent(a, BindVerifyActivity.class);
        paramBundle.putExtra("k_number", a.n);
        paramBundle.putExtra("k_country_code", a.m);
        paramBundle.putExtra("k_is_block", a.getIntent().getBooleanExtra("k_is_block", false));
        paramBundle.putExtra("key_is_from_qqhotspot", a.getIntent().getBooleanExtra("key_is_from_qqhotspot", false));
        paramBundle.putExtra("cmd_param_is_from_uni", BindNumberActivity.a(a));
        paramBundle.putExtra("key_is_from_qav_multi_call", BindNumberActivity.b(a));
        paramBundle.putExtra("cmd_param_is_from_change_bind", BindNumberActivity.c(a));
        paramBundle.putExtra("b_t_contacts", a.getIntent().getBooleanExtra("b_t_contacts", false));
        if ((paramBundle != null) && (!a.isFinishing()))
        {
          paramBundle.addFlags(536870912);
          paramBundle.addFlags(67108864);
          a.startActivityForResult(paramBundle, 2);
        }
      }
    }
    for (;;)
    {
      a.app.unRegistObserver(BindNumberActivity.b(a));
      BindNumberActivity.b(a, null);
      return;
      if (i == 107)
      {
        localObject = new Intent(a, RebindActivity.class);
        ((Intent)localObject).putExtra("k_uin", paramBundle.getString("k_uin"));
        ((Intent)localObject).putExtra("k_number", a.n);
        ((Intent)localObject).putExtra("k_country_code", a.m);
        ((Intent)localObject).putExtra("k_is_block", a.getIntent().getBooleanExtra("k_is_block", false));
        ((Intent)localObject).putExtra("key_is_from_qqhotspot", a.getIntent().getBooleanExtra("key_is_from_qqhotspot", false));
        ((Intent)localObject).putExtra("cmd_param_is_from_uni", BindNumberActivity.a(a));
        ((Intent)localObject).putExtra("key_is_from_qav_multi_call", BindNumberActivity.b(a));
        ((Intent)localObject).putExtra("cmd_param_is_from_change_bind", BindNumberActivity.c(a));
        paramBundle = (Bundle)localObject;
        break;
      }
      if (i == 106)
      {
        if (a.getIntent().getBooleanExtra("k_is_block", false)) {
          ReportController.b(a.app, "CliOper", "", "", "0X80053D5", "0X80053D5", 1, 0, "", "", "", "");
        }
        a.setResult(-1);
        if (a.getIntent().getExtras().containsKey("b_t_contacts")) {
          LoginWelcomeManager.a(a.app).a(a, false, true);
        }
        BindNumberActivity.a(a, 2);
        paramBundle = null;
        break;
      }
      if (i == 227)
      {
        ReportController.b(a.app, "CliOper", "", "", "0X8005B78", "0X8005B78", 0, 0, "", "", "", "");
        if (a.b == null) {
          a.b = DialogUtil.a((Context)localObject, 230, "绑定冲突", "该手机号码已绑定一个无密码的QQ号，需给原QQ号设置密码后才能解绑并绑定新QQ号。", null, "我知道了", new lxt(this), null);
        }
        if ((a.b == null) || (a.b.isShowing()) || (a.isFinishing())) {
          break label786;
        }
        a.b.show();
        paramBundle = null;
        break;
      }
      if (i == 226)
      {
        ReportController.b(a.app, "CliOper", "", "", "0X8005B77", "0X8005B77", 0, 0, "", "", "", "");
        if (a.c == null) {
          a.c = DialogUtil.a((Context)localObject, 230, "无法绑定", "当前要改绑QQ号未设置密码，无法绑定新的手机号码。请设置密码后重试。", null, "我知道了", new lxu(this), null);
        }
        if ((a.c == null) || (a.c.isShowing()) || (a.isFinishing())) {
          break label786;
        }
        a.c.show();
        paramBundle = null;
        break;
      }
      a.a(a(i));
      label786:
      paramBundle = null;
      break;
      a.b(2131368362);
    }
  }
}
