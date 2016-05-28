package org.apache.http.protocol;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.util.Args;

@ThreadSafe
public class UriPatternMatcher<T>
{
  @GuardedBy("this")
  private final Map<String, T> map = new HashMap();
  
  public UriPatternMatcher() {}
  
  @Deprecated
  public Map<String, T> getObjects()
  {
    try
    {
      Map localMap = map;
      return localMap;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public T lookup(String paramString)
  {
    try
    {
      Args.notNull(paramString, "Request path");
      Object localObject1 = map.get(paramString);
      Object localObject3 = localObject1;
      if (localObject1 == null)
      {
        Object localObject2 = null;
        Iterator localIterator = map.keySet().iterator();
        for (;;)
        {
          localObject3 = localObject1;
          if (!localIterator.hasNext()) {
            break;
          }
          localObject3 = (String)localIterator.next();
          if ((matchUriRequestPattern((String)localObject3, paramString)) && ((localObject2 == null) || (localObject2.length() < ((String)localObject3).length()) || ((localObject2.length() == ((String)localObject3).length()) && (((String)localObject3).endsWith("*")))))
          {
            localObject1 = map.get(localObject3);
            localObject2 = localObject3;
          }
        }
      }
      return localObject3;
    }
    finally {}
  }
  
  protected boolean matchUriRequestPattern(String paramString1, String paramString2)
  {
    boolean bool2 = false;
    if (paramString1.equals("*")) {
      return true;
    }
    boolean bool1;
    if ((!paramString1.endsWith("*")) || (!paramString2.startsWith(paramString1.substring(0, paramString1.length() - 1))))
    {
      bool1 = bool2;
      if (paramString1.startsWith("*"))
      {
        bool1 = bool2;
        if (!paramString2.endsWith(paramString1.substring(1, paramString1.length()))) {}
      }
    }
    else
    {
      bool1 = true;
    }
    return bool1;
  }
  
  public void register(String paramString, T paramT)
  {
    try
    {
      Args.notNull(paramString, "URI request pattern");
      map.put(paramString, paramT);
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  @Deprecated
  public void setHandlers(Map<String, T> paramMap)
  {
    try
    {
      Args.notNull(paramMap, "Map of handlers");
      map.clear();
      map.putAll(paramMap);
      return;
    }
    finally
    {
      paramMap = finally;
      throw paramMap;
    }
  }
  
  @Deprecated
  public void setObjects(Map<String, T> paramMap)
  {
    try
    {
      Args.notNull(paramMap, "Map of handlers");
      map.clear();
      map.putAll(paramMap);
      return;
    }
    finally
    {
      paramMap = finally;
      throw paramMap;
    }
  }
  
  public String toString()
  {
    return map.toString();
  }
  
  public void unregister(String paramString)
  {
    if (paramString == null) {}
    for (;;)
    {
      return;
      try
      {
        map.remove(paramString);
      }
      finally {}
    }
  }
}
