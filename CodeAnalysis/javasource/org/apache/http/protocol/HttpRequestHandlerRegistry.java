package org.apache.http.protocol;

import java.util.Map;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.util.Args;

@Deprecated
@ThreadSafe
public class HttpRequestHandlerRegistry
  implements HttpRequestHandlerResolver
{
  private final UriPatternMatcher<HttpRequestHandler> matcher = new UriPatternMatcher();
  
  public HttpRequestHandlerRegistry() {}
  
  public Map<String, HttpRequestHandler> getHandlers()
  {
    return matcher.getObjects();
  }
  
  public HttpRequestHandler lookup(String paramString)
  {
    return (HttpRequestHandler)matcher.lookup(paramString);
  }
  
  public void register(String paramString, HttpRequestHandler paramHttpRequestHandler)
  {
    Args.notNull(paramString, "URI request pattern");
    Args.notNull(paramHttpRequestHandler, "Request handler");
    matcher.register(paramString, paramHttpRequestHandler);
  }
  
  public void setHandlers(Map<String, HttpRequestHandler> paramMap)
  {
    matcher.setObjects(paramMap);
  }
  
  public void unregister(String paramString)
  {
    matcher.unregister(paramString);
  }
}
