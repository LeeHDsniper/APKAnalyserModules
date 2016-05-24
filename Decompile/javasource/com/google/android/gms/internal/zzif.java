package com.google.android.gms.internal;

import java.util.concurrent.TimeUnit;

@zzgk
public class zzif<T>
  implements zzih<T>
{
  private final T zzID;
  private final zzii zzIF;
  
  public zzif(T paramT)
  {
    zzID = paramT;
    zzIF = new zzii();
    zzIF.zzgK();
  }
  
  public boolean cancel(boolean paramBoolean)
  {
    return false;
  }
  
  public T get()
  {
    return zzID;
  }
  
  public T get(long paramLong, TimeUnit paramTimeUnit)
  {
    return zzID;
  }
  
  public boolean isCancelled()
  {
    return false;
  }
  
  public boolean isDone()
  {
    return true;
  }
  
  public void zzc(Runnable paramRunnable)
  {
    zzIF.zzc(paramRunnable);
  }
}
