package com.facebook.ads.internal.util;

import java.lang.ref.WeakReference;

public abstract class u<T>
  implements Runnable
{
  private final WeakReference<T> a;
  
  public u(T paramT)
  {
    a = new WeakReference(paramT);
  }
  
  public T a()
  {
    return a.get();
  }
}
