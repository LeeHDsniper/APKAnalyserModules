package com.tencent.mobileqq.app.proxy;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.DataLineMsgRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class DataLineMsgPcProxy
  extends DataLineMsgProxy
{
  public DataLineMsgPcProxy(QQAppInterface paramQQAppInterface, ProxyManager paramProxyManager)
  {
    super(paramQQAppInterface, paramProxyManager);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = DataLineMsgRecord.tableName(0);
  }
}
