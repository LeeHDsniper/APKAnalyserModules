package org.apache.http.config;

public abstract interface Lookup<I>
{
  public abstract I lookup(String paramString);
}
