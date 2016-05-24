package org.apache.http.client.methods;

import java.io.IOException;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import org.apache.http.HttpRequest;
import org.apache.http.client.utils.CloneUtils;
import org.apache.http.concurrent.Cancellable;
import org.apache.http.conn.ClientConnectionRequest;
import org.apache.http.conn.ConnectionReleaseTrigger;
import org.apache.http.message.AbstractHttpMessage;
import org.apache.http.message.HeaderGroup;
import org.apache.http.params.HttpParams;

public abstract class AbstractExecutionAwareRequest
  extends AbstractHttpMessage
  implements Cloneable, HttpRequest, AbortableHttpRequest, HttpExecutionAware
{
  private Lock abortLock = new ReentrantLock();
  private volatile boolean aborted;
  private volatile Cancellable cancellable;
  
  protected AbstractExecutionAwareRequest() {}
  
  private void cancelExecution()
  {
    if (cancellable != null)
    {
      cancellable.cancel();
      cancellable = null;
    }
  }
  
  public void abort()
  {
    if (aborted) {
      return;
    }
    abortLock.lock();
    try
    {
      aborted = true;
      cancelExecution();
      return;
    }
    finally
    {
      abortLock.unlock();
    }
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    AbstractExecutionAwareRequest localAbstractExecutionAwareRequest = (AbstractExecutionAwareRequest)super.clone();
    headergroup = ((HeaderGroup)CloneUtils.cloneObject(headergroup));
    params = ((HttpParams)CloneUtils.cloneObject(params));
    abortLock = new ReentrantLock();
    cancellable = null;
    aborted = false;
    return localAbstractExecutionAwareRequest;
  }
  
  public void completed()
  {
    abortLock.lock();
    try
    {
      cancellable = null;
      return;
    }
    finally
    {
      abortLock.unlock();
    }
  }
  
  public boolean isAborted()
  {
    return aborted;
  }
  
  public void reset()
  {
    abortLock.lock();
    try
    {
      cancelExecution();
      aborted = false;
      return;
    }
    finally
    {
      abortLock.unlock();
    }
  }
  
  public void setCancellable(Cancellable paramCancellable)
  {
    if (aborted) {
      return;
    }
    abortLock.lock();
    try
    {
      cancellable = paramCancellable;
      return;
    }
    finally
    {
      abortLock.unlock();
    }
  }
  
  @Deprecated
  public void setConnectionRequest(final ClientConnectionRequest paramClientConnectionRequest)
  {
    if (aborted) {
      return;
    }
    abortLock.lock();
    try
    {
      cancellable = new Cancellable()
      {
        public boolean cancel()
        {
          paramClientConnectionRequest.abortRequest();
          return true;
        }
      };
      return;
    }
    finally
    {
      abortLock.unlock();
    }
  }
  
  @Deprecated
  public void setReleaseTrigger(final ConnectionReleaseTrigger paramConnectionReleaseTrigger)
  {
    if (aborted) {
      return;
    }
    abortLock.lock();
    try
    {
      cancellable = new Cancellable()
      {
        public boolean cancel()
        {
          try
          {
            paramConnectionReleaseTrigger.abortConnection();
            return true;
          }
          catch (IOException localIOException) {}
          return false;
        }
      };
      return;
    }
    finally
    {
      abortLock.unlock();
    }
  }
}
