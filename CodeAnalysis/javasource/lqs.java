import android.os.Handler;
import android.os.Message;
import android.widget.EditText;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class lqs
  extends Handler
{
  public lqs(SearchBaseActivity paramSearchBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    a.a.clearFocus();
  }
}
