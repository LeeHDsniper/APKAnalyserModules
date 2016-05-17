package com.tencent.mobileqq.app.asyncdb;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public abstract class FullCache
  extends BaseCache
{
  public FullCache(QQAppInterface paramQQAppInterface, DBDelayManager paramDBDelayManager, Class paramClass)
  {
    super(paramQQAppInterface, paramDBDelayManager, paramClass);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected void a()
  {
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    Object localObject = localEntityManager.a(jdField_a_of_type_JavaLangClass, false, null, null, null, null, null, null);
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        Entity localEntity = (Entity)((Iterator)localObject).next();
        jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(a(localEntity), localEntity);
      }
    }
    localEntityManager.a();
  }
  
  public void a(Entity paramEntity, int paramInt, ProxyListener paramProxyListener)
  {
    String str = a(paramEntity);
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(str, paramEntity);
    if (paramEntity.getStatus() == 1000)
    {
      a.a(paramEntity, 0, paramInt, paramProxyListener);
      return;
    }
    a.a(paramEntity, 1, paramInt, paramProxyListener);
  }
}
