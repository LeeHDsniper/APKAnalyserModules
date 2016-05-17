package com.tencent.mobileqq.msf.sdk.utils;

import android.content.Context;
import com.tencent.qphone.base.util.QLog;
import java.lang.reflect.Field;
import java.net.Socket;
import java.net.SocketImpl;
import java.net.SocketImplFactory;
import java.util.HashSet;

public class MonitorSocketImplFactory
  implements SocketImplFactory
{
  private static HashSet mServerSocketSet = new HashSet();
  public static final String tag = "MSF.D.MonitorSocket";
  Context context;
  Class socketClass = null;
  SocketImpl socketImpl;
  
  public MonitorSocketImplFactory() {}
  
  public static void addServerSocket(String paramString)
  {
    mServerSocketSet.add(paramString);
  }
  
  public static boolean isNetworkTypeMobile(int paramInt)
  {
    switch (paramInt)
    {
    case 1: 
    default: 
      return false;
    }
    return true;
  }
  
  public static boolean isServerSocket(String paramString)
  {
    return mServerSocketSet.contains(paramString);
  }
  
  public static void removeServerSocket(String paramString)
  {
    mServerSocketSet.remove(paramString);
  }
  
  public SocketImpl createSocketImpl()
  {
    return new b(socketClass, context);
  }
  
  public boolean getMsfSocketImpl(Context paramContext)
  {
    try
    {
      context = paramContext;
      paramContext = new Socket();
      Field localField = Socket.class.getDeclaredField("impl");
      localField.setAccessible(true);
      socketImpl = ((SocketImpl)localField.get(paramContext));
      socketClass = socketImpl.getClass();
      return true;
    }
    catch (Exception paramContext)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.D.MonitorSocket", 2, "get SocketImpl failed " + paramContext.getMessage());
      }
    }
    return false;
  }
}
