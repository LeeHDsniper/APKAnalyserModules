import android.content.Intent;
import android.os.Bundle;
import com.tencent.mobileqq.activity.phone.BindVerifyActivity;
import com.tencent.mobileqq.activity.phone.RebindActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class lzk
  extends ContactBindObserver
{
  public lzk(RebindActivity paramRebindActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void b(boolean paramBoolean, Bundle paramBundle)
  {
    a.b();
    if (paramBoolean)
    {
      paramBundle = new Intent(a, BindVerifyActivity.class);
      paramBundle.putExtra("k_number", a.d);
      paramBundle.putExtra("kBindType", RebindActivity.a(a));
      paramBundle.putExtra("k_country_code", RebindActivity.a(a));
      paramBundle.putExtra("cmd_param_is_from_uni", RebindActivity.a(a));
      paramBundle.putExtra("cmd_param_is_from_change_bind", RebindActivity.b(a));
      paramBundle.addFlags(67108864);
      paramBundle.putExtra("k_is_block", a.getIntent().getBooleanExtra("k_is_block", false));
      paramBundle.putExtra("key_is_from_qqhotspot", a.getIntent().getBooleanExtra("key_is_from_qqhotspot", false));
      paramBundle.putExtra("key_is_from_qav_multi_call", a.getIntent().getBooleanExtra("key_is_from_qav_multi_call", false));
      a.startActivityForResult(paramBundle, 1);
      return;
    }
    a.b(2131368362);
  }
}
