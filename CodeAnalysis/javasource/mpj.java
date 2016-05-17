import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class mpj
  implements DialogInterface.OnClickListener
{
  public mpj()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt) {}
}
