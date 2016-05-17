import android.os.SystemClock;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.map.geolocation.TencentLocationManager;
import com.tencent.map.geolocation.TencentLocationRequest;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public final class nmj
  implements Runnable
{
  public nmj(SosoInterface.OnLocationListener paramOnLocationListener, TencentLocationRequest paramTencentLocationRequest)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    SosoInterface.a(0);
    SosoInterface.a(SystemClock.elapsedRealtime());
    SosoInterface.b(0);
    SosoInterface.OnLocationListener.b(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener, true);
    int i = TencentLocationManager.getInstance(BaseApplicationImpl.getContext()).requestLocationUpdates(jdField_a_of_type_ComTencentMapGeolocationTencentLocationRequest, SosoInterface.a(), ThreadManager.b());
    if (QLog.isColorLevel()) {
      QLog.d("SOSO.LBS", 2, "location manager requestLocationUpdates result is: " + i);
    }
  }
}
