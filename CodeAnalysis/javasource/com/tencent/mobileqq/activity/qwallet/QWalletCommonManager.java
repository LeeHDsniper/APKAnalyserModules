package com.tencent.mobileqq.activity.qwallet;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mdc;
import mqq.os.MqqHandler;
import mqq.util.WeakReference;

public class QWalletCommonManager
{
  public static long a;
  
  public QWalletCommonManager()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static void a(QQAppInterface paramQQAppInterface)
  {
    if (paramQQAppInterface == null) {}
    long l;
    MqqHandler localMqqHandler;
    do
    {
      do
      {
        return;
        l = System.currentTimeMillis() / 1000L;
      } while ((a > 0L) && (l > a) && (l - a < 86400L));
      paramQQAppInterface = new WeakReference(paramQQAppInterface);
      localMqqHandler = ThreadManager.b();
    } while (localMqqHandler == null);
    localMqqHandler.postDelayed(new mdc(paramQQAppInterface, l), 10000L);
  }
}
