import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.activity.qwallet.PublicQuickPayManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mdb
  implements DialogInterface.OnClickListener
{
  public mdb(PublicQuickPayManager paramPublicQuickPayManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt) {}
}
