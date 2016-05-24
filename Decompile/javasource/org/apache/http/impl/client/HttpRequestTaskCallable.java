package org.apache.http.impl.client;

import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.concurrent.FutureCallback;
import org.apache.http.protocol.HttpContext;

class HttpRequestTaskCallable<V>
  implements Callable<V>
{
  private final FutureCallback<V> callback;
  private final AtomicBoolean cancelled = new AtomicBoolean(false);
  private final HttpContext context;
  private long ended = -1L;
  private final HttpClient httpclient;
  private final FutureRequestExecutionMetrics metrics;
  private final HttpUriRequest request;
  private final ResponseHandler<V> responseHandler;
  private final long scheduled = System.currentTimeMillis();
  private long started = -1L;
  
  HttpRequestTaskCallable(HttpClient paramHttpClient, HttpUriRequest paramHttpUriRequest, HttpContext paramHttpContext, ResponseHandler<V> paramResponseHandler, FutureCallback<V> paramFutureCallback, FutureRequestExecutionMetrics paramFutureRequestExecutionMetrics)
  {
    httpclient = paramHttpClient;
    responseHandler = paramResponseHandler;
    request = paramHttpUriRequest;
    context = paramHttpContext;
    callback = paramFutureCallback;
    metrics = paramFutureRequestExecutionMetrics;
  }
  
  public V call()
    throws Exception
  {
    if (!cancelled.get()) {
      try
      {
        metrics.getActiveConnections().incrementAndGet();
        started = System.currentTimeMillis();
        try
        {
          metrics.getScheduledConnections().decrementAndGet();
          Object localObject1 = httpclient.execute(request, responseHandler, context);
          ended = System.currentTimeMillis();
          metrics.getSuccessfulConnections().increment(started);
          if (callback != null) {
            callback.completed(localObject1);
          }
          return localObject1;
        }
        catch (Exception localException)
        {
          metrics.getFailedConnections().increment(started);
          ended = System.currentTimeMillis();
          if (callback != null) {
            callback.failed(localException);
          }
          throw localException;
        }
        throw new IllegalStateException("call has been cancelled for request " + request.getURI());
      }
      finally
      {
        metrics.getRequests().increment(started);
        metrics.getTasks().increment(started);
        metrics.getActiveConnections().decrementAndGet();
      }
    }
  }
  
  public void cancel()
  {
    cancelled.set(true);
    if (callback != null) {
      callback.cancelled();
    }
  }
  
  public long getEnded()
  {
    return ended;
  }
  
  public long getScheduled()
  {
    return scheduled;
  }
  
  public long getStarted()
  {
    return started;
  }
}
