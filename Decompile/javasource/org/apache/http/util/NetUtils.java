package org.apache.http.util;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketAddress;

public final class NetUtils
{
  public NetUtils() {}
  
  public static void formatAddress(StringBuilder paramStringBuilder, SocketAddress paramSocketAddress)
  {
    Args.notNull(paramStringBuilder, "Buffer");
    Args.notNull(paramSocketAddress, "Socket address");
    if ((paramSocketAddress instanceof InetSocketAddress))
    {
      InetSocketAddress localInetSocketAddress = (InetSocketAddress)paramSocketAddress;
      InetAddress localInetAddress = localInetSocketAddress.getAddress();
      paramSocketAddress = localInetAddress;
      if (localInetAddress != null) {
        paramSocketAddress = localInetAddress.getHostAddress();
      }
      paramStringBuilder.append(paramSocketAddress).append(':').append(localInetSocketAddress.getPort());
      return;
    }
    paramStringBuilder.append(paramSocketAddress);
  }
}
