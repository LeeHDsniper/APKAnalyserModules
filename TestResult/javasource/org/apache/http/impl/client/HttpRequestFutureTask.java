package org.apache.http.impl.client;

import java.util.concurrent.FutureTask;
import org.apache.http.RequestLine;
import org.apache.http.client.methods.HttpUriRequest;

public class HttpRequestFutureTask<V>
  extends FutureTask<V>
{
  private final HttpRequestTaskCallable<V> callable;
  private final HttpUriRequest request;
  
  public HttpRequestFutureTask(HttpUriRequest paramHttpUriRequest, HttpRequestTaskCallable<V> paramHttpRequestTaskCallable)
  {
    super(paramHttpRequestTaskCallable);
    request = paramHttpUriRequest;
    callable = paramHttpRequestTaskCallable;
  }
  
  public boolean cancel(boolean paramBoolean)
  {
    callable.cancel();
    if (paramBoolean) {
      request.abort();
    }
    return super.cancel(paramBoolean);
  }
  
  public long endedTime()
  {
    if (isDone()) {
      return callable.getEnded();
    }
    throw new IllegalStateException("Task is not done yet");
  }
  
  public long requestDuration()
  {
    if (isDone()) {
      return endedTime() - startedTime();
    }
    throw new IllegalStateException("Task is not done yet");
  }
  
  public long scheduledTime()
  {
    return callable.getScheduled();
  }
  
  public long startedTime()
  {
    return callable.getStarted();
  }
  
  public long taskDuration()
  {
    if (isDone()) {
      return endedTime() - scheduledTime();
    }
    throw new IllegalStateException("Task is not done yet");
  }
  
  public String toString()
  {
    return request.getRequestLine().getUri();
  }
}
