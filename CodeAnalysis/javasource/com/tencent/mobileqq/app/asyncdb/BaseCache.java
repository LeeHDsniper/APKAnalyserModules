package com.tencent.mobileqq.app.asyncdb;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;

public abstract class BaseCache
{
  protected QQAppInterface a;
  protected DBDelayManager a;
  protected Class a;
  protected ArrayList a;
  protected ConcurrentHashMap a;
  
  public BaseCache(QQAppInterface paramQQAppInterface, DBDelayManager paramDBDelayManager, Class paramClass)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager = paramDBDelayManager;
    jdField_a_of_type_JavaLangClass = paramClass;
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
  }
  
  public Entity a(String paramString)
  {
    return (Entity)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
  }
  
  protected String a(Entity paramEntity)
  {
    return Long.toString(paramEntity.getId());
  }
  
  protected abstract void a();
  
  public void a(int paramInt)
  {
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext()) {
      ((CacheObserver)localIterator.next()).a(paramInt);
    }
  }
  
  public void a(CacheObserver paramCacheObserver)
  {
    if (!jdField_a_of_type_JavaUtilArrayList.contains(paramCacheObserver)) {
      jdField_a_of_type_JavaUtilArrayList.add(paramCacheObserver);
    }
  }
  
  public void a(Entity paramEntity)
  {
    a(paramEntity, 0, null);
  }
  
  public abstract void a(Entity paramEntity, int paramInt, ProxyListener paramProxyListener);
  
  protected abstract void b();
  
  public void b(CacheObserver paramCacheObserver)
  {
    if (jdField_a_of_type_JavaUtilArrayList.contains(paramCacheObserver)) {
      jdField_a_of_type_JavaUtilArrayList.remove(paramCacheObserver);
    }
  }
  
  public void b(Entity paramEntity)
  {
    b(paramEntity, 0, null);
  }
  
  public void b(Entity paramEntity, int paramInt, ProxyListener paramProxyListener)
  {
    String str = a(paramEntity);
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(str, paramEntity);
    if (paramEntity.getStatus() == 1000)
    {
      jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager.a(paramEntity, 0, paramInt, paramProxyListener);
      return;
    }
    jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager.a(paramEntity, 1, paramInt, paramProxyListener);
  }
  
  public void c(Entity paramEntity)
  {
    c(paramEntity, 0, null);
  }
  
  public void c(Entity paramEntity, int paramInt, ProxyListener paramProxyListener)
  {
    String str = a(paramEntity);
    if (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(str)) {
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(str);
    }
    jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager.a(paramEntity, 2, paramInt, paramProxyListener);
  }
}
