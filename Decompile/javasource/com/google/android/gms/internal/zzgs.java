package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.zzp;
import java.util.WeakHashMap;

@zzgk
public final class zzgs
{
  private WeakHashMap<Context, zza> zzFX = new WeakHashMap();
  
  public zzgs() {}
  
  public zzgr zzD(Context paramContext)
  {
    Object localObject = (zza)zzFX.get(paramContext);
    if ((localObject != null) && (!((zza)localObject).hasExpired()) && (((Boolean)zzby.zzuX.get()).booleanValue())) {}
    for (localObject = new zzgr.zza(paramContext, zzFZ).zzfN();; localObject = new zzgr.zza(paramContext).zzfN())
    {
      zzFX.put(paramContext, new zza((zzgr)localObject));
      return localObject;
    }
  }
  
  private class zza
  {
    public final long zzFY = zzp.zzbB().currentTimeMillis();
    public final zzgr zzFZ;
    
    public zza(zzgr paramZzgr)
    {
      zzFZ = paramZzgr;
    }
    
    public boolean hasExpired()
    {
      long l = zzFY;
      return ((Long)zzby.zzuY.get()).longValue() + l < zzp.zzbB().currentTimeMillis();
    }
  }
}
