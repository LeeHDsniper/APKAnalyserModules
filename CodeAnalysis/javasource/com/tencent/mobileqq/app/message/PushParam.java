package com.tencent.mobileqq.app.message;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class PushParam
{
  public long a;
  public String a;
  
  public PushParam(String paramString, long paramLong)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = paramString;
    jdField_a_of_type_Long = paramLong;
  }
}
