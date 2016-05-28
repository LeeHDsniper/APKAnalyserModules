package org.apache.http.protocol;

import org.apache.http.HttpRequest;
import org.apache.http.RequestLine;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.util.Args;

@ThreadSafe
public class UriHttpRequestHandlerMapper
  implements HttpRequestHandlerMapper
{
  private final UriPatternMatcher<HttpRequestHandler> matcher;
  
  public UriHttpRequestHandlerMapper()
  {
    this(new UriPatternMatcher());
  }
  
  protected UriHttpRequestHandlerMapper(UriPatternMatcher<HttpRequestHandler> paramUriPatternMatcher)
  {
    matcher = ((UriPatternMatcher)Args.notNull(paramUriPatternMatcher, "Pattern matcher"));
  }
  
  protected String getRequestPath(HttpRequest paramHttpRequest)
  {
    String str = paramHttpRequest.getRequestLine().getUri();
    int i = str.indexOf("?");
    if (i != -1) {
      paramHttpRequest = str.substring(0, i);
    }
    do
    {
      return paramHttpRequest;
      i = str.indexOf("#");
      paramHttpRequest = str;
    } while (i == -1);
    return str.substring(0, i);
  }
  
  public HttpRequestHandler lookup(HttpRequest paramHttpRequest)
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    return (HttpRequestHandler)matcher.lookup(getRequestPath(paramHttpRequest));
  }
  
  public void register(String paramString, HttpRequestHandler paramHttpRequestHandler)
  {
    Args.notNull(paramString, "Pattern");
    Args.notNull(paramHttpRequestHandler, "Handler");
    matcher.register(paramString, paramHttpRequestHandler);
  }
  
  public void unregister(String paramString)
  {
    matcher.unregister(paramString);
  }
}
