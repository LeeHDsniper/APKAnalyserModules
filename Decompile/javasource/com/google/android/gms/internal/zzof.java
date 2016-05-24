package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Process;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import com.google.android.gms.analytics.internal.zzam;
import com.google.android.gms.common.internal.zzx;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public final class zzof
{
  private static volatile zzof zzaId;
  private final Context mContext;
  private volatile zzok zzMm;
  private final List<zzog> zzaIe;
  private final zzoa zzaIf;
  private final zza zzaIg;
  private Thread.UncaughtExceptionHandler zzaIh;
  
  zzof(Context paramContext)
  {
    paramContext = paramContext.getApplicationContext();
    zzx.zzv(paramContext);
    mContext = paramContext;
    zzaIg = new zza();
    zzaIe = new CopyOnWriteArrayList();
    zzaIf = new zzoa();
  }
  
  public static zzof zzaI(Context paramContext)
  {
    zzx.zzv(paramContext);
    if (zzaId == null) {}
    try
    {
      if (zzaId == null) {
        zzaId = new zzof(paramContext);
      }
      return zzaId;
    }
    finally {}
  }
  
  private void zzb(zzob paramZzob)
  {
    zzx.zzci("deliver should be called from worker thread");
    zzx.zzb(paramZzob.zzxm(), "Measurement must be submitted");
    Object localObject = paramZzob.zzxj();
    if (((List)localObject).isEmpty()) {}
    for (;;)
    {
      return;
      HashSet localHashSet = new HashSet();
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        zzoh localZzoh = (zzoh)((Iterator)localObject).next();
        Uri localUri = localZzoh.zzhs();
        if (!localHashSet.contains(localUri))
        {
          localHashSet.add(localUri);
          localZzoh.zzb(paramZzob);
        }
      }
    }
  }
  
  public static void zzic()
  {
    if (!(Thread.currentThread() instanceof zzc)) {
      throw new IllegalStateException("Call expected from worker thread");
    }
  }
  
  public Context getContext()
  {
    return mContext;
  }
  
  public void zza(Thread.UncaughtExceptionHandler paramUncaughtExceptionHandler)
  {
    zzaIh = paramUncaughtExceptionHandler;
  }
  
  public <V> Future<V> zzb(Callable<V> paramCallable)
  {
    zzx.zzv(paramCallable);
    if ((Thread.currentThread() instanceof zzc))
    {
      paramCallable = new FutureTask(paramCallable);
      paramCallable.run();
      return paramCallable;
    }
    return zzaIg.submit(paramCallable);
  }
  
  void zze(final zzob paramZzob)
  {
    if (paramZzob.zzxq()) {
      throw new IllegalStateException("Measurement prototype can't be submitted");
    }
    if (paramZzob.zzxm()) {
      throw new IllegalStateException("Measurement can only be submitted once");
    }
    paramZzob = paramZzob.zzxh();
    paramZzob.zzxn();
    zzaIg.execute(new Runnable()
    {
      public void run()
      {
        paramZzob.zzxo().zza(paramZzob);
        Iterator localIterator = zzof.zza(zzof.this).iterator();
        while (localIterator.hasNext()) {
          ((zzog)localIterator.next()).zza(paramZzob);
        }
        zzof.zza(zzof.this, paramZzob);
      }
    });
  }
  
  public void zzf(Runnable paramRunnable)
  {
    zzx.zzv(paramRunnable);
    zzaIg.submit(paramRunnable);
  }
  
  public zzok zzxu()
  {
    if (zzMm == null) {}
    Object localObject5;
    Object localObject3;
    try
    {
      zzok localZzok;
      PackageManager localPackageManager;
      String str2;
      if (zzMm == null)
      {
        localZzok = new zzok();
        localPackageManager = mContext.getPackageManager();
        str2 = mContext.getPackageName();
        localZzok.setAppId(str2);
        localZzok.setAppInstallerId(localPackageManager.getInstallerPackageName(str2));
        localObject5 = null;
        localObject3 = str2;
      }
      try
      {
        PackageInfo localPackageInfo = localPackageManager.getPackageInfo(mContext.getPackageName(), 0);
        localObject4 = localObject5;
        str1 = str2;
        if (localPackageInfo != null)
        {
          localObject3 = str2;
          localObject4 = localPackageManager.getApplicationLabel(applicationInfo);
          str1 = str2;
          localObject3 = str2;
          if (!TextUtils.isEmpty((CharSequence)localObject4))
          {
            localObject3 = str2;
            str1 = ((CharSequence)localObject4).toString();
          }
          localObject3 = str1;
          localObject4 = versionName;
        }
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException)
      {
        for (;;)
        {
          String str1;
          Log.e("GAv4", "Error retrieving package info: appName set to " + (String)localObject3);
          Object localObject4 = localObject5;
          Object localObject1 = localObject3;
        }
      }
      localZzok.setAppName(str1);
      localZzok.setAppVersion((String)localObject4);
      zzMm = localZzok;
      return zzMm;
    }
    finally {}
  }
  
  public zzom zzxv()
  {
    DisplayMetrics localDisplayMetrics = mContext.getResources().getDisplayMetrics();
    zzom localZzom = new zzom();
    localZzom.setLanguage(zzam.zza(Locale.getDefault()));
    localZzom.zzhO(widthPixels);
    localZzom.zzhP(heightPixels);
    return localZzom;
  }
  
  private class zza
    extends ThreadPoolExecutor
  {
    public zza()
    {
      super(1, 0L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
      setThreadFactory(new zzof.zzb(null));
    }
    
    protected <T> RunnableFuture<T> newTaskFor(Runnable paramRunnable, T paramT)
    {
      new FutureTask(paramRunnable, paramT)
      {
        protected void setException(Throwable paramAnonymousThrowable)
        {
          Thread.UncaughtExceptionHandler localUncaughtExceptionHandler = zzof.zzb(zzof.this);
          if (localUncaughtExceptionHandler != null) {
            localUncaughtExceptionHandler.uncaughtException(Thread.currentThread(), paramAnonymousThrowable);
          }
          for (;;)
          {
            super.setException(paramAnonymousThrowable);
            return;
            if (Log.isLoggable("GAv4", 6)) {
              Log.e("GAv4", "MeasurementExecutor: job failed with " + paramAnonymousThrowable);
            }
          }
        }
      };
    }
  }
  
  private static class zzb
    implements ThreadFactory
  {
    private static final AtomicInteger zzaIl = new AtomicInteger();
    
    private zzb() {}
    
    public Thread newThread(Runnable paramRunnable)
    {
      return new zzof.zzc(paramRunnable, "measurement-" + zzaIl.incrementAndGet());
    }
  }
  
  private static class zzc
    extends Thread
  {
    zzc(Runnable paramRunnable, String paramString)
    {
      super(paramString);
    }
    
    public void run()
    {
      Process.setThreadPriority(10);
      super.run();
    }
  }
}
