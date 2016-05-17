import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class ldr
  implements DialogInterface.OnClickListener
{
  public ldr()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt) {}
}
