import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQUtils;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;

public class ndn
  extends Handler
{
  public ndn(QQAppInterface paramQQAppInterface, Looper paramLooper)
  {
    super(paramLooper);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void handleMessage(Message paramMessage)
  {
    int i;
    Intent localIntent;
    if (what == 990)
    {
      paramMessage = new ArrayList();
      synchronized (QQAppInterface.a(a))
      {
        paramMessage.addAll(QQAppInterface.a(a));
        QQAppInterface.a(a).clear();
        QQAppInterface.a(a).removeMessages(990);
        ??? = new ArrayList();
        if ((paramMessage == null) || (paramMessage.size() <= 0)) {
          break label171;
        }
        i = 0;
        if (i < paramMessage.size())
        {
          ???.add(a.a(1, (String)paramMessage.get(i), 0));
          i += 1;
        }
      }
      localIntent = new Intent("com.tencent.qqhead.getheadresp");
      localIntent.putStringArrayListExtra("uinList", paramMessage);
      localIntent.putStringArrayListExtra("headPathList", ???);
      a.a().sendBroadcast(localIntent, "com.tencent.qqhead.permission.getheadresp");
      label171:
      if (QLog.isColorLevel()) {
        QQUtils.a("Q.qqhead.broadcast", 2, "headQQHeadBroadcast, getQQHead resp uinList: ", paramMessage);
      }
    }
    do
    {
      do
      {
        return;
      } while (what != 991);
      paramMessage = new ArrayList();
      synchronized (QQAppInterface.b(a))
      {
        paramMessage.addAll(QQAppInterface.b(a));
        QQAppInterface.b(a).clear();
        QQAppInterface.a(a).removeMessages(991);
        ??? = new ArrayList();
        if ((paramMessage == null) || (paramMessage.size() <= 0)) {
          continue;
        }
        i = 0;
        if (i < paramMessage.size())
        {
          ???.add(a.a(4, (String)paramMessage.get(i), 0));
          i += 1;
        }
      }
      localIntent = new Intent("com.tencent.qqhead.getheadresp");
      localIntent.setPackage(QQAppInterface.d(a).getPackageName());
      localIntent.putStringArrayListExtra("uinList", paramMessage);
      localIntent.putStringArrayListExtra("headPathList", ???);
      localIntent.putExtra("faceType", 4);
      a.a().sendBroadcast(localIntent, "com.tencent.qqhead.permission.getheadresp");
    } while (!QLog.isColorLevel());
    QQUtils.a("Q.qqhead.broadcast", 2, "headQQHeadBroadcast, getQQHead resp uinList: ", paramMessage);
  }
}
