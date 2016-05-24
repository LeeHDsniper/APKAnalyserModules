package com.google.android.gms.common.api;

import java.util.concurrent.TimeUnit;

public abstract interface PendingResult<R extends Result>
{
  public abstract R await(long paramLong, TimeUnit paramTimeUnit);
  
  public abstract void setResultCallback(ResultCallback<R> paramResultCallback);
  
  public static abstract interface BatchCallback
  {
    public abstract void onComplete(Status paramStatus);
  }
}
