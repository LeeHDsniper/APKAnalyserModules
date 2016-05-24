package org.apache.http.conn.routing;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Immutable
public final class HttpRoute
  implements Cloneable, RouteInfo
{
  private final RouteInfo.LayerType layered;
  private final InetAddress localAddress;
  private final List<HttpHost> proxyChain;
  private final boolean secure;
  private final HttpHost targetHost;
  private final RouteInfo.TunnelType tunnelled;
  
  public HttpRoute(HttpHost paramHttpHost)
  {
    this(paramHttpHost, null, Collections.emptyList(), false, RouteInfo.TunnelType.PLAIN, RouteInfo.LayerType.PLAIN);
  }
  
  private HttpRoute(HttpHost paramHttpHost, InetAddress paramInetAddress, List<HttpHost> paramList, boolean paramBoolean, RouteInfo.TunnelType paramTunnelType, RouteInfo.LayerType paramLayerType)
  {
    Args.notNull(paramHttpHost, "Target host");
    targetHost = paramHttpHost;
    localAddress = paramInetAddress;
    boolean bool;
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      proxyChain = new ArrayList(paramList);
      if (paramTunnelType == RouteInfo.TunnelType.TUNNELLED)
      {
        if (proxyChain == null) {
          break label108;
        }
        bool = true;
        label64:
        Args.check(bool, "Proxy required if tunnelled");
      }
      secure = paramBoolean;
      if (paramTunnelType == null) {
        break label114;
      }
      label82:
      tunnelled = paramTunnelType;
      if (paramLayerType == null) {
        break label122;
      }
    }
    for (;;)
    {
      layered = paramLayerType;
      return;
      proxyChain = null;
      break;
      label108:
      bool = false;
      break label64;
      label114:
      paramTunnelType = RouteInfo.TunnelType.PLAIN;
      break label82;
      label122:
      paramLayerType = RouteInfo.LayerType.PLAIN;
    }
  }
  
  public HttpRoute(HttpHost paramHttpHost1, InetAddress paramInetAddress, HttpHost paramHttpHost2, boolean paramBoolean) {}
  
  public HttpRoute(HttpHost paramHttpHost1, InetAddress paramInetAddress, HttpHost paramHttpHost2, boolean paramBoolean, RouteInfo.TunnelType paramTunnelType, RouteInfo.LayerType paramLayerType) {}
  
  public HttpRoute(HttpHost paramHttpHost, InetAddress paramInetAddress, boolean paramBoolean)
  {
    this(paramHttpHost, paramInetAddress, Collections.emptyList(), paramBoolean, RouteInfo.TunnelType.PLAIN, RouteInfo.LayerType.PLAIN);
  }
  
  public HttpRoute(HttpHost paramHttpHost, InetAddress paramInetAddress, HttpHost[] paramArrayOfHttpHost, boolean paramBoolean, RouteInfo.TunnelType paramTunnelType, RouteInfo.LayerType paramLayerType) {}
  
  public HttpRoute(HttpHost paramHttpHost1, HttpHost paramHttpHost2)
  {
    this(paramHttpHost1, null, paramHttpHost2, false);
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    return super.clone();
  }
  
  public final boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof HttpRoute)) {
        break;
      }
      paramObject = (HttpRoute)paramObject;
    } while ((secure == secure) && (tunnelled == tunnelled) && (layered == layered) && (LangUtils.equals(targetHost, targetHost)) && (LangUtils.equals(localAddress, localAddress)) && (LangUtils.equals(proxyChain, proxyChain)));
    return false;
    return false;
  }
  
  public final int getHopCount()
  {
    if (proxyChain != null) {
      return proxyChain.size() + 1;
    }
    return 1;
  }
  
  public final HttpHost getHopTarget(int paramInt)
  {
    Args.notNegative(paramInt, "Hop index");
    int i = getHopCount();
    if (paramInt < i) {}
    for (boolean bool = true;; bool = false)
    {
      Args.check(bool, "Hop index exceeds tracked route length");
      if (paramInt >= i - 1) {
        break;
      }
      return (HttpHost)proxyChain.get(paramInt);
    }
    return targetHost;
  }
  
  public final RouteInfo.LayerType getLayerType()
  {
    return layered;
  }
  
  public final InetAddress getLocalAddress()
  {
    return localAddress;
  }
  
  public final InetSocketAddress getLocalSocketAddress()
  {
    if (localAddress != null) {
      return new InetSocketAddress(localAddress, 0);
    }
    return null;
  }
  
  public final HttpHost getProxyHost()
  {
    if ((proxyChain != null) && (!proxyChain.isEmpty())) {
      return (HttpHost)proxyChain.get(0);
    }
    return null;
  }
  
  public final HttpHost getTargetHost()
  {
    return targetHost;
  }
  
  public final RouteInfo.TunnelType getTunnelType()
  {
    return tunnelled;
  }
  
  public final int hashCode()
  {
    int i = LangUtils.hashCode(LangUtils.hashCode(17, targetHost), localAddress);
    int j = i;
    if (proxyChain != null)
    {
      Iterator localIterator = proxyChain.iterator();
      for (;;)
      {
        j = i;
        if (!localIterator.hasNext()) {
          break;
        }
        i = LangUtils.hashCode(i, (HttpHost)localIterator.next());
      }
    }
    return LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(j, secure), tunnelled), layered);
  }
  
  public final boolean isLayered()
  {
    return layered == RouteInfo.LayerType.LAYERED;
  }
  
  public final boolean isSecure()
  {
    return secure;
  }
  
  public final boolean isTunnelled()
  {
    return tunnelled == RouteInfo.TunnelType.TUNNELLED;
  }
  
  public final String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(getHopCount() * 30 + 50);
    if (localAddress != null)
    {
      localStringBuilder.append(localAddress);
      localStringBuilder.append("->");
    }
    localStringBuilder.append('{');
    if (tunnelled == RouteInfo.TunnelType.TUNNELLED) {
      localStringBuilder.append('t');
    }
    if (layered == RouteInfo.LayerType.LAYERED) {
      localStringBuilder.append('l');
    }
    if (secure) {
      localStringBuilder.append('s');
    }
    localStringBuilder.append("}->");
    if (proxyChain != null)
    {
      Iterator localIterator = proxyChain.iterator();
      while (localIterator.hasNext())
      {
        localStringBuilder.append((HttpHost)localIterator.next());
        localStringBuilder.append("->");
      }
    }
    localStringBuilder.append(targetHost);
    return localStringBuilder.toString();
  }
}
