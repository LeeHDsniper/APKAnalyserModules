package com.google.android.gms.internal;

import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.zzbg;
import java.util.List;

public abstract class zzqx
{
  private zzqn zzaUo;
  private zzql zzaUp;
  private zzlm zzpO;
  
  public zzqx(zzqn paramZzqn, zzql paramZzql)
  {
    this(paramZzqn, paramZzql, zzlo.zzpN());
  }
  
  public zzqx(zzqn paramZzqn, zzql paramZzql, zzlm paramZzlm)
  {
    if (paramZzqn.zzBv().size() == 1) {}
    for (;;)
    {
      zzx.zzZ(bool);
      zzaUo = paramZzqn;
      zzaUp = paramZzql;
      zzpO = paramZzlm;
      return;
      bool = false;
    }
  }
  
  protected abstract zzb zza(zzqi paramZzqi);
  
  protected abstract void zza(zzqo paramZzqo);
  
  public void zza(zza paramZza)
  {
    zzbg.e("ResourceManager: Failed to download a resource: " + paramZza.name());
    paramZza = (zzqi)zzaUo.zzBv().get(0);
    zzb localZzb = zza(paramZza);
    if ((localZzb != null) && ((localZzb.zzBX() instanceof zzqp.zzc))) {}
    for (paramZza = new zzqo.zza(Status.zzaaD, paramZza, null, (zzqp.zzc)localZzb.zzBX(), localZzb.zzBx(), localZzb.zzBB());; paramZza = new zzqo.zza(Status.zzaaF, paramZza, zzqo.zza.zza.zzaTO))
    {
      zza(new zzqo(paramZza));
      return;
    }
  }
  
  public void zzu(byte[] paramArrayOfByte)
  {
    zzbg.v("ResourceManager: Resource downloaded from Network: " + zzaUo.getId());
    localZzqi = (zzqi)zzaUo.zzBv().get(0);
    zzqo.zza.zza localZza2 = zzqo.zza.zza.zzaTO;
    localObject1 = null;
    long l2 = 0L;
    long l1 = l2;
    localZza1 = localZza2;
    try
    {
      Object localObject2 = zzaUp.zzt(paramArrayOfByte);
      l1 = l2;
      localObject1 = localObject2;
      localZza1 = localZza2;
      l2 = zzpO.currentTimeMillis();
      l1 = l2;
      localObject1 = localObject2;
      localZza1 = localZza2;
      if (localObject2 == null)
      {
        l1 = l2;
        localObject1 = localObject2;
        localZza1 = localZza2;
        zzbg.zzaD("Parsed resource from network is null");
        l1 = l2;
        localObject1 = localObject2;
        localZza1 = localZza2;
        zzb localZzb2 = zza(localZzqi);
        l1 = l2;
        localObject1 = localObject2;
        localZza1 = localZza2;
        if (localZzb2 != null)
        {
          l1 = l2;
          localObject1 = localObject2;
          localZza1 = localZza2;
          localObject2 = localZzb2.zzBX();
          l1 = l2;
          localObject1 = localObject2;
          localZza1 = localZza2;
          localZza2 = localZzb2.zzBx();
          l1 = l2;
          localObject1 = localObject2;
          localZza1 = localZza2;
          l2 = localZzb2.zzBB();
          l1 = l2;
          localZza1 = localZza2;
          localObject1 = localObject2;
        }
      }
    }
    catch (zzqp.zzg localZzg)
    {
      for (;;)
      {
        zzbg.zzaD("Resource from network is corrupted");
        zzb localZzb1 = zza(localZzqi);
        if (localZzb1 != null)
        {
          localObject1 = localZzb1.zzBX();
          localZza1 = localZzb1.zzBx();
          continue;
          paramArrayOfByte = new zzqo.zza(Status.zzaaF, localZzqi, zzqo.zza.zza.zzaTO);
        }
      }
    }
    if (localObject1 != null)
    {
      paramArrayOfByte = new zzqo.zza(Status.zzaaD, localZzqi, paramArrayOfByte, (zzqp.zzc)localObject1, localZza1, l1);
      zza(new zzqo(paramArrayOfByte));
      return;
    }
  }
  
  public static enum zza
  {
    private zza() {}
  }
  
  public class zzb
  {
    private final zzqo.zza.zza zzaTJ;
    private final long zzaTL;
    private final Object zzaUu;
    
    public long zzBB()
    {
      return zzaTL;
    }
    
    public Object zzBX()
    {
      return zzaUu;
    }
    
    public zzqo.zza.zza zzBx()
    {
      return zzaTJ;
    }
  }
}
