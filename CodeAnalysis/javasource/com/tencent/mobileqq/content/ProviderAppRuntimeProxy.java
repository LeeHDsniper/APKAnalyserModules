package com.tencent.mobileqq.content;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SQLiteDatabase;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import mqq.app.AppRuntime;

public class ProviderAppRuntimeProxy
{
  public ProviderAppRuntimeProxy()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  SQLiteDatabase a(AppRuntime paramAppRuntime, String paramString)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramAppRuntime != null)
    {
      localObject1 = localObject2;
      if ((paramAppRuntime instanceof QQAppInterface)) {
        localObject1 = ((QQAppInterface)paramAppRuntime).b(paramString);
      }
    }
    return localObject1;
  }
}
