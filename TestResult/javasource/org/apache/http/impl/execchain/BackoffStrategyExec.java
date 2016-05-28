package org.apache.http.impl.execchain;

import java.io.IOException;
import java.lang.reflect.UndeclaredThrowableException;
import org.apache.http.HttpException;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.BackoffManager;
import org.apache.http.client.ConnectionBackoffStrategy;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpExecutionAware;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.util.Args;

@Immutable
public class BackoffStrategyExec
  implements ClientExecChain
{
  private final BackoffManager backoffManager;
  private final ConnectionBackoffStrategy connectionBackoffStrategy;
  private final ClientExecChain requestExecutor;
  
  public BackoffStrategyExec(ClientExecChain paramClientExecChain, ConnectionBackoffStrategy paramConnectionBackoffStrategy, BackoffManager paramBackoffManager)
  {
    Args.notNull(paramClientExecChain, "HTTP client request executor");
    Args.notNull(paramConnectionBackoffStrategy, "Connection backoff strategy");
    Args.notNull(paramBackoffManager, "Backoff manager");
    requestExecutor = paramClientExecChain;
    connectionBackoffStrategy = paramConnectionBackoffStrategy;
    backoffManager = paramBackoffManager;
  }
  
  public CloseableHttpResponse execute(HttpRoute paramHttpRoute, HttpRequestWrapper paramHttpRequestWrapper, HttpClientContext paramHttpClientContext, HttpExecutionAware paramHttpExecutionAware)
    throws IOException, HttpException
  {
    Args.notNull(paramHttpRoute, "HTTP route");
    Args.notNull(paramHttpRequestWrapper, "HTTP request");
    Args.notNull(paramHttpClientContext, "HTTP context");
    try
    {
      paramHttpRequestWrapper = requestExecutor.execute(paramHttpRoute, paramHttpRequestWrapper, paramHttpClientContext, paramHttpExecutionAware);
      if (connectionBackoffStrategy.shouldBackoff(paramHttpRequestWrapper))
      {
        backoffManager.backOff(paramHttpRoute);
        return paramHttpRequestWrapper;
      }
    }
    catch (Exception paramHttpRequestWrapper)
    {
      if (0 != 0) {
        throw new NullPointerException();
      }
      if (connectionBackoffStrategy.shouldBackoff(paramHttpRequestWrapper)) {
        backoffManager.backOff(paramHttpRoute);
      }
      if ((paramHttpRequestWrapper instanceof RuntimeException)) {
        throw ((RuntimeException)paramHttpRequestWrapper);
      }
      if ((paramHttpRequestWrapper instanceof HttpException)) {
        throw ((HttpException)paramHttpRequestWrapper);
      }
      if ((paramHttpRequestWrapper instanceof IOException)) {
        throw ((IOException)paramHttpRequestWrapper);
      }
      throw new UndeclaredThrowableException(paramHttpRequestWrapper);
    }
    backoffManager.probe(paramHttpRoute);
    return paramHttpRequestWrapper;
  }
}
