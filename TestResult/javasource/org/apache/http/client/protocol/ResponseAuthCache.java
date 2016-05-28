package org.apache.http.client.protocol;

import java.io.IOException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthState;
import org.apache.http.client.AuthCache;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Deprecated
@Immutable
public class ResponseAuthCache
  implements HttpResponseInterceptor
{
  private final Log log = LogFactory.getLog(getClass());
  
  public ResponseAuthCache() {}
  
  private void cache(AuthCache paramAuthCache, HttpHost paramHttpHost, AuthScheme paramAuthScheme)
  {
    if (log.isDebugEnabled()) {
      log.debug("Caching '" + paramAuthScheme.getSchemeName() + "' auth scheme for " + paramHttpHost);
    }
    paramAuthCache.put(paramHttpHost, paramAuthScheme);
  }
  
  private boolean isCachable(AuthState paramAuthState)
  {
    paramAuthState = paramAuthState.getAuthScheme();
    if ((paramAuthState == null) || (!paramAuthState.isComplete())) {}
    do
    {
      return false;
      paramAuthState = paramAuthState.getSchemeName();
    } while ((!paramAuthState.equalsIgnoreCase("Basic")) && (!paramAuthState.equalsIgnoreCase("Digest")));
    return true;
  }
  
  private void uncache(AuthCache paramAuthCache, HttpHost paramHttpHost, AuthScheme paramAuthScheme)
  {
    if (log.isDebugEnabled()) {
      log.debug("Removing from cache '" + paramAuthScheme.getSchemeName() + "' auth scheme for " + paramHttpHost);
    }
    paramAuthCache.remove(paramHttpHost);
  }
  
  public void process(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpResponse, "HTTP request");
    Args.notNull(paramHttpContext, "HTTP context");
    Object localObject1 = (AuthCache)paramHttpContext.getAttribute("http.auth.auth-cache");
    Object localObject3 = (HttpHost)paramHttpContext.getAttribute("http.target_host");
    AuthState localAuthState = (AuthState)paramHttpContext.getAttribute("http.auth.target-scope");
    paramHttpResponse = (HttpResponse)localObject1;
    Object localObject2;
    if (localObject3 != null)
    {
      paramHttpResponse = (HttpResponse)localObject1;
      if (localAuthState != null)
      {
        if (log.isDebugEnabled()) {
          log.debug("Target auth state: " + localAuthState.getState());
        }
        paramHttpResponse = (HttpResponse)localObject1;
        if (isCachable(localAuthState))
        {
          paramHttpResponse = (SchemeRegistry)paramHttpContext.getAttribute("http.scheme-registry");
          localObject2 = localObject3;
          if (((HttpHost)localObject3).getPort() < 0)
          {
            paramHttpResponse = paramHttpResponse.getScheme((HttpHost)localObject3);
            localObject2 = new HttpHost(((HttpHost)localObject3).getHostName(), paramHttpResponse.resolvePort(((HttpHost)localObject3).getPort()), ((HttpHost)localObject3).getSchemeName());
          }
          paramHttpResponse = (HttpResponse)localObject1;
          if (localObject1 == null)
          {
            paramHttpResponse = new BasicAuthCache();
            paramHttpContext.setAttribute("http.auth.auth-cache", paramHttpResponse);
          }
          switch (1.$SwitchMap$org$apache$http$auth$AuthProtocolState[localAuthState.getState().ordinal()])
          {
          }
        }
      }
    }
    for (;;)
    {
      localObject2 = (HttpHost)paramHttpContext.getAttribute("http.proxy_host");
      localObject3 = (AuthState)paramHttpContext.getAttribute("http.auth.proxy-scope");
      if ((localObject2 != null) && (localObject3 != null))
      {
        if (log.isDebugEnabled()) {
          log.debug("Proxy auth state: " + ((AuthState)localObject3).getState());
        }
        if (isCachable((AuthState)localObject3))
        {
          localObject1 = paramHttpResponse;
          if (paramHttpResponse == null)
          {
            localObject1 = new BasicAuthCache();
            paramHttpContext.setAttribute("http.auth.auth-cache", localObject1);
          }
        }
      }
      switch (1.$SwitchMap$org$apache$http$auth$AuthProtocolState[localObject3.getState().ordinal()])
      {
      default: 
        return;
        cache(paramHttpResponse, (HttpHost)localObject2, localAuthState.getAuthScheme());
        continue;
        uncache(paramHttpResponse, (HttpHost)localObject2, localAuthState.getAuthScheme());
      }
    }
    cache((AuthCache)localObject1, (HttpHost)localObject2, ((AuthState)localObject3).getAuthScheme());
    return;
    uncache((AuthCache)localObject1, (HttpHost)localObject2, ((AuthState)localObject3).getAuthScheme());
  }
}
