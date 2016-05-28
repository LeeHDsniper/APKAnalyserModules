package com.google.android.gms.internal;

public class zzr
  extends Exception
{
  private long zzC;
  public final zzi zzaj;
  
  public zzr()
  {
    zzaj = null;
  }
  
  public zzr(zzi paramZzi)
  {
    zzaj = paramZzi;
  }
  
  public zzr(Throwable paramThrowable)
  {
    super(paramThrowable);
    zzaj = null;
  }
  
  void zza(long paramLong)
  {
    zzC = paramLong;
  }
}
