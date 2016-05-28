package org.apache.http.client;

import org.apache.http.HttpResponse;
import org.apache.http.protocol.HttpContext;

public abstract interface ServiceUnavailableRetryStrategy
{
  public abstract long getRetryInterval();
  
  public abstract boolean retryRequest(HttpResponse paramHttpResponse, int paramInt, HttpContext paramHttpContext);
}
