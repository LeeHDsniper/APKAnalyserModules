package org.apache.http.impl.client;

import java.util.LinkedList;
import java.util.Locale;
import java.util.Map;
import java.util.Queue;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthOption;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.client.AuthCache;
import org.apache.http.client.AuthenticationHandler;
import org.apache.http.client.AuthenticationStrategy;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Deprecated
@Immutable
class AuthenticationStrategyAdaptor
  implements AuthenticationStrategy
{
  private final AuthenticationHandler handler;
  private final Log log = LogFactory.getLog(getClass());
  
  public AuthenticationStrategyAdaptor(AuthenticationHandler paramAuthenticationHandler)
  {
    handler = paramAuthenticationHandler;
  }
  
  private boolean isCachable(AuthScheme paramAuthScheme)
  {
    if ((paramAuthScheme == null) || (!paramAuthScheme.isComplete())) {}
    do
    {
      return false;
      paramAuthScheme = paramAuthScheme.getSchemeName();
    } while ((!paramAuthScheme.equalsIgnoreCase("Basic")) && (!paramAuthScheme.equalsIgnoreCase("Digest")));
    return true;
  }
  
  public void authFailed(HttpHost paramHttpHost, AuthScheme paramAuthScheme, HttpContext paramHttpContext)
  {
    paramHttpContext = (AuthCache)paramHttpContext.getAttribute("http.auth.auth-cache");
    if (paramHttpContext == null) {
      return;
    }
    if (log.isDebugEnabled()) {
      log.debug("Removing from cache '" + paramAuthScheme.getSchemeName() + "' auth scheme for " + paramHttpHost);
    }
    paramHttpContext.remove(paramHttpHost);
  }
  
  public void authSucceeded(HttpHost paramHttpHost, AuthScheme paramAuthScheme, HttpContext paramHttpContext)
  {
    AuthCache localAuthCache = (AuthCache)paramHttpContext.getAttribute("http.auth.auth-cache");
    if (isCachable(paramAuthScheme))
    {
      Object localObject = localAuthCache;
      if (localAuthCache == null)
      {
        localObject = new BasicAuthCache();
        paramHttpContext.setAttribute("http.auth.auth-cache", localObject);
      }
      if (log.isDebugEnabled()) {
        log.debug("Caching '" + paramAuthScheme.getSchemeName() + "' auth scheme for " + paramHttpHost);
      }
      ((AuthCache)localObject).put(paramHttpHost, paramAuthScheme);
    }
  }
  
  public Map<String, Header> getChallenges(HttpHost paramHttpHost, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws MalformedChallengeException
  {
    return handler.getChallenges(paramHttpResponse, paramHttpContext);
  }
  
  public AuthenticationHandler getHandler()
  {
    return handler;
  }
  
  public boolean isAuthenticationRequested(HttpHost paramHttpHost, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
  {
    return handler.isAuthenticationRequested(paramHttpResponse, paramHttpContext);
  }
  
  public Queue<AuthOption> select(Map<String, Header> paramMap, HttpHost paramHttpHost, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws MalformedChallengeException
  {
    Args.notNull(paramMap, "Map of auth challenges");
    Args.notNull(paramHttpHost, "Host");
    Args.notNull(paramHttpResponse, "HTTP response");
    Args.notNull(paramHttpContext, "HTTP context");
    LinkedList localLinkedList = new LinkedList();
    CredentialsProvider localCredentialsProvider = (CredentialsProvider)paramHttpContext.getAttribute("http.auth.credentials-provider");
    if (localCredentialsProvider == null) {
      log.debug("Credentials provider not set in the context");
    }
    do
    {
      for (;;)
      {
        return localLinkedList;
        try
        {
          paramHttpResponse = handler.selectScheme(paramMap, paramHttpResponse, paramHttpContext);
          paramHttpResponse.processChallenge((Header)paramMap.get(paramHttpResponse.getSchemeName().toLowerCase(Locale.US)));
          paramMap = localCredentialsProvider.getCredentials(new AuthScope(paramHttpHost.getHostName(), paramHttpHost.getPort(), paramHttpResponse.getRealm(), paramHttpResponse.getSchemeName()));
          if (paramMap != null)
          {
            localLinkedList.add(new AuthOption(paramHttpResponse, paramMap));
            return localLinkedList;
          }
        }
        catch (AuthenticationException paramMap) {}
      }
    } while (!log.isWarnEnabled());
    log.warn(paramMap.getMessage(), paramMap);
    return localLinkedList;
  }
}
