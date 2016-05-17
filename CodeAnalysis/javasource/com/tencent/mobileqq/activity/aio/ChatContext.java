package com.tencent.mobileqq.activity.aio;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ChatContext
{
  private long jdField_a_of_type_Long;
  private String jdField_a_of_type_JavaLangString;
  
  public ChatContext(String paramString)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = paramString;
  }
  
  public long a()
  {
    return jdField_a_of_type_Long;
  }
  
  public String a()
  {
    return jdField_a_of_type_JavaLangString;
  }
  
  public void a(long paramLong)
  {
    jdField_a_of_type_Long = paramLong;
  }
  
  public void a(String paramString)
  {
    jdField_a_of_type_JavaLangString = paramString;
  }
}
