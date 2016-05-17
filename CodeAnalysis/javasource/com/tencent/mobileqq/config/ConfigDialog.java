package com.tencent.mobileqq.config;

import android.content.Context;
import android.os.Bundle;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class ConfigDialog
{
  public static int a;
  public static String a;
  public static int b;
  public static String b;
  protected Bundle a;
  protected CommandListener a;
  protected String c;
  protected String d;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "TITLE";
    jdField_b_of_type_JavaLangString = "CONTENT";
    jdField_a_of_type_Int = 10001;
    jdField_b_of_type_Int = 10002;
  }
  
  public ConfigDialog(Context paramContext) {}
  
  public abstract Bundle a();
  
  public abstract String a();
  
  public abstract String b();
}
