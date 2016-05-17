package com.tencent.mobileqq.pluginsdk;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import com.tencent.mobileqq.pluginsdk.ipc.PluginRemoteService.Sub1;
import com.tencent.mobileqq.pluginsdk.ipc.PluginRemoteService.Sub2;
import com.tencent.qphone.base.util.QLog;
import java.util.Iterator;
import java.util.LinkedList;

public class PluginRemoteProcessor
{
  private static PluginRemoteProcessor d;
  private volatile boolean a;
  private LinkedList b = new LinkedList();
  private Handler c = new Handler(Looper.getMainLooper());
  
  private PluginRemoteProcessor() {}
  
  private void a(a paramA)
  {
    Object localObject = null;
    switch (a.c(paramA))
    {
    default: 
      if (QLog.isColorLevel()) {
        QLog.i("plugin_tag", 2, "processInner, " + paramA + ", " + localObject);
      }
      if (localObject != null) {
        break;
      }
    }
    do
    {
      return;
      localObject = PluginRemoteService.Sub1.class;
      break;
      localObject = PluginRemoteService.Sub2.class;
      break;
      Context localContext = a.b(paramA).getApplicationContext();
      localObject = new Intent(localContext, (Class)localObject);
      ((Intent)localObject).putExtra("key_binder_type", a.c(paramA));
      try
      {
        localContext.bindService((Intent)localObject, paramA, 1);
        return;
      }
      catch (SecurityException paramA) {}
    } while (!QLog.isColorLevel());
    QLog.i("plugin_tag", 2, "processInner", paramA);
  }
  
  private void a(a paramA, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.i("plugin_tag", 2, "processInnerDelay. " + paramInt + ", " + paramA);
    }
    c.postDelayed(new h(this, paramA), paramInt);
  }
  
  public static PluginRemoteProcessor get()
  {
    if (d == null) {}
    try
    {
      if (d == null) {
        d = new PluginRemoteProcessor();
      }
      return d;
    }
    finally {}
  }
  
  public void cancel(ServiceConnection paramServiceConnection)
  {
    synchronized (b)
    {
      Iterator localIterator = b.iterator();
      while (localIterator.hasNext())
      {
        a localA = (a)localIterator.next();
        if (a.a(localA) == paramServiceConnection) {
          a.b(localA).unbindService(localA);
        }
      }
      return;
    }
  }
  
  public void process(Context arg1, ServiceConnection paramServiceConnection, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.i("plugin_tag", 2, "PluginRemoteProcessor.process, " + paramInt);
    }
    paramServiceConnection = new a(paramServiceConnection, ???, paramInt);
    if (a)
    {
      if (QLog.isColorLevel()) {
        QLog.i("plugin_tag", 2, "queue");
      }
      synchronized (b)
      {
        b.offer(paramServiceConnection);
        return;
      }
    }
    a = true;
    a(paramServiceConnection);
  }
  
  private class a
    implements ServiceConnection
  {
    private ServiceConnection b;
    private Context c;
    private int d;
    
    public a(ServiceConnection paramServiceConnection, Context paramContext, int paramInt)
    {
      b = paramServiceConnection;
      c = paramContext;
      d = paramInt;
    }
    
    public void onServiceConnected(ComponentName arg1, IBinder paramIBinder)
    {
      do
      {
        try
        {
          c.getApplicationContext().unbindService(this);
          if (QLog.isColorLevel()) {
            QLog.i("plugin_tag", 2, "onServiceConnected, " + this);
          }
          b.onServiceConnected(???, paramIBinder);
        }
        catch (Exception localException)
        {
          synchronized (PluginRemoteProcessor.a(PluginRemoteProcessor.this))
          {
            do
            {
              paramIBinder = (a)PluginRemoteProcessor.a(PluginRemoteProcessor.this).poll();
              if (paramIBinder == null) {
                break;
              }
              if (QLog.isColorLevel()) {
                QLog.i("plugin_tag", 2, "continue process");
              }
              PluginRemoteProcessor.a(PluginRemoteProcessor.this, paramIBinder, 300);
              return;
              localException = localException;
            } while (!QLog.isColorLevel());
            QLog.i("plugin_tag", 2, "unbindService, " + this);
          }
        }
        PluginRemoteProcessor.a(PluginRemoteProcessor.this, false);
      } while (!QLog.isColorLevel());
      QLog.i("plugin_tag", 2, "queue empty");
    }
    
    public void onServiceDisconnected(ComponentName paramComponentName)
    {
      if (QLog.isColorLevel()) {
        QLog.i("plugin_tag", 2, "onServiceDisconnected, " + this);
      }
      b.onServiceDisconnected(paramComponentName);
    }
  }
}
