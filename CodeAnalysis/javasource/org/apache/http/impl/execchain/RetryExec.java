package org.apache.http.impl.execchain;

import java.io.IOException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.NonRepeatableRequestException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpExecutionAware;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.util.Args;

@Immutable
public class RetryExec
  implements ClientExecChain
{
  private final Log log = LogFactory.getLog(getClass());
  private final ClientExecChain requestExecutor;
  private final HttpRequestRetryHandler retryHandler;
  
  public RetryExec(ClientExecChain paramClientExecChain, HttpRequestRetryHandler paramHttpRequestRetryHandler)
  {
    Args.notNull(paramClientExecChain, "HTTP request executor");
    Args.notNull(paramHttpRequestRetryHandler, "HTTP request retry handler");
    requestExecutor = paramClientExecChain;
    retryHandler = paramHttpRequestRetryHandler;
  }
  
  public CloseableHttpResponse execute(HttpRoute paramHttpRoute, HttpRequestWrapper paramHttpRequestWrapper, HttpClientContext paramHttpClientContext, HttpExecutionAware paramHttpExecutionAware)
    throws IOException, HttpException
  {
    Args.notNull(paramHttpRoute, "HTTP route");
    Args.notNull(paramHttpRequestWrapper, "HTTP request");
    Args.notNull(paramHttpClientContext, "HTTP context");
    Header[] arrayOfHeader = paramHttpRequestWrapper.getAllHeaders();
    int i = 1;
    try
    {
      CloseableHttpResponse localCloseableHttpResponse = requestExecutor.execute(paramHttpRoute, paramHttpRequestWrapper, paramHttpClientContext, paramHttpExecutionAware);
      return localCloseableHttpResponse;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        if ((paramHttpExecutionAware != null) && (paramHttpExecutionAware.isAborted()))
        {
          log.debug("Request has been aborted");
          throw localIOException;
        }
        if (!retryHandler.retryRequest(localIOException, i, paramHttpClientContext)) {
          break;
        }
        if (log.isInfoEnabled()) {
          log.info("I/O exception (" + localIOException.getClass().getName() + ") caught when processing request: " + localIOException.getMessage());
        }
        if (log.isDebugEnabled()) {
          log.debug(localIOException.getMessage(), localIOException);
        }
        if (!Proxies.isRepeatable(paramHttpRequestWrapper))
        {
          log.debug("Cannot retry non-repeatable request");
          throw new NonRepeatableRequestException("Cannot retry request with a non-repeatable request entity", localIOException);
        }
        paramHttpRequestWrapper.setHeaders(arrayOfHeader);
        log.info("Retrying request");
        i += 1;
      }
      throw localIOException;
    }
  }
}
