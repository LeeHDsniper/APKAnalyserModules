package com.tencent.mobileqq.persistence.fts;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class FTSCursorEntity
{
  private static final String a = "Q.fts.ftscursor";
  public int a;
  public int b;
  private String b;
  
  public FTSCursorEntity(int paramInt1, int paramInt2)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = paramInt1;
    jdField_b_of_type_Int = paramInt2;
  }
  
  public String a()
  {
    return jdField_b_of_type_JavaLangString;
  }
  
  public void a(String paramString)
  {
    jdField_b_of_type_JavaLangString = paramString;
  }
}
