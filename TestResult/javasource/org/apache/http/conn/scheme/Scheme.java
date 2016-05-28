package org.apache.http.conn.scheme;

import java.util.Locale;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Deprecated
@Immutable
public final class Scheme
{
  private final int defaultPort;
  private final boolean layered;
  private final String name;
  private final SchemeSocketFactory socketFactory;
  private String stringRep;
  
  public Scheme(String paramString, int paramInt, SchemeSocketFactory paramSchemeSocketFactory)
  {
    Args.notNull(paramString, "Scheme name");
    if ((paramInt > 0) && (paramInt <= 65535)) {}
    for (boolean bool = true;; bool = false)
    {
      Args.check(bool, "Port is invalid");
      Args.notNull(paramSchemeSocketFactory, "Socket factory");
      name = paramString.toLowerCase(Locale.ENGLISH);
      defaultPort = paramInt;
      if (!(paramSchemeSocketFactory instanceof SchemeLayeredSocketFactory)) {
        break;
      }
      layered = true;
      socketFactory = paramSchemeSocketFactory;
      return;
    }
    if ((paramSchemeSocketFactory instanceof LayeredSchemeSocketFactory))
    {
      layered = true;
      socketFactory = new SchemeLayeredSocketFactoryAdaptor2((LayeredSchemeSocketFactory)paramSchemeSocketFactory);
      return;
    }
    layered = false;
    socketFactory = paramSchemeSocketFactory;
  }
  
  @Deprecated
  public Scheme(String paramString, SocketFactory paramSocketFactory, int paramInt)
  {
    Args.notNull(paramString, "Scheme name");
    Args.notNull(paramSocketFactory, "Socket factory");
    boolean bool;
    if ((paramInt > 0) && (paramInt <= 65535))
    {
      bool = true;
      Args.check(bool, "Port is invalid");
      name = paramString.toLowerCase(Locale.ENGLISH);
      if (!(paramSocketFactory instanceof LayeredSocketFactory)) {
        break label88;
      }
      socketFactory = new SchemeLayeredSocketFactoryAdaptor((LayeredSocketFactory)paramSocketFactory);
    }
    for (layered = true;; layered = false)
    {
      defaultPort = paramInt;
      return;
      bool = false;
      break;
      label88:
      socketFactory = new SchemeSocketFactoryAdaptor(paramSocketFactory);
    }
  }
  
  public final boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (!(paramObject instanceof Scheme)) {
        break;
      }
      paramObject = (Scheme)paramObject;
    } while ((name.equals(name)) && (defaultPort == defaultPort) && (layered == layered));
    return false;
    return false;
  }
  
  public final int getDefaultPort()
  {
    return defaultPort;
  }
  
  public final String getName()
  {
    return name;
  }
  
  public final SchemeSocketFactory getSchemeSocketFactory()
  {
    return socketFactory;
  }
  
  @Deprecated
  public final SocketFactory getSocketFactory()
  {
    if ((socketFactory instanceof SchemeSocketFactoryAdaptor)) {
      return ((SchemeSocketFactoryAdaptor)socketFactory).getFactory();
    }
    if (layered) {
      return new LayeredSocketFactoryAdaptor((LayeredSchemeSocketFactory)socketFactory);
    }
    return new SocketFactoryAdaptor(socketFactory);
  }
  
  public int hashCode()
  {
    return LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(17, defaultPort), name), layered);
  }
  
  public final boolean isLayered()
  {
    return layered;
  }
  
  public final int resolvePort(int paramInt)
  {
    int i = paramInt;
    if (paramInt <= 0) {
      i = defaultPort;
    }
    return i;
  }
  
  public final String toString()
  {
    if (stringRep == null)
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append(name);
      localStringBuilder.append(':');
      localStringBuilder.append(Integer.toString(defaultPort));
      stringRep = localStringBuilder.toString();
    }
    return stringRep;
  }
}
