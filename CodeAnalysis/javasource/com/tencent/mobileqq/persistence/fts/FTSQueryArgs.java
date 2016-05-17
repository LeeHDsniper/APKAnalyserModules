package com.tencent.mobileqq.persistence.fts;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class FTSQueryArgs
{
  public int a;
  public String a;
  public boolean a;
  public String[] a;
  public int b;
  public String b;
  public boolean b;
  public int c;
  public String c;
  
  public FTSQueryArgs(String paramString, Class paramClass, String[] paramArrayOfString, boolean paramBoolean, int paramInt)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = null;
    jdField_a_of_type_ArrayOfJavaLangString = new String[0];
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Int = -1;
    jdField_b_of_type_JavaLangString = null;
    jdField_c_of_type_JavaLangString = null;
    jdField_c_of_type_Int = 0;
    jdField_a_of_type_JavaLangString = paramString;
    jdField_c_of_type_JavaLangString = paramClass.getName().replace('.', '/');
    jdField_a_of_type_ArrayOfJavaLangString = paramArrayOfString;
    jdField_a_of_type_Boolean = paramBoolean;
    jdField_a_of_type_Int = paramInt;
  }
}
