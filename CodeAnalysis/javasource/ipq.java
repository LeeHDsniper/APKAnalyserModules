import android.app.Dialog;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Message;
import android.widget.TextView;
import com.tencent.mobileqq.activity.ContactSyncJumpActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ipq
  extends Handler
{
  public ipq(ContactSyncJumpActivity paramContactSyncJumpActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    if (what == 1000)
    {
      if (a.a()) {
        break label149;
      }
      i = arg1 - 1;
      if (i != 0) {
        break label39;
      }
      ContactSyncJumpActivity.a(a);
    }
    label39:
    label149:
    while ((a.jdField_a_of_type_AndroidAppDialog == null) || (a.jdField_a_of_type_Int != 2))
    {
      int i;
      return;
      if ((a.jdField_a_of_type_AndroidAppDialog != null) && (a.jdField_a_of_type_Int == 2))
      {
        paramMessage = "(" + i + ")";
        ((TextView)a.jdField_a_of_type_AndroidAppDialog.findViewById(2131301063)).setText(String.format(a.getResources().getString(2131370835), new Object[] { paramMessage }));
      }
      paramMessage = obtainMessage(1000);
      arg1 = i;
      sendMessageDelayed(paramMessage, 1000L);
      return;
    }
    ((TextView)a.jdField_a_of_type_AndroidAppDialog.findViewById(2131301063)).setText(String.format(a.getResources().getString(2131370835), new Object[] { "" }));
  }
}
