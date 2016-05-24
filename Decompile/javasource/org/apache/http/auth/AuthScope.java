package org.apache.http.auth;

import java.util.Locale;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Immutable
public class AuthScope
{
  public static final AuthScope ANY = new AuthScope(ANY_HOST, -1, ANY_REALM, ANY_SCHEME);
  public static final String ANY_HOST = null;
  public static final int ANY_PORT = -1;
  public static final String ANY_REALM = null;
  public static final String ANY_SCHEME = null;
  private final String host;
  private final int port;
  private final String realm;
  private final String scheme;
  
  public AuthScope(String paramString, int paramInt)
  {
    this(paramString, paramInt, ANY_REALM, ANY_SCHEME);
  }
  
  public AuthScope(String paramString1, int paramInt, String paramString2)
  {
    this(paramString1, paramInt, paramString2, ANY_SCHEME);
  }
  
  public AuthScope(String paramString1, int paramInt, String paramString2, String paramString3)
  {
    if (paramString1 == null)
    {
      paramString1 = ANY_HOST;
      host = paramString1;
      int i = paramInt;
      if (paramInt < 0) {
        i = -1;
      }
      port = i;
      paramString1 = paramString2;
      if (paramString2 == null) {
        paramString1 = ANY_REALM;
      }
      realm = paramString1;
      if (paramString3 != null) {
        break label74;
      }
    }
    label74:
    for (paramString1 = ANY_SCHEME;; paramString1 = paramString3.toUpperCase(Locale.ENGLISH))
    {
      scheme = paramString1;
      return;
      paramString1 = paramString1.toLowerCase(Locale.ENGLISH);
      break;
    }
  }
  
  public AuthScope(HttpHost paramHttpHost)
  {
    this(paramHttpHost, ANY_REALM, ANY_SCHEME);
  }
  
  public AuthScope(HttpHost paramHttpHost, String paramString1, String paramString2)
  {
    this(paramHttpHost.getHostName(), paramHttpHost.getPort(), paramString1, paramString2);
  }
  
  public AuthScope(AuthScope paramAuthScope)
  {
    Args.notNull(paramAuthScope, "Scope");
    host = paramAuthScope.getHost();
    port = paramAuthScope.getPort();
    realm = paramAuthScope.getRealm();
    scheme = paramAuthScope.getScheme();
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = true;
    boolean bool1;
    if (paramObject == null) {
      bool1 = false;
    }
    do
    {
      do
      {
        return bool1;
        bool1 = bool2;
      } while (paramObject == this);
      if (!(paramObject instanceof AuthScope)) {
        return super.equals(paramObject);
      }
      paramObject = (AuthScope)paramObject;
      if ((!LangUtils.equals(host, host)) || (port != port) || (!LangUtils.equals(realm, realm))) {
        break;
      }
      bool1 = bool2;
    } while (LangUtils.equals(scheme, scheme));
    return false;
  }
  
  public String getHost()
  {
    return host;
  }
  
  public int getPort()
  {
    return port;
  }
  
  public String getRealm()
  {
    return realm;
  }
  
  public String getScheme()
  {
    return scheme;
  }
  
  public int hashCode()
  {
    return LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(17, host), port), realm), scheme);
  }
  
  public int match(AuthScope paramAuthScope)
  {
    int j = 0;
    int i;
    if (LangUtils.equals(scheme, scheme))
    {
      i = 0 + 1;
      if (!LangUtils.equals(realm, realm)) {
        break label100;
      }
      j = i + 2;
      label38:
      if (port != port) {
        break label126;
      }
      i = j + 4;
      label53:
      if (!LangUtils.equals(host, host)) {
        break label148;
      }
      j = i + 8;
    }
    label100:
    label126:
    label148:
    do
    {
      do
      {
        return j;
        i = j;
        if (scheme == ANY_SCHEME) {
          break;
        }
        i = j;
        if (scheme == ANY_SCHEME) {
          break;
        }
        return -1;
        j = i;
        if (realm == ANY_REALM) {
          break label38;
        }
        j = i;
        if (realm == ANY_REALM) {
          break label38;
        }
        return -1;
        i = j;
        if (port == -1) {
          break label53;
        }
        i = j;
        if (port == -1) {
          break label53;
        }
        return -1;
        j = i;
      } while (host == ANY_HOST);
      j = i;
    } while (host == ANY_HOST);
    return -1;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (scheme != null)
    {
      localStringBuilder.append(scheme.toUpperCase(Locale.ENGLISH));
      localStringBuilder.append(' ');
    }
    if (realm != null)
    {
      localStringBuilder.append('\'');
      localStringBuilder.append(realm);
      localStringBuilder.append('\'');
    }
    for (;;)
    {
      if (host != null)
      {
        localStringBuilder.append('@');
        localStringBuilder.append(host);
        if (port >= 0)
        {
          localStringBuilder.append(':');
          localStringBuilder.append(port);
        }
      }
      return localStringBuilder.toString();
      localStringBuilder.append("<any realm>");
    }
  }
}
