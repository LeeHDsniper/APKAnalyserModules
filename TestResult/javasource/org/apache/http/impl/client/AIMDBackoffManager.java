package org.apache.http.impl.client;

import java.util.HashMap;
import java.util.Map;
import org.apache.http.client.BackoffManager;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.pool.ConnPoolControl;
import org.apache.http.util.Args;

public class AIMDBackoffManager
  implements BackoffManager
{
  private double backoffFactor = 0.5D;
  private int cap = 2;
  private final Clock clock;
  private final ConnPoolControl<HttpRoute> connPerRoute;
  private long coolDown = 5000L;
  private final Map<HttpRoute, Long> lastRouteBackoffs;
  private final Map<HttpRoute, Long> lastRouteProbes;
  
  public AIMDBackoffManager(ConnPoolControl<HttpRoute> paramConnPoolControl)
  {
    this(paramConnPoolControl, new SystemClock());
  }
  
  AIMDBackoffManager(ConnPoolControl<HttpRoute> paramConnPoolControl, Clock paramClock)
  {
    clock = paramClock;
    connPerRoute = paramConnPoolControl;
    lastRouteProbes = new HashMap();
    lastRouteBackoffs = new HashMap();
  }
  
  private int getBackedOffPoolSize(int paramInt)
  {
    if (paramInt <= 1) {
      return 1;
    }
    return (int)Math.floor(backoffFactor * paramInt);
  }
  
  private Long getLastUpdate(Map<HttpRoute, Long> paramMap, HttpRoute paramHttpRoute)
  {
    paramHttpRoute = (Long)paramMap.get(paramHttpRoute);
    paramMap = paramHttpRoute;
    if (paramHttpRoute == null) {
      paramMap = Long.valueOf(0L);
    }
    return paramMap;
  }
  
  public void backOff(HttpRoute paramHttpRoute)
  {
    synchronized (connPerRoute)
    {
      int i = connPerRoute.getMaxPerRoute(paramHttpRoute);
      Long localLong = getLastUpdate(lastRouteBackoffs, paramHttpRoute);
      long l = clock.getCurrentTime();
      if (l - localLong.longValue() < coolDown) {
        return;
      }
      connPerRoute.setMaxPerRoute(paramHttpRoute, getBackedOffPoolSize(i));
      lastRouteBackoffs.put(paramHttpRoute, Long.valueOf(l));
      return;
    }
  }
  
  public void probe(HttpRoute paramHttpRoute)
  {
    for (;;)
    {
      int i;
      synchronized (connPerRoute)
      {
        i = connPerRoute.getMaxPerRoute(paramHttpRoute);
        if (i >= cap)
        {
          i = cap;
          Long localLong1 = getLastUpdate(lastRouteProbes, paramHttpRoute);
          Long localLong2 = getLastUpdate(lastRouteBackoffs, paramHttpRoute);
          long l = clock.getCurrentTime();
          if ((l - localLong1.longValue() < coolDown) || (l - localLong2.longValue() < coolDown)) {
            return;
          }
          connPerRoute.setMaxPerRoute(paramHttpRoute, i);
          lastRouteProbes.put(paramHttpRoute, Long.valueOf(l));
          return;
        }
      }
      i += 1;
    }
  }
  
  public void setBackoffFactor(double paramDouble)
  {
    if ((paramDouble > 0.0D) && (paramDouble < 1.0D)) {}
    for (boolean bool = true;; bool = false)
    {
      Args.check(bool, "Backoff factor must be 0.0 < f < 1.0");
      backoffFactor = paramDouble;
      return;
    }
  }
  
  public void setCooldownMillis(long paramLong)
  {
    Args.positive(coolDown, "Cool down");
    coolDown = paramLong;
  }
  
  public void setPerHostConnectionCap(int paramInt)
  {
    Args.positive(paramInt, "Per host connection cap");
    cap = paramInt;
  }
}
