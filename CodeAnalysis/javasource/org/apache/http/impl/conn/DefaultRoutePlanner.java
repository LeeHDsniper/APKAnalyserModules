package org.apache.http.impl.conn;

import java.net.InetAddress;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.conn.UnsupportedSchemeException;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.HttpRoutePlanner;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
public class DefaultRoutePlanner
  implements HttpRoutePlanner
{
  private final SchemePortResolver schemePortResolver;
  
  public DefaultRoutePlanner(SchemePortResolver paramSchemePortResolver)
  {
    if (paramSchemePortResolver != null) {}
    for (;;)
    {
      schemePortResolver = paramSchemePortResolver;
      return;
      paramSchemePortResolver = DefaultSchemePortResolver.INSTANCE;
    }
  }
  
  protected HttpHost determineProxy(HttpHost paramHttpHost, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException
  {
    return null;
  }
  
  public HttpRoute determineRoute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException
  {
    Args.notNull(paramHttpHost, "Target host");
    Args.notNull(paramHttpRequest, "Request");
    Object localObject = HttpClientContext.adapt(paramHttpContext).getRequestConfig();
    InetAddress localInetAddress = ((RequestConfig)localObject).getLocalAddress();
    HttpHost localHttpHost = ((RequestConfig)localObject).getProxy();
    localObject = localHttpHost;
    if (localHttpHost == null) {
      localObject = determineProxy(paramHttpHost, paramHttpRequest, paramHttpContext);
    }
    if (paramHttpHost.getPort() <= 0) {}
    boolean bool;
    for (;;)
    {
      try
      {
        paramHttpHost = new HttpHost(paramHttpHost.getHostName(), schemePortResolver.resolve(paramHttpHost), paramHttpHost.getSchemeName());
        bool = paramHttpHost.getSchemeName().equalsIgnoreCase("https");
        if (localObject != null) {
          break;
        }
        return new HttpRoute(paramHttpHost, localInetAddress, bool);
      }
      catch (UnsupportedSchemeException paramHttpHost)
      {
        throw new HttpException(paramHttpHost.getMessage());
      }
    }
    return new HttpRoute(paramHttpHost, localInetAddress, (HttpHost)localObject, bool);
  }
}
