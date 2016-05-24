package com.google.android.gms.common.stats;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.os.Debug;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;
import com.google.android.gms.internal.zzkq;
import com.google.android.gms.internal.zzll;
import com.google.android.gms.internal.zzlw;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class zzb
{
  private static final Object zzadT = new Object();
  private static Integer zzafB;
  private static zzb zzafu;
  private static final ComponentName zzafz = new ComponentName("com.google.android.gms", "com.google.android.gms.common.stats.GmsCoreStatsService");
  private zze zzafA;
  private final List<String> zzafv;
  private final List<String> zzafw;
  private final List<String> zzafx;
  private final List<String> zzafy;
  
  private zzb()
  {
    if (getLogLevel() == zzd.LOG_LEVEL_OFF)
    {
      zzafv = Collections.EMPTY_LIST;
      zzafw = Collections.EMPTY_LIST;
      zzafx = Collections.EMPTY_LIST;
      zzafy = Collections.EMPTY_LIST;
      return;
    }
    Object localObject = (String)zzc.zza.zzafE.get();
    if (localObject == null)
    {
      localObject = Collections.EMPTY_LIST;
      zzafv = ((List)localObject);
      localObject = (String)zzc.zza.zzafF.get();
      if (localObject != null) {
        break label174;
      }
      localObject = Collections.EMPTY_LIST;
      label83:
      zzafw = ((List)localObject);
      localObject = (String)zzc.zza.zzafG.get();
      if (localObject != null) {
        break label187;
      }
      localObject = Collections.EMPTY_LIST;
      label106:
      zzafx = ((List)localObject);
      localObject = (String)zzc.zza.zzafH.get();
      if (localObject != null) {
        break label200;
      }
    }
    label174:
    label187:
    label200:
    for (localObject = Collections.EMPTY_LIST;; localObject = Arrays.asList(((String)localObject).split(",")))
    {
      zzafy = ((List)localObject);
      zzafA = new zze(1024, ((Long)zzc.zza.zzafI.get()).longValue());
      return;
      localObject = Arrays.asList(((String)localObject).split(","));
      break;
      localObject = Arrays.asList(((String)localObject).split(","));
      break label83;
      localObject = Arrays.asList(((String)localObject).split(","));
      break label106;
    }
  }
  
  private static int getLogLevel()
  {
    if (zzafB == null) {}
    for (;;)
    {
      try
      {
        if (!zzll.zzjk()) {
          continue;
        }
        i = ((Integer)zzc.zza.zzafD.get()).intValue();
        zzafB = Integer.valueOf(i);
      }
      catch (SecurityException localSecurityException)
      {
        int i;
        zzafB = Integer.valueOf(zzd.LOG_LEVEL_OFF);
        continue;
      }
      return zzafB.intValue();
      i = zzd.LOG_LEVEL_OFF;
    }
  }
  
  private void zza(Context paramContext, ServiceConnection paramServiceConnection, String paramString, Intent paramIntent, int paramInt)
  {
    if (!com.google.android.gms.common.internal.zzd.zzacF) {}
    String str;
    do
    {
      return;
      str = zzb(paramServiceConnection);
    } while (!zza(paramContext, paramString, paramIntent, str, paramInt));
    long l2 = System.currentTimeMillis();
    paramServiceConnection = null;
    if ((getLogLevel() & zzd.zzafM) != 0) {
      paramServiceConnection = zzlw.zzm(3, 5);
    }
    long l1 = 0L;
    if ((getLogLevel() & zzd.zzafO) != 0) {
      l1 = Debug.getNativeHeapAllocatedSize();
    }
    if ((paramInt == 1) || (paramInt == 4)) {}
    for (paramServiceConnection = new ConnectionEvent(l2, paramInt, null, null, null, null, paramServiceConnection, str, SystemClock.elapsedRealtime(), l1);; paramServiceConnection = new ConnectionEvent(l2, paramInt, zzlw.zzap(paramContext), paramString, processName, name, paramServiceConnection, str, SystemClock.elapsedRealtime(), l1))
    {
      paramContext.startService(new Intent().setComponent(zzafz).putExtra("com.google.android.gms.common.stats.EXTRA_LOG_EVENT", paramServiceConnection));
      return;
      paramIntent = zzc(paramContext, paramIntent);
    }
  }
  
  private boolean zza(Context paramContext, String paramString1, Intent paramIntent, String paramString2, int paramInt)
  {
    int i = getLogLevel();
    if ((i == zzd.LOG_LEVEL_OFF) || (zzafA == null)) {}
    Object localObject;
    do
    {
      do
      {
        return false;
        if ((paramInt != 4) && (paramInt != 1)) {
          break;
        }
      } while (!zzafA.zzcz(paramString2));
      return true;
      localObject = zzc(paramContext, paramIntent);
      if (localObject == null)
      {
        Log.w("ConnectionTracker", String.format("Client %s made an invalid request %s", new Object[] { paramString1, paramIntent.toUri(0) }));
        return false;
      }
      paramContext = zzlw.zzap(paramContext);
      paramIntent = processName;
      localObject = name;
    } while ((zzafv.contains(paramContext)) || (zzafw.contains(paramString1)) || (zzafx.contains(paramIntent)) || (zzafy.contains(localObject)) || ((paramIntent.equals(paramContext)) && ((i & zzd.zzafN) != 0)));
    zzafA.zzcy(paramString2);
    return true;
  }
  
  private String zzb(ServiceConnection paramServiceConnection)
  {
    return String.valueOf(Process.myPid() << 32 | System.identityHashCode(paramServiceConnection));
  }
  
  private boolean zzb(Context paramContext, Intent paramIntent)
  {
    paramIntent = paramIntent.getComponent();
    if ((paramIntent == null) || ((com.google.android.gms.common.internal.zzd.zzacF) && ("com.google.android.gms".equals(paramIntent.getPackageName())))) {
      return false;
    }
    return zzll.zzi(paramContext, paramIntent.getPackageName());
  }
  
  private static ServiceInfo zzc(Context paramContext, Intent paramIntent)
  {
    paramContext = paramContext.getPackageManager().queryIntentServices(paramIntent, 128);
    if ((paramContext == null) || (paramContext.size() == 0))
    {
      Log.w("ConnectionTracker", String.format("There are no handler of this intent: %s\n Stack trace: %s", new Object[] { paramIntent.toUri(0), zzlw.zzm(3, 20) }));
      return null;
    }
    if (paramContext.size() > 1)
    {
      Log.w("ConnectionTracker", String.format("Multiple handlers found for this intent: %s\n Stack trace: %s", new Object[] { paramIntent.toUri(0), zzlw.zzm(3, 20) }));
      paramIntent = paramContext.iterator();
      if (paramIntent.hasNext())
      {
        Log.w("ConnectionTracker", nextserviceInfo.name);
        return null;
      }
    }
    return get0serviceInfo;
  }
  
  public static zzb zzpD()
  {
    synchronized (zzadT)
    {
      if (zzafu == null) {
        zzafu = new zzb();
      }
      return zzafu;
    }
  }
  
  public void zza(Context paramContext, ServiceConnection paramServiceConnection)
  {
    paramContext.unbindService(paramServiceConnection);
    zza(paramContext, paramServiceConnection, null, null, 1);
  }
  
  public void zza(Context paramContext, ServiceConnection paramServiceConnection, String paramString, Intent paramIntent)
  {
    zza(paramContext, paramServiceConnection, paramString, paramIntent, 3);
  }
  
  public boolean zza(Context paramContext, Intent paramIntent, ServiceConnection paramServiceConnection, int paramInt)
  {
    return zza(paramContext, paramContext.getClass().getName(), paramIntent, paramServiceConnection, paramInt);
  }
  
  public boolean zza(Context paramContext, String paramString, Intent paramIntent, ServiceConnection paramServiceConnection, int paramInt)
  {
    if (zzb(paramContext, paramIntent))
    {
      Log.w("ConnectionTracker", "Attempted to bind to a service in a STOPPED package.");
      return false;
    }
    boolean bool = paramContext.bindService(paramIntent, paramServiceConnection, paramInt);
    if (bool) {
      zza(paramContext, paramServiceConnection, paramString, paramIntent, 2);
    }
    return bool;
  }
  
  public void zzb(Context paramContext, ServiceConnection paramServiceConnection)
  {
    zza(paramContext, paramServiceConnection, null, null, 4);
  }
}
