package com.squareup.okhttp.internal;

import com.squareup.okhttp.Route;
import java.util.LinkedHashSet;
import java.util.Set;

public final class RouteDatabase
{
  private final Set<Route> failedRoutes = new LinkedHashSet();
  
  public RouteDatabase() {}
  
  public void connected(Route paramRoute)
  {
    try
    {
      failedRoutes.remove(paramRoute);
      return;
    }
    finally
    {
      paramRoute = finally;
      throw paramRoute;
    }
  }
  
  public void failed(Route paramRoute)
  {
    try
    {
      failedRoutes.add(paramRoute);
      return;
    }
    finally
    {
      paramRoute = finally;
      throw paramRoute;
    }
  }
  
  public boolean shouldPostpone(Route paramRoute)
  {
    try
    {
      boolean bool = failedRoutes.contains(paramRoute);
      return bool;
    }
    finally
    {
      paramRoute = finally;
      throw paramRoute;
    }
  }
}
