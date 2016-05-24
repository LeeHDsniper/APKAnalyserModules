package com.localytics.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

public class ReferralReceiver
  extends BroadcastReceiver
{
  protected String appKey = null;
  
  public ReferralReceiver() {}
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    do
    {
      do
      {
        try
        {
          Bundle localBundle = paramIntent.getExtras();
          if (localBundle != null) {
            localBundle.containsKey(null);
          }
          if (!paramIntent.getAction().equals("com.android.vending.INSTALL_REFERRER")) {
            return;
          }
        }
        catch (Exception paramContext)
        {
          return;
        }
        if ((appKey == null) || (appKey.length() == 0)) {
          appKey = DatapointHelper.getLocalyticsAppKeyOrNull(paramContext);
        }
      } while ((appKey == null) || (appKey.length() == 0));
      paramIntent = paramIntent.getStringExtra("referrer");
    } while ((paramIntent == null) || (paramIntent.length() == 0));
    new LocalyticsSession(paramContext, appKey, paramIntent);
  }
}
