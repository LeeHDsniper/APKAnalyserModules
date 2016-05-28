package org.apache.http.protocol;

import java.io.IOException;
import java.net.InetAddress;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpInetConnection;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolException;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;

@Immutable
public class RequestTargetHost
  implements HttpRequestInterceptor
{
  public RequestTargetHost() {}
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    paramHttpContext = HttpCoreContext.adapt(paramHttpContext);
    ProtocolVersion localProtocolVersion = paramHttpRequest.getRequestLine().getProtocolVersion();
    if ((paramHttpRequest.getRequestLine().getMethod().equalsIgnoreCase("CONNECT")) && (localProtocolVersion.lessEquals(HttpVersion.HTTP_1_0))) {}
    Object localObject;
    do
    {
      do
      {
        return;
      } while (paramHttpRequest.containsHeader("Host"));
      HttpHost localHttpHost = paramHttpContext.getTargetHost();
      localObject = localHttpHost;
      if (localHttpHost != null) {
        break;
      }
      localObject = paramHttpContext.getConnection();
      paramHttpContext = localHttpHost;
      if ((localObject instanceof HttpInetConnection))
      {
        InetAddress localInetAddress = ((HttpInetConnection)localObject).getRemoteAddress();
        int i = ((HttpInetConnection)localObject).getRemotePort();
        paramHttpContext = localHttpHost;
        if (localInetAddress != null) {
          paramHttpContext = new HttpHost(localInetAddress.getHostName(), i);
        }
      }
      localObject = paramHttpContext;
      if (paramHttpContext != null) {
        break;
      }
    } while (localProtocolVersion.lessEquals(HttpVersion.HTTP_1_0));
    throw new ProtocolException("Target host missing");
    paramHttpRequest.addHeader("Host", ((HttpHost)localObject).toHostString());
  }
}
