package org.apache.http.client.methods;

import org.apache.http.concurrent.Cancellable;

public abstract interface HttpExecutionAware
{
  public abstract boolean isAborted();
  
  public abstract void setCancellable(Cancellable paramCancellable);
}
