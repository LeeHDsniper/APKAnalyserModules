package com.facebook.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.facebook.Session;
import com.facebook.Session.StatusCallback;

public class SessionTracker
{
  private final Session.StatusCallback callback;
  
  private class ActiveSessionBroadcastReceiver
    extends BroadcastReceiver
  {
    public void onReceive(Context paramContext, Intent paramIntent)
    {
      if ("com.facebook.sdk.ACTIVE_SESSION_SET".equals(paramIntent.getAction()))
      {
        paramContext = Session.getActiveSession();
        if (paramContext != null) {
          paramContext.addCallback(this$0.callback);
        }
      }
    }
  }
}
