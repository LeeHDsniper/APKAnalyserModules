package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.ContainerHolder;
import com.google.android.gms.tagmanager.TagManager;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class zzqg
{
  private static zzqg zzaTp;
  private Context mContext;
  private boolean mStarted;
  private final Set<zza> zzaTq = new HashSet();
  private TagManager zzaTr = null;
  private zzqf zzpo;
  
  zzqg(Context paramContext, TagManager paramTagManager)
  {
    mContext = paramContext;
    zzaTr = paramTagManager;
  }
  
  public static zzqg zzaR(Context paramContext)
  {
    zzx.zzv(paramContext);
    if (zzaTp == null) {}
    try
    {
      if (zzaTp == null) {
        zzaTp = new zzqg(paramContext, TagManager.getInstance(paramContext.getApplicationContext()));
      }
      return zzaTp;
    }
    finally {}
  }
  
  private void zzgK()
  {
    try
    {
      Iterator localIterator = zzaTq.iterator();
      while (localIterator.hasNext()) {
        ((zza)localIterator.next()).zzbo();
      }
    }
    finally {}
  }
  
  public void start()
    throws IllegalStateException
  {
    try
    {
      if (mStarted) {
        throw new IllegalStateException("Method start() has already been called");
      }
    }
    finally {}
    if (zzpo == null) {
      throw new IllegalStateException("No settings configured");
    }
    mStarted = true;
    zzaTr.zzc(zzpo.zzBj(), -1, "admob").setResultCallback(new ResultCallback()
    {
      public void zza(ContainerHolder paramAnonymousContainerHolder)
      {
        if (paramAnonymousContainerHolder.getStatus().isSuccess()) {}
        for (paramAnonymousContainerHolder = paramAnonymousContainerHolder.getContainer();; paramAnonymousContainerHolder = null)
        {
          paramAnonymousContainerHolder = new zzqe(zzqg.zza(zzqg.this), paramAnonymousContainerHolder, zzBn());
          zzqg.zza(zzqg.this, paramAnonymousContainerHolder.zzBh());
          zzqg.zzb(zzqg.this);
          return;
        }
      }
    });
  }
  
  public zzqf zzBn()
  {
    try
    {
      zzqf localZzqf = zzpo;
      return localZzqf;
    }
    finally {}
  }
  
  public void zza(zzqf paramZzqf)
  {
    try
    {
      if (mStarted) {
        throw new IllegalStateException("Settings can't be changed after TagManager has been started");
      }
    }
    finally {}
    zzpo = paramZzqf;
  }
  
  public void zza(zza paramZza)
  {
    try
    {
      zzaTq.add(paramZza);
      return;
    }
    finally {}
  }
  
  public static abstract interface zza
  {
    public abstract void zzbo();
  }
}
