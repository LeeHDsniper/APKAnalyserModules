package com.tencent.mobileqq.app;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ShakeListener
  implements SensorEventListener
{
  private float jdField_a_of_type_Float;
  int jdField_a_of_type_Int;
  private long jdField_a_of_type_Long;
  private float jdField_b_of_type_Float;
  private long jdField_b_of_type_Long;
  private float jdField_c_of_type_Float;
  private long jdField_c_of_type_Long;
  private float jdField_d_of_type_Float;
  private long jdField_d_of_type_Long;
  private float e;
  
  public ShakeListener()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
  }
  
  public void a() {}
  
  public void a(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt) {}
  
  public void b()
  {
    jdField_b_of_type_Long = 0L;
    jdField_c_of_type_Long = 0L;
    jdField_a_of_type_Long = 0L;
    jdField_d_of_type_Long = 0L;
    jdField_a_of_type_Float = 0.0F;
    jdField_b_of_type_Float = 0.0F;
    jdField_c_of_type_Float = 0.0F;
    jdField_d_of_type_Float = 0.0F;
    e = 0.0F;
  }
  
  public void onAccuracyChanged(Sensor paramSensor, int paramInt) {}
  
  public void onSensorChanged(SensorEvent paramSensorEvent)
  {
    float f1;
    float f2;
    float f3;
    if (sensor.getType() == 1)
    {
      f1 = values[0];
      f2 = values[1];
      f3 = values[2];
      jdField_a_of_type_Long = System.currentTimeMillis();
      float f4 = (float)(jdField_a_of_type_Long - jdField_b_of_type_Long);
      if (jdField_a_of_type_Long - jdField_b_of_type_Long > 100L)
      {
        jdField_c_of_type_Long = (jdField_a_of_type_Long - jdField_b_of_type_Long);
        if ((jdField_a_of_type_Float != 0.0F) || (jdField_b_of_type_Float != 0.0F) || (jdField_c_of_type_Float != 0.0F)) {
          break label225;
        }
        jdField_d_of_type_Long = System.currentTimeMillis();
      }
    }
    for (;;)
    {
      e += jdField_d_of_type_Float;
      if (jdField_a_of_type_Int > 10)
      {
        b();
        jdField_a_of_type_Int = 0;
      }
      a(f1, f2, f3, (int)e);
      if ((e > 100.0F) && (jdField_a_of_type_Int >= 3))
      {
        a();
        jdField_a_of_type_Int = 0;
        b();
      }
      jdField_a_of_type_Int += 1;
      jdField_a_of_type_Float = f1;
      jdField_b_of_type_Float = f2;
      jdField_c_of_type_Float = f3;
      jdField_b_of_type_Long = jdField_a_of_type_Long;
      return;
      label225:
      jdField_d_of_type_Float = (Math.abs(f1 - jdField_a_of_type_Float) + Math.abs(f2 - jdField_b_of_type_Float) + Math.abs(f3 - jdField_c_of_type_Float));
    }
  }
}
