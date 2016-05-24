package org.apache.http.conn.params;

import java.net.InetAddress;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@Deprecated
@Immutable
public class ConnRouteParams
  implements ConnRoutePNames
{
  public static final HttpHost NO_HOST = new HttpHost("127.0.0.255", 0, "no-host");
  public static final HttpRoute NO_ROUTE = new HttpRoute(NO_HOST);
  
  private ConnRouteParams() {}
  
  public static HttpHost getDefaultProxy(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "Parameters");
    HttpHost localHttpHost = (HttpHost)paramHttpParams.getParameter("http.route.default-proxy");
    paramHttpParams = localHttpHost;
    if (localHttpHost != null)
    {
      paramHttpParams = localHttpHost;
      if (NO_HOST.equals(localHttpHost)) {
        paramHttpParams = null;
      }
    }
    return paramHttpParams;
  }
  
  public static HttpRoute getForcedRoute(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "Parameters");
    HttpRoute localHttpRoute = (HttpRoute)paramHttpParams.getParameter("http.route.forced-route");
    paramHttpParams = localHttpRoute;
    if (localHttpRoute != null)
    {
      paramHttpParams = localHttpRoute;
      if (NO_ROUTE.equals(localHttpRoute)) {
        paramHttpParams = null;
      }
    }
    return paramHttpParams;
  }
  
  public static InetAddress getLocalAddress(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "Parameters");
    return (InetAddress)paramHttpParams.getParameter("http.route.local-address");
  }
  
  public static void setDefaultProxy(HttpParams paramHttpParams, HttpHost paramHttpHost)
  {
    Args.notNull(paramHttpParams, "Parameters");
    paramHttpParams.setParameter("http.route.default-proxy", paramHttpHost);
  }
  
  public static void setForcedRoute(HttpParams paramHttpParams, HttpRoute paramHttpRoute)
  {
    Args.notNull(paramHttpParams, "Parameters");
    paramHttpParams.setParameter("http.route.forced-route", paramHttpRoute);
  }
  
  public static void setLocalAddress(HttpParams paramHttpParams, InetAddress paramInetAddress)
  {
    Args.notNull(paramHttpParams, "Parameters");
    paramHttpParams.setParameter("http.route.local-address", paramInetAddress);
  }
}
