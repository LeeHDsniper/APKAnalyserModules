package org.apache.http.impl.client;

import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.Credentials;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.util.Args;

@ThreadSafe
public class SystemDefaultCredentialsProvider
  implements CredentialsProvider
{
  private static final Map<String, String> SCHEME_MAP = new ConcurrentHashMap();
  private final BasicCredentialsProvider internal = new BasicCredentialsProvider();
  
  static
  {
    SCHEME_MAP.put("Basic".toUpperCase(Locale.ENGLISH), "Basic");
    SCHEME_MAP.put("Digest".toUpperCase(Locale.ENGLISH), "Digest");
    SCHEME_MAP.put("NTLM".toUpperCase(Locale.ENGLISH), "NTLM");
    SCHEME_MAP.put("negotiate".toUpperCase(Locale.ENGLISH), "SPNEGO");
    SCHEME_MAP.put("Kerberos".toUpperCase(Locale.ENGLISH), "Kerberos");
  }
  
  public SystemDefaultCredentialsProvider() {}
  
  private static String translateScheme(String paramString)
  {
    Object localObject;
    if (paramString == null) {
      localObject = null;
    }
    String str;
    do
    {
      return localObject;
      str = (String)SCHEME_MAP.get(paramString);
      localObject = str;
    } while (str != null);
    return paramString;
  }
  
  public void clear()
  {
    internal.clear();
  }
  
  public Credentials getCredentials(AuthScope paramAuthScope)
  {
    Args.notNull(paramAuthScope, "Auth scope");
    Credentials localCredentials = internal.getCredentials(paramAuthScope);
    if (localCredentials != null) {
      return localCredentials;
    }
    if (paramAuthScope.getHost() != null)
    {
      paramAuthScope = Authenticator.requestPasswordAuthentication(paramAuthScope.getHost(), null, paramAuthScope.getPort(), "http", null, translateScheme(paramAuthScope.getScheme()));
      if (paramAuthScope != null) {
        return new UsernamePasswordCredentials(paramAuthScope.getUserName(), new String(paramAuthScope.getPassword()));
      }
    }
    return null;
  }
  
  public void setCredentials(AuthScope paramAuthScope, Credentials paramCredentials)
  {
    internal.setCredentials(paramAuthScope, paramCredentials);
  }
}
