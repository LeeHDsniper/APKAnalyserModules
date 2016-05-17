import android.os.Handler;
import android.os.Message;
import com.tencent.mobileqq.activity.phone.BaseActivityView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public class lxm
  extends Handler
{
  private WeakReference a;
  
  public lxm(BaseActivityView paramBaseActivityView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramBaseActivityView);
  }
  
  public void handleMessage(Message paramMessage)
  {
    boolean bool = true;
    BaseActivityView localBaseActivityView = (BaseActivityView)a.get();
    if (localBaseActivityView == null) {
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
        localBaseActivityView.b(i, bool);
        return;
        bool = false;
      }
    case 2: 
      localBaseActivityView.f();
      return;
    }
    localBaseActivityView.i();
  }
}
