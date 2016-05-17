import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.app.automator.step.RegisterProxy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class nij
  extends Handler
{
  public nij(RegisterProxy paramRegisterProxy, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    }
    RegisterProxy.a(a, false);
  }
}
