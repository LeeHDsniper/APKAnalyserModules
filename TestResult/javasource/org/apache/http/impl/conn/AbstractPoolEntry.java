package org.apache.http.impl.conn;

import java.io.IOException;
import java.io.InterruptedIOException;
import org.apache.http.HttpHost;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.RouteTracker;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
public abstract class AbstractPoolEntry
{
  protected final ClientConnectionOperator connOperator;
  protected final OperatedClientConnection connection;
  protected volatile HttpRoute route;
  protected volatile Object state;
  protected volatile RouteTracker tracker;
  
  protected AbstractPoolEntry(ClientConnectionOperator paramClientConnectionOperator, HttpRoute paramHttpRoute)
  {
    Args.notNull(paramClientConnectionOperator, "Connection operator");
    connOperator = paramClientConnectionOperator;
    connection = paramClientConnectionOperator.createConnection();
    route = paramHttpRoute;
    tracker = null;
  }
  
  public Object getState()
  {
    return state;
  }
  
  public void layerProtocol(HttpContext paramHttpContext, HttpParams paramHttpParams)
    throws IOException
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    Asserts.notNull(tracker, "Route tracker");
    Asserts.check(tracker.isConnected(), "Connection not open");
    Asserts.check(tracker.isTunnelled(), "Protocol layering without a tunnel not supported");
    if (!tracker.isLayered()) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "Multiple protocol layering not supported");
      HttpHost localHttpHost = tracker.getTargetHost();
      connOperator.updateSecureConnection(connection, localHttpHost, paramHttpContext, paramHttpParams);
      tracker.layerProtocol(connection.isSecure());
      return;
    }
  }
  
  public void open(HttpRoute paramHttpRoute, HttpContext paramHttpContext, HttpParams paramHttpParams)
    throws IOException
  {
    Args.notNull(paramHttpRoute, "Route");
    Args.notNull(paramHttpParams, "HTTP parameters");
    boolean bool;
    HttpHost localHttpHost2;
    ClientConnectionOperator localClientConnectionOperator;
    OperatedClientConnection localOperatedClientConnection;
    if (tracker != null)
    {
      if (!tracker.isConnected())
      {
        bool = true;
        Asserts.check(bool, "Connection already open");
      }
    }
    else
    {
      tracker = new RouteTracker(paramHttpRoute);
      localHttpHost2 = paramHttpRoute.getProxyHost();
      localClientConnectionOperator = connOperator;
      localOperatedClientConnection = connection;
      if (localHttpHost2 == null) {
        break label122;
      }
    }
    label122:
    for (HttpHost localHttpHost1 = localHttpHost2;; localHttpHost1 = paramHttpRoute.getTargetHost())
    {
      localClientConnectionOperator.openConnection(localOperatedClientConnection, localHttpHost1, paramHttpRoute.getLocalAddress(), paramHttpContext, paramHttpParams);
      paramHttpRoute = tracker;
      if (paramHttpRoute != null) {
        break label131;
      }
      throw new InterruptedIOException("Request aborted");
      bool = false;
      break;
    }
    label131:
    if (localHttpHost2 == null)
    {
      paramHttpRoute.connectTarget(connection.isSecure());
      return;
    }
    paramHttpRoute.connectProxy(localHttpHost2, connection.isSecure());
  }
  
  public void setState(Object paramObject)
  {
    state = paramObject;
  }
  
  protected void shutdownEntry()
  {
    tracker = null;
    state = null;
  }
  
  public void tunnelProxy(HttpHost paramHttpHost, boolean paramBoolean, HttpParams paramHttpParams)
    throws IOException
  {
    Args.notNull(paramHttpHost, "Next proxy");
    Args.notNull(paramHttpParams, "Parameters");
    Asserts.notNull(tracker, "Route tracker");
    Asserts.check(tracker.isConnected(), "Connection not open");
    connection.update(null, paramHttpHost, paramBoolean, paramHttpParams);
    tracker.tunnelProxy(paramHttpHost, paramBoolean);
  }
  
  public void tunnelTarget(boolean paramBoolean, HttpParams paramHttpParams)
    throws IOException
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    Asserts.notNull(tracker, "Route tracker");
    Asserts.check(tracker.isConnected(), "Connection not open");
    if (!tracker.isTunnelled()) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "Connection is already tunnelled");
      connection.update(null, tracker.getTargetHost(), paramBoolean, paramHttpParams);
      tracker.tunnelTarget(paramBoolean);
      return;
    }
  }
}
