package com.tencent.mobileqq.activity.aio;

import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.Random;
import kpk;

public class AIOTimeReporter
{
  public static final int a = 0;
  public static final int b = 1;
  public static final int c = 1;
  private static String c = "HighDeviceFirstOpenAIOBusiness";
  public static final int d = 2;
  private static String d = "HighDeviceFirstOpenAIOBase";
  public static final int e = 3;
  private static String e = "HighDeviceNotFirstOpenAIOBusiness";
  public static final int f = 0;
  private static String f = "HighDeviceNotFirstOpenAIOBase";
  public static final int g = 1;
  private static String g = "MidDeviceFirstOpenAIOBusiness";
  private static String jdField_h_of_type_JavaLangString = "MidDeviceFirstOpenAIOBase";
  private static String i = "MidDeviceNotFirstOpenAIOBusiness";
  private static String j = "MidDeviceNotFirstOpenAIOBase";
  private static String k = "LowDeviceFirstOpenAIOBusiness";
  private static String l = "LowDeviceFirstOpenAIOBase";
  private static String m = "LowDeviceNotFirstOpenAIOBusiness";
  private static String n = "LowDeviceNotFirstOpenAIOBase";
  public String a = "Q.aio.AIOTimeReporter";
  private String b = "0";
  private int jdField_h_of_type_Int = -1;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public AIOTimeReporter() {}
  
  private void b()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d(a, 4, "reSet ");
    }
    jdField_h_of_type_Int = -1;
    b = "0";
  }
  
  public void a()
  {
    if (QLog.isDevelopLevel()) {
      QLog.d(a, 4, "reportAIOLifeCycleTime ");
    }
    if (new Random().nextInt(100) != 1)
    {
      b();
      return;
    }
    ThreadManager.a(new kpk(this), 0, null, false);
  }
}
