package org.apache.http;

import java.io.Serializable;
import java.net.InetAddress;
import java.util.Locale;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Immutable
public final class HttpHost
  implements Serializable, Cloneable
{
  public static final String DEFAULT_SCHEME_NAME = "http";
  private static final long serialVersionUID = -7529410654042457626L;
  protected final InetAddress address;
  protected final String hostname;
  protected final String lcHostname;
  protected final int port;
  protected final String schemeName;
  
  public HttpHost(String paramString)
  {
    this(paramString, -1, null);
  }
  
  public HttpHost(String paramString, int paramInt)
  {
    this(paramString, paramInt, null);
  }
  
  public HttpHost(String paramString1, int paramInt, String paramString2)
  {
    hostname = ((String)Args.notNull(paramString1, "Host name"));
    lcHostname = paramString1.toLowerCase(Locale.ENGLISH);
    if (paramString2 != null) {}
    for (schemeName = paramString2.toLowerCase(Locale.ENGLISH);; schemeName = "http")
    {
      port = paramInt;
      address = null;
      return;
    }
  }
  
  public HttpHost(InetAddress paramInetAddress)
  {
    this(paramInetAddress, -1, null);
  }
  
  public HttpHost(InetAddress paramInetAddress, int paramInt)
  {
    this(paramInetAddress, paramInt, null);
  }
  
  public HttpHost(InetAddress paramInetAddress, int paramInt, String paramString)
  {
    address = ((InetAddress)Args.notNull(paramInetAddress, "Inet address"));
    hostname = paramInetAddress.getHostAddress();
    lcHostname = hostname.toLowerCase(Locale.ENGLISH);
    if (paramString != null) {}
    for (schemeName = paramString.toLowerCase(Locale.ENGLISH);; schemeName = "http")
    {
      port = paramInt;
      return;
    }
  }
  
  public HttpHost(HttpHost paramHttpHost)
  {
    Args.notNull(paramHttpHost, "HTTP host");
    hostname = hostname;
    lcHostname = lcHostname;
    schemeName = schemeName;
    port = port;
    address = address;
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    return super.clone();
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof HttpHost)) {
        break;
      }
      paramObject = (HttpHost)paramObject;
    } while ((lcHostname.equals(lcHostname)) && (port == port) && (schemeName.equals(schemeName)));
    return false;
    return false;
  }
  
  public InetAddress getAddress()
  {
    return address;
  }
  
  public String getHostName()
  {
    return hostname;
  }
  
  public int getPort()
  {
    return port;
  }
  
  public String getSchemeName()
  {
    return schemeName;
  }
  
  public int hashCode()
  {
    return LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(17, lcHostname), port), schemeName);
  }
  
  public String toHostString()
  {
    if (port != -1)
    {
      StringBuilder localStringBuilder = new StringBuilder(hostname.length() + 6);
      localStringBuilder.append(hostname);
      localStringBuilder.append(":");
      localStringBuilder.append(Integer.toString(port));
      return localStringBuilder.toString();
    }
    return hostname;
  }
  
  public String toString()
  {
    return toURI();
  }
  
  public String toURI()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(schemeName);
    localStringBuilder.append("://");
    localStringBuilder.append(hostname);
    if (port != -1)
    {
      localStringBuilder.append(':');
      localStringBuilder.append(Integer.toString(port));
    }
    return localStringBuilder.toString();
  }
}
