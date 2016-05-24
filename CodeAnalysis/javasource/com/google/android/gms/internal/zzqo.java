package com.google.android.gms.internal;

import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;

public class zzqo
  implements Result
{
  private final zza zzaTI;
  
  public zzqo(zza paramZza)
  {
    zzaTI = paramZza;
  }
  
  public Status getStatus()
  {
    return zzaTI.getStatus();
  }
  
  public zza zzBw()
  {
    return zzaTI;
  }
  
  public static class zza
  {
    private final Status zzQA;
    private final zza zzaTJ;
    private final byte[] zzaTK;
    private final long zzaTL;
    private final zzqi zzaTM;
    private final zzqp.zzc zzaTN;
    
    public zza(Status paramStatus, zzqi paramZzqi, zza paramZza)
    {
      this(paramStatus, paramZzqi, null, null, paramZza, 0L);
    }
    
    public zza(Status paramStatus, zzqi paramZzqi, byte[] paramArrayOfByte, zzqp.zzc paramZzc, zza paramZza, long paramLong)
    {
      zzQA = paramStatus;
      zzaTM = paramZzqi;
      zzaTK = paramArrayOfByte;
      zzaTN = paramZzc;
      zzaTJ = paramZza;
      zzaTL = paramLong;
    }
    
    public Status getStatus()
    {
      return zzQA;
    }
    
    public zzqp.zzc zzBA()
    {
      return zzaTN;
    }
    
    public long zzBB()
    {
      return zzaTL;
    }
    
    public zza zzBx()
    {
      return zzaTJ;
    }
    
    public byte[] zzBy()
    {
      return zzaTK;
    }
    
    public zzqi zzBz()
    {
      return zzaTM;
    }
    
    public static enum zza
    {
      private zza() {}
    }
  }
}
