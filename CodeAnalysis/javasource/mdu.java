import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.widget.TextView;
import com.tencent.mobileqq.activity.qwallet.SendHbActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public class mdu
  extends Handler
{
  WeakReference a;
  
  public mdu(SendHbActivity paramSendHbActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramSendHbActivity);
  }
  
  public void handleMessage(Message paramMessage)
  {
    SendHbActivity localSendHbActivity = (SendHbActivity)a.get();
    Bundle localBundle = paramMessage.getData();
    if (localBundle == null) {}
    do
    {
      return;
      switch (what)
      {
      default: 
        return;
      }
      paramMessage = localBundle.getString("wish");
    } while (TextUtils.isEmpty(paramMessage));
    SendHbActivity.a(localSendHbActivity).setText(paramMessage);
  }
}
