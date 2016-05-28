package org.apache.http.auth;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.config.Lookup;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Deprecated
@ThreadSafe
public final class AuthSchemeRegistry
  implements Lookup<AuthSchemeProvider>
{
  private final ConcurrentHashMap<String, AuthSchemeFactory> registeredSchemes = new ConcurrentHashMap();
  
  public AuthSchemeRegistry() {}
  
  public AuthScheme getAuthScheme(String paramString, HttpParams paramHttpParams)
    throws IllegalStateException
  {
    Args.notNull(paramString, "Name");
    AuthSchemeFactory localAuthSchemeFactory = (AuthSchemeFactory)registeredSchemes.get(paramString.toLowerCase(Locale.ENGLISH));
    if (localAuthSchemeFactory != null) {
      return localAuthSchemeFactory.newInstance(paramHttpParams);
    }
    throw new IllegalStateException("Unsupported authentication scheme: " + paramString);
  }
  
  public List<String> getSchemeNames()
  {
    return new ArrayList(registeredSchemes.keySet());
  }
  
  public AuthSchemeProvider lookup(final String paramString)
  {
    new AuthSchemeProvider()
    {
      public AuthScheme create(HttpContext paramAnonymousHttpContext)
      {
        paramAnonymousHttpContext = (HttpRequest)paramAnonymousHttpContext.getAttribute("http.request");
        return getAuthScheme(paramString, paramAnonymousHttpContext.getParams());
      }
    };
  }
  
  public void register(String paramString, AuthSchemeFactory paramAuthSchemeFactory)
  {
    Args.notNull(paramString, "Name");
    Args.notNull(paramAuthSchemeFactory, "Authentication scheme factory");
    registeredSchemes.put(paramString.toLowerCase(Locale.ENGLISH), paramAuthSchemeFactory);
  }
  
  public void setItems(Map<String, AuthSchemeFactory> paramMap)
  {
    if (paramMap == null) {
      return;
    }
    registeredSchemes.clear();
    registeredSchemes.putAll(paramMap);
  }
  
  public void unregister(String paramString)
  {
    Args.notNull(paramString, "Name");
    registeredSchemes.remove(paramString.toLowerCase(Locale.ENGLISH));
  }
}
