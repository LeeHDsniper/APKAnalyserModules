package org.apache.http.conn.routing;

import java.net.InetAddress;
import org.apache.http.HttpHost;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;
import org.apache.http.util.LangUtils;

@NotThreadSafe
public final class RouteTracker
  implements Cloneable, RouteInfo
{
  private boolean connected;
  private RouteInfo.LayerType layered;
  private final InetAddress localAddress;
  private HttpHost[] proxyChain;
  private boolean secure;
  private final HttpHost targetHost;
  private RouteInfo.TunnelType tunnelled;
  
  public RouteTracker(HttpHost paramHttpHost, InetAddress paramInetAddress)
  {
    Args.notNull(paramHttpHost, "Target host");
    targetHost = paramHttpHost;
    localAddress = paramInetAddress;
    tunnelled = RouteInfo.TunnelType.PLAIN;
    layered = RouteInfo.LayerType.PLAIN;
  }
  
  public RouteTracker(HttpRoute paramHttpRoute)
  {
    this(paramHttpRoute.getTargetHost(), paramHttpRoute.getLocalAddress());
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    return super.clone();
  }
  
  public final void connectProxy(HttpHost paramHttpHost, boolean paramBoolean)
  {
    Args.notNull(paramHttpHost, "Proxy host");
    if (!connected) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "Already connected");
      connected = true;
      proxyChain = new HttpHost[] { paramHttpHost };
      secure = paramBoolean;
      return;
    }
  }
  
  public final void connectTarget(boolean paramBoolean)
  {
    if (!connected) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "Already connected");
      connected = true;
      secure = paramBoolean;
      return;
    }
  }
  
  public final boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof RouteTracker)) {
        return false;
      }
      paramObject = (RouteTracker)paramObject;
    } while ((connected == connected) && (secure == secure) && (tunnelled == tunnelled) && (layered == layered) && (LangUtils.equals(targetHost, targetHost)) && (LangUtils.equals(localAddress, localAddress)) && (LangUtils.equals(proxyChain, proxyChain)));
    return false;
  }
  
  public final int getHopCount()
  {
    int i = 0;
    if (connected)
    {
      if (proxyChain == null) {
        i = 1;
      }
    }
    else {
      return i;
    }
    return proxyChain.length + 1;
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
      return proxyChain[paramInt];
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
  
  public final HttpHost getProxyHost()
  {
    if (proxyChain == null) {
      return null;
    }
    return proxyChain[0];
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
    int k = i;
    if (proxyChain != null)
    {
      HttpHost[] arrayOfHttpHost = proxyChain;
      int m = arrayOfHttpHost.length;
      int j = 0;
      for (;;)
      {
        k = i;
        if (j >= m) {
          break;
        }
        i = LangUtils.hashCode(i, arrayOfHttpHost[j]);
        j += 1;
      }
    }
    return LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(k, connected), secure), tunnelled), layered);
  }
  
  public final boolean isConnected()
  {
    return connected;
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
  
  public final void layerProtocol(boolean paramBoolean)
  {
    Asserts.check(connected, "No layered protocol unless connected");
    layered = RouteInfo.LayerType.LAYERED;
    secure = paramBoolean;
  }
  
  public void reset()
  {
    connected = false;
    proxyChain = null;
    tunnelled = RouteInfo.TunnelType.PLAIN;
    layered = RouteInfo.LayerType.PLAIN;
    secure = false;
  }
  
  public final HttpRoute toRoute()
  {
    if (!connected) {
      return null;
    }
    return new HttpRoute(targetHost, localAddress, proxyChain, secure, tunnelled, layered);
  }
  
  public final String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(getHopCount() * 30 + 50);
    localStringBuilder.append("RouteTracker[");
    if (localAddress != null)
    {
      localStringBuilder.append(localAddress);
      localStringBuilder.append("->");
    }
    localStringBuilder.append('{');
    if (connected) {
      localStringBuilder.append('c');
    }
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
      HttpHost[] arrayOfHttpHost = proxyChain;
      int j = arrayOfHttpHost.length;
      int i = 0;
      while (i < j)
      {
        localStringBuilder.append(arrayOfHttpHost[i]);
        localStringBuilder.append("->");
        i += 1;
      }
    }
    localStringBuilder.append(targetHost);
    localStringBuilder.append(']');
    return localStringBuilder.toString();
  }
  
  public final void tunnelProxy(HttpHost paramHttpHost, boolean paramBoolean)
  {
    Args.notNull(paramHttpHost, "Proxy host");
    Asserts.check(connected, "No tunnel unless connected");
    Asserts.notNull(proxyChain, "No tunnel without proxy");
    HttpHost[] arrayOfHttpHost = new HttpHost[proxyChain.length + 1];
    System.arraycopy(proxyChain, 0, arrayOfHttpHost, 0, proxyChain.length);
    arrayOfHttpHost[(arrayOfHttpHost.length - 1)] = paramHttpHost;
    proxyChain = arrayOfHttpHost;
    secure = paramBoolean;
  }
  
  public final void tunnelTarget(boolean paramBoolean)
  {
    Asserts.check(connected, "No tunnel unless connected");
    Asserts.notNull(proxyChain, "No tunnel without proxy");
    tunnelled = RouteInfo.TunnelType.TUNNELLED;
    secure = paramBoolean;
  }
}
