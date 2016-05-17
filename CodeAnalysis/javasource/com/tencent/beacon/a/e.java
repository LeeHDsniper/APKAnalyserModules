package com.tencent.beacon.a;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.State;
import com.tencent.beacon.a.b.b;
import com.tencent.beacon.d.a;
import com.tencent.beacon.event.o;

public final class e
  extends BroadcastReceiver
{
  protected Context a;
  private boolean b = false;
  private Runnable c = new Runnable()
  {
    public final void run()
    {
      if (a != null) {
        h.c(a);
      }
    }
  };
  private Runnable d = new Runnable()
  {
    public final void run()
    {
      a.b(" db events to up on netConnectChange", new Object[0]);
      try
      {
        o.d(true);
        return;
      }
      catch (Throwable localThrowable)
      {
        a.a(localThrowable);
      }
    }
  };
  
  public e() {}
  
  public final void a(Context paramContext)
  {
    if (paramContext == null) {
      a.c(" Context is null!", new Object[0]);
    }
    while (b) {
      return;
    }
    b = true;
    paramContext.registerReceiver(this, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
  }
  
  public final void onReceive(Context paramContext, Intent paramIntent)
  {
    if (paramContext == null) {}
    try
    {
      a.c(" onReceive context is null!", new Object[0]);
      return;
    }
    catch (Exception paramContext)
    {
      a.a(paramContext);
      return;
    }
    if (a == null) {
      a = paramContext;
    }
    Object localObject = (ConnectivityManager)paramContext.getSystemService("connectivity");
    if (localObject == null)
    {
      a.c(" onReceive ConnectivityManager is null!", new Object[0]);
      return;
    }
    paramIntent = ((ConnectivityManager)localObject).getNetworkInfo(1);
    localObject = ((ConnectivityManager)localObject).getNetworkInfo(0);
    if (paramIntent != null)
    {
      paramIntent = paramIntent.getState();
      if (localObject != null)
      {
        localObject = ((NetworkInfo)localObject).getState();
        break label177;
        label88:
        break label176;
        label89:
        paramContext = b.a(paramContext);
        if ((paramContext.a()) || (o.d().j() == 0) || (paramContext.j() == 2)) {
          break label188;
        }
        c.a().a(paramContext.d());
        break label188;
      }
    }
    for (;;)
    {
      if ((NetworkInfo.State.CONNECTED == localObject) || (NetworkInfo.State.CONNECTED == paramIntent))
      {
        c.a().a(d);
        c.a().a(c);
        return;
        localObject = null;
        break label177;
        paramIntent = null;
        break;
      }
      label176:
      return;
      label177:
      if ((paramIntent != null) || (localObject != null)) {
        break label89;
      }
      label188:
      if (paramIntent == null) {
        if (localObject == null) {
          break label88;
        }
      }
    }
  }
}
