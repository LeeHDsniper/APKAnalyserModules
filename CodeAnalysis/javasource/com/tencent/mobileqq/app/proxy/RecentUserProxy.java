package com.tencent.mobileqq.app.proxy;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.asyncdb.DBDelayManager;
import com.tencent.mobileqq.app.asyncdb.cache.RecentUserCache;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class RecentUserProxy
  extends RecentUserCache
{
  public RecentUserProxy(QQAppInterface paramQQAppInterface, DBDelayManager paramDBDelayManager)
  {
    super(paramQQAppInterface, paramDBDelayManager);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
}
