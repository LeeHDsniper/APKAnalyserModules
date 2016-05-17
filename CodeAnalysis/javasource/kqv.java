import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnDismissListener;
import com.tencent.mobileqq.activity.aio.PlusPanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kqv
  implements DialogInterface.OnDismissListener
{
  public kqv(PlusPanel paramPlusPanel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    if ((a.a == null) || (a.a.isShowing())) {}
    try
    {
      a.a.dismiss();
      a.a = null;
      return;
    }
    catch (Exception paramDialogInterface)
    {
      for (;;) {}
    }
  }
}
