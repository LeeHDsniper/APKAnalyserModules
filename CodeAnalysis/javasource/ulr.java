import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import cooperation.qlink.QQProxyForQlink;
import cooperation.qlink.QlAndQQInterface.WorkState;
import java.util.TimerTask;

public class ulr
  extends TimerTask
{
  public ulr(QQProxyForQlink paramQQProxyForQlink)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    QQProxyForQlink.a(a);
    if (QQProxyForQlink.b(a) > 1)
    {
      QLog.e("QQProxyForQlink", 1, "[QLINK]-QQ qlink pulgin is dead:");
      QQProxyForQlink.a(a, new QlAndQQInterface.WorkState(false, 1, null, null, 0, 0, false));
      QQProxyForQlink.a(a);
      return;
    }
    a.f();
  }
}
