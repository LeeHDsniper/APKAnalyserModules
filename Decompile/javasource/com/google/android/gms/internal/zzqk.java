package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.zzbg;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class zzqk
{
  private final Context mContext;
  private String zzaPw = null;
  private final Map<String, zzqz> zzaTA;
  private final zzqr zzaTy;
  Map<String, zzc<zzqp.zzc>> zzaTz = new HashMap();
  private final zzlm zzpO;
  
  public zzqk(Context paramContext)
  {
    this(paramContext, new HashMap(), new zzqr(paramContext), zzlo.zzpN());
  }
  
  zzqk(Context paramContext, Map<String, zzqz> paramMap, zzqr paramZzqr, zzlm paramZzlm)
  {
    mContext = paramContext;
    zzpO = paramZzlm;
    zzaTy = paramZzqr;
    zzaTA = paramMap;
  }
  
  private void zza(zzqn paramZzqn, zza paramZza)
  {
    boolean bool = true;
    paramZzqn = paramZzqn.zzBv();
    if (paramZzqn.size() == 1) {}
    for (;;)
    {
      zzx.zzZ(bool);
      zza((zzqi)paramZzqn.get(0), paramZza);
      return;
      bool = false;
    }
  }
  
  void zza(final zzqi paramZzqi, final zza paramZza)
  {
    zzaTy.zza(paramZzqi.zzBr(), paramZzqi.zzBp(), zzqm.zzaTG, new zzqq()
    {
      public void zza(Status paramAnonymousStatus, Object paramAnonymousObject, Integer paramAnonymousInteger, long paramAnonymousLong)
      {
        if (paramAnonymousStatus.isSuccess()) {
          if (paramAnonymousInteger == zzqr.zzaUg) {
            paramAnonymousStatus = zzqo.zza.zza.zzaTQ;
          }
        }
        for (paramAnonymousStatus = new zzqo.zza(Status.zzaaD, paramZzqi, null, (zzqp.zzc)paramAnonymousObject, paramAnonymousStatus, paramAnonymousLong);; paramAnonymousStatus = new zzqo.zza(new Status(16, "There is no valid resource for the container: " + paramZzqi.getContainerId()), null, zzqo.zza.zza.zzaTP))
        {
          paramZza.zza(new zzqo(paramAnonymousStatus));
          return;
          paramAnonymousStatus = zzqo.zza.zza.zzaTP;
          break;
        }
      }
    });
  }
  
  void zza(zzqn paramZzqn, zza paramZza, zzqx paramZzqx)
  {
    Iterator localIterator = paramZzqn.zzBv().iterator();
    int i = 0;
    zzqi localZzqi;
    long l;
    if (localIterator.hasNext())
    {
      localZzqi = (zzqi)localIterator.next();
      zzc localZzc = (zzc)zzaTz.get(localZzqi.getContainerId());
      if (localZzc != null)
      {
        l = localZzc.zzBu();
        label67:
        if (l + 900000L >= zzpO.currentTimeMillis()) {
          break label202;
        }
        i = 1;
      }
    }
    label199:
    label202:
    for (;;)
    {
      break;
      l = zzaTy.zzfp(localZzqi.getContainerId());
      break label67;
      if (i != 0)
      {
        paramZza = (zzqz)zzaTA.get(paramZzqn.getId());
        if (paramZza != null) {
          break label199;
        }
        if (zzaPw == null)
        {
          paramZza = new zzqz();
          zzaTA.put(paramZzqn.getId(), paramZza);
        }
      }
      for (;;)
      {
        paramZza.zza(mContext, paramZzqn, 0L, paramZzqx);
        return;
        paramZza = new zzqz(zzaPw);
        break;
        zza(paramZzqn, paramZza);
        return;
      }
    }
  }
  
  void zza(zzqo.zza paramZza)
  {
    Object localObject = paramZza.zzBz().getContainerId();
    Status localStatus = paramZza.getStatus();
    paramZza = paramZza.zzBA();
    if (zzaTz.containsKey(localObject))
    {
      localObject = (zzc)zzaTz.get(localObject);
      ((zzc)localObject).zzU(zzpO.currentTimeMillis());
      if (localStatus == Status.zzaaD)
      {
        ((zzc)localObject).zzbh(localStatus);
        ((zzc)localObject).zzQ(paramZza);
      }
      return;
    }
    zzaTz.put(localObject, new zzc(localStatus, paramZza, zzpO.currentTimeMillis()));
  }
  
  public void zza(String paramString1, Integer paramInteger, String paramString2, zza paramZza)
  {
    paramString1 = new zzqn().zzb(new zzqi(paramString1, paramInteger, paramString2, false));
    zza(paramString1, paramZza, new zzb(paramString1, zzqm.zzaTG, paramZza));
  }
  
  public void zzfj(String paramString)
  {
    zzaPw = paramString;
  }
  
  public static abstract interface zza
  {
    public abstract void zza(zzqo paramZzqo);
  }
  
  class zzb
    extends zzqx
  {
    private final zzqk.zza zzaTE;
    
    zzb(zzqn paramZzqn, zzql paramZzql, zzqk.zza paramZza)
    {
      super(paramZzql);
      zzaTE = paramZza;
    }
    
    protected zzqx.zzb zza(zzqi paramZzqi)
    {
      return null;
    }
    
    protected void zza(zzqo paramZzqo)
    {
      zzqo.zza localZza = paramZzqo.zzBw();
      zza(localZza);
      if ((localZza.getStatus() == Status.zzaaD) && (localZza.zzBx() == zzqo.zza.zza.zzaTO) && (localZza.zzBy() != null) && (localZza.zzBy().length > 0))
      {
        zzqk.zza(zzqk.this).zze(localZza.zzBz().zzBr(), localZza.zzBy());
        zzbg.v("Resource successfully load from Network.");
        zzaTE.zza(paramZzqo);
        return;
      }
      StringBuilder localStringBuilder = new StringBuilder().append("Response status: ");
      if (localZza.getStatus().isSuccess()) {}
      for (paramZzqo = "SUCCESS";; paramZzqo = "FAILURE")
      {
        zzbg.v(paramZzqo);
        if (localZza.getStatus().isSuccess())
        {
          zzbg.v("Response source: " + localZza.zzBx().toString());
          zzbg.v("Response size: " + localZza.zzBy().length);
        }
        zza(localZza.zzBz(), zzaTE);
        return;
      }
    }
  }
  
  static class zzc<T>
  {
    private T mData;
    private Status zzQA;
    private long zzaTF;
    
    public zzc(Status paramStatus, T paramT, long paramLong)
    {
      zzQA = paramStatus;
      mData = paramT;
      zzaTF = paramLong;
    }
    
    public long zzBu()
    {
      return zzaTF;
    }
    
    public void zzQ(T paramT)
    {
      mData = paramT;
    }
    
    public void zzU(long paramLong)
    {
      zzaTF = paramLong;
    }
    
    public void zzbh(Status paramStatus)
    {
      zzQA = paramStatus;
    }
  }
}
