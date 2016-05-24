package org.apache.http.impl.conn;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.net.ProxySelector;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.Immutable;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.protocol.HttpContext;

@Immutable
public class SystemDefaultRoutePlanner
  extends DefaultRoutePlanner
{
  private final ProxySelector proxySelector;
  
  public SystemDefaultRoutePlanner(ProxySelector paramProxySelector)
  {
    this(null, paramProxySelector);
  }
  
  public SystemDefaultRoutePlanner(SchemePortResolver paramSchemePortResolver, ProxySelector paramProxySelector)
  {
    super(paramSchemePortResolver);
    if (paramProxySelector != null) {}
    for (;;)
    {
      proxySelector = paramProxySelector;
      return;
      paramProxySelector = ProxySelector.getDefault();
    }
  }
  
  private Proxy chooseProxy(List<Proxy> paramList)
  {
    Object localObject = null;
    int i = 0;
    if ((localObject == null) && (i < paramList.size()))
    {
      Proxy localProxy = (Proxy)paramList.get(i);
      switch (1.$SwitchMap$java$net$Proxy$Type[localProxy.type().ordinal()])
      {
      }
      for (;;)
      {
        i += 1;
        break;
        localObject = localProxy;
      }
    }
    paramList = localObject;
    if (localObject == null) {
      paramList = Proxy.NO_PROXY;
    }
    return paramList;
  }
  
  private String getHost(InetSocketAddress paramInetSocketAddress)
  {
    if (paramInetSocketAddress.isUnresolved()) {
      return paramInetSocketAddress.getHostName();
    }
    return paramInetSocketAddress.getAddress().getHostAddress();
  }
  
  protected HttpHost determineProxy(HttpHost paramHttpHost, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException
  {
    try
    {
      paramHttpRequest = new URI(paramHttpHost.toURI());
      paramHttpRequest = chooseProxy(proxySelector.select(paramHttpRequest));
      paramHttpHost = null;
      if (paramHttpRequest.type() != Proxy.Type.HTTP) {
        return paramHttpHost;
      }
      if (!(paramHttpRequest.address() instanceof InetSocketAddress)) {
        throw new HttpException("Unable to handle non-Inet proxy address: " + paramHttpRequest.address());
      }
    }
    catch (URISyntaxException paramHttpRequest)
    {
      throw new HttpException("Cannot convert host to URI: " + paramHttpHost, paramHttpRequest);
    }
    paramHttpHost = (InetSocketAddress)paramHttpRequest.address();
    paramHttpHost = new HttpHost(getHost(paramHttpHost), paramHttpHost.getPort());
    return paramHttpHost;
  }
}
