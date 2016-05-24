package org.apache.http.impl.client;

import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.routing.HttpRoute;

@Deprecated
@NotThreadSafe
public class RoutedRequest
{
  protected final RequestWrapper request;
  protected final HttpRoute route;
  
  public RoutedRequest(RequestWrapper paramRequestWrapper, HttpRoute paramHttpRoute)
  {
    request = paramRequestWrapper;
    route = paramHttpRoute;
  }
  
  public final RequestWrapper getRequest()
  {
    return request;
  }
  
  public final HttpRoute getRoute()
  {
    return route;
  }
}
