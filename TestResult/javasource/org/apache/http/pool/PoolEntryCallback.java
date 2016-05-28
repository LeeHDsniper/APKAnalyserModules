package org.apache.http.pool;

public abstract interface PoolEntryCallback<T, C>
{
  public abstract void process(PoolEntry<T, C> paramPoolEntry);
}
