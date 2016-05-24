package org.apache.http.protocol;

import java.util.HashMap;
import java.util.Map;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class BasicHttpContext
  implements HttpContext
{
  private Map<String, Object> map = null;
  private final HttpContext parentContext;
  
  public BasicHttpContext()
  {
    this(null);
  }
  
  public BasicHttpContext(HttpContext paramHttpContext)
  {
    parentContext = paramHttpContext;
  }
  
  public void clear()
  {
    if (map != null) {
      map.clear();
    }
  }
  
  public Object getAttribute(String paramString)
  {
    Args.notNull(paramString, "Id");
    Object localObject1 = null;
    if (map != null) {
      localObject1 = map.get(paramString);
    }
    Object localObject2 = localObject1;
    if (localObject1 == null)
    {
      localObject2 = localObject1;
      if (parentContext != null) {
        localObject2 = parentContext.getAttribute(paramString);
      }
    }
    return localObject2;
  }
  
  public Object removeAttribute(String paramString)
  {
    Args.notNull(paramString, "Id");
    if (map != null) {
      return map.remove(paramString);
    }
    return null;
  }
  
  public void setAttribute(String paramString, Object paramObject)
  {
    Args.notNull(paramString, "Id");
    if (map == null) {
      map = new HashMap();
    }
    map.put(paramString, paramObject);
  }
  
  public String toString()
  {
    if (map != null) {
      return map.toString();
    }
    return "{}";
  }
}
