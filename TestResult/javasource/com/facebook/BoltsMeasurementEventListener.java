package com.facebook;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import java.util.Iterator;
import java.util.Set;

public class BoltsMeasurementEventListener
  extends BroadcastReceiver
{
  private Context applicationContext;
  
  private void close()
  {
    LocalBroadcastManager.getInstance(applicationContext).unregisterReceiver(this);
  }
  
  protected void finalize()
    throws Throwable
  {
    try
    {
      close();
      return;
    }
    finally
    {
      super.finalize();
    }
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    paramContext = AppEventsLogger.newLogger(paramContext);
    String str1 = "bf_" + paramIntent.getStringExtra("event_name");
    paramIntent = paramIntent.getBundleExtra("event_args");
    Bundle localBundle = new Bundle();
    Iterator localIterator = paramIntent.keySet().iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        paramContext.logEvent(str1, localBundle);
        return;
      }
      String str2 = (String)localIterator.next();
      localBundle.putString(str2.replaceAll("[^0-9a-zA-Z _-]", "-").replaceAll("^[ -]*", "").replaceAll("[ -]*$", ""), (String)paramIntent.get(str2));
    }
  }
}
