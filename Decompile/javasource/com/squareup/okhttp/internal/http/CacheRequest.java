package com.squareup.okhttp.internal.http;

import java.io.IOException;
import okio.Sink;

public abstract interface CacheRequest
{
  public abstract void abort();
  
  public abstract Sink body()
    throws IOException;
}
