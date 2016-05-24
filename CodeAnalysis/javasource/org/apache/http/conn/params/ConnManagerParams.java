package org.apache.http.conn.params;

import org.apache.http.annotation.Immutable;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@Deprecated
@Immutable
public final class ConnManagerParams
  implements ConnManagerPNames
{
  private static final ConnPerRoute DEFAULT_CONN_PER_ROUTE = new ConnPerRoute()
  {
    public int getMaxForRoute(HttpRoute paramAnonymousHttpRoute)
    {
      return 2;
    }
  };
  public static final int DEFAULT_MAX_TOTAL_CONNECTIONS = 20;
  
  public ConnManagerParams() {}
  
  public static ConnPerRoute getMaxConnectionsPerRoute(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    ConnPerRoute localConnPerRoute = (ConnPerRoute)paramHttpParams.getParameter("http.conn-manager.max-per-route");
    paramHttpParams = localConnPerRoute;
    if (localConnPerRoute == null) {
      paramHttpParams = DEFAULT_CONN_PER_ROUTE;
    }
    return paramHttpParams;
  }
  
  public static int getMaxTotalConnections(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return paramHttpParams.getIntParameter("http.conn-manager.max-total", 20);
  }
  
  @Deprecated
  public static long getTimeout(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return paramHttpParams.getLongParameter("http.conn-manager.timeout", 0L);
  }
  
  public static void setMaxConnectionsPerRoute(HttpParams paramHttpParams, ConnPerRoute paramConnPerRoute)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setParameter("http.conn-manager.max-per-route", paramConnPerRoute);
  }
  
  public static void setMaxTotalConnections(HttpParams paramHttpParams, int paramInt)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setIntParameter("http.conn-manager.max-total", paramInt);
  }
  
  @Deprecated
  public static void setTimeout(HttpParams paramHttpParams, long paramLong)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setLongParameter("http.conn-manager.timeout", paramLong);
  }
}
