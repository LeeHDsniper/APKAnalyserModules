import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import cooperation.qzone.CrashGuard;
import cooperation.qzone.LocalMultiProcConfig;
import java.util.concurrent.atomic.AtomicBoolean;

public class uqc
  implements Runnable
{
  public uqc(CrashGuard paramCrashGuard, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_CooperationQzoneCrashGuard.a.set(true);
    QLog.i("QZLog", 1, "clear crash count with no crash");
    LocalMultiProcConfig.a("key_crash_count", 0, jdField_a_of_type_Long);
  }
}
