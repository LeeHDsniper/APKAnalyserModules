package com.tencent.mobileqq.activity.qwallet;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class PasswdRedBagUpdateInfo
{
  public int a;
  public long a;
  public long b;
  
  public PasswdRedBagUpdateInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof PasswdRedBagUpdateInfo))
    {
      paramObject = (PasswdRedBagUpdateInfo)paramObject;
      if ((jdField_a_of_type_Int == jdField_a_of_type_Int) && (jdField_a_of_type_Long == jdField_a_of_type_Long)) {
        return true;
      }
    }
    return false;
  }
}
