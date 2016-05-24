package com.google.android.gms.common.internal;

import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;

public final class zzk
  implements Handler.Callback
{
  private final Handler mHandler;
  private final zza zzadM;
  private final ArrayList<GoogleApiClient.ConnectionCallbacks> zzadN = new ArrayList();
  final ArrayList<GoogleApiClient.ConnectionCallbacks> zzadO = new ArrayList();
  private final ArrayList<GoogleApiClient.OnConnectionFailedListener> zzadP = new ArrayList();
  private volatile boolean zzadQ = false;
  private final AtomicInteger zzadR = new AtomicInteger(0);
  private boolean zzadS = false;
  private final Object zzpc = new Object();
  
  public zzk(Looper paramLooper, zza paramZza)
  {
    zzadM = paramZza;
    mHandler = new Handler(paramLooper, this);
  }
  
  public boolean handleMessage(Message arg1)
  {
    if (what == 1)
    {
      GoogleApiClient.ConnectionCallbacks localConnectionCallbacks = (GoogleApiClient.ConnectionCallbacks)obj;
      synchronized (zzpc)
      {
        if ((zzadQ) && (zzadM.isConnected()) && (zzadN.contains(localConnectionCallbacks))) {
          localConnectionCallbacks.onConnected(zzadM.zzmw());
        }
        return true;
      }
    }
    Log.wtf("GmsClientEvents", "Don't know how to handle this message.");
    return false;
  }
  
  public void registerConnectionCallbacks(GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    zzx.zzv(paramConnectionCallbacks);
    synchronized (zzpc)
    {
      if (zzadN.contains(paramConnectionCallbacks))
      {
        Log.w("GmsClientEvents", "registerConnectionCallbacks(): listener " + paramConnectionCallbacks + " is already registered");
        if (zzadM.isConnected()) {
          mHandler.sendMessage(mHandler.obtainMessage(1, paramConnectionCallbacks));
        }
        return;
      }
      zzadN.add(paramConnectionCallbacks);
    }
  }
  
  public void registerConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    zzx.zzv(paramOnConnectionFailedListener);
    synchronized (zzpc)
    {
      if (zzadP.contains(paramOnConnectionFailedListener))
      {
        Log.w("GmsClientEvents", "registerConnectionFailedListener(): listener " + paramOnConnectionFailedListener + " is already registered");
        return;
      }
      zzadP.add(paramOnConnectionFailedListener);
    }
  }
  
  public void unregisterConnectionCallbacks(GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    zzx.zzv(paramConnectionCallbacks);
    synchronized (zzpc)
    {
      if (!zzadN.remove(paramConnectionCallbacks)) {
        Log.w("GmsClientEvents", "unregisterConnectionCallbacks(): listener " + paramConnectionCallbacks + " not found");
      }
      while (!zzadS) {
        return;
      }
      zzadO.add(paramConnectionCallbacks);
    }
  }
  
  public void unregisterConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    zzx.zzv(paramOnConnectionFailedListener);
    synchronized (zzpc)
    {
      if (!zzadP.remove(paramOnConnectionFailedListener)) {
        Log.w("GmsClientEvents", "unregisterConnectionFailedListener(): listener " + paramOnConnectionFailedListener + " not found");
      }
      return;
    }
  }
  
  public void zzbB(int paramInt)
  {
    boolean bool = false;
    if (Looper.myLooper() == mHandler.getLooper()) {
      bool = true;
    }
    zzx.zza(bool, "onUnintentionalDisconnection must only be called on the Handler thread");
    mHandler.removeMessages(1);
    synchronized (zzpc)
    {
      zzadS = true;
      Object localObject2 = new ArrayList(zzadN);
      int i = zzadR.get();
      localObject2 = ((ArrayList)localObject2).iterator();
      GoogleApiClient.ConnectionCallbacks localConnectionCallbacks;
      do
      {
        if (((Iterator)localObject2).hasNext())
        {
          localConnectionCallbacks = (GoogleApiClient.ConnectionCallbacks)((Iterator)localObject2).next();
          if ((zzadQ) && (zzadR.get() == i)) {}
        }
        else
        {
          zzadO.clear();
          zzadS = false;
          return;
        }
      } while (!zzadN.contains(localConnectionCallbacks));
      localConnectionCallbacks.onConnectionSuspended(paramInt);
    }
  }
  
  public void zzh(Bundle paramBundle)
  {
    boolean bool2 = true;
    boolean bool1;
    if (Looper.myLooper() == mHandler.getLooper())
    {
      bool1 = true;
      zzx.zza(bool1, "onConnectionSuccess must only be called on the Handler thread");
    }
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzadS) {
          break label206;
        }
        bool1 = true;
        zzx.zzY(bool1);
        mHandler.removeMessages(1);
        zzadS = true;
        if (zzadO.size() != 0) {
          break label211;
        }
        bool1 = bool2;
        zzx.zzY(bool1);
        Object localObject2 = new ArrayList(zzadN);
        int i = zzadR.get();
        localObject2 = ((ArrayList)localObject2).iterator();
        GoogleApiClient.ConnectionCallbacks localConnectionCallbacks;
        if (((Iterator)localObject2).hasNext())
        {
          localConnectionCallbacks = (GoogleApiClient.ConnectionCallbacks)((Iterator)localObject2).next();
          if ((zzadQ) && (zzadM.isConnected()) && (zzadR.get() == i)) {}
        }
        else
        {
          zzadO.clear();
          zzadS = false;
          return;
        }
        if (zzadO.contains(localConnectionCallbacks)) {
          continue;
        }
        localConnectionCallbacks.onConnected(paramBundle);
      }
      bool1 = false;
      break;
      label206:
      bool1 = false;
      continue;
      label211:
      bool1 = false;
    }
  }
  
  public void zzj(ConnectionResult paramConnectionResult)
  {
    if (Looper.myLooper() == mHandler.getLooper()) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zza(bool, "onConnectionFailure must only be called on the Handler thread");
      mHandler.removeMessages(1);
      synchronized (zzpc)
      {
        Object localObject2 = new ArrayList(zzadP);
        int i = zzadR.get();
        localObject2 = ((ArrayList)localObject2).iterator();
        while (((Iterator)localObject2).hasNext())
        {
          GoogleApiClient.OnConnectionFailedListener localOnConnectionFailedListener = (GoogleApiClient.OnConnectionFailedListener)((Iterator)localObject2).next();
          if ((!zzadQ) || (zzadR.get() != i)) {
            return;
          }
          if (zzadP.contains(localOnConnectionFailedListener)) {
            localOnConnectionFailedListener.onConnectionFailed(paramConnectionResult);
          }
        }
      }
      return;
    }
  }
  
  public void zzoI()
  {
    zzadQ = false;
    zzadR.incrementAndGet();
  }
  
  public void zzoJ()
  {
    zzadQ = true;
  }
  
  public static abstract interface zza
  {
    public abstract boolean isConnected();
    
    public abstract Bundle zzmw();
  }
}
