import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import com.tencent.mobileqq.activity.qwallet.TransactionActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mdv
  implements TextWatcher
{
  public mdv(TransactionActivity paramTransactionActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    if (TransactionActivity.a(a).getVisibility() == 0) {
      if (TransactionActivity.a(a).getText().length() > 4) {
        if (!TransactionActivity.a(a).isEnabled())
        {
          TransactionActivity.a(a).setEnabled(true);
          TransactionActivity.a(a).setClickable(true);
          a.a(TransactionActivity.a(a), 128, "transfer.qqid.enable", "", "", TransactionActivity.a(a), "");
        }
      }
    }
    do
    {
      do
      {
        do
        {
          return;
        } while (!TransactionActivity.a(a).isEnabled());
        TransactionActivity.a(a).setClickable(false);
        TransactionActivity.a(a).setEnabled(false);
        a.a(TransactionActivity.a(a), 128, "transfer.qqid.disable", "", "", TransactionActivity.a(a), "");
        return;
        if ((TransactionActivity.b(a).getText().length() <= 0) || (TransactionActivity.b(a).getText().toString().startsWith(".")) || (TransactionActivity.b(a).getText().toString().endsWith(".")) || (!TransactionActivity.a(a, TransactionActivity.b(a).getText().toString()))) {
          break;
        }
      } while (TransactionActivity.b(a).isEnabled());
      TransactionActivity.b(a).setEnabled(true);
      TransactionActivity.b(a).setClickable(true);
      a.a(TransactionActivity.a(a), 128, "transfer.amount.enable", "", "", TransactionActivity.a(a), "");
      return;
    } while (!TransactionActivity.b(a).isEnabled());
    TransactionActivity.b(a).setClickable(false);
    TransactionActivity.b(a).setEnabled(false);
    a.a(TransactionActivity.a(a), 128, "transfer.amount.disable", "", "", TransactionActivity.a(a), "");
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}
