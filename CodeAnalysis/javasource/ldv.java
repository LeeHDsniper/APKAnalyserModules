import android.os.Handler;
import android.os.Message;
import android.os.Process;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public final class ldv
  extends Handler
{
  public ldv()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("PEAK", 2, "self-destory BOOM!!!!");
    }
    Process.killProcess(Process.myPid());
  }
}
