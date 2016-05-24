package org.apache.http.impl.client;

import org.apache.http.HttpResponse;
import org.apache.http.client.ConnectionBackoffStrategy;

public class NullBackoffStrategy
  implements ConnectionBackoffStrategy
{
  public NullBackoffStrategy() {}
  
  public boolean shouldBackoff(Throwable paramThrowable)
  {
    return false;
  }
  
  public boolean shouldBackoff(HttpResponse paramHttpResponse)
  {
    return false;
  }
}
