package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.annotation.Immutable;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@Immutable
public class RequestUserAgent
  implements HttpRequestInterceptor
{
  private final String userAgent;
  
  public RequestUserAgent()
  {
    this(null);
  }
  
  public RequestUserAgent(String paramString)
  {
    userAgent = paramString;
  }
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    if (!paramHttpRequest.containsHeader("User-Agent"))
    {
      paramHttpContext = null;
      Object localObject = paramHttpRequest.getParams();
      if (localObject != null) {
        paramHttpContext = (String)((HttpParams)localObject).getParameter("http.useragent");
      }
      localObject = paramHttpContext;
      if (paramHttpContext == null) {
        localObject = userAgent;
      }
      if (localObject != null) {
        paramHttpRequest.addHeader("User-Agent", (String)localObject);
      }
    }
  }
}
