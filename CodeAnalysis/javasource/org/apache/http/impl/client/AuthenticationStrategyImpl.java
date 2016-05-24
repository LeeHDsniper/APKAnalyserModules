package org.apache.http.impl.client;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Queue;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.FormattedHeader;
import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthOption;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthSchemeProvider;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.Credentials;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.client.AuthCache;
import org.apache.http.client.AuthenticationStrategy;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.config.Lookup;
import org.apache.http.protocol.HTTP;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Immutable
abstract class AuthenticationStrategyImpl
  implements AuthenticationStrategy
{
  private static final List<String> DEFAULT_SCHEME_PRIORITY = Collections.unmodifiableList(Arrays.asList(new String[] { "negotiate", "Kerberos", "NTLM", "Digest", "Basic" }));
  private final int challengeCode;
  private final String headerName;
  private final Log log = LogFactory.getLog(getClass());
  
  AuthenticationStrategyImpl(int paramInt, String paramString)
  {
    challengeCode = paramInt;
    headerName = paramString;
  }
  
  public void authFailed(HttpHost paramHttpHost, AuthScheme paramAuthScheme, HttpContext paramHttpContext)
  {
    Args.notNull(paramHttpHost, "Host");
    Args.notNull(paramHttpContext, "HTTP context");
    paramAuthScheme = HttpClientContext.adapt(paramHttpContext).getAuthCache();
    if (paramAuthScheme != null)
    {
      if (log.isDebugEnabled()) {
        log.debug("Clearing cached auth scheme for " + paramHttpHost);
      }
      paramAuthScheme.remove(paramHttpHost);
    }
  }
  
  public void authSucceeded(HttpHost paramHttpHost, AuthScheme paramAuthScheme, HttpContext paramHttpContext)
  {
    Args.notNull(paramHttpHost, "Host");
    Args.notNull(paramAuthScheme, "Auth scheme");
    Args.notNull(paramHttpContext, "HTTP context");
    HttpClientContext localHttpClientContext = HttpClientContext.adapt(paramHttpContext);
    if (isCachable(paramAuthScheme))
    {
      AuthCache localAuthCache = localHttpClientContext.getAuthCache();
      paramHttpContext = localAuthCache;
      if (localAuthCache == null)
      {
        paramHttpContext = new BasicAuthCache();
        localHttpClientContext.setAuthCache(paramHttpContext);
      }
      if (log.isDebugEnabled()) {
        log.debug("Caching '" + paramAuthScheme.getSchemeName() + "' auth scheme for " + paramHttpHost);
      }
      paramHttpContext.put(paramHttpHost, paramAuthScheme);
    }
  }
  
  public Map<String, Header> getChallenges(HttpHost paramHttpHost, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws MalformedChallengeException
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    paramHttpResponse = paramHttpResponse.getHeaders(headerName);
    paramHttpContext = new HashMap(paramHttpResponse.length);
    int m = paramHttpResponse.length;
    int k = 0;
    while (k < m)
    {
      Object localObject = paramHttpResponse[k];
      int i;
      if ((localObject instanceof FormattedHeader))
      {
        paramHttpHost = ((FormattedHeader)localObject).getBuffer();
        i = ((FormattedHeader)localObject).getValuePos();
      }
      while ((i < paramHttpHost.length()) && (HTTP.isWhitespace(paramHttpHost.charAt(i))))
      {
        i += 1;
        continue;
        String str = localObject.getValue();
        if (str == null) {
          throw new MalformedChallengeException("Header value is null");
        }
        paramHttpHost = new CharArrayBuffer(str.length());
        paramHttpHost.append(str);
        i = 0;
      }
      int j = i;
      while ((j < paramHttpHost.length()) && (!HTTP.isWhitespace(paramHttpHost.charAt(j)))) {
        j += 1;
      }
      paramHttpContext.put(paramHttpHost.substring(i, j).toLowerCase(Locale.US), localObject);
      k += 1;
    }
    return paramHttpContext;
  }
  
  abstract Collection<String> getPreferredAuthSchemes(RequestConfig paramRequestConfig);
  
  public boolean isAuthenticationRequested(HttpHost paramHttpHost, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    return paramHttpResponse.getStatusLine().getStatusCode() == challengeCode;
  }
  
  protected boolean isCachable(AuthScheme paramAuthScheme)
  {
    if ((paramAuthScheme == null) || (!paramAuthScheme.isComplete())) {}
    do
    {
      return false;
      paramAuthScheme = paramAuthScheme.getSchemeName();
    } while ((!paramAuthScheme.equalsIgnoreCase("Basic")) && (!paramAuthScheme.equalsIgnoreCase("Digest")));
    return true;
  }
  
  public Queue<AuthOption> select(Map<String, Header> paramMap, HttpHost paramHttpHost, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws MalformedChallengeException
  {
    Args.notNull(paramMap, "Map of auth challenges");
    Args.notNull(paramHttpHost, "Host");
    Args.notNull(paramHttpResponse, "HTTP response");
    Args.notNull(paramHttpContext, "HTTP context");
    paramHttpResponse = HttpClientContext.adapt(paramHttpContext);
    LinkedList localLinkedList = new LinkedList();
    Lookup localLookup = paramHttpResponse.getAuthSchemeRegistry();
    if (localLookup == null) {
      log.debug("Auth scheme registry not set in the context");
    }
    for (;;)
    {
      return localLinkedList;
      CredentialsProvider localCredentialsProvider = paramHttpResponse.getCredentialsProvider();
      if (localCredentialsProvider == null)
      {
        log.debug("Credentials provider not set in the context");
        return localLinkedList;
      }
      Object localObject1 = getPreferredAuthSchemes(paramHttpResponse.getRequestConfig());
      paramHttpResponse = (HttpResponse)localObject1;
      if (localObject1 == null) {
        paramHttpResponse = DEFAULT_SCHEME_PRIORITY;
      }
      if (log.isDebugEnabled()) {
        log.debug("Authentication schemes in the order of preference: " + paramHttpResponse);
      }
      paramHttpResponse = paramHttpResponse.iterator();
      while (paramHttpResponse.hasNext())
      {
        Object localObject2 = (String)paramHttpResponse.next();
        localObject1 = (Header)paramMap.get(((String)localObject2).toLowerCase(Locale.US));
        if (localObject1 != null)
        {
          AuthSchemeProvider localAuthSchemeProvider = (AuthSchemeProvider)localLookup.lookup((String)localObject2);
          if (localAuthSchemeProvider == null)
          {
            if (log.isWarnEnabled()) {
              log.warn("Authentication scheme " + (String)localObject2 + " not supported");
            }
          }
          else
          {
            localObject2 = localAuthSchemeProvider.create(paramHttpContext);
            ((AuthScheme)localObject2).processChallenge((Header)localObject1);
            localObject1 = localCredentialsProvider.getCredentials(new AuthScope(paramHttpHost.getHostName(), paramHttpHost.getPort(), ((AuthScheme)localObject2).getRealm(), ((AuthScheme)localObject2).getSchemeName()));
            if (localObject1 != null) {
              localLinkedList.add(new AuthOption((AuthScheme)localObject2, (Credentials)localObject1));
            }
          }
        }
        else if (log.isDebugEnabled())
        {
          log.debug("Challenge for " + (String)localObject2 + " authentication scheme not available");
        }
      }
    }
  }
}
