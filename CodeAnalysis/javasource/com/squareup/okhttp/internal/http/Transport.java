package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response.Builder;
import java.io.IOException;
import okio.Sink;
import okio.Source;

public abstract interface Transport
{
  public abstract boolean canReuseConnection();
  
  public abstract Sink createRequestBody(Request paramRequest, long paramLong)
    throws IOException;
  
  public abstract void disconnect(HttpEngine paramHttpEngine)
    throws IOException;
  
  public abstract void emptyTransferStream()
    throws IOException;
  
  public abstract void flushRequest()
    throws IOException;
  
  public abstract Source getTransferStream(CacheRequest paramCacheRequest)
    throws IOException;
  
  public abstract Response.Builder readResponseHeaders()
    throws IOException;
  
  public abstract void releaseConnectionOnIdle()
    throws IOException;
  
  public abstract void writeRequestBody(RetryableSink paramRetryableSink)
    throws IOException;
  
  public abstract void writeRequestHeaders(Request paramRequest)
    throws IOException;
}
