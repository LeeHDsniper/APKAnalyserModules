package cooperation.qzone;

import android.os.Handler;
import android.text.TextUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import common.config.service.QzoneConfig;
import common.qzone.component.util.SecurityUtil;
import java.util.concurrent.atomic.AtomicBoolean;
import uqc;

public class CrashGuard
{
  private static int jdField_a_of_type_Int = -1;
  private static long jdField_a_of_type_Long = 0L;
  private static final int b = 15;
  private static final int c = 2;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private CrashGuard.CrashListener jdField_a_of_type_CooperationQzoneCrashGuard$CrashListener;
  private Runnable jdField_a_of_type_JavaLangRunnable;
  public AtomicBoolean a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Long = 0L;
  }
  
  public CrashGuard()
  {
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
  }
  
  public static int a()
  {
    return QzoneConfig.a().a("SafeModeSetting", "StartDuration", 15) * 1000;
  }
  
  public static CrashGuard a()
  {
    return CrashGuard.H.a;
  }
  
  public static int b()
  {
    return QzoneConfig.a().a("SafeModeSetting", "CrashMax", 2);
  }
  
  public void a(long paramLong, Handler paramHandler, CrashGuard.CrashListener paramCrashListener)
  {
    jdField_a_of_type_Long = System.currentTimeMillis();
    jdField_a_of_type_AndroidOsHandler = paramHandler;
    jdField_a_of_type_CooperationQzoneCrashGuard$CrashListener = paramCrashListener;
    if (jdField_a_of_type_JavaLangRunnable == null) {
      jdField_a_of_type_JavaLangRunnable = new uqc(this, paramLong);
    }
    if (jdField_a_of_type_Int < 0) {
      jdField_a_of_type_Int = a();
    }
    jdField_a_of_type_AndroidOsHandler.postDelayed(jdField_a_of_type_JavaLangRunnable, jdField_a_of_type_Int);
  }
  
  public void a(Throwable paramThrowable, long paramLong)
  {
    int j = 0;
    if (jdField_a_of_type_CooperationQzoneCrashGuard$CrashListener != null) {
      jdField_a_of_type_CooperationQzoneCrashGuard$CrashListener.a(paramThrowable);
    }
    if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
      return;
    }
    if (jdField_a_of_type_JavaLangRunnable != null) {
      jdField_a_of_type_AndroidOsHandler.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
    }
    int i = LocalMultiProcConfig.a("key_crash_count", 0, paramLong);
    if (jdField_a_of_type_Int < 0) {
      jdField_a_of_type_Int = a();
    }
    if (System.currentTimeMillis() - jdField_a_of_type_Long <= jdField_a_of_type_Int)
    {
      i += 1;
      paramThrowable = String.valueOf(paramLong);
      if (i < b()) {
        break label182;
      }
      i = j;
      if (!TextUtils.isEmpty(paramThrowable))
      {
        String str = SecurityUtil.a(paramThrowable);
        BaseApplication.getContext().deleteDatabase(str);
        QLog.i("QZLog", 1, "crash in a row, delete db for " + paramThrowable);
        i = j;
      }
    }
    label182:
    for (;;)
    {
      LocalMultiProcConfig.a("key_crash_count", i, paramLong);
      return;
      QLog.i("QZLog", 1, "clear crash count with overtime");
      i = 0;
      break;
    }
  }
}
