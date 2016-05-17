import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.manager.Manager;

public class nds
  implements Runnable
{
  public nds(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    for (;;)
    {
      int i;
      synchronized (QQAppInterface.a(a))
      {
        Manager[] arrayOfManager2 = QQAppInterface.a(a);
        int j = arrayOfManager2.length;
        i = 0;
        if (i < j)
        {
          Manager localManager = arrayOfManager2[i];
          if (localManager != null) {
            localManager.onDestroy();
          }
        }
        else
        {
          return;
        }
      }
      i += 1;
    }
  }
}
