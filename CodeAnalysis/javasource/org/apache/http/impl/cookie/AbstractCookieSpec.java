package org.apache.http.impl.cookie;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.cookie.CookieAttributeHandler;
import org.apache.http.cookie.CookieSpec;
import org.apache.http.util.Args;

@NotThreadSafe
public abstract class AbstractCookieSpec
  implements CookieSpec
{
  private final Map<String, CookieAttributeHandler> attribHandlerMap = new HashMap(10);
  
  public AbstractCookieSpec() {}
  
  protected CookieAttributeHandler findAttribHandler(String paramString)
  {
    return (CookieAttributeHandler)attribHandlerMap.get(paramString);
  }
  
  protected CookieAttributeHandler getAttribHandler(String paramString)
  {
    CookieAttributeHandler localCookieAttributeHandler = findAttribHandler(paramString);
    if (localCookieAttributeHandler == null) {
      throw new IllegalStateException("Handler not registered for " + paramString + " attribute.");
    }
    return localCookieAttributeHandler;
  }
  
  protected Collection<CookieAttributeHandler> getAttribHandlers()
  {
    return attribHandlerMap.values();
  }
  
  public void registerAttribHandler(String paramString, CookieAttributeHandler paramCookieAttributeHandler)
  {
    Args.notNull(paramString, "Attribute name");
    Args.notNull(paramCookieAttributeHandler, "Attribute handler");
    attribHandlerMap.put(paramString, paramCookieAttributeHandler);
  }
}
