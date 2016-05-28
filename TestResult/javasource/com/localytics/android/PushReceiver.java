package com.localytics.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class PushReceiver
  extends BroadcastReceiver
{
  public PushReceiver() {}
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    paramContext = new LocalyticsSession(paramContext);
    if (paramIntent.getAction().equals("com.google.android.c2dm.intent.REGISTRATION")) {
      paramContext.handleRegistration(paramIntent);
    }
    while (!paramIntent.getAction().equals("com.google.android.c2dm.intent.RECEIVE")) {
      return;
    }
    paramContext.handleNotificationReceived(paramIntent);
  }
}
