package org.apache.http.client.protocol;

import java.io.IOException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthProtocolState;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.AuthState;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.conn.routing.RouteInfo;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
public class RequestAuthCache
  implements HttpRequestInterceptor
{
  private final Log log = LogFactory.getLog(getClass());
  
  public RequestAuthCache() {}
  
  private void doPreemptiveAuth(HttpHost paramHttpHost, AuthScheme paramAuthScheme, AuthState paramAuthState, CredentialsProvider paramCredentialsProvider)
  {
    String str = paramAuthScheme.getSchemeName();
    if (log.isDebugEnabled()) {
      log.debug("Re-using cached '" + str + "' auth scheme for " + paramHttpHost);
    }
    paramHttpHost = paramCredentialsProvider.getCredentials(new AuthScope(paramHttpHost, AuthScope.ANY_REALM, str));
    if (paramHttpHost != null)
    {
      if ("BASIC".equalsIgnoreCase(paramAuthScheme.getSchemeName())) {
        paramAuthState.setState(AuthProtocolState.CHALLENGED);
      }
      for (;;)
      {
        paramAuthState.update(paramAuthScheme, paramHttpHost);
        return;
        paramAuthState.setState(AuthProtocolState.SUCCESS);
      }
    }
    log.debug("No credentials for preemptive authentication");
  }
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    Args.notNull(paramHttpContext, "HTTP context");
    HttpClientContext localHttpClientContext = HttpClientContext.adapt(paramHttpContext);
    Object localObject = localHttpClientContext.getAuthCache();
    if (localObject == null) {
      log.debug("Auth cache not set in the context");
    }
    CredentialsProvider localCredentialsProvider;
    do
    {
      do
      {
        return;
        localCredentialsProvider = localHttpClientContext.getCredentialsProvider();
        if (localCredentialsProvider == null)
        {
          log.debug("Credentials provider not set in the context");
          return;
        }
        RouteInfo localRouteInfo = localHttpClientContext.getHttpRoute();
        paramHttpContext = localHttpClientContext.getTargetHost();
        paramHttpRequest = paramHttpContext;
        if (paramHttpContext.getPort() < 0) {
          paramHttpRequest = new HttpHost(paramHttpContext.getHostName(), localRouteInfo.getTargetHost().getPort(), paramHttpContext.getSchemeName());
        }
        paramHttpContext = localHttpClientContext.getTargetAuthState();
        if ((paramHttpContext != null) && (paramHttpContext.getState() == AuthProtocolState.UNCHALLENGED))
        {
          AuthScheme localAuthScheme = ((AuthCache)localObject).get(paramHttpRequest);
          if (localAuthScheme != null) {
            doPreemptiveAuth(paramHttpRequest, localAuthScheme, paramHttpContext, localCredentialsProvider);
          }
        }
        paramHttpRequest = localRouteInfo.getProxyHost();
        paramHttpContext = localHttpClientContext.getProxyAuthState();
      } while ((paramHttpRequest == null) || (paramHttpContext == null) || (paramHttpContext.getState() != AuthProtocolState.UNCHALLENGED));
      localObject = ((AuthCache)localObject).get(paramHttpRequest);
    } while (localObject == null);
    doPreemptiveAuth(paramHttpRequest, (AuthScheme)localObject, paramHttpContext, localCredentialsProvider);
  }
}
