import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import com.tencent.mobileqq.activity.phone.BindNumberFromPcActivity;
import com.tencent.mobileqq.activity.phone.BindVerifyActivity;
import com.tencent.mobileqq.activity.phone.RebindActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class lya
  extends ContactBindObserver
{
  public lya(BindNumberFromPcActivity paramBindNumberFromPcActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(boolean paramBoolean, Bundle paramBundle)
  {
    a.jdField_a_of_type_AndroidWidgetButton.setEnabled(true);
    a.b();
    int i;
    if (paramBoolean)
    {
      i = paramBundle.getInt("k_result");
      if ((i == 104) || (i == 0))
      {
        paramBundle = new Intent(a, BindVerifyActivity.class);
        paramBundle.putExtra("k_number", a.jdField_a_of_type_JavaLangString);
        paramBundle.putExtra("k_country_code", a.b);
        if ((paramBundle != null) && (!a.isFinishing()))
        {
          paramBundle.addFlags(536870912);
          a.startActivityForResult(paramBundle, 1);
        }
      }
    }
    for (;;)
    {
      a.app.unRegistObserver(BindNumberFromPcActivity.a(a));
      BindNumberFromPcActivity.a(a, null);
      return;
      if (i == 107)
      {
        Intent localIntent = new Intent(a, RebindActivity.class);
        localIntent.putExtra("k_uin", paramBundle.getString("k_uin"));
        localIntent.putExtra("k_number", a.jdField_a_of_type_JavaLangString);
        localIntent.putExtra("k_country_code", a.b);
        paramBundle = localIntent;
        break;
      }
      if (i == 106)
      {
        a.setResult(-1);
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
