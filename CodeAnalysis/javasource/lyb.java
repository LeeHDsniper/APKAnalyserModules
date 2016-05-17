import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;
import com.tencent.mobileqq.activity.phone.BindVerifyActivity;
import com.tencent.mobileqq.activity.phone.RebindActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;
import com.tencent.mobileqq.statistics.ReportController;

public class lyb
  extends ContactBindObserver
{
  public lyb(BindVerifyActivity paramBindVerifyActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Bundle paramBundle)
  {
    BindVerifyActivity.a(a).setEnabled(true);
    a.b();
    int i;
    if (paramBoolean)
    {
      i = paramBundle.getInt("k_result");
      if ((i == 104) || (i == 0))
      {
        paramBundle = new Intent(a, BindVerifyActivity.class);
        paramBundle.putExtra("k_number", BindVerifyActivity.a(a));
        paramBundle.putExtra("k_country_code", BindVerifyActivity.b(a));
        paramBundle.putExtra("k_is_block", a.getIntent().getBooleanExtra("k_is_block", false));
        paramBundle.putExtra("cmd_param_is_from_uni", BindVerifyActivity.a(a));
        paramBundle.putExtra("cmd_param_is_from_change_bind", BindVerifyActivity.b(a));
        paramBundle.putExtra("key_is_from_qqhotspot", a.getIntent().getBooleanExtra("key_is_from_qqhotspot", false));
        if ((paramBundle != null) && (!a.isFinishing()))
        {
          paramBundle.addFlags(536870912);
          paramBundle.addFlags(67108864);
          a.startActivityForResult(paramBundle, 0);
        }
      }
    }
    for (;;)
    {
      a.app.unRegistObserver(BindVerifyActivity.a(a));
      BindVerifyActivity.a(a, null);
      return;
      if (i == 107)
      {
        Intent localIntent = new Intent(a, RebindActivity.class);
        localIntent.putExtra("k_uin", paramBundle.getString("k_uin"));
        localIntent.putExtra("k_number", BindVerifyActivity.a(a));
        localIntent.putExtra("k_country_code", BindVerifyActivity.b(a));
        localIntent.putExtra("k_is_block", a.getIntent().getBooleanExtra("k_is_block", false));
        localIntent.putExtra("cmd_param_is_from_uni", BindVerifyActivity.a(a));
        localIntent.putExtra("cmd_param_is_from_change_bind", BindVerifyActivity.b(a));
        localIntent.putExtra("key_is_from_qqhotspot", a.getIntent().getBooleanExtra("key_is_from_qqhotspot", false));
        paramBundle = localIntent;
        break;
      }
      if (i == 106)
      {
        paramBundle = new Intent();
        paramBundle.putExtra("bind_mobile", BindVerifyActivity.a(a).getText().toString().trim());
        a.setResult(-1, paramBundle);
        if (a.getIntent().getBooleanExtra("k_is_block", false)) {
          ReportController.b(a.app, "CliOper", "", "", "0X80053D5", "0X80053D5", 2, 0, "", "", "", "");
        }
        a.finish();
        paramBundle = null;
        break;
      }
      a.a(a(i));
      paramBundle = null;
      break;
      a.b(2131368362);
    }
  }
}
