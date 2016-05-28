package org.apache.http.config;

import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.annotation.ThreadSafe;

@ThreadSafe
public final class Registry<I>
  implements Lookup<I>
{
  private final Map<String, I> map;
  
  Registry(Map<String, I> paramMap)
  {
    map = new ConcurrentHashMap(paramMap);
  }
  
  public I lookup(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return map.get(paramString.toLowerCase(Locale.US));
  }
  
  public String toString()
  {
    return map.toString();
  }
}
