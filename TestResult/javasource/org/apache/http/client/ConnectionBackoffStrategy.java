package org.apache.http.client;

import org.apache.http.HttpResponse;

public abstract interface ConnectionBackoffStrategy
{
  public abstract boolean shouldBackoff(Throwable paramThrowable);
  
  public abstract boolean shouldBackoff(HttpResponse paramHttpResponse);
}
