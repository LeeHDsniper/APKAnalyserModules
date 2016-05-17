package com.tencent.mobileqq.app.fms;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.SoftReference;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Observable;
import mqq.manager.Manager;
import nit;

public class FullMessageSearchManager
  extends Observable
  implements Manager
{
  private static final String jdField_a_of_type_JavaLangString = "Q.msg.FullMessageSearch";
  private final QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private HashMap jdField_a_of_type_JavaUtilHashMap;
  
  public FullMessageSearchManager(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  private FullMessageSearchTask a(String paramString)
  {
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaUtilHashMap)
      {
        localObject1 = (SoftReference)jdField_a_of_type_JavaUtilHashMap.get(paramString);
        if (localObject1 != null)
        {
          localObject1 = (FullMessageSearchTask)((SoftReference)localObject1).get();
          Object localObject2 = localObject1;
          if (localObject1 == null)
          {
            localObject2 = new FullMessageSearchTask(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString, new nit(this));
            jdField_a_of_type_JavaUtilHashMap.put(paramString, new SoftReference(localObject2));
          }
          return localObject2;
        }
      }
      Object localObject1 = null;
    }
  }
  
  public FullMessageSearchResult a(String paramString)
  {
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaUtilHashMap)
      {
        localObject = (SoftReference)jdField_a_of_type_JavaUtilHashMap.get(paramString);
        if (localObject == null) {
          break label67;
        }
        localObject = (FullMessageSearchTask)((SoftReference)localObject).get();
        if (localObject == null)
        {
          if (QLog.isColorLevel()) {
            QLog.d("Q.msg.FullMessageSearch", 2, "reusmeSearch fail , do all-search");
          }
          return c(paramString);
        }
      }
      return ((FullMessageSearchTask)localObject).a();
      label67:
      Object localObject = null;
    }
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.FullMessageSearch", 2, "stopSearch " + jdField_a_of_type_JavaUtilHashMap.size());
    }
    synchronized (jdField_a_of_type_JavaUtilHashMap)
    {
      Iterator localIterator = jdField_a_of_type_JavaUtilHashMap.values().iterator();
      while (localIterator.hasNext())
      {
        Object localObject2 = (SoftReference)localIterator.next();
        if (localObject2 != null)
        {
          localObject2 = (FullMessageSearchTask)((SoftReference)localObject2).get();
          if (localObject2 != null) {
            ((FullMessageSearchTask)localObject2).b(2);
          }
        }
      }
    }
    jdField_a_of_type_JavaUtilHashMap.clear();
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.msg.FullMessageSearch", 2, "pauseSearch " + paramString);
    }
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaUtilHashMap)
      {
        paramString = (SoftReference)jdField_a_of_type_JavaUtilHashMap.get(paramString);
        if (paramString != null)
        {
          paramString = (FullMessageSearchTask)paramString.get();
          if (paramString != null) {
            paramString.a();
          }
          return;
        }
      }
      paramString = null;
    }
  }
  
  public FullMessageSearchResult b(String paramString)
  {
    return a(paramString).b();
  }
  
  public FullMessageSearchResult c(String paramString)
  {
    return a(paramString).c();
  }
  
  public void onDestroy()
  {
    a();
  }
}
