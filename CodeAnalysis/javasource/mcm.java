import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.mobileqq.activity.qwallet.PasswdRedBagManager;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.Iterator;
import java.util.List;
import mqq.os.MqqHandler;
import tencent.im.oidb.cmd0x438.oidb_0x438.RedBagInfo;

public class mcm
  extends Handler
{
  public mcm(PasswdRedBagManager paramPasswdRedBagManager, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    int i = what;
    boolean bool;
    if (arg1 == 1)
    {
      bool = true;
      if (QLog.isColorLevel()) {
        QLog.d(PasswdRedBagManager.a, 2, "receive passwdredbags from group or disgroup, isSuccess = " + bool);
      }
      if (bool) {
        break label57;
      }
    }
    for (;;)
    {
      return;
      bool = false;
      break;
      label57:
      if ((i == 1) || (i == 0))
      {
        ThreadManager.a().post(new mcn(this, i));
        paramMessage = (List)obj;
        if (paramMessage != null)
        {
          paramMessage = paramMessage.iterator();
          while (paramMessage.hasNext())
          {
            oidb_0x438.RedBagInfo localRedBagInfo = (oidb_0x438.RedBagInfo)paramMessage.next();
            a.a(localRedBagInfo);
          }
        }
      }
    }
  }
}
