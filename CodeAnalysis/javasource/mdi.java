import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.qwallet.SendHbActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mdi
  implements DialogInterface.OnClickListener
{
  public mdi(SendHbActivity paramSendHbActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    a.finish();
  }
}
