package org.apache.http.protocol;

import org.apache.http.util.Args;

@Deprecated
public final class DefaultedHttpContext
  implements HttpContext
{
  private final HttpContext defaults;
  private final HttpContext local;
  
  public DefaultedHttpContext(HttpContext paramHttpContext1, HttpContext paramHttpContext2)
  {
    local = ((HttpContext)Args.notNull(paramHttpContext1, "HTTP context"));
    defaults = paramHttpContext2;
  }
  
  public Object getAttribute(String paramString)
  {
    Object localObject2 = local.getAttribute(paramString);
    Object localObject1 = localObject2;
    if (localObject2 == null) {
      localObject1 = defaults.getAttribute(paramString);
    }
    return localObject1;
  }
  
  public HttpContext getDefaults()
  {
    return defaults;
  }
  
  public Object removeAttribute(String paramString)
  {
    return local.removeAttribute(paramString);
  }
  
  public void setAttribute(String paramString, Object paramObject)
  {
    local.setAttribute(paramString, paramObject);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[local: ").append(local);
    localStringBuilder.append("defaults: ").append(defaults);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}
