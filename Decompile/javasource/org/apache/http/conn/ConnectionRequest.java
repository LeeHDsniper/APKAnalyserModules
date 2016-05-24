package org.apache.http.conn;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import org.apache.http.HttpClientConnection;
import org.apache.http.concurrent.Cancellable;

public abstract interface ConnectionRequest
  extends Cancellable
{
  public abstract HttpClientConnection get(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException, ExecutionException, ConnectionPoolTimeoutException;
}
