package com.tencent.mobileqq.msf.sdk;

import android.content.Context;
import android.net.NetworkInfo;
import com.tencent.mobileqq.msf.sdk.handler.INetEventHandler;
import com.tencent.mobileqq.msf.sdk.handler.INetInfoHandler;

public class AppNetConnInfo
{
  public static final int MOBILE_2G = 0;
  public static final int MOBILE_3G = 1;
  public static final int MOBILE_4G = 2;
  public static final int MOBILE_NONE = -1;
  public static final int MOBILE_UNKNOWN = 3;
  public static final int NET_MOBILE = 0;
  public static final int NET_NONE = -1;
  public static final int NET_WIFI = 1;
  public static final int NET_WIFI_NEEDAUTH = 2;
  
  public AppNetConnInfo() {}
  
  public static int getConnInfo()
  {
    a.h();
    return a.c() - 1;
  }
  
  public static String getCurrentAPN()
  {
    a.h();
    return a.i;
  }
  
  public static int getMobileInfo()
  {
    a.h();
    return a.d();
  }
  
  public static NetworkInfo getRecentNetworkInfo()
  {
    a.h();
    return a.g();
  }
  
  public static String getSubtypeName()
  {
    a.h();
    return a.j;
  }
  
  public static boolean isMobileConn()
  {
    a.h();
    return a.f();
  }
  
  public static boolean isNeedWifiAuth()
  {
    a.h();
    return a.g;
  }
  
  public static boolean isNetSupport()
  {
    a.h();
    return a.b();
  }
  
  public static boolean isWifiConn()
  {
    a.h();
    return a.e();
  }
  
  public static void registerConnectionChangeReceiver(Context paramContext, INetInfoHandler paramINetInfoHandler)
  {
    a.a(paramContext, paramINetInfoHandler);
  }
  
  public static void registerNetChangeReceiver(Context paramContext, INetEventHandler paramINetEventHandler)
  {
    a.a(paramContext, paramINetEventHandler);
  }
  
  public static boolean unregisterNetEventHandler(INetEventHandler paramINetEventHandler)
  {
    return a.a(paramINetEventHandler);
  }
  
  public static boolean unregisterNetInfoHandler(INetInfoHandler paramINetInfoHandler)
  {
    return a.a(paramINetInfoHandler);
  }
}
