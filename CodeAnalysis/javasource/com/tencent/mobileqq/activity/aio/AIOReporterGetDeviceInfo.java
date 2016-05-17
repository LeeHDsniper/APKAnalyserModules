package com.tencent.mobileqq.activity.aio;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.DeviceInfoUtil;

public class AIOReporterGetDeviceInfo
{
  private static AIOReporterGetDeviceInfo a;
  public int a;
  private int b = -1;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqActivityAioAIOReporterGetDeviceInfo = null;
  }
  
  private AIOReporterGetDeviceInfo()
  {
    jdField_a_of_type_Int = 0;
  }
  
  /* Error */
  public static AIOReporterGetDeviceInfo a()
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 18	com/tencent/mobileqq/activity/aio/AIOReporterGetDeviceInfo:jdField_a_of_type_ComTencentMobileqqActivityAioAIOReporterGetDeviceInfo	Lcom/tencent/mobileqq/activity/aio/AIOReporterGetDeviceInfo;
    //   6: ifnonnull +22 -> 28
    //   9: new 2	com/tencent/mobileqq/activity/aio/AIOReporterGetDeviceInfo
    //   12: dup
    //   13: invokespecial 28	com/tencent/mobileqq/activity/aio/AIOReporterGetDeviceInfo:<init>	()V
    //   16: putstatic 18	com/tencent/mobileqq/activity/aio/AIOReporterGetDeviceInfo:jdField_a_of_type_ComTencentMobileqqActivityAioAIOReporterGetDeviceInfo	Lcom/tencent/mobileqq/activity/aio/AIOReporterGetDeviceInfo;
    //   19: getstatic 18	com/tencent/mobileqq/activity/aio/AIOReporterGetDeviceInfo:jdField_a_of_type_ComTencentMobileqqActivityAioAIOReporterGetDeviceInfo	Lcom/tencent/mobileqq/activity/aio/AIOReporterGetDeviceInfo;
    //   22: astore_0
    //   23: ldc 2
    //   25: monitorexit
    //   26: aload_0
    //   27: areturn
    //   28: getstatic 18	com/tencent/mobileqq/activity/aio/AIOReporterGetDeviceInfo:jdField_a_of_type_ComTencentMobileqqActivityAioAIOReporterGetDeviceInfo	Lcom/tencent/mobileqq/activity/aio/AIOReporterGetDeviceInfo;
    //   31: iconst_1
    //   32: putfield 24	com/tencent/mobileqq/activity/aio/AIOReporterGetDeviceInfo:jdField_a_of_type_Int	I
    //   35: goto -16 -> 19
    //   38: astore_0
    //   39: ldc 2
    //   41: monitorexit
    //   42: aload_0
    //   43: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   22	5	0	localAIOReporterGetDeviceInfo	AIOReporterGetDeviceInfo
    //   38	5	0	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   3	19	38	finally
    //   19	23	38	finally
    //   28	35	38	finally
  }
  
  public int a()
  {
    if (-1 == b)
    {
      if ((DeviceInfoUtil.c() >>> 20 <= 1390L) || (DeviceInfoUtil.b() <= 3) || (DeviceInfoUtil.a() <= 1433L)) {
        break label48;
      }
      b = 1;
    }
    for (;;)
    {
      return b;
      label48:
      if ((DeviceInfoUtil.c() >>> 20 > 926L) && (DeviceInfoUtil.b() > 1) && (DeviceInfoUtil.a() > 961L)) {
        b = 2;
      } else {
        b = 3;
      }
    }
  }
}
