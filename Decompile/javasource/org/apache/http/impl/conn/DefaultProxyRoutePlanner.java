package org.apache.http.impl.conn;

import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.Immutable;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
public class DefaultProxyRoutePlanner
  extends DefaultRoutePlanner
{
  private final HttpHost proxy;
  
  public DefaultProxyRoutePlanner(HttpHost paramHttpHost)
  {
    this(paramHttpHost, null);
  }
  
  public DefaultProxyRoutePlanner(HttpHost paramHttpHost, SchemePortResolver paramSchemePortResolver)
  {
    super(paramSchemePortResolver);
    proxy = ((HttpHost)Args.notNull(paramHttpHost, "Proxy host"));
  }
  
  protected HttpHost determineProxy(HttpHost paramHttpHost, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException
  {
    return proxy;
  }
}
