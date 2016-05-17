package com.tencent.mobileqq.app.asyncdb;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.asyncdb.cache.RoamDateCache;
import com.tencent.mobileqq.app.asyncdb.cache.TroopStatisticsCache;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import mqq.manager.Manager;

public class CacheManager
  implements Manager
{
  public static final int a = 1;
  private static final String jdField_a_of_type_JavaLangString = "Q.db.Cache";
  public static final int b = 2;
  public static final int c = 3;
  private static final int d = 4;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private DBDelayManager jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager;
  private boolean jdField_a_of_type_Boolean;
  private int[] jdField_a_of_type_ArrayOfInt;
  private BaseCache[] jdField_a_of_type_ArrayOfComTencentMobileqqAppAsyncdbBaseCache;
  private boolean jdField_b_of_type_Boolean;
  private int[] jdField_b_of_type_ArrayOfInt;
  
  public CacheManager(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_ArrayOfComTencentMobileqqAppAsyncdbBaseCache = new BaseCache[4];
    jdField_a_of_type_ArrayOfInt = new int[0];
    jdField_b_of_type_ArrayOfInt = new int[0];
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager = new DBDelayManager(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
  }
  
  private void a(int[] paramArrayOfInt)
  {
    int j = paramArrayOfInt.length;
    int i = 0;
    while (i < j)
    {
      int k = paramArrayOfInt[i];
      long l = System.currentTimeMillis();
      BaseCache localBaseCache = a(k);
      if (localBaseCache != null)
      {
        localBaseCache.a();
        if (QLog.isColorLevel()) {
          QLog.d("Q.db.Cache", 2, "cacheManager init cache:" + localBaseCache.getClass().getName() + " cost=" + (System.currentTimeMillis() - l));
        }
        localBaseCache.a(0);
      }
      i += 1;
    }
  }
  
  public BaseCache a(int paramInt)
  {
    BaseCache localBaseCache = jdField_a_of_type_ArrayOfComTencentMobileqqAppAsyncdbBaseCache[paramInt];
    if (localBaseCache == null) {}
    for (;;)
    {
      synchronized (jdField_a_of_type_ArrayOfComTencentMobileqqAppAsyncdbBaseCache)
      {
        localBaseCache = jdField_a_of_type_ArrayOfComTencentMobileqqAppAsyncdbBaseCache[paramInt];
        if (localBaseCache != null) {
          return localBaseCache;
        }
        long l = System.currentTimeMillis();
        switch (paramInt)
        {
        case 2: 
          if ((localBaseCache != null) && (jdField_a_of_type_ArrayOfComTencentMobileqqAppAsyncdbBaseCache[paramInt] == null)) {
            jdField_a_of_type_ArrayOfComTencentMobileqqAppAsyncdbBaseCache[paramInt] = localBaseCache;
          }
          if ((QLog.isColorLevel()) && (localBaseCache != null)) {
            QLog.d("Q.db.Cache", 2, "get cache instance:" + localBaseCache.getClass().getName() + " cost=" + (System.currentTimeMillis() - l));
          }
          return localBaseCache;
        }
      }
      Object localObject2 = new RoamDateCache(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager);
      continue;
      localObject2 = new TroopStatisticsCache(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager);
      continue;
      return localObject2;
    }
  }
  
  public DBDelayManager a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager;
  }
  
  public void a()
  {
    if (jdField_a_of_type_Boolean) {
      return;
    }
    a(jdField_a_of_type_ArrayOfInt);
    jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager.a();
    jdField_a_of_type_Boolean = true;
  }
  
  public void b()
  {
    if (jdField_b_of_type_Boolean) {
      return;
    }
    a(jdField_b_of_type_ArrayOfInt);
    jdField_b_of_type_Boolean = true;
  }
  
  public void onDestroy()
  {
    for (;;)
    {
      int i;
      synchronized (jdField_a_of_type_ArrayOfComTencentMobileqqAppAsyncdbBaseCache)
      {
        BaseCache[] arrayOfBaseCache2 = jdField_a_of_type_ArrayOfComTencentMobileqqAppAsyncdbBaseCache;
        int j = arrayOfBaseCache2.length;
        i = 0;
        if (i < j)
        {
          BaseCache localBaseCache = arrayOfBaseCache2[i];
          if (localBaseCache != null) {
            localBaseCache.b();
          }
        }
        else
        {
          jdField_a_of_type_ComTencentMobileqqAppAsyncdbDBDelayManager.onDestroy();
          return;
        }
      }
      i += 1;
    }
  }
}
