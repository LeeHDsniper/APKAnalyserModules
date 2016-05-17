import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kqp
  implements SensorEventListener
{
  public kqp(MediaPlayerManager paramMediaPlayerManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void onAccuracyChanged(Sensor paramSensor, int paramInt) {}
  
  public void onSensorChanged(SensorEvent paramSensorEvent)
  {
    float f3;
    float f2;
    float f1;
    int i;
    int j;
    int k;
    if (sensor.getType() == 1)
    {
      float f6 = values[0];
      float f5 = values[1];
      float f4 = values[2];
      f3 = f4;
      f2 = f5;
      f1 = f6;
      if (MediaPlayerManager.a())
      {
        f1 = f6 * 10.0F;
        f2 = f5 * 10.0F;
        f3 = f4 * 10.0F;
      }
      i = (int)(a.jdField_a_of_type_Float - f1);
      j = (int)(a.b - f2);
      k = (int)(a.c - f3);
      if ((i == 0) && (j == 0) && (k == 0)) {
        break label156;
      }
    }
    for (a.jdField_a_of_type_Boolean = true;; a.jdField_a_of_type_Boolean = false) {
      label156:
      do
      {
        a.jdField_a_of_type_Float = f1;
        a.b = f2;
        a.c = f3;
        return;
      } while ((i != 0) || (j != 0) || (k != 0));
    }
  }
}
