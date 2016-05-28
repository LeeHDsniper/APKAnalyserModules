package org.apache.http.client.protocol;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.RequestLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
public class RequestDefaultHeaders
  implements HttpRequestInterceptor
{
  private final Collection<? extends Header> defaultHeaders;
  
  public RequestDefaultHeaders()
  {
    this(null);
  }
  
  public RequestDefaultHeaders(Collection<? extends Header> paramCollection)
  {
    defaultHeaders = paramCollection;
  }
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    if (paramHttpRequest.getRequestLine().getMethod().equalsIgnoreCase("CONNECT")) {}
    for (;;)
    {
      return;
      Collection localCollection = (Collection)paramHttpRequest.getParams().getParameter("http.default-headers");
      paramHttpContext = localCollection;
      if (localCollection == null) {
        paramHttpContext = defaultHeaders;
      }
      if (paramHttpContext != null)
      {
        paramHttpContext = paramHttpContext.iterator();
        while (paramHttpContext.hasNext()) {
          paramHttpRequest.addHeader((Header)paramHttpContext.next());
        }
      }
    }
  }
}
