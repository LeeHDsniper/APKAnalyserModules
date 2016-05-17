package com.tencent.mobileqq.app.asyncdb;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;

public class BaseDBQueueItem
{
  public static final int a = 0;
  public static final int b = 1;
  public static final int c = 2;
  public static final int d = 0;
  public static final int e = 1;
  public static final int f = 2;
  ProxyListener a;
  public Entity a;
  public int g;
  public int h;
  
  public BaseDBQueueItem(Entity paramEntity, int paramInt1, int paramInt2, ProxyListener paramProxyListener)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqPersistenceEntity = paramEntity;
    g = paramInt1;
    h = paramInt2;
    jdField_a_of_type_ComTencentMobileqqAppAsyncdbProxyListener = paramProxyListener;
  }
}
