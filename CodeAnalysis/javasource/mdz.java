import android.widget.TextView;
import com.tencent.mobileqq.activity.qwallet.TransactionActivity;
import com.tencent.mobileqq.app.FriendListObserver;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;

public class mdz
  extends FriendListObserver
{
  public mdz(TransactionActivity paramTransactionActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a(String paramString, boolean paramBoolean)
  {
    if ((!paramBoolean) || (paramString == null)) {
      return;
    }
    TransactionActivity.a(a, ContactUtils.c(a.app, TransactionActivity.b(a), false));
    TransactionActivity.a(a).setText(TransactionActivity.c(a));
  }
}
