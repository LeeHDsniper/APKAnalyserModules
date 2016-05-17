import android.content.SharedPreferences;
import android.os.Build.VERSION;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;
import mqq.util.WeakReference;

public final class mdc
  implements Runnable
{
  public mdc(WeakReference paramWeakReference, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_MqqUtilWeakReference.get() == null) {}
    label152:
    label155:
    for (;;)
    {
      return;
      String str = ((QQAppInterface)jdField_a_of_type_MqqUtilWeakReference.get()).a();
      Object localObject = ((QQAppInterface)jdField_a_of_type_MqqUtilWeakReference.get()).a();
      int i;
      long l;
      if (Build.VERSION.SDK_INT > 10)
      {
        i = 4;
        localObject = ((BaseApplication)localObject).getSharedPreferences("qwallet_multi", i);
        if (localObject == null) {
          break label152;
        }
        l = ((SharedPreferences)localObject).getLong("ads_update_time_prefix_" + str, 0L);
        com.tencent.mobileqq.activity.qwallet.QWalletCommonManager.jdField_a_of_type_Long = l;
      }
      for (;;)
      {
        if ((l > 0L) && (jdField_a_of_type_Long > l) && (jdField_a_of_type_Long - l < 86400L)) {
          break label155;
        }
        SosoInterface.a(new mdd(this, 3, true, false, 0L, false, false, "RecommendReq"));
        return;
        i = 0;
        break;
        l = 0L;
      }
    }
  }
}
