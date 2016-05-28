package org.apache.http.impl.client;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.URI;
import java.util.concurrent.TimeUnit;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolException;
import org.apache.http.StatusLine;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.auth.AuthProtocolState;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthState;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthenticationHandler;
import org.apache.http.client.AuthenticationStrategy;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.NonRepeatableRequestException;
import org.apache.http.client.RedirectException;
import org.apache.http.client.RedirectHandler;
import org.apache.http.client.RedirectStrategy;
import org.apache.http.client.RequestDirector;
import org.apache.http.client.UserTokenHandler;
import org.apache.http.client.methods.AbortableHttpRequest;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.params.HttpClientParams;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.conn.BasicManagedEntity;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ClientConnectionRequest;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.routing.BasicRouteDirector;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.HttpRouteDirector;
import org.apache.http.conn.routing.HttpRoutePlanner;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.conn.ConnectionShutdownException;
import org.apache.http.message.BasicHttpRequest;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.util.Args;
import org.apache.http.util.EntityUtils;

@Deprecated
@NotThreadSafe
public class DefaultRequestDirector
  implements RequestDirector
{
  private final HttpAuthenticator authenticator;
  protected final ClientConnectionManager connManager;
  private int execCount;
  protected final HttpProcessor httpProcessor;
  protected final ConnectionKeepAliveStrategy keepAliveStrategy;
  private final Log log;
  protected ManagedClientConnection managedConn;
  private final int maxRedirects;
  protected final HttpParams params;
  @Deprecated
  protected final AuthenticationHandler proxyAuthHandler;
  protected final AuthState proxyAuthState;
  protected final AuthenticationStrategy proxyAuthStrategy;
  private int redirectCount;
  @Deprecated
  protected final RedirectHandler redirectHandler;
  protected final RedirectStrategy redirectStrategy;
  protected final HttpRequestExecutor requestExec;
  protected final HttpRequestRetryHandler retryHandler;
  protected final ConnectionReuseStrategy reuseStrategy;
  protected final HttpRoutePlanner routePlanner;
  @Deprecated
  protected final AuthenticationHandler targetAuthHandler;
  protected final AuthState targetAuthState;
  protected final AuthenticationStrategy targetAuthStrategy;
  protected final UserTokenHandler userTokenHandler;
  private HttpHost virtualHost;
  
  @Deprecated
  public DefaultRequestDirector(Log paramLog, HttpRequestExecutor paramHttpRequestExecutor, ClientConnectionManager paramClientConnectionManager, ConnectionReuseStrategy paramConnectionReuseStrategy, ConnectionKeepAliveStrategy paramConnectionKeepAliveStrategy, HttpRoutePlanner paramHttpRoutePlanner, HttpProcessor paramHttpProcessor, HttpRequestRetryHandler paramHttpRequestRetryHandler, RedirectStrategy paramRedirectStrategy, AuthenticationHandler paramAuthenticationHandler1, AuthenticationHandler paramAuthenticationHandler2, UserTokenHandler paramUserTokenHandler, HttpParams paramHttpParams)
  {
    this(LogFactory.getLog(DefaultRequestDirector.class), paramHttpRequestExecutor, paramClientConnectionManager, paramConnectionReuseStrategy, paramConnectionKeepAliveStrategy, paramHttpRoutePlanner, paramHttpProcessor, paramHttpRequestRetryHandler, paramRedirectStrategy, new AuthenticationStrategyAdaptor(paramAuthenticationHandler1), new AuthenticationStrategyAdaptor(paramAuthenticationHandler2), paramUserTokenHandler, paramHttpParams);
  }
  
  public DefaultRequestDirector(Log paramLog, HttpRequestExecutor paramHttpRequestExecutor, ClientConnectionManager paramClientConnectionManager, ConnectionReuseStrategy paramConnectionReuseStrategy, ConnectionKeepAliveStrategy paramConnectionKeepAliveStrategy, HttpRoutePlanner paramHttpRoutePlanner, HttpProcessor paramHttpProcessor, HttpRequestRetryHandler paramHttpRequestRetryHandler, RedirectStrategy paramRedirectStrategy, AuthenticationStrategy paramAuthenticationStrategy1, AuthenticationStrategy paramAuthenticationStrategy2, UserTokenHandler paramUserTokenHandler, HttpParams paramHttpParams)
  {
    Args.notNull(paramLog, "Log");
    Args.notNull(paramHttpRequestExecutor, "Request executor");
    Args.notNull(paramClientConnectionManager, "Client connection manager");
    Args.notNull(paramConnectionReuseStrategy, "Connection reuse strategy");
    Args.notNull(paramConnectionKeepAliveStrategy, "Connection keep alive strategy");
    Args.notNull(paramHttpRoutePlanner, "Route planner");
    Args.notNull(paramHttpProcessor, "HTTP protocol processor");
    Args.notNull(paramHttpRequestRetryHandler, "HTTP request retry handler");
    Args.notNull(paramRedirectStrategy, "Redirect strategy");
    Args.notNull(paramAuthenticationStrategy1, "Target authentication strategy");
    Args.notNull(paramAuthenticationStrategy2, "Proxy authentication strategy");
    Args.notNull(paramUserTokenHandler, "User token handler");
    Args.notNull(paramHttpParams, "HTTP parameters");
    log = paramLog;
    authenticator = new HttpAuthenticator(paramLog);
    requestExec = paramHttpRequestExecutor;
    connManager = paramClientConnectionManager;
    reuseStrategy = paramConnectionReuseStrategy;
    keepAliveStrategy = paramConnectionKeepAliveStrategy;
    routePlanner = paramHttpRoutePlanner;
    httpProcessor = paramHttpProcessor;
    retryHandler = paramHttpRequestRetryHandler;
    redirectStrategy = paramRedirectStrategy;
    targetAuthStrategy = paramAuthenticationStrategy1;
    proxyAuthStrategy = paramAuthenticationStrategy2;
    userTokenHandler = paramUserTokenHandler;
    params = paramHttpParams;
    if ((paramRedirectStrategy instanceof DefaultRedirectStrategyAdaptor))
    {
      redirectHandler = ((DefaultRedirectStrategyAdaptor)paramRedirectStrategy).getHandler();
      if (!(paramAuthenticationStrategy1 instanceof AuthenticationStrategyAdaptor)) {
        break label315;
      }
      targetAuthHandler = ((AuthenticationStrategyAdaptor)paramAuthenticationStrategy1).getHandler();
      label232:
      if (!(paramAuthenticationStrategy2 instanceof AuthenticationStrategyAdaptor)) {
        break label323;
      }
    }
    label315:
    label323:
    for (proxyAuthHandler = ((AuthenticationStrategyAdaptor)paramAuthenticationStrategy2).getHandler();; proxyAuthHandler = null)
    {
      managedConn = null;
      execCount = 0;
      redirectCount = 0;
      targetAuthState = new AuthState();
      proxyAuthState = new AuthState();
      maxRedirects = params.getIntParameter("http.protocol.max-redirects", 100);
      return;
      redirectHandler = null;
      break;
      targetAuthHandler = null;
      break label232;
    }
  }
  
  @Deprecated
  public DefaultRequestDirector(HttpRequestExecutor paramHttpRequestExecutor, ClientConnectionManager paramClientConnectionManager, ConnectionReuseStrategy paramConnectionReuseStrategy, ConnectionKeepAliveStrategy paramConnectionKeepAliveStrategy, HttpRoutePlanner paramHttpRoutePlanner, HttpProcessor paramHttpProcessor, HttpRequestRetryHandler paramHttpRequestRetryHandler, RedirectHandler paramRedirectHandler, AuthenticationHandler paramAuthenticationHandler1, AuthenticationHandler paramAuthenticationHandler2, UserTokenHandler paramUserTokenHandler, HttpParams paramHttpParams)
  {
    this(LogFactory.getLog(DefaultRequestDirector.class), paramHttpRequestExecutor, paramClientConnectionManager, paramConnectionReuseStrategy, paramConnectionKeepAliveStrategy, paramHttpRoutePlanner, paramHttpProcessor, paramHttpRequestRetryHandler, new DefaultRedirectStrategyAdaptor(paramRedirectHandler), new AuthenticationStrategyAdaptor(paramAuthenticationHandler1), new AuthenticationStrategyAdaptor(paramAuthenticationHandler2), paramUserTokenHandler, paramHttpParams);
  }
  
  private void abortConnection()
  {
    ManagedClientConnection localManagedClientConnection = managedConn;
    if (localManagedClientConnection != null) {
      managedConn = null;
    }
    try
    {
      localManagedClientConnection.abortConnection();
    }
    catch (IOException localIOException2)
    {
      for (;;)
      {
        try
        {
          localManagedClientConnection.releaseConnection();
          return;
        }
        catch (IOException localIOException1)
        {
          log.debug("Error releasing connection", localIOException1);
        }
        localIOException2 = localIOException2;
        if (log.isDebugEnabled()) {
          log.debug(localIOException2.getMessage(), localIOException2);
        }
      }
    }
  }
  
  private void tryConnect(RoutedRequest paramRoutedRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    HttpRoute localHttpRoute = paramRoutedRequest.getRoute();
    paramRoutedRequest = paramRoutedRequest.getRequest();
    i = 0;
    for (;;)
    {
      paramHttpContext.setAttribute("http.request", paramRoutedRequest);
      j = i + 1;
      try
      {
        if (!managedConn.isOpen()) {
          managedConn.open(localHttpRoute, paramHttpContext, params);
        }
        for (;;)
        {
          establishRoute(localHttpRoute, paramHttpContext);
          return;
          managedConn.setSocketTimeout(HttpConnectionParams.getSoTimeout(params));
        }
        try
        {
          managedConn.close();
          if (retryHandler.retryRequest(localIOException1, j, paramHttpContext))
          {
            i = j;
            if (!log.isInfoEnabled()) {
              continue;
            }
            log.info("I/O exception (" + localIOException1.getClass().getName() + ") caught when connecting to the target host: " + localIOException1.getMessage());
            if (log.isDebugEnabled()) {
              log.debug(localIOException1.getMessage(), localIOException1);
            }
            log.info("Retrying connect");
            i = j;
            continue;
          }
          throw localIOException1;
        }
        catch (IOException localIOException2)
        {
          for (;;) {}
        }
      }
      catch (IOException localIOException1) {}
    }
  }
  
  private HttpResponse tryExecute(RoutedRequest paramRoutedRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    RequestWrapper localRequestWrapper = paramRoutedRequest.getRequest();
    HttpRoute localHttpRoute = paramRoutedRequest.getRoute();
    paramRoutedRequest = null;
    for (;;)
    {
      execCount += 1;
      localRequestWrapper.incrementExecCount();
      if (!localRequestWrapper.isRepeatable())
      {
        log.debug("Cannot retry non-repeatable request");
        if (paramRoutedRequest != null) {
          throw new NonRepeatableRequestException("Cannot retry request with a non-repeatable request entity.  The cause lists the reason the original request failed.", paramRoutedRequest);
        }
        throw new NonRepeatableRequestException("Cannot retry request with a non-repeatable request entity.");
      }
      try
      {
        if (!managedConn.isOpen())
        {
          if (!localHttpRoute.isTunnelled())
          {
            log.debug("Reopening the direct connection.");
            managedConn.open(localHttpRoute, paramHttpContext, params);
          }
        }
        else
        {
          if (log.isDebugEnabled()) {
            log.debug("Attempt " + execCount + " to execute request");
          }
          return requestExec.execute(localRequestWrapper, managedConn, paramHttpContext);
        }
        log.debug("Proxied connection. Need to start over.");
        return null;
      }
      catch (IOException paramRoutedRequest)
      {
        log.debug("Closing the connection.");
      }
      try
      {
        managedConn.close();
        if (retryHandler.retryRequest(paramRoutedRequest, localRequestWrapper.getExecCount(), paramHttpContext))
        {
          if (log.isInfoEnabled()) {
            log.info("I/O exception (" + paramRoutedRequest.getClass().getName() + ") caught when processing request: " + paramRoutedRequest.getMessage());
          }
          if (log.isDebugEnabled()) {
            log.debug(paramRoutedRequest.getMessage(), paramRoutedRequest);
          }
          log.info("Retrying request");
          continue;
        }
        throw paramRoutedRequest;
      }
      catch (IOException localIOException)
      {
        for (;;) {}
      }
    }
  }
  
  private RequestWrapper wrapRequest(HttpRequest paramHttpRequest)
    throws ProtocolException
  {
    if ((paramHttpRequest instanceof HttpEntityEnclosingRequest)) {
      return new EntityEnclosingRequestWrapper((HttpEntityEnclosingRequest)paramHttpRequest);
    }
    return new RequestWrapper(paramHttpRequest);
  }
  
  protected HttpRequest createConnectRequest(HttpRoute paramHttpRoute, HttpContext paramHttpContext)
  {
    paramHttpContext = paramHttpRoute.getTargetHost();
    paramHttpRoute = paramHttpContext.getHostName();
    int j = paramHttpContext.getPort();
    int i = j;
    if (j < 0) {
      i = connManager.getSchemeRegistry().getScheme(paramHttpContext.getSchemeName()).getDefaultPort();
    }
    paramHttpContext = new StringBuilder(paramHttpRoute.length() + 6);
    paramHttpContext.append(paramHttpRoute);
    paramHttpContext.append(':');
    paramHttpContext.append(Integer.toString(i));
    return new BasicHttpRequest("CONNECT", paramHttpContext.toString(), HttpProtocolParams.getVersion(params));
  }
  
  protected boolean createTunnelToProxy(HttpRoute paramHttpRoute, int paramInt, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    throw new HttpException("Proxy chains are not supported.");
  }
  
  protected boolean createTunnelToTarget(HttpRoute paramHttpRoute, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    HttpHost localHttpHost1 = paramHttpRoute.getProxyHost();
    HttpHost localHttpHost2 = paramHttpRoute.getTargetHost();
    Object localObject;
    for (;;)
    {
      if (!managedConn.isOpen()) {
        managedConn.open(paramHttpRoute, paramHttpContext, params);
      }
      localObject = createConnectRequest(paramHttpRoute, paramHttpContext);
      ((HttpRequest)localObject).setParams(params);
      paramHttpContext.setAttribute("http.target_host", localHttpHost2);
      paramHttpContext.setAttribute("http.proxy_host", localHttpHost1);
      paramHttpContext.setAttribute("http.connection", managedConn);
      paramHttpContext.setAttribute("http.request", localObject);
      requestExec.preProcess((HttpRequest)localObject, httpProcessor, paramHttpContext);
      localObject = requestExec.execute((HttpRequest)localObject, managedConn, paramHttpContext);
      ((HttpResponse)localObject).setParams(params);
      requestExec.postProcess((HttpResponse)localObject, httpProcessor, paramHttpContext);
      if (((HttpResponse)localObject).getStatusLine().getStatusCode() < 200) {
        throw new HttpException("Unexpected response to CONNECT request: " + ((HttpResponse)localObject).getStatusLine());
      }
      if (HttpClientParams.isAuthenticating(params))
      {
        if ((!authenticator.isAuthenticationRequested(localHttpHost1, (HttpResponse)localObject, proxyAuthStrategy, proxyAuthState, paramHttpContext)) || (!authenticator.authenticate(localHttpHost1, (HttpResponse)localObject, proxyAuthStrategy, proxyAuthState, paramHttpContext))) {
          break;
        }
        if (reuseStrategy.keepAlive((HttpResponse)localObject, paramHttpContext))
        {
          log.debug("Connection kept alive");
          EntityUtils.consume(((HttpResponse)localObject).getEntity());
        }
        else
        {
          managedConn.close();
        }
      }
    }
    if (((HttpResponse)localObject).getStatusLine().getStatusCode() > 299)
    {
      paramHttpRoute = ((HttpResponse)localObject).getEntity();
      if (paramHttpRoute != null) {
        ((HttpResponse)localObject).setEntity(new BufferedHttpEntity(paramHttpRoute));
      }
      managedConn.close();
      throw new TunnelRefusedException("CONNECT refused by proxy: " + ((HttpResponse)localObject).getStatusLine(), (HttpResponse)localObject);
    }
    managedConn.markReusable();
    return false;
  }
  
  protected HttpRoute determineRoute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException
  {
    HttpRoutePlanner localHttpRoutePlanner = routePlanner;
    if (paramHttpHost != null) {}
    for (;;)
    {
      return localHttpRoutePlanner.determineRoute(paramHttpHost, paramHttpRequest, paramHttpContext);
      paramHttpHost = (HttpHost)paramHttpRequest.getParams().getParameter("http.default-host");
    }
  }
  
  protected void establishRoute(HttpRoute paramHttpRoute, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    BasicRouteDirector localBasicRouteDirector = new BasicRouteDirector();
    HttpRoute localHttpRoute = managedConn.getRoute();
    int i = localBasicRouteDirector.nextStep(paramHttpRoute, localHttpRoute);
    switch (i)
    {
    default: 
      throw new IllegalStateException("Unknown step indicator " + i + " from RouteDirector.");
    case 1: 
    case 2: 
      managedConn.open(paramHttpRoute, paramHttpContext, params);
    case 0: 
    case 3: 
    case 4: 
    case 5: 
      while (i <= 0)
      {
        return;
        boolean bool = createTunnelToTarget(paramHttpRoute, paramHttpContext);
        log.debug("Tunnel to target created.");
        managedConn.tunnelTarget(bool, params);
        continue;
        int j = localHttpRoute.getHopCount() - 1;
        bool = createTunnelToProxy(paramHttpRoute, j, paramHttpContext);
        log.debug("Tunnel to proxy created.");
        managedConn.tunnelProxy(paramHttpRoute.getHopTarget(j), bool, params);
        continue;
        managedConn.layerProtocol(paramHttpContext, params);
      }
    }
    throw new HttpException("Unable to establish route: planned = " + paramHttpRoute + "; current = " + localHttpRoute);
  }
  
  public HttpResponse execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    paramHttpContext.setAttribute("http.auth.target-scope", targetAuthState);
    paramHttpContext.setAttribute("http.auth.proxy-scope", proxyAuthState);
    Object localObject2 = wrapRequest(paramHttpRequest);
    ((RequestWrapper)localObject2).setParams(params);
    Object localObject3 = determineRoute(paramHttpHost, (HttpRequest)localObject2, paramHttpContext);
    virtualHost = ((HttpHost)((RequestWrapper)localObject2).getParams().getParameter("http.virtual-host"));
    Object localObject1;
    if ((virtualHost != null) && (virtualHost.getPort() == -1))
    {
      if (paramHttpHost == null) {
        break label807;
      }
      localObject1 = paramHttpHost;
      i = ((HttpHost)localObject1).getPort();
      if (i != -1) {
        virtualHost = new HttpHost(virtualHost.getHostName(), i, virtualHost.getSchemeName());
      }
    }
    localObject3 = new RoutedRequest((RequestWrapper)localObject2, (HttpRoute)localObject3);
    boolean bool1 = false;
    int i = 0;
    localObject2 = null;
    label159:
    if (i == 0) {}
    for (;;)
    {
      try
      {
        localObject2 = ((RoutedRequest)localObject3).getRequest();
        localObject4 = ((RoutedRequest)localObject3).getRoute();
        localObject6 = paramHttpContext.getAttribute("http.user-token");
        if (managedConn == null)
        {
          localObject1 = connManager.requestConnection((HttpRoute)localObject4, localObject6);
          if ((paramHttpRequest instanceof AbortableHttpRequest)) {
            ((AbortableHttpRequest)paramHttpRequest).setConnectionRequest((ClientConnectionRequest)localObject1);
          }
          l = HttpClientParams.getConnectionManagerTimeout(params);
        }
      }
      catch (ConnectionShutdownException paramHttpHost)
      {
        try
        {
          managedConn = ((ClientConnectionRequest)localObject1).getConnection(l, TimeUnit.MILLISECONDS);
          if ((HttpConnectionParams.isStaleCheckingEnabled(params)) && (managedConn.isOpen()))
          {
            log.debug("Stale connection check");
            if (managedConn.isStale())
            {
              log.debug("Stale connection detected");
              managedConn.close();
            }
          }
          if ((paramHttpRequest instanceof AbortableHttpRequest)) {
            ((AbortableHttpRequest)paramHttpRequest).setReleaseTrigger(managedConn);
          }
        }
        catch (InterruptedException paramHttpHost)
        {
          Object localObject6;
          long l;
          Object localObject5;
          Thread.currentThread().interrupt();
          throw new InterruptedIOException();
        }
        try
        {
          tryConnect((RoutedRequest)localObject3, paramHttpContext);
          localObject1 = ((RequestWrapper)localObject2).getURI().getUserInfo();
          if (localObject1 != null) {
            targetAuthState.update(new BasicScheme(), new UsernamePasswordCredentials((String)localObject1));
          }
          if (virtualHost == null) {
            continue;
          }
          paramHttpHost = virtualHost;
          localObject1 = paramHttpHost;
          if (paramHttpHost == null) {
            localObject1 = ((HttpRoute)localObject4).getTargetHost();
          }
          ((RequestWrapper)localObject2).resetHeaders();
          rewriteRequestURI((RequestWrapper)localObject2, (HttpRoute)localObject4);
          paramHttpContext.setAttribute("http.target_host", localObject1);
          paramHttpContext.setAttribute("http.route", localObject4);
          paramHttpContext.setAttribute("http.connection", managedConn);
          requestExec.preProcess((HttpRequest)localObject2, httpProcessor, paramHttpContext);
          localHttpResponse = tryExecute((RoutedRequest)localObject3, paramHttpContext);
          localObject2 = localHttpResponse;
          paramHttpHost = (HttpHost)localObject1;
          if (localHttpResponse == null) {
            break label159;
          }
          localHttpResponse.setParams(params);
          requestExec.postProcess(localHttpResponse, httpProcessor, paramHttpContext);
          bool2 = reuseStrategy.keepAlive(localHttpResponse, paramHttpContext);
          if (bool2)
          {
            l = keepAliveStrategy.getKeepAliveDuration(localHttpResponse, paramHttpContext);
            if (log.isDebugEnabled())
            {
              if (l <= 0L) {
                break label1169;
              }
              paramHttpHost = "for " + l + " " + TimeUnit.MILLISECONDS;
              log.debug("Connection can be kept alive " + paramHttpHost);
            }
            managedConn.setIdleDuration(l, TimeUnit.MILLISECONDS);
          }
          localObject4 = handleResponse((RoutedRequest)localObject3, localHttpResponse, paramHttpContext);
          if (localObject4 != null) {
            continue;
          }
          j = 1;
          localObject4 = localObject3;
          i = j;
          localObject2 = localHttpResponse;
          bool1 = bool2;
          localObject3 = localObject4;
          paramHttpHost = (HttpHost)localObject1;
          if (managedConn == null) {
            break label159;
          }
          localObject5 = localObject6;
          if (localObject6 == null)
          {
            localObject5 = userTokenHandler.getUserToken(paramHttpContext);
            paramHttpContext.setAttribute("http.user-token", localObject5);
          }
          i = j;
          localObject2 = localHttpResponse;
          bool1 = bool2;
          localObject3 = localObject4;
          paramHttpHost = (HttpHost)localObject1;
          if (localObject5 == null) {
            break label159;
          }
          managedConn.setState(localObject5);
          i = j;
          localObject2 = localHttpResponse;
          bool1 = bool2;
          localObject3 = localObject4;
          paramHttpHost = (HttpHost)localObject1;
        }
        catch (TunnelRefusedException paramHttpHost)
        {
          if (!log.isDebugEnabled()) {
            continue;
          }
          log.debug(paramHttpHost.getMessage());
          localObject2 = paramHttpHost.getResponse();
        }
        paramHttpHost = paramHttpHost;
        paramHttpRequest = new InterruptedIOException("Connection has been shut down");
        paramHttpRequest.initCause(paramHttpHost);
        throw paramHttpRequest;
        localObject1 = ((HttpRoute)localObject3).getTargetHost();
      }
      catch (HttpException paramHttpHost)
      {
        Object localObject4;
        HttpResponse localHttpResponse;
        boolean bool2;
        abortConnection();
        throw paramHttpHost;
        if ((localObject2 == null) || (((HttpResponse)localObject2).getEntity() == null) || (!((HttpResponse)localObject2).getEntity().isStreaming()))
        {
          if (bool1) {
            managedConn.markReusable();
          }
          releaseConnection();
          return localObject2;
          localObject1 = ((RequestWrapper)localObject2).getURI();
          if (!((URI)localObject1).isAbsolute()) {
            continue;
          }
          paramHttpHost = URIUtils.extractHost((URI)localObject1);
          continue;
          if (bool2)
          {
            EntityUtils.consume(localHttpResponse.getEntity());
            managedConn.markReusable();
            if (((RoutedRequest)localObject4).getRoute().equals(((RoutedRequest)localObject3).getRoute())) {
              break label1176;
            }
            releaseConnection();
            break label1176;
          }
          managedConn.close();
          if ((proxyAuthState.getState().compareTo(AuthProtocolState.CHALLENGED) > 0) && (proxyAuthState.getAuthScheme() != null) && (proxyAuthState.getAuthScheme().isConnectionBased()))
          {
            log.debug("Resetting proxy auth state");
            proxyAuthState.reset();
          }
          if ((targetAuthState.getState().compareTo(AuthProtocolState.CHALLENGED) <= 0) || (targetAuthState.getAuthScheme() == null) || (!targetAuthState.getAuthScheme().isConnectionBased())) {
            continue;
          }
          log.debug("Resetting target auth state");
          targetAuthState.reset();
          continue;
        }
      }
      catch (IOException paramHttpHost)
      {
        abortConnection();
        throw paramHttpHost;
        ((HttpResponse)localObject2).setEntity(new BasicManagedEntity(((HttpResponse)localObject2).getEntity(), managedConn, bool1));
        return localObject2;
      }
      catch (RuntimeException paramHttpHost)
      {
        label807:
        abortConnection();
        throw paramHttpHost;
      }
      label1169:
      paramHttpHost = "indefinitely";
      continue;
      label1176:
      int j = i;
    }
  }
  
  protected RoutedRequest handleResponse(RoutedRequest paramRoutedRequest, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    HttpRoute localHttpRoute = paramRoutedRequest.getRoute();
    RequestWrapper localRequestWrapper = paramRoutedRequest.getRequest();
    HttpParams localHttpParams = localRequestWrapper.getParams();
    Object localObject2;
    Object localObject1;
    if (HttpClientParams.isAuthenticating(localHttpParams))
    {
      localObject2 = (HttpHost)paramHttpContext.getAttribute("http.target_host");
      localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = localHttpRoute.getTargetHost();
      }
      localObject2 = localObject1;
      if (((HttpHost)localObject1).getPort() < 0)
      {
        localObject2 = connManager.getSchemeRegistry().getScheme((HttpHost)localObject1);
        localObject2 = new HttpHost(((HttpHost)localObject1).getHostName(), ((Scheme)localObject2).getDefaultPort(), ((HttpHost)localObject1).getSchemeName());
      }
      if ((authenticator.isAuthenticationRequested((HttpHost)localObject2, paramHttpResponse, targetAuthStrategy, targetAuthState, paramHttpContext)) && (authenticator.authenticate((HttpHost)localObject2, paramHttpResponse, targetAuthStrategy, targetAuthState, paramHttpContext))) {}
      do
      {
        return paramRoutedRequest;
        localObject2 = localHttpRoute.getProxyHost();
        if (!authenticator.isAuthenticationRequested((HttpHost)localObject2, paramHttpResponse, proxyAuthStrategy, proxyAuthState, paramHttpContext)) {
          break;
        }
        localObject1 = localObject2;
        if (localObject2 == null) {
          localObject1 = localHttpRoute.getTargetHost();
        }
      } while (authenticator.authenticate((HttpHost)localObject1, paramHttpResponse, proxyAuthStrategy, proxyAuthState, paramHttpContext));
    }
    if ((HttpClientParams.isRedirecting(localHttpParams)) && (redirectStrategy.isRedirected(localRequestWrapper, paramHttpResponse, paramHttpContext)))
    {
      if (redirectCount >= maxRedirects) {
        throw new RedirectException("Maximum redirects (" + maxRedirects + ") exceeded");
      }
      redirectCount += 1;
      virtualHost = null;
      paramHttpResponse = redirectStrategy.getRedirect(localRequestWrapper, paramHttpResponse, paramHttpContext);
      paramHttpResponse.setHeaders(localRequestWrapper.getOriginal().getAllHeaders());
      paramRoutedRequest = paramHttpResponse.getURI();
      localObject1 = URIUtils.extractHost(paramRoutedRequest);
      if (localObject1 == null) {
        throw new ProtocolException("Redirect URI does not specify a valid host name: " + paramRoutedRequest);
      }
      if (!localHttpRoute.getTargetHost().equals(localObject1))
      {
        log.debug("Resetting target auth state");
        targetAuthState.reset();
        localObject2 = proxyAuthState.getAuthScheme();
        if ((localObject2 != null) && (((AuthScheme)localObject2).isConnectionBased()))
        {
          log.debug("Resetting proxy auth state");
          proxyAuthState.reset();
        }
      }
      paramHttpResponse = wrapRequest(paramHttpResponse);
      paramHttpResponse.setParams(localHttpParams);
      paramHttpContext = determineRoute((HttpHost)localObject1, paramHttpResponse, paramHttpContext);
      paramHttpResponse = new RoutedRequest(paramHttpResponse, paramHttpContext);
      if (log.isDebugEnabled()) {
        log.debug("Redirecting to '" + paramRoutedRequest + "' via " + paramHttpContext);
      }
      return paramHttpResponse;
    }
    return null;
  }
  
  protected void releaseConnection()
  {
    try
    {
      managedConn.releaseConnection();
      managedConn = null;
      return;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        log.debug("IOException releasing connection", localIOException);
      }
    }
  }
  
  /* Error */
  protected void rewriteRequestURI(RequestWrapper paramRequestWrapper, HttpRoute paramHttpRoute)
    throws ProtocolException
  {
    // Byte code:
    //   0: aload_1
    //   1: invokevirtual 662	org/apache/http/impl/client/RequestWrapper:getURI	()Ljava/net/URI;
    //   4: astore_3
    //   5: aload_2
    //   6: invokevirtual 434	org/apache/http/conn/routing/HttpRoute:getProxyHost	()Lorg/apache/http/HttpHost;
    //   9: ifnull +41 -> 50
    //   12: aload_2
    //   13: invokevirtual 321	org/apache/http/conn/routing/HttpRoute:isTunnelled	()Z
    //   16: ifne +34 -> 50
    //   19: aload_3
    //   20: invokevirtual 753	java/net/URI:isAbsolute	()Z
    //   23: ifne +19 -> 42
    //   26: aload_3
    //   27: aload_2
    //   28: invokevirtual 368	org/apache/http/conn/routing/HttpRoute:getTargetHost	()Lorg/apache/http/HttpHost;
    //   31: iconst_1
    //   32: invokestatic 854	org/apache/http/client/utils/URIUtils:rewriteURI	(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;
    //   35: astore_2
    //   36: aload_1
    //   37: aload_2
    //   38: invokevirtual 858	org/apache/http/impl/client/RequestWrapper:setURI	(Ljava/net/URI;)V
    //   41: return
    //   42: aload_3
    //   43: invokestatic 861	org/apache/http/client/utils/URIUtils:rewriteURI	(Ljava/net/URI;)Ljava/net/URI;
    //   46: astore_2
    //   47: goto -11 -> 36
    //   50: aload_3
    //   51: invokevirtual 753	java/net/URI:isAbsolute	()Z
    //   54: ifeq +13 -> 67
    //   57: aload_3
    //   58: aconst_null
    //   59: iconst_1
    //   60: invokestatic 854	org/apache/http/client/utils/URIUtils:rewriteURI	(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;
    //   63: astore_2
    //   64: goto -28 -> 36
    //   67: aload_3
    //   68: invokestatic 861	org/apache/http/client/utils/URIUtils:rewriteURI	(Ljava/net/URI;)Ljava/net/URI;
    //   71: astore_2
    //   72: goto -36 -> 36
    //   75: astore_2
    //   76: new 352	org/apache/http/ProtocolException
    //   79: dup
    //   80: new 262	java/lang/StringBuilder
    //   83: dup
    //   84: invokespecial 263	java/lang/StringBuilder:<init>	()V
    //   87: ldc_w 863
    //   90: invokevirtual 269	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   93: aload_1
    //   94: invokevirtual 867	org/apache/http/impl/client/RequestWrapper:getRequestLine	()Lorg/apache/http/RequestLine;
    //   97: invokeinterface 872 1 0
    //   102: invokevirtual 269	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   105: invokevirtual 283	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   108: aload_2
    //   109: invokespecial 873	org/apache/http/ProtocolException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   112: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	113	0	this	DefaultRequestDirector
    //   0	113	1	paramRequestWrapper	RequestWrapper
    //   0	113	2	paramHttpRoute	HttpRoute
    //   4	64	3	localURI	URI
    // Exception table:
    //   from	to	target	type
    //   0	36	75	java/net/URISyntaxException
    //   36	41	75	java/net/URISyntaxException
    //   42	47	75	java/net/URISyntaxException
    //   50	64	75	java/net/URISyntaxException
    //   67	72	75	java/net/URISyntaxException
  }
}
