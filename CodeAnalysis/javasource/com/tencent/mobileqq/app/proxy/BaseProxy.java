package com.tencent.mobileqq.app.proxy;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public abstract class BaseProxy
{
  protected QQAppInterface a;
  public ProxyManager a;
  
  public BaseProxy(QQAppInterface paramQQAppInterface, ProxyManager paramProxyManager)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager = paramProxyManager;
  }
  
  protected abstract void a();
  
  protected abstract void b();
}
