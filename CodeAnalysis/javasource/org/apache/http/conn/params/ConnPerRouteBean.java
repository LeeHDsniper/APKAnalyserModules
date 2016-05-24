package org.apache.http.conn.params;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.util.Args;

@Deprecated
@ThreadSafe
public final class ConnPerRouteBean
  implements ConnPerRoute
{
  public static final int DEFAULT_MAX_CONNECTIONS_PER_ROUTE = 2;
  private volatile int defaultMax;
  private final ConcurrentHashMap<HttpRoute, Integer> maxPerHostMap = new ConcurrentHashMap();
  
  public ConnPerRouteBean()
  {
    this(2);
  }
  
  public ConnPerRouteBean(int paramInt)
  {
    setDefaultMaxPerRoute(paramInt);
  }
  
  public int getDefaultMax()
  {
    return defaultMax;
  }
  
  public int getDefaultMaxPerRoute()
  {
    return defaultMax;
  }
  
  public int getMaxForRoute(HttpRoute paramHttpRoute)
  {
    Args.notNull(paramHttpRoute, "HTTP route");
    paramHttpRoute = (Integer)maxPerHostMap.get(paramHttpRoute);
    if (paramHttpRoute != null) {
      return paramHttpRoute.intValue();
    }
    return defaultMax;
  }
  
  public void setDefaultMaxPerRoute(int paramInt)
  {
    Args.positive(paramInt, "Defautl max per route");
    defaultMax = paramInt;
  }
  
  public void setMaxForRoute(HttpRoute paramHttpRoute, int paramInt)
  {
    Args.notNull(paramHttpRoute, "HTTP route");
    Args.positive(paramInt, "Max per route");
    maxPerHostMap.put(paramHttpRoute, Integer.valueOf(paramInt));
  }
  
  public void setMaxForRoutes(Map<HttpRoute, Integer> paramMap)
  {
    if (paramMap == null) {
      return;
    }
    maxPerHostMap.clear();
    maxPerHostMap.putAll(paramMap);
  }
  
  public String toString()
  {
    return maxPerHostMap.toString();
  }
}
