import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.view.KeyEvent;
import com.tencent.mobileqq.activity.shortvideo.SendVideoActivity;
import com.tencent.mobileqq.activity.shortvideo.SendVideoActivity.SendBlessPTVTask;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.util.MqqWeakReferenceHandler;

public class mof
  implements DialogInterface.OnKeyListener
{
  public mof(SendVideoActivity.SendBlessPTVTask paramSendBlessPTVTask)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean onKey(DialogInterface paramDialogInterface, int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 84) {}
    do
    {
      return true;
      if (paramInt != 4) {
        break;
      }
    } while (SendVideoActivity.a() == null);
    SendVideoActivity.a().sendEmptyMessage(1);
    return true;
    return false;
  }
}
