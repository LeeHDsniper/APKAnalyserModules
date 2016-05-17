import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.phone.DialogBaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public class lyz
  extends Handler
{
  private WeakReference a;
  
  public lyz(DialogBaseActivity paramDialogBaseActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramDialogBaseActivity);
  }
  
  public void handleMessage(Message paramMessage)
  {
    boolean bool = true;
    DialogBaseActivity localDialogBaseActivity = (DialogBaseActivity)a.get();
    if (localDialogBaseActivity == null) {
      return;
    }
    switch (what)
    {
    default: 
      throw new RuntimeException("Unknown message: " + what);
    case 1: 
      int i = arg1;
      if (arg2 == 1) {}
      for (;;)
      {
        localDialogBaseActivity.a(i, bool);
        return;
        bool = false;
      }
    }
    localDialogBaseActivity.finish();
  }
}
