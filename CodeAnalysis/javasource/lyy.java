import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.view.KeyEvent;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class lyy
  implements DialogInterface.OnKeyListener
{
  public lyy()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onKey(DialogInterface paramDialogInterface, int paramInt, KeyEvent paramKeyEvent)
  {
    return paramInt == 4;
  }
}
