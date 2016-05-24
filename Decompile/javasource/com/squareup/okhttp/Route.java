package com.squareup.okhttp;

import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Proxy.Type;

public final class Route
{
  final Address address;
  final ConnectionSpec connectionSpec;
  final InetSocketAddress inetSocketAddress;
  final Proxy proxy;
  
  public Route(Address paramAddress, Proxy paramProxy, InetSocketAddress paramInetSocketAddress, ConnectionSpec paramConnectionSpec)
  {
    if (paramAddress == null) {
      throw new NullPointerException("address == null");
    }
    if (paramProxy == null) {
      throw new NullPointerException("proxy == null");
    }
    if (paramInetSocketAddress == null) {
      throw new NullPointerException("inetSocketAddress == null");
    }
    if (paramConnectionSpec == null) {
      throw new NullPointerException("connectionConfiguration == null");
    }
    address = paramAddress;
    proxy = paramProxy;
    inetSocketAddress = paramInetSocketAddress;
    connectionSpec = paramConnectionSpec;
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Route))
    {
      paramObject = (Route)paramObject;
      bool1 = bool2;
      if (address.equals(address))
      {
        bool1 = bool2;
        if (proxy.equals(proxy))
        {
          bool1 = bool2;
          if (inetSocketAddress.equals(inetSocketAddress))
          {
            bool1 = bool2;
            if (connectionSpec.equals(connectionSpec)) {
              bool1 = true;
            }
          }
        }
      }
    }
    return bool1;
  }
  
  public Address getAddress()
  {
    return address;
  }
  
  public Proxy getProxy()
  {
    return proxy;
  }
  
  public int hashCode()
  {
    return (((address.hashCode() + 527) * 31 + proxy.hashCode()) * 31 + inetSocketAddress.hashCode()) * 31 + connectionSpec.hashCode();
  }
  
  public boolean requiresTunnel()
  {
    return (address.sslSocketFactory != null) && (proxy.type() == Proxy.Type.HTTP);
  }
}
