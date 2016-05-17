package com.tencent.mobileqq.persistence;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class OGColumn
{
  public Class a;
  public String a;
  public String b;
  
  public OGColumn()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public OGColumn(Class paramClass, String paramString1, String paramString2)
  {
    jdField_a_of_type_JavaLangClass = paramClass;
    jdField_a_of_type_JavaLangString = paramString1;
    b = paramString2;
  }
  
  public String toString()
  {
    return jdField_a_of_type_JavaLangString;
  }
}
