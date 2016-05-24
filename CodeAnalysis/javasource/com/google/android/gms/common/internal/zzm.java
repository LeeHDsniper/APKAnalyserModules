package com.google.android.gms.common.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.IBinder;
import android.os.Message;
import com.google.android.gms.common.stats.zzb;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

final class zzm
  extends zzl
  implements Handler.Callback
{
  private final Handler mHandler;
  private final HashMap<zza, zzb> zzadV = new HashMap();
  private final zzb zzadW;
  private final long zzadX;
  private final Context zzqO;
  
  zzm(Context paramContext)
  {
    zzqO = paramContext.getApplicationContext();
    mHandler = new Handler(paramContext.getMainLooper(), this);
    zzadW = zzb.zzpD();
    zzadX = 5000L;
  }
  
  private boolean zza(zza paramZza, ServiceConnection paramServiceConnection, String paramString)
  {
    zzx.zzb(paramServiceConnection, "ServiceConnection must not be null");
    for (;;)
    {
      zzb localZzb;
      synchronized (zzadV)
      {
        localZzb = (zzb)zzadV.get(paramZza);
        if (localZzb == null)
        {
          localZzb = new zzb(paramZza);
          localZzb.zza(paramServiceConnection, paramString);
          localZzb.zzcl(paramString);
          zzadV.put(paramZza, localZzb);
          paramZza = localZzb;
          boolean bool = paramZza.isBound();
          return bool;
        }
        mHandler.removeMessages(0, localZzb);
        if (localZzb.zza(paramServiceConnection)) {
          throw new IllegalStateException("Trying to bind a GmsServiceConnection that was already connected before.  config=" + paramZza);
        }
      }
      localZzb.zza(paramServiceConnection, paramString);
      switch (localZzb.getState())
      {
      case 1: 
        paramServiceConnection.onServiceConnected(localZzb.getComponentName(), localZzb.getBinder());
        paramZza = localZzb;
        break;
      case 2: 
        localZzb.zzcl(paramString);
        paramZza = localZzb;
        break;
      default: 
        paramZza = localZzb;
      }
    }
  }
  
  private void zzb(zza paramZza, ServiceConnection paramServiceConnection, String paramString)
  {
    zzx.zzb(paramServiceConnection, "ServiceConnection must not be null");
    zzb localZzb;
    synchronized (zzadV)
    {
      localZzb = (zzb)zzadV.get(paramZza);
      if (localZzb == null) {
        throw new IllegalStateException("Nonexistent connection status for service config: " + paramZza);
      }
    }
    if (!localZzb.zza(paramServiceConnection)) {
      throw new IllegalStateException("Trying to unbind a GmsServiceConnection  that was not bound before.  config=" + paramZza);
    }
    localZzb.zzb(paramServiceConnection, paramString);
    if (localZzb.zzoL())
    {
      paramZza = mHandler.obtainMessage(0, localZzb);
      mHandler.sendMessageDelayed(paramZza, zzadX);
    }
  }
  
  public boolean handleMessage(Message arg1)
  {
    switch (what)
    {
    default: 
      return false;
    }
    zzb localZzb = (zzb)obj;
    synchronized (zzadV)
    {
      if (localZzb.zzoL())
      {
        if (localZzb.isBound()) {
          localZzb.zzcm("GmsClientSupervisor");
        }
        zzadV.remove(zzb.zza(localZzb));
      }
      return true;
    }
  }
  
  public boolean zza(String paramString1, ServiceConnection paramServiceConnection, String paramString2)
  {
    return zza(new zza(paramString1), paramServiceConnection, paramString2);
  }
  
  public void zzb(String paramString1, ServiceConnection paramServiceConnection, String paramString2)
  {
    zzb(new zza(paramString1), paramServiceConnection, paramString2);
  }
  
  private static final class zza
  {
    private final String zzOj;
    private final ComponentName zzadY;
    
    public zza(String paramString)
    {
      zzOj = zzx.zzcs(paramString);
      zzadY = null;
    }
    
    public boolean equals(Object paramObject)
    {
      if (this == paramObject) {}
      do
      {
        return true;
        if (!(paramObject instanceof zza)) {
          return false;
        }
        paramObject = (zza)paramObject;
      } while ((zzw.equal(zzOj, zzOj)) && (zzw.equal(zzadY, zzadY)));
      return false;
    }
    
    public int hashCode()
    {
      return zzw.hashCode(new Object[] { zzOj, zzadY });
    }
    
    public String toString()
    {
      if (zzOj == null) {
        return zzadY.flattenToString();
      }
      return zzOj;
    }
    
    public Intent zzoK()
    {
      if (zzOj != null) {
        return new Intent(zzOj).setPackage("com.google.android.gms");
      }
      return new Intent().setComponent(zzadY);
    }
  }
  
  private final class zzb
  {
    private int mState;
    private IBinder zzacE;
    private ComponentName zzadY;
    private final zza zzadZ;
    private final Set<ServiceConnection> zzaea;
    private boolean zzaeb;
    private final zzm.zza zzaec;
    
    public zzb(zzm.zza paramZza)
    {
      zzaec = paramZza;
      zzadZ = new zza();
      zzaea = new HashSet();
      mState = 2;
    }
    
    public IBinder getBinder()
    {
      return zzacE;
    }
    
    public ComponentName getComponentName()
    {
      return zzadY;
    }
    
    public int getState()
    {
      return mState;
    }
    
    public boolean isBound()
    {
      return zzaeb;
    }
    
    public void zza(ServiceConnection paramServiceConnection, String paramString)
    {
      zzm.zzc(zzm.this).zza(zzm.zzb(zzm.this), paramServiceConnection, paramString, zzaec.zzoK());
      zzaea.add(paramServiceConnection);
    }
    
    public boolean zza(ServiceConnection paramServiceConnection)
    {
      return zzaea.contains(paramServiceConnection);
    }
    
    public void zzb(ServiceConnection paramServiceConnection, String paramString)
    {
      zzm.zzc(zzm.this).zzb(zzm.zzb(zzm.this), paramServiceConnection);
      zzaea.remove(paramServiceConnection);
    }
    
    public void zzcl(String paramString)
    {
      zzaeb = zzm.zzc(zzm.this).zza(zzm.zzb(zzm.this), paramString, zzaec.zzoK(), zzadZ, 129);
      if (zzaeb)
      {
        mState = 3;
        return;
      }
      try
      {
        zzm.zzc(zzm.this).zza(zzm.zzb(zzm.this), zzadZ);
        return;
      }
      catch (IllegalArgumentException paramString) {}
    }
    
    public void zzcm(String paramString)
    {
      zzm.zzc(zzm.this).zza(zzm.zzb(zzm.this), zzadZ);
      zzaeb = false;
      mState = 2;
    }
    
    public boolean zzoL()
    {
      return zzaea.isEmpty();
    }
    
    public class zza
      implements ServiceConnection
    {
      public zza() {}
      
      public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
      {
        synchronized (zzm.zza(zzm.this))
        {
          zzm.zzb.zza(zzm.zzb.this, paramIBinder);
          zzm.zzb.zza(zzm.zzb.this, paramComponentName);
          Iterator localIterator = zzm.zzb.zzb(zzm.zzb.this).iterator();
          if (localIterator.hasNext()) {
            ((ServiceConnection)localIterator.next()).onServiceConnected(paramComponentName, paramIBinder);
          }
        }
        zzm.zzb.zza(zzm.zzb.this, 1);
      }
      
      public void onServiceDisconnected(ComponentName paramComponentName)
      {
        synchronized (zzm.zza(zzm.this))
        {
          zzm.zzb.zza(zzm.zzb.this, null);
          zzm.zzb.zza(zzm.zzb.this, paramComponentName);
          Iterator localIterator = zzm.zzb.zzb(zzm.zzb.this).iterator();
          if (localIterator.hasNext()) {
            ((ServiceConnection)localIterator.next()).onServiceDisconnected(paramComponentName);
          }
        }
        zzm.zzb.zza(zzm.zzb.this, 2);
      }
    }
  }
}
