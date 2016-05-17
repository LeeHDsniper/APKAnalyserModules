package com.tencent.mobileqq.app.message;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.concurrent.ConcurrentHashMap;

public class MsgPool
{
  private static final String a = "null";
  private static ConcurrentHashMap d = new ConcurrentHashMap();
  protected ConcurrentHashMap a = new ConcurrentHashMap();
  private ConcurrentHashMap b = new ConcurrentHashMap();
  private ConcurrentHashMap c = new ConcurrentHashMap();
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private MsgPool() {}
  
  public static MsgPool a(String arg0)
  {
    String str = ???;
    if (??? == null)
    {
      ??? = "null";
      str = ???;
      if (QLog.isColorLevel())
      {
        QLog.e("MsgPool", 2, "getPoolInstance curUin is null");
        str = ???;
      }
    }
    if (!d.containsKey(str)) {}
    synchronized (d)
    {
      if (!d.containsKey(str)) {
        d.put(str, new MsgPool());
      }
      return (MsgPool)d.get(str);
    }
  }
  
  public static void a(String paramString)
  {
    String str = paramString;
    if (paramString == null)
    {
      paramString = "null";
      str = paramString;
      if (QLog.isColorLevel())
      {
        QLog.e("MsgPool", 2, "getPoolInstance curUin is null");
        str = paramString;
      }
    }
    if (d.containsKey(str)) {
      d.remove(str);
    }
  }
  
  public Object a(String paramString, int paramInt)
  {
    ??? = MsgProxyUtils.a(paramString, paramInt);
    paramString = (String)???;
    if (??? == null) {
      paramString = "0";
    }
    if (!a.containsKey(paramString)) {}
    synchronized (a)
    {
      if (!a.containsKey(paramString)) {
        a.put(paramString, new Object());
      }
      return a.get(paramString);
    }
  }
  
  public ConcurrentHashMap a()
  {
    return b;
  }
  
  public ConcurrentHashMap b()
  {
    return c;
  }
}
