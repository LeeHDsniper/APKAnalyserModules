package org.apache.http.conn.params;

import org.apache.http.conn.routing.HttpRoute;

@Deprecated
public abstract interface ConnPerRoute
{
  public abstract int getMaxForRoute(HttpRoute paramHttpRoute);
}
