package org.apache.http.impl;

import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.Header;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.ParseException;
import org.apache.http.ProtocolVersion;
import org.apache.http.StatusLine;
import org.apache.http.TokenIterator;
import org.apache.http.annotation.Immutable;
import org.apache.http.message.BasicTokenIterator;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
public class DefaultConnectionReuseStrategy
  implements ConnectionReuseStrategy
{
  public static final DefaultConnectionReuseStrategy INSTANCE = new DefaultConnectionReuseStrategy();
  
  public DefaultConnectionReuseStrategy() {}
  
  private boolean canResponseHaveBody(HttpResponse paramHttpResponse)
  {
    int i = paramHttpResponse.getStatusLine().getStatusCode();
    return (i >= 200) && (i != 204) && (i != 304) && (i != 205);
  }
  
  protected TokenIterator createTokenIterator(HeaderIterator paramHeaderIterator)
  {
    return new BasicTokenIterator(paramHeaderIterator);
  }
  
  public boolean keepAlive(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    Args.notNull(paramHttpContext, "HTTP context");
    ProtocolVersion localProtocolVersion = paramHttpResponse.getStatusLine().getProtocolVersion();
    paramHttpContext = paramHttpResponse.getFirstHeader("Transfer-Encoding");
    int i;
    if (paramHttpContext != null)
    {
      if (!"chunked".equalsIgnoreCase(paramHttpContext.getValue())) {
        return false;
      }
    }
    else if (canResponseHaveBody(paramHttpResponse))
    {
      paramHttpContext = paramHttpResponse.getHeaders("Content-Length");
      if (paramHttpContext.length == 1)
      {
        paramHttpContext = paramHttpContext[0];
        try
        {
          i = Integer.parseInt(paramHttpContext.getValue());
          if (i >= 0) {
            break label104;
          }
          return false;
        }
        catch (NumberFormatException paramHttpResponse)
        {
          return false;
        }
      }
      else
      {
        return false;
      }
    }
    label104:
    HeaderIterator localHeaderIterator = paramHttpResponse.headerIterator("Connection");
    paramHttpContext = localHeaderIterator;
    if (!localHeaderIterator.hasNext()) {
      paramHttpContext = paramHttpResponse.headerIterator("Proxy-Connection");
    }
    if (paramHttpContext.hasNext()) {
      try
      {
        paramHttpResponse = createTokenIterator(paramHttpContext);
        i = 0;
        while (paramHttpResponse.hasNext())
        {
          paramHttpContext = paramHttpResponse.nextToken();
          if ("Close".equalsIgnoreCase(paramHttpContext)) {
            return false;
          }
          boolean bool = "Keep-Alive".equalsIgnoreCase(paramHttpContext);
          if (bool) {
            i = 1;
          }
        }
        if (i != 0) {
          return true;
        }
      }
      catch (ParseException paramHttpResponse)
      {
        return false;
      }
    }
    return !localProtocolVersion.lessEquals(HttpVersion.HTTP_1_0);
  }
}
