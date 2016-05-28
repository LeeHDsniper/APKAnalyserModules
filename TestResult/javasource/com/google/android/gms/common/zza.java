package com.google.android.gms.common;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.Looper;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class zza
  implements ServiceConnection
{
  boolean zzYg = false;
  private final BlockingQueue<IBinder> zzYh = new LinkedBlockingQueue();
  
  public zza() {}
  
  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    zzYh.add(paramIBinder);
  }
  
  public void onServiceDisconnected(ComponentName paramComponentName) {}
  
  public IBinder zzmS()
    throws InterruptedException
  {
    if (Looper.myLooper() == Looper.getMainLooper()) {
      throw new IllegalStateException("BlockingServiceConnection.getService() called on main thread");
    }
    if (zzYg) {
      throw new IllegalStateException();
    }
    zzYg = true;
    return (IBinder)zzYh.take();
  }
}
