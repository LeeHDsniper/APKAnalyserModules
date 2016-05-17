import com.tencent.mobileqq.app.asyncdb.DBDelayManager;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.Vector;

public class nlv
  implements Runnable
{
  public nlv(ProxyManager paramProxyManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    ProxyManager.a(a, System.currentTimeMillis());
    while (!a.jdField_a_of_type_Boolean) {
      synchronized (a.jdField_a_of_type_JavaUtilVector)
      {
        try
        {
          a.jdField_a_of_type_JavaUtilVector.wait(10000L);
          if (((!a.jdField_a_of_type_JavaUtilVector.isEmpty()) || (ProxyManager.a(a).a().size() > 0)) && (ProxyManager.a(a)))
          {
            a.c();
            ProxyManager.a(a).c();
          }
        }
        catch (Exception localException)
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.w("Q.msg.MsgProxy", 2, "writeRunable Exception:" + localException);
            }
          }
        }
      }
    }
  }
}
