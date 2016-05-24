package org.apache.http.conn.scheme;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.HttpHost;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.util.Args;

@Deprecated
@ThreadSafe
public final class SchemeRegistry
{
  private final ConcurrentHashMap<String, Scheme> registeredSchemes = new ConcurrentHashMap();
  
  public SchemeRegistry() {}
  
  public final Scheme get(String paramString)
  {
    Args.notNull(paramString, "Scheme name");
    return (Scheme)registeredSchemes.get(paramString);
  }
  
  public final Scheme getScheme(String paramString)
  {
    Scheme localScheme = get(paramString);
    if (localScheme == null) {
      throw new IllegalStateException("Scheme '" + paramString + "' not registered.");
    }
    return localScheme;
  }
  
  public final Scheme getScheme(HttpHost paramHttpHost)
  {
    Args.notNull(paramHttpHost, "Host");
    return getScheme(paramHttpHost.getSchemeName());
  }
  
  public final List<String> getSchemeNames()
  {
    return new ArrayList(registeredSchemes.keySet());
  }
  
  public final Scheme register(Scheme paramScheme)
  {
    Args.notNull(paramScheme, "Scheme");
    return (Scheme)registeredSchemes.put(paramScheme.getName(), paramScheme);
  }
  
  public void setItems(Map<String, Scheme> paramMap)
  {
    if (paramMap == null) {
      return;
    }
    registeredSchemes.clear();
    registeredSchemes.putAll(paramMap);
  }
  
  public final Scheme unregister(String paramString)
  {
    Args.notNull(paramString, "Scheme name");
    return (Scheme)registeredSchemes.remove(paramString);
  }
}
