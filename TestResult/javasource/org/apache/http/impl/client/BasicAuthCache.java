package org.apache.http.impl.client;

import java.util.HashMap;
import org.apache.http.HttpHost;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.auth.AuthScheme;
import org.apache.http.client.AuthCache;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.conn.UnsupportedSchemeException;
import org.apache.http.impl.conn.DefaultSchemePortResolver;
import org.apache.http.util.Args;

@NotThreadSafe
public class BasicAuthCache
  implements AuthCache
{
  private final HashMap<HttpHost, AuthScheme> map = new HashMap();
  private final SchemePortResolver schemePortResolver;
  
  public BasicAuthCache()
  {
    this(null);
  }
  
  public BasicAuthCache(SchemePortResolver paramSchemePortResolver)
  {
    if (paramSchemePortResolver != null) {}
    for (;;)
    {
      schemePortResolver = paramSchemePortResolver;
      return;
      paramSchemePortResolver = DefaultSchemePortResolver.INSTANCE;
    }
  }
  
  public void clear()
  {
    map.clear();
  }
  
  public AuthScheme get(HttpHost paramHttpHost)
  {
    Args.notNull(paramHttpHost, "HTTP host");
    return (AuthScheme)map.get(getKey(paramHttpHost));
  }
  
  protected HttpHost getKey(HttpHost paramHttpHost)
  {
    HttpHost localHttpHost = paramHttpHost;
    if (paramHttpHost.getPort() <= 0) {}
    try
    {
      int i = schemePortResolver.resolve(paramHttpHost);
      localHttpHost = new HttpHost(paramHttpHost.getHostName(), i, paramHttpHost.getSchemeName());
      return localHttpHost;
    }
    catch (UnsupportedSchemeException localUnsupportedSchemeException) {}
    return paramHttpHost;
  }
  
  public void put(HttpHost paramHttpHost, AuthScheme paramAuthScheme)
  {
    Args.notNull(paramHttpHost, "HTTP host");
    map.put(getKey(paramHttpHost), paramAuthScheme);
  }
  
  public void remove(HttpHost paramHttpHost)
  {
    Args.notNull(paramHttpHost, "HTTP host");
    map.remove(getKey(paramHttpHost));
  }
  
  public String toString()
  {
    return map.toString();
  }
}
