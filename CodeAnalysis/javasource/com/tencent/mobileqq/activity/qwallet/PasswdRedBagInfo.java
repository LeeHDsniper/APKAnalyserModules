package com.tencent.mobileqq.activity.qwallet;

import android.text.TextUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class PasswdRedBagInfo
{
  public long a;
  public String a;
  public boolean a;
  public String b;
  public boolean b;
  public String c;
  public boolean c;
  
  public PasswdRedBagInfo() {}
  
  public PasswdRedBagInfo(String paramString1, String paramString2, long paramLong, String paramString3, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = paramString1;
    jdField_b_of_type_JavaLangString = paramString2;
    jdField_a_of_type_Long = paramLong;
    jdField_c_of_type_JavaLangString = paramString3;
    jdField_a_of_type_Boolean = paramBoolean1;
    jdField_b_of_type_Boolean = paramBoolean2;
    jdField_c_of_type_Boolean = paramBoolean3;
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof PasswdRedBagInfo))
    {
      paramObject = (PasswdRedBagInfo)paramObject;
      if (!TextUtils.isEmpty(jdField_a_of_type_JavaLangString)) {
        break label24;
      }
    }
    label24:
    while (!jdField_a_of_type_JavaLangString.equals(jdField_a_of_type_JavaLangString)) {
      return false;
    }
    return true;
  }
}
