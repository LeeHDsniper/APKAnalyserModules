package org.apache.http.impl.client;

import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.ServiceUnavailableRetryStrategy;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
public class DefaultServiceUnavailableRetryStrategy
  implements ServiceUnavailableRetryStrategy
{
  private final int maxRetries;
  private final long retryInterval;
  
  public DefaultServiceUnavailableRetryStrategy()
  {
    this(1, 1000);
  }
  
  public DefaultServiceUnavailableRetryStrategy(int paramInt1, int paramInt2)
  {
    Args.positive(paramInt1, "Max retries");
    Args.positive(paramInt2, "Retry interval");
    maxRetries = paramInt1;
    retryInterval = paramInt2;
  }
  
  public long getRetryInterval()
  {
    return retryInterval;
  }
  
  public boolean retryRequest(HttpResponse paramHttpResponse, int paramInt, HttpContext paramHttpContext)
  {
    return (paramInt <= maxRetries) && (paramHttpResponse.getStatusLine().getStatusCode() == 503);
  }
}
