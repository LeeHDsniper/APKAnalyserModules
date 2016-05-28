package com.adobe.creativesdk.aviary.internal.utils;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

public final class ConnectionUtils
{
  private static final String TAG = ConnectionUtils.class.getSimpleName();
  
  private ConnectionUtils() {}
  
  public static NetworkInfo getNetworkInfo(Context paramContext)
  {
    Object localObject = null;
    try
    {
      ConnectivityManager localConnectivityManager = (ConnectivityManager)paramContext.getSystemService("connectivity");
      paramContext = localObject;
      if (localConnectivityManager != null) {
        paramContext = localConnectivityManager.getActiveNetworkInfo();
      }
      return paramContext;
    }
    catch (SecurityException paramContext) {}
    return null;
  }
  
  private static NetworkInfo getNetworkInfo(Context paramContext, int paramInt)
  {
    Object localObject = null;
    try
    {
      ConnectivityManager localConnectivityManager = (ConnectivityManager)paramContext.getSystemService("connectivity");
      paramContext = localObject;
      if (localConnectivityManager != null) {
        paramContext = localConnectivityManager.getNetworkInfo(paramInt);
      }
      return paramContext;
    }
    catch (SecurityException paramContext) {}
    return null;
  }
  
  public static boolean isConnected(Context paramContext, boolean paramBoolean, int paramInt)
  {
    boolean bool2 = false;
    paramContext = getNetworkInfo(paramContext, paramInt);
    boolean bool1 = bool2;
    if (paramContext != null)
    {
      bool1 = bool2;
      if (paramContext.isConnected()) {
        if (!paramBoolean)
        {
          bool1 = bool2;
          if (paramContext.isRoaming()) {}
        }
        else
        {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public static boolean isConnectedOrConnecting(Context paramContext, boolean paramBoolean)
  {
    boolean bool2 = false;
    paramContext = getNetworkInfo(paramContext);
    boolean bool1 = bool2;
    if (paramContext != null)
    {
      bool1 = bool2;
      if (paramContext.isConnectedOrConnecting()) {
        if (!paramBoolean)
        {
          bool1 = bool2;
          if (paramContext.isRoaming()) {}
        }
        else
        {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public static boolean isWifiConnected(Context paramContext)
  {
    return (paramContext != null) && (isConnected(paramContext, false, 1));
  }
}
