package org.apache.http.impl.client;

import java.io.Closeable;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.concurrent.FutureCallback;
import org.apache.http.protocol.HttpContext;

@ThreadSafe
public class FutureRequestExecutionService
  implements Closeable
{
  private final AtomicBoolean closed = new AtomicBoolean(false);
  private final ExecutorService executorService;
  private final HttpClient httpclient;
  private final FutureRequestExecutionMetrics metrics = new FutureRequestExecutionMetrics();
  
  public FutureRequestExecutionService(HttpClient paramHttpClient, ExecutorService paramExecutorService)
  {
    httpclient = paramHttpClient;
    executorService = paramExecutorService;
  }
  
  public void close()
    throws IOException
  {
    closed.set(true);
    executorService.shutdownNow();
    if ((httpclient instanceof Closeable)) {
      ((Closeable)httpclient).close();
    }
  }
  
  public <T> HttpRequestFutureTask<T> execute(HttpUriRequest paramHttpUriRequest, HttpContext paramHttpContext, ResponseHandler<T> paramResponseHandler)
  {
    return execute(paramHttpUriRequest, paramHttpContext, paramResponseHandler, null);
  }
  
  public <T> HttpRequestFutureTask<T> execute(HttpUriRequest paramHttpUriRequest, HttpContext paramHttpContext, ResponseHandler<T> paramResponseHandler, FutureCallback<T> paramFutureCallback)
  {
    if (closed.get()) {
      throw new IllegalStateException("Close has been called on this httpclient instance.");
    }
    metrics.getScheduledConnections().incrementAndGet();
    paramHttpUriRequest = new HttpRequestFutureTask(paramHttpUriRequest, new HttpRequestTaskCallable(httpclient, paramHttpUriRequest, paramHttpContext, paramResponseHandler, paramFutureCallback, metrics));
    executorService.execute(paramHttpUriRequest);
    return paramHttpUriRequest;
  }
  
  public FutureRequestExecutionMetrics metrics()
  {
    return metrics;
  }
}
