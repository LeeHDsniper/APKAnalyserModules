import android.support.v4.view.ViewPager;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.widget.Button;
import android.widget.EditText;
import com.tencent.mobileqq.activity.qwallet.SendHbActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mdf
  implements TextWatcher
{
  public mdf(SendHbActivity paramSendHbActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    paramEditable = SendHbActivity.a(a).getText().toString();
    String str;
    if ((SendHbActivity.a(a)) && (SendHbActivity.b(a)) && ((SendHbActivity.a(a).getCurrentItem() != 2) || (!TextUtils.isEmpty(paramEditable))) && (((!"1".equals(SendHbActivity.a(a))) && (!"7".equals(SendHbActivity.a(a)))) || (SendHbActivity.a(a).getCurrentItem() != 1) || (!TextUtils.isEmpty(paramEditable))))
    {
      if (!SendHbActivity.a(a).isEnabled())
      {
        SendHbActivity.a(a).setEnabled(true);
        SendHbActivity.a(a).setClickable(true);
        a.a(SendHbActivity.b(a), a.a(), "hongbao.wrap.enable", "", "", 2, "");
      }
      paramEditable = new StringBuffer();
      paramEditable.append("塞钱");
      if ("2".equals(SendHbActivity.c(a)))
      {
        str = SendHbActivity.b(a).getText().toString();
        paramEditable.append(SendHbActivity.a(a, str, "1"));
        paramEditable.append("元");
        SendHbActivity.a(a).setText(paramEditable.toString());
        label251:
        if (!TextUtils.isEmpty(SendHbActivity.b(a).getText().toString())) {
          break label470;
        }
        SendHbActivity.b(a).setGravity(19);
      }
    }
    for (;;)
    {
      if (SendHbActivity.c(a) != null)
      {
        if (!TextUtils.isEmpty(SendHbActivity.c(a).getText().toString())) {
          break label485;
        }
        SendHbActivity.c(a).setGravity(19);
      }
      return;
      if (SendHbActivity.c(a) == null)
      {
        str = SendHbActivity.b(a).getText().toString();
        paramEditable.append(SendHbActivity.a(a, str, "1"));
        break;
      }
      paramEditable.append(SendHbActivity.a(a, SendHbActivity.d(a), "1"));
      break;
      if (SendHbActivity.a(a).isEnabled())
      {
        SendHbActivity.a(a).setClickable(false);
        SendHbActivity.a(a).setEnabled(false);
        a.a(SendHbActivity.b(a), a.a(), "hongbao.wrap.disable", "", "", 2, "");
      }
      SendHbActivity.a(a).setText(2131365579);
      break label251;
      label470:
      SendHbActivity.b(a).setGravity(21);
    }
    label485:
    SendHbActivity.c(a).setGravity(21);
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
