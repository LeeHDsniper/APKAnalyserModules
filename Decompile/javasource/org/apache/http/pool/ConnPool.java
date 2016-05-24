package org.apache.http.pool;

import java.util.concurrent.Future;
import org.apache.http.concurrent.FutureCallback;

public abstract interface ConnPool<T, E>
{
  public abstract Future<E> lease(T paramT, Object paramObject, FutureCallback<E> paramFutureCallback);
  
  public abstract void release(E paramE, boolean paramBoolean);
}
