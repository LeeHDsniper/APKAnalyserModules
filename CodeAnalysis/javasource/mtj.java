import android.hardware.SensorManager;
import com.tencent.mobileqq.app.BaseActivity2;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mtj
  implements Runnable
{
  public mtj(BaseActivity2 paramBaseActivity2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    mtl localMtl = new mtl(null);
    SensorManager localSensorManager = (SensorManager)a.getSystemService("sensor");
    localSensorManager.registerListener(localMtl, localSensorManager.getDefaultSensor(1), 0);
    BaseActivity2.a(localMtl);
  }
}
