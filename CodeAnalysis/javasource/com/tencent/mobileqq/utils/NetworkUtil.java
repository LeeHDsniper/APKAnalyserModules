package com.tencent.mobileqq.utils;

import android.content.Context;
import android.net.NetworkInfo;
import android.os.Build.VERSION;
import com.tencent.biz.common.util.HttpUtil;
import com.tencent.mobileqq.highway.utils.HwNetworkUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.AppNetConnInfo;
import cooperation.qzone.util.NetworkState;

public class NetworkUtil
{
  public NetworkUtil()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static int a(Context paramContext)
  {
    int j = HttpUtil.a();
    int i = j;
    if (j == -1) {
      i = 2;
    }
    return i;
  }
  
  public static String a(int paramInt)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append(paramInt & 0xFF).append(".").append(paramInt >> 8 & 0xFF).append(".").append(paramInt >> 16 & 0xFF).append(".").append(paramInt >> 24 & 0xFF);
    return localStringBuffer.toString();
  }
  
  public static String a(Context paramContext)
  {
    return NetworkState.b();
  }
  
  public static boolean a(Context paramContext)
  {
    return HwNetworkUtil.isAirplaneModeOn(paramContext);
  }
  
  public static boolean a(NetworkInfo paramNetworkInfo)
  {
    return HwNetworkUtil.isMobileNetworkInfo(paramNetworkInfo);
  }
  
  public static int b(Context paramContext)
  {
    int j = -1;
    int i = j;
    if (AppNetConnInfo.isNetSupport())
    {
      paramContext = AppNetConnInfo.getRecentNetworkInfo();
      i = j;
      if (paramContext != null) {
        i = paramContext.getType();
      }
    }
    return i;
  }
  
  public static boolean b(Context paramContext)
  {
    return HwNetworkUtil.isWifiEnabled(paramContext);
  }
  
  public static boolean c(Context paramContext)
  {
    return HwNetworkUtil.isMobileNetWork(paramContext);
  }
  
  public static boolean d(Context paramContext)
  {
    return HwNetworkUtil.is3Gor4G(paramContext);
  }
  
  public static boolean e(Context paramContext)
  {
    return HwNetworkUtil.isNetSupport(paramContext);
  }
  
  public static boolean f(Context paramContext)
  {
    return (Build.VERSION.SDK_INT >= 13) && (b(paramContext) == 7);
  }
  
  public static boolean g(Context paramContext)
  {
    return HwNetworkUtil.isNetworkAvailable(paramContext);
  }
  
  public static boolean h(Context paramContext)
  {
    return NetworkState.c();
  }
}
