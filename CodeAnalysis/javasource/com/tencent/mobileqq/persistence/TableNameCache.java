package com.tencent.mobileqq.persistence;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class TableNameCache
{
  private ConcurrentHashMap a;
  public boolean a;
  
  public TableNameCache()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  }
  
  public void a(String paramString)
  {
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, Boolean.valueOf(true));
  }
  
  public void a(String[] paramArrayOfString)
  {
    if (paramArrayOfString == null) {
      return;
    }
    int j = paramArrayOfString.length;
    int i = 0;
    while (i < j)
    {
      String str = paramArrayOfString[i];
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(str, Boolean.valueOf(true));
      i += 1;
    }
    jdField_a_of_type_Boolean = true;
  }
  
  public boolean a(String paramString)
  {
    return jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString);
  }
  
  public String[] a()
  {
    Set localSet = jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.keySet();
    String[] arrayOfString = new String[localSet.size()];
    localSet.toArray(arrayOfString);
    return arrayOfString;
  }
  
  public void b(String paramString)
  {
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramString);
  }
}
