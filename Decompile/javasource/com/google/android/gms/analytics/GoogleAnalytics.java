package com.google.android.gms.analytics;

import android.content.Context;
import android.util.Log;
import com.google.android.gms.analytics.internal.zzae;
import com.google.android.gms.analytics.internal.zzan;
import com.google.android.gms.analytics.internal.zzf;
import com.google.android.gms.analytics.internal.zzn;
import com.google.android.gms.analytics.internal.zzy;
import com.google.android.gms.analytics.internal.zzy.zza;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class GoogleAnalytics
  extends zza
{
  private static List<Runnable> zzKt = new ArrayList();
  private boolean zzKu;
  private Set<Object> zzKv = new HashSet();
  private boolean zzKx;
  private volatile boolean zzKy;
  private boolean zzKz;
  private boolean zzpr;
  
  public GoogleAnalytics(zzf paramZzf)
  {
    super(paramZzf);
  }
  
  public static GoogleAnalytics getInstance(Context paramContext)
  {
    return zzf.zzX(paramContext).zzis();
  }
  
  private zzan zzhA()
  {
    return zzhp().zzhA();
  }
  
  public static void zzhx()
  {
    try
    {
      if (zzKt != null)
      {
        Iterator localIterator = zzKt.iterator();
        while (localIterator.hasNext()) {
          ((Runnable)localIterator.next()).run();
        }
        zzKt = null;
      }
    }
    finally {}
  }
  
  public boolean getAppOptOut()
  {
    return zzKy;
  }
  
  public String getClientId()
  {
    zzx.zzci("getClientId can not be called from the main thread");
    return zzhp().zziv().zzjd();
  }
  
  @Deprecated
  public Logger getLogger()
  {
    return zzae.getLogger();
  }
  
  public boolean isDryRunEnabled()
  {
    return zzKx;
  }
  
  public boolean isInitialized()
  {
    return (zzpr) && (!zzKu);
  }
  
  public Tracker newTracker(String paramString)
  {
    try
    {
      paramString = new Tracker(zzhp(), paramString, null);
      paramString.zza();
      return paramString;
    }
    finally {}
  }
  
  public void setDryRun(boolean paramBoolean)
  {
    zzKx = paramBoolean;
  }
  
  @Deprecated
  public void setLogger(Logger paramLogger)
  {
    zzae.setLogger(paramLogger);
    if (!zzKz)
    {
      Log.i((String)zzy.zzNa.get(), "GoogleAnalytics.setLogger() is deprecated. To enable debug logging, please run:\nadb shell setprop log.tag." + (String)zzy.zzNa.get() + " DEBUG");
      zzKz = true;
    }
  }
  
  public void zza()
  {
    zzhw();
    zzpr = true;
  }
  
  void zzhw()
  {
    zzan localZzan = zzhA();
    if (localZzan.zzkc()) {
      getLogger().setLogLevel(localZzan.getLogLevel());
    }
    if (localZzan.zzkg()) {
      setDryRun(localZzan.zzkh());
    }
    if (localZzan.zzkc())
    {
      Logger localLogger = zzae.getLogger();
      if (localLogger != null) {
        localLogger.setLogLevel(localZzan.getLogLevel());
      }
    }
  }
}
