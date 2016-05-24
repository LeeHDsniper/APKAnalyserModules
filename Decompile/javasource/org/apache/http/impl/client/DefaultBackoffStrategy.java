package org.apache.http.impl.client;

import java.net.ConnectException;
import java.net.SocketTimeoutException;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ConnectionBackoffStrategy;

public class DefaultBackoffStrategy
  implements ConnectionBackoffStrategy
{
  public DefaultBackoffStrategy() {}
  
  public boolean shouldBackoff(Throwable paramThrowable)
  {
    return ((paramThrowable instanceof SocketTimeoutException)) || ((paramThrowable instanceof ConnectException));
  }
  
  public boolean shouldBackoff(HttpResponse paramHttpResponse)
  {
    return paramHttpResponse.getStatusLine().getStatusCode() == 503;
  }
}
