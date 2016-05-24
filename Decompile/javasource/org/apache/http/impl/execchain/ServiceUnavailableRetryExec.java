package org.apache.http.impl.execchain;

import java.io.IOException;
import java.io.InterruptedIOException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpException;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.ServiceUnavailableRetryStrategy;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpExecutionAware;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.util.Args;

@Immutable
public class ServiceUnavailableRetryExec
  implements ClientExecChain
{
  private final Log log = LogFactory.getLog(getClass());
  private final ClientExecChain requestExecutor;
  private final ServiceUnavailableRetryStrategy retryStrategy;
  
  public ServiceUnavailableRetryExec(ClientExecChain paramClientExecChain, ServiceUnavailableRetryStrategy paramServiceUnavailableRetryStrategy)
  {
    Args.notNull(paramClientExecChain, "HTTP request executor");
    Args.notNull(paramServiceUnavailableRetryStrategy, "Retry strategy");
    requestExecutor = paramClientExecChain;
    retryStrategy = paramServiceUnavailableRetryStrategy;
  }
  
  public CloseableHttpResponse execute(HttpRoute paramHttpRoute, HttpRequestWrapper paramHttpRequestWrapper, HttpClientContext paramHttpClientContext, HttpExecutionAware paramHttpExecutionAware)
    throws IOException, HttpException
  {
    int i = 1;
    for (;;)
    {
      localCloseableHttpResponse = requestExecutor.execute(paramHttpRoute, paramHttpRequestWrapper, paramHttpClientContext, paramHttpExecutionAware);
      try
      {
        if (retryStrategy.retryRequest(localCloseableHttpResponse, i, paramHttpClientContext))
        {
          localCloseableHttpResponse.close();
          long l = retryStrategy.getRetryInterval();
          if (l > 0L) {}
          try
          {
            log.trace("Wait for " + l);
            Thread.sleep(l);
            i += 1;
          }
          catch (InterruptedException paramHttpRoute)
          {
            Thread.currentThread().interrupt();
            throw new InterruptedIOException();
          }
        }
        return localCloseableHttpResponse;
      }
      catch (RuntimeException paramHttpRoute)
      {
        localCloseableHttpResponse.close();
        throw paramHttpRoute;
      }
    }
  }
}
