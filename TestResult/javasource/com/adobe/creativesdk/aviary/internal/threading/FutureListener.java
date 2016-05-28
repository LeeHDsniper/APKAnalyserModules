package com.adobe.creativesdk.aviary.internal.threading;

public abstract interface FutureListener<T>
{
  public abstract void onFutureDone(Future<T> paramFuture);
}
