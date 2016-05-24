package com.facebook;

import android.os.Handler;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class RequestBatch
  extends AbstractList<Request>
{
  private static AtomicInteger idGenerator = new AtomicInteger();
  private String batchApplicationId;
  private Handler callbackHandler;
  private List<Callback> callbacks = new ArrayList();
  private final String id = Integer.valueOf(idGenerator.incrementAndGet()).toString();
  private List<Request> requests = new ArrayList();
  private int timeoutInMilliseconds = 0;
  
  public RequestBatch()
  {
    requests = new ArrayList();
  }
  
  public RequestBatch(Collection<Request> paramCollection)
  {
    requests = new ArrayList(paramCollection);
  }
  
  public RequestBatch(Request... paramVarArgs)
  {
    requests = Arrays.asList(paramVarArgs);
  }
  
  public final void add(int paramInt, Request paramRequest)
  {
    requests.add(paramInt, paramRequest);
  }
  
  public final boolean add(Request paramRequest)
  {
    return requests.add(paramRequest);
  }
  
  public void addCallback(Callback paramCallback)
  {
    if (!callbacks.contains(paramCallback)) {
      callbacks.add(paramCallback);
    }
  }
  
  public final void clear()
  {
    requests.clear();
  }
  
  public final List<Response> executeAndWait()
  {
    return executeAndWaitImpl();
  }
  
  List<Response> executeAndWaitImpl()
  {
    return Request.executeBatchAndWait(this);
  }
  
  public final RequestAsyncTask executeAsync()
  {
    return executeAsyncImpl();
  }
  
  RequestAsyncTask executeAsyncImpl()
  {
    return Request.executeBatchAsync(this);
  }
  
  public final Request get(int paramInt)
  {
    return (Request)requests.get(paramInt);
  }
  
  final String getBatchApplicationId()
  {
    return batchApplicationId;
  }
  
  final Handler getCallbackHandler()
  {
    return callbackHandler;
  }
  
  final List<Callback> getCallbacks()
  {
    return callbacks;
  }
  
  final String getId()
  {
    return id;
  }
  
  final List<Request> getRequests()
  {
    return requests;
  }
  
  public int getTimeout()
  {
    return timeoutInMilliseconds;
  }
  
  public final Request remove(int paramInt)
  {
    return (Request)requests.remove(paramInt);
  }
  
  public final Request set(int paramInt, Request paramRequest)
  {
    return (Request)requests.set(paramInt, paramRequest);
  }
  
  final void setBatchApplicationId(String paramString)
  {
    batchApplicationId = paramString;
  }
  
  final void setCallbackHandler(Handler paramHandler)
  {
    callbackHandler = paramHandler;
  }
  
  public final int size()
  {
    return requests.size();
  }
  
  public static abstract interface Callback
  {
    public abstract void onBatchCompleted(RequestBatch paramRequestBatch);
  }
  
  public static abstract interface OnProgressCallback
    extends RequestBatch.Callback
  {
    public abstract void onBatchProgress(RequestBatch paramRequestBatch, long paramLong1, long paramLong2);
  }
}
