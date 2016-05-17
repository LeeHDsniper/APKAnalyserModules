import android.content.Intent;
import android.os.Bundle;
import com.tencent.mobileqq.activity.phone.BindNumberDialogActivity;
import com.tencent.mobileqq.activity.phone.BindVerifyActivity;
import com.tencent.mobileqq.activity.phone.RebindActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class lxz
  extends ContactBindObserver
{
  public lxz(BindNumberDialogActivity paramBindNumberDialogActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Bundle paramBundle)
  {
    a.b();
    int i;
    if (paramBoolean)
    {
      i = paramBundle.getInt("k_result");
      if ((i == 104) || (i == 0))
      {
        paramBundle = new Intent(a, BindVerifyActivity.class);
        paramBundle.putExtra("kBindType", a.jdField_b_of_type_Int);
        paramBundle.putExtra("k_number", a.c);
        paramBundle.putExtra("k_country_code", a.jdField_b_of_type_JavaLangString);
        paramBundle.putExtra("kShowAgree", true);
        if ((paramBundle != null) && (!a.isFinishing()))
        {
          paramBundle.addFlags(536870912);
          a.startActivityForResult(paramBundle, 2);
        }
      }
    }
    for (;;)
    {
      a.app.unRegistObserver(a.a);
      a.a = null;
      a.finish();
      return;
      if (i == 107)
      {
        Intent localIntent = new Intent(a, RebindActivity.class);
        localIntent.putExtra("k_uin", paramBundle.getString("k_uin"));
        localIntent.putExtra("k_number", a.c);
        localIntent.putExtra("k_country_code", a.jdField_b_of_type_JavaLangString);
        localIntent.putExtra("kBindType", a.jdField_b_of_type_Int);
        paramBundle = localIntent;
        break;
      }
      if (i == 106)
      {
        a.a("已经绑定成功");
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
