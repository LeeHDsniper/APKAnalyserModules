package org.apache.http.impl.client;

abstract interface Clock
{
  public abstract long getCurrentTime();
}
