package org.apache.http.cookie;

import java.util.Locale;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;

@Immutable
public final class CookieOrigin
{
  private final String host;
  private final String path;
  private final int port;
  private final boolean secure;
  
  public CookieOrigin(String paramString1, int paramInt, String paramString2, boolean paramBoolean)
  {
    Args.notBlank(paramString1, "Host");
    Args.notNegative(paramInt, "Port");
    Args.notNull(paramString2, "Path");
    host = paramString1.toLowerCase(Locale.ENGLISH);
    port = paramInt;
    if (paramString2.trim().length() != 0) {}
    for (path = paramString2;; path = "/")
    {
      secure = paramBoolean;
      return;
    }
  }
  
  public String getHost()
  {
    return host;
  }
  
  public String getPath()
  {
    return path;
  }
  
  public int getPort()
  {
    return port;
  }
  
  public boolean isSecure()
  {
    return secure;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append('[');
    if (secure) {
      localStringBuilder.append("(secure)");
    }
    localStringBuilder.append(host);
    localStringBuilder.append(':');
    localStringBuilder.append(Integer.toString(port));
    localStringBuilder.append(path);
    localStringBuilder.append(']');
    return localStringBuilder.toString();
  }
}
