import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.widget.Button;
import com.tencent.mobileqq.activity.phone.BindNumberBusinessActivity;
import com.tencent.mobileqq.activity.phone.RebindActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.phonecontact.ContactBindObserver;

public class lxx
  extends ContactBindObserver
{
  public lxx(BindNumberBusinessActivity paramBindNumberBusinessActivity)
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
      if ((i == 104) || (i == 0)) {
        a.jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(4);
      }
    }
    for (;;)
    {
      a.app.unRegistObserver(BindNumberBusinessActivity.b(a));
      BindNumberBusinessActivity.b(a, null);
      return;
      if (i == 107)
      {
        Intent localIntent = new Intent(a, RebindActivity.class);
        localIntent.putExtra("k_uin", paramBundle.getString("k_uin"));
        localIntent.putExtra("k_number", a.c);
        localIntent.putExtra("k_country_code", a.b);
        localIntent.putExtra("kBindType", BindNumberBusinessActivity.a(a));
        if ((localIntent != null) && (!a.isFinishing()))
        {
          localIntent.addFlags(536870912);
          a.startActivityForResult(localIntent, 2);
        }
      }
      else if (i == 106)
      {
        a.setResult(-1);
        a.finish();
      }
      else
      {
        a.a(a(i));
        a.finish();
        continue;
        a.b(2131368362);
      }
    }
  }
}
