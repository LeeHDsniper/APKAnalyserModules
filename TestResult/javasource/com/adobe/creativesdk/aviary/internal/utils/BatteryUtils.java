package com.adobe.creativesdk.aviary.internal.utils;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

public final class BatteryUtils
{
  private static Intent getChargingIntent(Context paramContext)
  {
    if (paramContext == null) {
      return null;
    }
    return paramContext.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
  }
  
  @TargetApi(17)
  private static boolean getIsCharging(int paramInt)
  {
    if (paramInt == 2) {}
    while ((paramInt == 1) || ((ApiHelper.AT_LEAST_17) && (paramInt == 4))) {
      return true;
    }
    return false;
  }
  
  public static boolean isCharging(Context paramContext, Intent paramIntent)
  {
    Intent localIntent;
    if (paramIntent != null)
    {
      localIntent = paramIntent;
      if (paramIntent.hasExtra("plugged")) {}
    }
    else
    {
      localIntent = getChargingIntent(paramContext);
    }
    if (localIntent == null) {
      return false;
    }
    return getIsCharging(localIntent.getIntExtra("plugged", -1));
  }
}
