package oicq.wlogin_sdk.request;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Semaphore;
import oicq.wlogin_sdk.tools.util;

public class WtloginMsfListener
  implements Runnable
{
  static Object TicketMgr;
  private static final Object __SyncCB;
  private static final Object __SyncSeq = new Object();
  private static Map<Long, WtloginMsfListener> __cbs = new HashMap();
  private static long __seq;
  private final String CLIENT_CLASSNAME = "com.tencent.mobileqq.msf.core.auth.WtProvider";
  private byte[] data;
  private boolean flag;
  private int ret;
  private byte[] ret_data = null;
  private String ret_serviceCmd;
  private boolean ret_success = false;
  private String ret_uin;
  private final Semaphore semp = new Semaphore(1);
  private String serviceCmd;
  private int timeout;
  private String uin;
  private WUserSigInfo userSigInfo;
  
  static
  {
    __SyncCB = new Object();
    __seq = 0L;
  }
  
  public WtloginMsfListener(String paramString1, String paramString2, byte[] paramArrayOfByte, int paramInt, boolean paramBoolean, WUserSigInfo paramWUserSigInfo)
  {
    String str = paramString1;
    if (paramString1 == null) {
      str = "0";
    }
    uin = str;
    paramString1 = paramString2;
    if (paramString2 == null) {
      paramString1 = "";
    }
    serviceCmd = paramString1;
    paramString1 = paramArrayOfByte;
    if (paramArrayOfByte == null) {
      paramString1 = new byte[0];
    }
    data = paramString1;
    if (paramInt > 0) {}
    for (;;)
    {
      timeout = paramInt;
      flag = paramBoolean;
      userSigInfo = paramWUserSigInfo;
      return;
      paramInt = 5000;
    }
  }
  
  private static long allocateSeq()
  {
    synchronized (__SyncSeq)
    {
      long l = __seq + 1L;
      __seq = l;
      return l % 2147483647L;
    }
  }
  
  public static void onAsyncReceive(String paramString1, String paramString2, long paramLong, byte[] paramArrayOfByte)
  {
    StringBuilder localStringBuilder = new StringBuilder().append("rpc receive ").append(paramString2).append(" seq: ").append(paramLong).append(" data:");
    if (paramArrayOfByte == null) {}
    for (Object localObject = "null";; localObject = Integer.valueOf(paramArrayOfByte.length))
    {
      util.LOGI(localObject, paramString1);
      localObject = pickSeq(paramLong);
      if (localObject != null) {
        ((WtloginMsfListener)localObject).onReceiveData(paramString1, paramString2, paramArrayOfByte);
      }
      return;
    }
  }
  
  public static void onAsyncReceiveFail(String paramString1, String paramString2, long paramLong, int paramInt)
  {
    util.LOGI("rpc receive " + paramString2 + " seq: " + paramLong + " fail:" + paramInt, paramString1);
    WtloginMsfListener localWtloginMsfListener = pickSeq(paramLong);
    if (localWtloginMsfListener != null) {
      localWtloginMsfListener.onReceiveFail(paramString1, paramString2, paramInt);
    }
  }
  
  private static WtloginMsfListener pickSeq(long paramLong)
  {
    synchronized (__SyncCB)
    {
      WtloginMsfListener localWtloginMsfListener = (WtloginMsfListener)__cbs.get(Long.valueOf(paramLong));
      __cbs.remove(Long.valueOf(paramLong));
      return localWtloginMsfListener;
    }
  }
  
  private int sendRPCData(byte[] arg1, int paramInt)
  {
    long l = allocateSeq();
    util.LOGI("sendRPCData seq: " + l, "");
    try
    {
      Class localClass1 = Class.forName("mqq.manager.TicketManager");
      if (TicketMgr == null)
      {
        Object localObject3 = Class.forName("com.tencent.common.app.BaseApplicationImpl");
        Object localObject4 = Class.forName("mqq.app.BaseActivity");
        Class localClass2 = Class.forName("mqq.app.AppRuntime");
        Object localObject2 = ((Class)localObject3).getMethod("getApplication", new Class[0]);
        Method localMethod = ((Class)localObject3).getMethod("waitAppRuntime", new Class[] { localObject4 });
        localObject3 = localClass2.getMethod("getManager", new Class[] { Integer.TYPE });
        localObject4 = localClass2.getField("TICKET_MANAGER");
        localObject2 = ((Method)localObject2).invoke(null, new Object[0]);
        if (localObject2 != null)
        {
          localObject2 = localMethod.invoke(localObject2, new Object[] { null });
          if (localObject2 != null) {
            TicketMgr = ((Method)localObject3).invoke(localObject2, new Object[] { ((Field)localObject4).get(localClass2) });
          }
        }
      }
      int i = Integer.valueOf(localClass1.getMethod("sendRPCData", new Class[] { Long.TYPE, String.class, String.class, [B.class, Integer.TYPE }).invoke(TicketMgr, new Object[] { Long.valueOf(l), uin, serviceCmd, ???.clone(), Integer.valueOf(paramInt) }).toString()).intValue();
      paramInt = i;
      if (i == 0) {
        paramInt = 99;
      }
      synchronized (__SyncCB)
      {
        __cbs.put(Long.valueOf(l), this);
        semp.acquire();
        return paramInt;
      }
      return 64536;
    }
    catch (Exception ???)
    {
      util.printException(???, uin);
    }
  }
  
  public void Cancel()
  {
    try
    {
      Class localClass = Class.forName("com.tencent.mobileqq.msf.core.auth.WtProvider");
      localClass.getMethod("cancel", new Class[] { WUserSigInfo.class }).invoke(localClass, new Object[] { userSigInfo });
      return;
    }
    catch (Exception localException)
    {
      util.printException(localException, uin);
    }
  }
  
  public byte[] RecvData()
  {
    StringBuilder localStringBuilder;
    for (;;)
    {
      try
      {
        semp.acquire();
        if (!ret_success) {
          return null;
        }
        if ((ret_uin != null) && (ret_uin.equals(uin))) {
          break;
        }
        ret = 64527;
        localStringBuilder = new StringBuilder().append("ret_uin: ");
        if (ret_uin == null)
        {
          String str = "null";
          localStringBuilder = localStringBuilder.append(str).append(", uin: ");
          if (uin != null) {
            break label124;
          }
          str = "null";
          util.LOGI(str, "");
          return null;
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        util.printException(localInterruptedException, uin);
        return null;
      }
      localObject = ret_uin;
      continue;
      label124:
      localObject = uin;
    }
    if ((ret_serviceCmd == null) || (!ret_serviceCmd.equals(serviceCmd)))
    {
      ret = 64527;
      localStringBuilder = new StringBuilder().append("ret_serviceCmd: ");
      if (ret_serviceCmd == null)
      {
        localObject = "null";
        localStringBuilder = localStringBuilder.append((String)localObject).append(", serviceCmd:");
        if (serviceCmd != null) {
          break label229;
        }
      }
      label229:
      for (localObject = "null";; localObject = serviceCmd)
      {
        util.LOGI((String)localObject, "");
        return null;
        localObject = ret_serviceCmd;
        break;
      }
    }
    semp.release();
    Object localObject = ret_data;
    return localObject;
  }
  
  public int SendData(byte[] paramArrayOfByte, int paramInt)
  {
    Object localObject = u.l();
    util.LOGI("mqq process: " + (String)localObject, "");
    if (!((String)localObject).endsWith(":MSF")) {
      paramInt = sendRPCData(paramArrayOfByte, paramInt);
    }
    for (;;)
    {
      return paramInt;
      try
      {
        util.LOGI("msf sendData", "");
        localObject = Class.forName("com.tencent.mobileqq.msf.core.auth.WtProvider");
        int i = Integer.valueOf(((Class)localObject).getMethod("sendData", new Class[] { WUserSigInfo.class, String.class, String.class, [B.class, Integer.TYPE, Boolean.TYPE, WtloginMsfListener.class }).invoke(localObject, new Object[] { userSigInfo, uin, serviceCmd, paramArrayOfByte.clone(), Integer.valueOf(paramInt), Boolean.valueOf(flag), this }).toString()).intValue();
        paramInt = i;
        if (i > 0)
        {
          semp.acquire();
          return i;
        }
      }
      catch (Exception paramArrayOfByte)
      {
        util.printException(paramArrayOfByte, uin);
      }
    }
    return 64536;
  }
  
  public int getRet()
  {
    return ret;
  }
  
  public byte[] getRetData()
  {
    return ret_data;
  }
  
  public void onReceiveData(String paramString1, String paramString2, byte[] paramArrayOfByte)
  {
    ret_success = true;
    ret_uin = paramString1;
    ret_serviceCmd = paramString2;
    ret = 0;
    ret_data = paramArrayOfByte;
    semp.release();
  }
  
  public void onReceiveFail(String paramString1, String paramString2, int paramInt)
  {
    ret_success = false;
    ret_uin = paramString1;
    ret_serviceCmd = paramString2;
    ret = paramInt;
    semp.release();
  }
  
  public void run()
  {
    try
    {
      ret = SendData(data, timeout);
      if (ret <= 0)
      {
        util.LOGI("msf request send data failed, ret=" + ret, "");
        return;
      }
      if (RecvData() == null)
      {
        ret_data = null;
        return;
      }
    }
    catch (Exception localException) {}
  }
}
