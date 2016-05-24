package com.google.android.gms.tagmanager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;

class zzbl
  extends BroadcastReceiver
{
  static final String zzOo = zzbl.class.getName();
  private final zzct zzaQI;
  
  zzbl(zzct paramZzct)
  {
    zzaQI = paramZzct;
  }
  
  public static void zzaQ(Context paramContext)
  {
    Intent localIntent = new Intent("com.google.analytics.RADIO_POWERED");
    localIntent.addCategory(paramContext.getPackageName());
    localIntent.putExtra(zzOo, true);
    paramContext.sendBroadcast(localIntent);
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    paramContext = paramIntent.getAction();
    if ("android.net.conn.CONNECTIVITY_CHANGE".equals(paramContext))
    {
      localBundle = paramIntent.getExtras();
      paramContext = Boolean.FALSE;
      if (localBundle != null) {
        paramContext = Boolean.valueOf(paramIntent.getExtras().getBoolean("noConnectivity"));
      }
      paramIntent = zzaQI;
      if (!paramContext.booleanValue())
      {
        bool = true;
        paramIntent.zzat(bool);
      }
    }
    while ((!"com.google.analytics.RADIO_POWERED".equals(paramContext)) || (paramIntent.hasExtra(zzOo))) {
      for (;;)
      {
        Bundle localBundle;
        return;
        boolean bool = false;
      }
    }
    zzaQI.zzhY();
  }
  
  public void zzaP(Context paramContext)
  {
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
    paramContext.registerReceiver(this, localIntentFilter);
    localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("com.google.analytics.RADIO_POWERED");
    localIntentFilter.addCategory(paramContext.getPackageName());
    paramContext.registerReceiver(this, localIntentFilter);
  }
}
