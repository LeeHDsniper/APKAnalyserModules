package org.apache.http.impl.execchain;

import java.io.IOException;
import java.net.URI;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.ProtocolException;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthState;
import org.apache.http.client.RedirectException;
import org.apache.http.client.RedirectStrategy;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpExecutionAware;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.HttpRoutePlanner;
import org.apache.http.util.Args;
import org.apache.http.util.EntityUtils;

@ThreadSafe
public class RedirectExec
  implements ClientExecChain
{
  private final Log log = LogFactory.getLog(getClass());
  private final RedirectStrategy redirectStrategy;
  private final ClientExecChain requestExecutor;
  private final HttpRoutePlanner routePlanner;
  
  public RedirectExec(ClientExecChain paramClientExecChain, HttpRoutePlanner paramHttpRoutePlanner, RedirectStrategy paramRedirectStrategy)
  {
    Args.notNull(paramClientExecChain, "HTTP client request executor");
    Args.notNull(paramHttpRoutePlanner, "HTTP route planner");
    Args.notNull(paramRedirectStrategy, "HTTP redirect strategy");
    requestExecutor = paramClientExecChain;
    routePlanner = paramHttpRoutePlanner;
    redirectStrategy = paramRedirectStrategy;
  }
  
  public CloseableHttpResponse execute(HttpRoute paramHttpRoute, HttpRequestWrapper paramHttpRequestWrapper, HttpClientContext paramHttpClientContext, HttpExecutionAware paramHttpExecutionAware)
    throws IOException, HttpException
  {
    Args.notNull(paramHttpRoute, "HTTP route");
    Args.notNull(paramHttpRequestWrapper, "HTTP request");
    Args.notNull(paramHttpClientContext, "HTTP context");
    Object localObject = paramHttpClientContext.getRedirectLocations();
    if (localObject != null) {
      ((List)localObject).clear();
    }
    RequestConfig localRequestConfig = paramHttpClientContext.getRequestConfig();
    int i;
    if (localRequestConfig.getMaxRedirects() > 0) {
      i = localRequestConfig.getMaxRedirects();
    }
    CloseableHttpResponse localCloseableHttpResponse;
    for (;;)
    {
      localObject = paramHttpRequestWrapper;
      int j = 0;
      localCloseableHttpResponse = requestExecutor.execute(paramHttpRoute, (HttpRequestWrapper)localObject, paramHttpClientContext, paramHttpExecutionAware);
      try
      {
        if ((localRequestConfig.isRedirectsEnabled()) && (redirectStrategy.isRedirected((HttpRequest)localObject, localCloseableHttpResponse, paramHttpClientContext))) {
          if (j >= i) {
            throw new RedirectException("Maximum redirects (" + i + ") exceeded");
          }
        }
      }
      catch (RuntimeException paramHttpRoute)
      {
        localCloseableHttpResponse.close();
        throw paramHttpRoute;
        i = 50;
        continue;
        j += 1;
        localObject = redirectStrategy.getRedirect((HttpRequest)localObject, localCloseableHttpResponse, paramHttpClientContext);
        if (!((HttpRequest)localObject).headerIterator().hasNext()) {
          ((HttpRequest)localObject).setHeaders(paramHttpRequestWrapper.getOriginal().getAllHeaders());
        }
        localObject = HttpRequestWrapper.wrap((HttpRequest)localObject);
        if ((localObject instanceof HttpEntityEnclosingRequest)) {
          Proxies.enhanceEntity((HttpEntityEnclosingRequest)localObject);
        }
        localURI = ((HttpRequestWrapper)localObject).getURI();
        localHttpHost = URIUtils.extractHost(localURI);
        if (localHttpHost == null) {
          throw new ProtocolException("Redirect URI does not specify a valid host name: " + localURI);
        }
      }
      catch (IOException paramHttpRoute)
      {
        URI localURI;
        HttpHost localHttpHost;
        localCloseableHttpResponse.close();
        throw paramHttpRoute;
        if (!paramHttpRoute.getTargetHost().equals(localHttpHost))
        {
          paramHttpRoute = paramHttpClientContext.getTargetAuthState();
          if (paramHttpRoute != null)
          {
            log.debug("Resetting target auth state");
            paramHttpRoute.reset();
          }
          paramHttpRoute = paramHttpClientContext.getProxyAuthState();
          if (paramHttpRoute != null)
          {
            AuthScheme localAuthScheme = paramHttpRoute.getAuthScheme();
            if ((localAuthScheme != null) && (localAuthScheme.isConnectionBased()))
            {
              log.debug("Resetting proxy auth state");
              paramHttpRoute.reset();
            }
          }
        }
        paramHttpRoute = routePlanner.determineRoute(localHttpHost, (HttpRequest)localObject, paramHttpClientContext);
        if (log.isDebugEnabled()) {
          log.debug("Redirecting to '" + localURI + "' via " + paramHttpRoute);
        }
        EntityUtils.consume(localCloseableHttpResponse.getEntity());
        localCloseableHttpResponse.close();
      }
      catch (HttpException paramHttpRoute)
      {
        try
        {
          EntityUtils.consume(localCloseableHttpResponse.getEntity());
        }
        catch (IOException paramHttpRequestWrapper)
        {
          for (;;)
          {
            log.debug("I/O error while releasing connection", paramHttpRequestWrapper);
            localCloseableHttpResponse.close();
          }
        }
        finally
        {
          localCloseableHttpResponse.close();
        }
        throw paramHttpRoute;
      }
    }
    return localCloseableHttpResponse;
  }
}
