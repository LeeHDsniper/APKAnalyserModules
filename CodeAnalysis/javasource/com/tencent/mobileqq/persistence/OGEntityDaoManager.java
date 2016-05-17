package com.tencent.mobileqq.persistence;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.reflect.Method;

public class OGEntityDaoManager
{
  public static OGEntityDaoManager a;
  public static final String a = "com.tencent.mobileqq.persistence.EntityDaoRegister";
  public static Method a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqPersistenceOGEntityDaoManager = new OGEntityDaoManager();
    jdField_a_of_type_JavaLangReflectMethod = null;
  }
  
  public OGEntityDaoManager() {}
  
  public static OGEntityDaoManager a()
  {
    return jdField_a_of_type_ComTencentMobileqqPersistenceOGEntityDaoManager;
  }
  
  public static void a(String[] paramArrayOfString)
  {
    new OGEntityDaoManager().a(OGEntityDaoManager.class);
  }
  
  public OGAbstractDao a(Class paramClass)
  {
    return EntityDaoRegister.a(paramClass);
  }
  
  public String a(Class paramClass, String paramString)
  {
    paramClass = a(paramClass);
    if (paramClass != null) {
      return paramClass.a(paramString);
    }
    return null;
  }
}
