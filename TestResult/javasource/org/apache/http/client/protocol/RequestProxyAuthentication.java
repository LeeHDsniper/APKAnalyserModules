package org.apache.http.client.protocol;

import java.io.IOException;
import org.apache.commons.logging.Log;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthState;
import org.apache.http.conn.HttpRoutedConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Deprecated
@Immutable
public class RequestProxyAuthentication
  extends RequestAuthenticationBase
{
  public RequestProxyAuthentication() {}
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    Args.notNull(paramHttpContext, "HTTP context");
    if (paramHttpRequest.containsHeader("Proxy-Authorization")) {}
    do
    {
      return;
      localObject = (HttpRoutedConnection)paramHttpContext.getAttribute("http.connection");
      if (localObject == null)
      {
        log.debug("HTTP connection not set in the context");
        return;
      }
    } while (((HttpRoutedConnection)localObject).getRoute().isTunnelled());
    Object localObject = (AuthState)paramHttpContext.getAttribute("http.auth.proxy-scope");
    if (localObject == null)
    {
      log.debug("Proxy auth state not set in the context");
      return;
    }
    if (log.isDebugEnabled()) {
      log.debug("Proxy auth state: " + ((AuthState)localObject).getState());
    }
    process((AuthState)localObject, paramHttpRequest, paramHttpContext);
  }
}
