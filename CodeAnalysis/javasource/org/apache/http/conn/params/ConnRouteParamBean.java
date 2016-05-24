package org.apache.http.conn.params;

import java.net.InetAddress;
import org.apache.http.HttpHost;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.params.HttpAbstractParamBean;
import org.apache.http.params.HttpParams;

@Deprecated
@NotThreadSafe
public class ConnRouteParamBean
  extends HttpAbstractParamBean
{
  public ConnRouteParamBean(HttpParams paramHttpParams)
  {
    super(paramHttpParams);
  }
  
  public void setDefaultProxy(HttpHost paramHttpHost)
  {
    params.setParameter("http.route.default-proxy", paramHttpHost);
  }
  
  public void setForcedRoute(HttpRoute paramHttpRoute)
  {
    params.setParameter("http.route.forced-route", paramHttpRoute);
  }
  
  public void setLocalAddress(InetAddress paramInetAddress)
  {
    params.setParameter("http.route.local-address", paramInetAddress);
  }
}
