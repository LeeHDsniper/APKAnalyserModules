package org.apache.http.impl.execchain;

import java.io.IOException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthState;
import org.apache.http.client.AuthenticationStrategy;
import org.apache.http.client.UserTokenHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.client.protocol.RequestClientConnControl;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.routing.BasicRouteDirector;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.HttpRouteDirector;
import org.apache.http.conn.routing.RouteInfo;
import org.apache.http.conn.routing.RouteTracker;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.impl.auth.HttpAuthenticator;
import org.apache.http.message.BasicHttpRequest;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.protocol.ImmutableHttpProcessor;
import org.apache.http.protocol.RequestTargetHost;
import org.apache.http.util.Args;
import org.apache.http.util.EntityUtils;

@Immutable
public class MainClientExec
  implements ClientExecChain
{
  private final HttpAuthenticator authenticator;
  private final HttpClientConnectionManager connManager;
  private final ConnectionKeepAliveStrategy keepAliveStrategy;
  private final Log log = LogFactory.getLog(getClass());
  private final AuthenticationStrategy proxyAuthStrategy;
  private final HttpProcessor proxyHttpProcessor;
  private final HttpRequestExecutor requestExecutor;
  private final ConnectionReuseStrategy reuseStrategy;
  private final HttpRouteDirector routeDirector;
  private final AuthenticationStrategy targetAuthStrategy;
  private final UserTokenHandler userTokenHandler;
  
  public MainClientExec(HttpRequestExecutor paramHttpRequestExecutor, HttpClientConnectionManager paramHttpClientConnectionManager, ConnectionReuseStrategy paramConnectionReuseStrategy, ConnectionKeepAliveStrategy paramConnectionKeepAliveStrategy, AuthenticationStrategy paramAuthenticationStrategy1, AuthenticationStrategy paramAuthenticationStrategy2, UserTokenHandler paramUserTokenHandler)
  {
    Args.notNull(paramHttpRequestExecutor, "HTTP request executor");
    Args.notNull(paramHttpClientConnectionManager, "Client connection manager");
    Args.notNull(paramConnectionReuseStrategy, "Connection reuse strategy");
    Args.notNull(paramConnectionKeepAliveStrategy, "Connection keep alive strategy");
    Args.notNull(paramAuthenticationStrategy1, "Target authentication strategy");
    Args.notNull(paramAuthenticationStrategy2, "Proxy authentication strategy");
    Args.notNull(paramUserTokenHandler, "User token handler");
    authenticator = new HttpAuthenticator();
    proxyHttpProcessor = new ImmutableHttpProcessor(new HttpRequestInterceptor[] { new RequestTargetHost(), new RequestClientConnControl() });
    routeDirector = new BasicRouteDirector();
    requestExecutor = paramHttpRequestExecutor;
    connManager = paramHttpClientConnectionManager;
    reuseStrategy = paramConnectionReuseStrategy;
    keepAliveStrategy = paramConnectionKeepAliveStrategy;
    targetAuthStrategy = paramAuthenticationStrategy1;
    proxyAuthStrategy = paramAuthenticationStrategy2;
    userTokenHandler = paramUserTokenHandler;
  }
  
  private boolean createTunnelToProxy(HttpRoute paramHttpRoute, int paramInt, HttpClientContext paramHttpClientContext)
    throws HttpException
  {
    throw new HttpException("Proxy chains are not supported.");
  }
  
  private boolean createTunnelToTarget(AuthState paramAuthState, HttpClientConnection paramHttpClientConnection, HttpRoute paramHttpRoute, HttpRequest paramHttpRequest, HttpClientContext paramHttpClientContext)
    throws HttpException, IOException
  {
    RequestConfig localRequestConfig = paramHttpClientContext.getRequestConfig();
    int j = localRequestConfig.getConnectTimeout();
    Object localObject = paramHttpRoute.getTargetHost();
    HttpHost localHttpHost = paramHttpRoute.getProxyHost();
    paramHttpRequest = new BasicHttpRequest("CONNECT", ((HttpHost)localObject).toHostString(), paramHttpRequest.getProtocolVersion());
    requestExecutor.preProcess(paramHttpRequest, proxyHttpProcessor, paramHttpClientContext);
    for (;;)
    {
      if (!paramHttpClientConnection.isOpen())
      {
        localObject = connManager;
        if (j <= 0) {
          break label187;
        }
      }
      label187:
      for (int i = j;; i = 0)
      {
        ((HttpClientConnectionManager)localObject).connect(paramHttpClientConnection, paramHttpRoute, i, paramHttpClientContext);
        paramHttpRequest.removeHeaders("Proxy-Authorization");
        authenticator.generateAuthResponse(paramHttpRequest, paramAuthState, paramHttpClientContext);
        localObject = requestExecutor.execute(paramHttpRequest, paramHttpClientConnection, paramHttpClientContext);
        if (((HttpResponse)localObject).getStatusLine().getStatusCode() >= 200) {
          break;
        }
        throw new HttpException("Unexpected response to CONNECT request: " + ((HttpResponse)localObject).getStatusLine());
      }
      if (localRequestConfig.isAuthenticationEnabled())
      {
        if ((!authenticator.isAuthenticationRequested(localHttpHost, (HttpResponse)localObject, proxyAuthStrategy, paramAuthState, paramHttpClientContext)) || (!authenticator.handleAuthChallenge(localHttpHost, (HttpResponse)localObject, proxyAuthStrategy, paramAuthState, paramHttpClientContext))) {
          break;
        }
        if (reuseStrategy.keepAlive((HttpResponse)localObject, paramHttpClientContext))
        {
          log.debug("Connection kept alive");
          EntityUtils.consume(((HttpResponse)localObject).getEntity());
        }
        else
        {
          paramHttpClientConnection.close();
        }
      }
    }
    if (((HttpResponse)localObject).getStatusLine().getStatusCode() > 299)
    {
      paramAuthState = ((HttpResponse)localObject).getEntity();
      if (paramAuthState != null) {
        ((HttpResponse)localObject).setEntity(new BufferedHttpEntity(paramAuthState));
      }
      paramHttpClientConnection.close();
      throw new TunnelRefusedException("CONNECT refused by proxy: " + ((HttpResponse)localObject).getStatusLine(), (HttpResponse)localObject);
    }
    return false;
  }
  
  private boolean needAuthentication(AuthState paramAuthState1, AuthState paramAuthState2, HttpRoute paramHttpRoute, HttpResponse paramHttpResponse, HttpClientContext paramHttpClientContext)
  {
    if (paramHttpClientContext.getRequestConfig().isAuthenticationEnabled())
    {
      Object localObject2 = paramHttpClientContext.getTargetHost();
      Object localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = paramHttpRoute.getTargetHost();
      }
      localObject2 = localObject1;
      if (((HttpHost)localObject1).getPort() < 0) {
        localObject2 = new HttpHost(((HttpHost)localObject1).getHostName(), paramHttpRoute.getTargetHost().getPort(), ((HttpHost)localObject1).getSchemeName());
      }
      if (authenticator.isAuthenticationRequested((HttpHost)localObject2, paramHttpResponse, targetAuthStrategy, paramAuthState1, paramHttpClientContext)) {
        return authenticator.handleAuthChallenge((HttpHost)localObject2, paramHttpResponse, targetAuthStrategy, paramAuthState1, paramHttpClientContext);
      }
      localObject1 = paramHttpRoute.getProxyHost();
      if (authenticator.isAuthenticationRequested((HttpHost)localObject1, paramHttpResponse, proxyAuthStrategy, paramAuthState2, paramHttpClientContext))
      {
        paramAuthState1 = (AuthState)localObject1;
        if (localObject1 == null) {
          paramAuthState1 = paramHttpRoute.getTargetHost();
        }
        return authenticator.handleAuthChallenge(paramAuthState1, paramHttpResponse, proxyAuthStrategy, paramAuthState2, paramHttpClientContext);
      }
    }
    return false;
  }
  
  void establishRoute(AuthState paramAuthState, HttpClientConnection paramHttpClientConnection, HttpRoute paramHttpRoute, HttpRequest paramHttpRequest, HttpClientContext paramHttpClientContext)
    throws HttpException, IOException
  {
    int i = paramHttpClientContext.getRequestConfig().getConnectTimeout();
    RouteTracker localRouteTracker = new RouteTracker(paramHttpRoute);
    Object localObject = localRouteTracker.toRoute();
    int k = routeDirector.nextStep(paramHttpRoute, (RouteInfo)localObject);
    int j;
    switch (k)
    {
    default: 
      throw new IllegalStateException("Unknown step indicator " + k + " from RouteDirector.");
    case 1: 
      localObject = connManager;
      if (i > 0)
      {
        j = i;
        label134:
        ((HttpClientConnectionManager)localObject).connect(paramHttpClientConnection, paramHttpRoute, j, paramHttpClientContext);
        localRouteTracker.connectTarget(paramHttpRoute.isSecure());
      }
      break;
    }
    while (k <= 0)
    {
      return;
      j = 0;
      break label134;
      localObject = connManager;
      if (i > 0) {}
      for (j = i;; j = 0)
      {
        ((HttpClientConnectionManager)localObject).connect(paramHttpClientConnection, paramHttpRoute, j, paramHttpClientContext);
        localRouteTracker.connectProxy(paramHttpRoute.getProxyHost(), false);
        break;
      }
      boolean bool = createTunnelToTarget(paramAuthState, paramHttpClientConnection, paramHttpRoute, paramHttpRequest, paramHttpClientContext);
      log.debug("Tunnel to target created.");
      localRouteTracker.tunnelTarget(bool);
      continue;
      j = ((HttpRoute)localObject).getHopCount() - 1;
      bool = createTunnelToProxy(paramHttpRoute, j, paramHttpClientContext);
      log.debug("Tunnel to proxy created.");
      localRouteTracker.tunnelProxy(paramHttpRoute.getHopTarget(j), bool);
      continue;
      connManager.upgrade(paramHttpClientConnection, paramHttpRoute, paramHttpClientContext);
      localRouteTracker.layerProtocol(paramHttpRoute.isSecure());
      continue;
      throw new HttpException("Unable to establish route: planned = " + paramHttpRoute + "; current = " + localObject);
      connManager.routeComplete(paramHttpClientConnection, paramHttpRoute, paramHttpClientContext);
    }
  }
  
  /* Error */
  public org.apache.http.client.methods.CloseableHttpResponse execute(HttpRoute paramHttpRoute, org.apache.http.client.methods.HttpRequestWrapper paramHttpRequestWrapper, HttpClientContext paramHttpClientContext, org.apache.http.client.methods.HttpExecutionAware paramHttpExecutionAware)
    throws IOException, HttpException
  {
    // Byte code:
    //   0: aload_1
    //   1: ldc_w 366
    //   4: invokestatic 53	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   7: pop
    //   8: aload_2
    //   9: ldc_w 368
    //   12: invokestatic 53	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   15: pop
    //   16: aload_3
    //   17: ldc_w 370
    //   20: invokestatic 53	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   23: pop
    //   24: aload_3
    //   25: invokevirtual 374	org/apache/http/client/protocol/HttpClientContext:getTargetAuthState	()Lorg/apache/http/auth/AuthState;
    //   28: astore 10
    //   30: aload 10
    //   32: astore 9
    //   34: aload 10
    //   36: ifnonnull +21 -> 57
    //   39: new 376	org/apache/http/auth/AuthState
    //   42: dup
    //   43: invokespecial 377	org/apache/http/auth/AuthState:<init>	()V
    //   46: astore 9
    //   48: aload_3
    //   49: ldc_w 379
    //   52: aload 9
    //   54: invokevirtual 383	org/apache/http/client/protocol/HttpClientContext:setAttribute	(Ljava/lang/String;Ljava/lang/Object;)V
    //   57: aload_3
    //   58: invokevirtual 386	org/apache/http/client/protocol/HttpClientContext:getProxyAuthState	()Lorg/apache/http/auth/AuthState;
    //   61: astore 11
    //   63: aload 11
    //   65: astore 10
    //   67: aload 11
    //   69: ifnonnull +21 -> 90
    //   72: new 376	org/apache/http/auth/AuthState
    //   75: dup
    //   76: invokespecial 377	org/apache/http/auth/AuthState:<init>	()V
    //   79: astore 10
    //   81: aload_3
    //   82: ldc_w 388
    //   85: aload 10
    //   87: invokevirtual 383	org/apache/http/client/protocol/HttpClientContext:setAttribute	(Ljava/lang/String;Ljava/lang/Object;)V
    //   90: aload_2
    //   91: instanceof 390
    //   94: ifeq +10 -> 104
    //   97: aload_2
    //   98: checkcast 390	org/apache/http/HttpEntityEnclosingRequest
    //   101: invokestatic 396	org/apache/http/impl/execchain/Proxies:enhanceEntity	(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    //   104: aload_3
    //   105: invokevirtual 400	org/apache/http/client/protocol/HttpClientContext:getUserToken	()Ljava/lang/Object;
    //   108: astore 12
    //   110: aload_0
    //   111: getfield 94	org/apache/http/impl/execchain/MainClientExec:connManager	Lorg/apache/http/conn/HttpClientConnectionManager;
    //   114: aload_1
    //   115: aload 12
    //   117: invokeinterface 404 3 0
    //   122: astore 11
    //   124: aload 4
    //   126: ifnull +41 -> 167
    //   129: aload 4
    //   131: invokeinterface 409 1 0
    //   136: ifeq +22 -> 158
    //   139: aload 11
    //   141: invokeinterface 414 1 0
    //   146: pop
    //   147: new 416	org/apache/http/impl/execchain/RequestAbortedException
    //   150: dup
    //   151: ldc_w 418
    //   154: invokespecial 419	org/apache/http/impl/execchain/RequestAbortedException:<init>	(Ljava/lang/String;)V
    //   157: athrow
    //   158: aload 4
    //   160: aload 11
    //   162: invokeinterface 423 2 0
    //   167: aload_3
    //   168: invokevirtual 125	org/apache/http/client/protocol/HttpClientContext:getRequestConfig	()Lorg/apache/http/client/config/RequestConfig;
    //   171: astore 15
    //   173: aload 15
    //   175: invokevirtual 426	org/apache/http/client/config/RequestConfig:getConnectionRequestTimeout	()I
    //   178: istore 5
    //   180: iload 5
    //   182: ifle +170 -> 352
    //   185: iload 5
    //   187: i2l
    //   188: lstore 7
    //   190: aload 11
    //   192: lload 7
    //   194: getstatic 432	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   197: invokeinterface 436 4 0
    //   202: astore 16
    //   204: aload_3
    //   205: ldc_w 438
    //   208: aload 16
    //   210: invokevirtual 383	org/apache/http/client/protocol/HttpClientContext:setAttribute	(Ljava/lang/String;Ljava/lang/Object;)V
    //   213: aload 15
    //   215: invokevirtual 441	org/apache/http/client/config/RequestConfig:isStaleConnectionCheckEnabled	()Z
    //   218: ifeq +54 -> 272
    //   221: aload 16
    //   223: invokeinterface 171 1 0
    //   228: ifeq +44 -> 272
    //   231: aload_0
    //   232: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   235: ldc_w 443
    //   238: invokeinterface 240 2 0
    //   243: aload 16
    //   245: invokeinterface 446 1 0
    //   250: ifeq +22 -> 272
    //   253: aload_0
    //   254: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   257: ldc_w 448
    //   260: invokeinterface 240 2 0
    //   265: aload 16
    //   267: invokeinterface 253 1 0
    //   272: new 450	org/apache/http/impl/execchain/ConnectionHolder
    //   275: dup
    //   276: aload_0
    //   277: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   280: aload_0
    //   281: getfield 94	org/apache/http/impl/execchain/MainClientExec:connManager	Lorg/apache/http/conn/HttpClientConnectionManager;
    //   284: aload 16
    //   286: invokespecial 453	org/apache/http/impl/execchain/ConnectionHolder:<init>	(Lorg/apache/commons/logging/Log;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/HttpClientConnection;)V
    //   289: astore 14
    //   291: aload 4
    //   293: ifnull +871 -> 1164
    //   296: aload 4
    //   298: aload 14
    //   300: invokeinterface 423 2 0
    //   305: goto +859 -> 1164
    //   308: iload 5
    //   310: iconst_1
    //   311: if_icmple +92 -> 403
    //   314: aload_2
    //   315: invokestatic 457	org/apache/http/impl/execchain/Proxies:isRepeatable	(Lorg/apache/http/HttpRequest;)Z
    //   318: ifne +85 -> 403
    //   321: new 459	org/apache/http/client/NonRepeatableRequestException
    //   324: dup
    //   325: ldc_w 461
    //   328: invokespecial 462	org/apache/http/client/NonRepeatableRequestException:<init>	(Ljava/lang/String;)V
    //   331: athrow
    //   332: astore_1
    //   333: new 464	java/io/InterruptedIOException
    //   336: dup
    //   337: ldc_w 466
    //   340: invokespecial 467	java/io/InterruptedIOException:<init>	(Ljava/lang/String;)V
    //   343: astore_2
    //   344: aload_2
    //   345: aload_1
    //   346: invokevirtual 471	java/io/InterruptedIOException:initCause	(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    //   349: pop
    //   350: aload_2
    //   351: athrow
    //   352: lconst_0
    //   353: lstore 7
    //   355: goto -165 -> 190
    //   358: astore_1
    //   359: invokestatic 477	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   362: invokevirtual 480	java/lang/Thread:interrupt	()V
    //   365: new 416	org/apache/http/impl/execchain/RequestAbortedException
    //   368: dup
    //   369: ldc_w 418
    //   372: aload_1
    //   373: invokespecial 483	org/apache/http/impl/execchain/RequestAbortedException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   376: athrow
    //   377: astore_2
    //   378: aload_2
    //   379: invokevirtual 487	java/util/concurrent/ExecutionException:getCause	()Ljava/lang/Throwable;
    //   382: astore_3
    //   383: aload_3
    //   384: astore_1
    //   385: aload_3
    //   386: ifnonnull +5 -> 391
    //   389: aload_2
    //   390: astore_1
    //   391: new 416	org/apache/http/impl/execchain/RequestAbortedException
    //   394: dup
    //   395: ldc_w 489
    //   398: aload_1
    //   399: invokespecial 483	org/apache/http/impl/execchain/RequestAbortedException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   402: athrow
    //   403: aload 4
    //   405: ifnull +32 -> 437
    //   408: aload 4
    //   410: invokeinterface 409 1 0
    //   415: ifeq +22 -> 437
    //   418: new 416	org/apache/http/impl/execchain/RequestAbortedException
    //   421: dup
    //   422: ldc_w 418
    //   425: invokespecial 419	org/apache/http/impl/execchain/RequestAbortedException:<init>	(Ljava/lang/String;)V
    //   428: athrow
    //   429: astore_1
    //   430: aload 14
    //   432: invokevirtual 492	org/apache/http/impl/execchain/ConnectionHolder:abortConnection	()V
    //   435: aload_1
    //   436: athrow
    //   437: aload 16
    //   439: invokeinterface 171 1 0
    //   444: ifne +43 -> 487
    //   447: aload_0
    //   448: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   451: new 203	java/lang/StringBuilder
    //   454: dup
    //   455: invokespecial 204	java/lang/StringBuilder:<init>	()V
    //   458: ldc_w 494
    //   461: invokevirtual 210	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   464: aload_1
    //   465: invokevirtual 213	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   468: invokevirtual 216	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   471: invokeinterface 240 2 0
    //   476: aload_0
    //   477: aload 10
    //   479: aload 16
    //   481: aload_1
    //   482: aload_2
    //   483: aload_3
    //   484: invokevirtual 496	org/apache/http/impl/execchain/MainClientExec:establishRoute	(Lorg/apache/http/auth/AuthState;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/protocol/HttpClientContext;)V
    //   487: aload 15
    //   489: invokevirtual 499	org/apache/http/client/config/RequestConfig:getSocketTimeout	()I
    //   492: istore 6
    //   494: iload 6
    //   496: iflt +12 -> 508
    //   499: aload 16
    //   501: iload 6
    //   503: invokeinterface 503 2 0
    //   508: aload 4
    //   510: ifnull +134 -> 644
    //   513: aload 4
    //   515: invokeinterface 409 1 0
    //   520: ifeq +124 -> 644
    //   523: new 416	org/apache/http/impl/execchain/RequestAbortedException
    //   526: dup
    //   527: ldc_w 418
    //   530: invokespecial 419	org/apache/http/impl/execchain/RequestAbortedException:<init>	(Ljava/lang/String;)V
    //   533: athrow
    //   534: astore_1
    //   535: aload 14
    //   537: invokevirtual 492	org/apache/http/impl/execchain/ConnectionHolder:abortConnection	()V
    //   540: aload_1
    //   541: athrow
    //   542: astore_1
    //   543: aload_0
    //   544: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   547: invokeinterface 506 1 0
    //   552: ifeq +16 -> 568
    //   555: aload_0
    //   556: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   559: aload_1
    //   560: invokevirtual 509	org/apache/http/impl/execchain/TunnelRefusedException:getMessage	()Ljava/lang/String;
    //   563: invokeinterface 240 2 0
    //   568: aload_1
    //   569: invokevirtual 513	org/apache/http/impl/execchain/TunnelRefusedException:getResponse	()Lorg/apache/http/HttpResponse;
    //   572: astore 11
    //   574: aload 12
    //   576: astore_1
    //   577: aload 12
    //   579: ifnonnull +22 -> 601
    //   582: aload_0
    //   583: getfield 104	org/apache/http/impl/execchain/MainClientExec:userTokenHandler	Lorg/apache/http/client/UserTokenHandler;
    //   586: aload_3
    //   587: invokeinterface 518 2 0
    //   592: astore_1
    //   593: aload_3
    //   594: ldc_w 520
    //   597: aload_1
    //   598: invokevirtual 383	org/apache/http/client/protocol/HttpClientContext:setAttribute	(Ljava/lang/String;Ljava/lang/Object;)V
    //   601: aload_1
    //   602: ifnull +9 -> 611
    //   605: aload 14
    //   607: aload_1
    //   608: invokevirtual 523	org/apache/http/impl/execchain/ConnectionHolder:setState	(Ljava/lang/Object;)V
    //   611: aload 11
    //   613: invokeinterface 244 1 0
    //   618: astore_1
    //   619: aload_1
    //   620: ifnull +12 -> 632
    //   623: aload_1
    //   624: invokeinterface 528 1 0
    //   629: ifne +525 -> 1154
    //   632: aload 14
    //   634: invokevirtual 531	org/apache/http/impl/execchain/ConnectionHolder:releaseConnection	()V
    //   637: aload 11
    //   639: aconst_null
    //   640: invokestatic 535	org/apache/http/impl/execchain/Proxies:enhanceResponse	(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    //   643: areturn
    //   644: aload_0
    //   645: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   648: invokeinterface 506 1 0
    //   653: ifeq +35 -> 688
    //   656: aload_0
    //   657: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   660: new 203	java/lang/StringBuilder
    //   663: dup
    //   664: invokespecial 204	java/lang/StringBuilder:<init>	()V
    //   667: ldc_w 537
    //   670: invokevirtual 210	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   673: aload_2
    //   674: invokevirtual 543	org/apache/http/client/methods/HttpRequestWrapper:getRequestLine	()Lorg/apache/http/RequestLine;
    //   677: invokevirtual 213	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   680: invokevirtual 216	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   683: invokeinterface 240 2 0
    //   688: aload_2
    //   689: ldc_w 545
    //   692: invokevirtual 549	org/apache/http/client/methods/HttpRequestWrapper:containsHeader	(Ljava/lang/String;)Z
    //   695: ifne +59 -> 754
    //   698: aload_0
    //   699: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   702: invokeinterface 506 1 0
    //   707: ifeq +36 -> 743
    //   710: aload_0
    //   711: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   714: new 203	java/lang/StringBuilder
    //   717: dup
    //   718: invokespecial 204	java/lang/StringBuilder:<init>	()V
    //   721: ldc_w 551
    //   724: invokevirtual 210	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   727: aload 9
    //   729: invokevirtual 555	org/apache/http/auth/AuthState:getState	()Lorg/apache/http/auth/AuthProtocolState;
    //   732: invokevirtual 213	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   735: invokevirtual 216	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   738: invokeinterface 240 2 0
    //   743: aload_0
    //   744: getfield 70	org/apache/http/impl/execchain/MainClientExec:authenticator	Lorg/apache/http/impl/auth/HttpAuthenticator;
    //   747: aload_2
    //   748: aload 9
    //   750: aload_3
    //   751: invokevirtual 186	org/apache/http/impl/auth/HttpAuthenticator:generateAuthResponse	(Lorg/apache/http/HttpRequest;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)V
    //   754: aload_2
    //   755: ldc -77
    //   757: invokevirtual 549	org/apache/http/client/methods/HttpRequestWrapper:containsHeader	(Ljava/lang/String;)Z
    //   760: ifne +66 -> 826
    //   763: aload_1
    //   764: invokevirtual 558	org/apache/http/conn/routing/HttpRoute:isTunnelled	()Z
    //   767: ifne +59 -> 826
    //   770: aload_0
    //   771: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   774: invokeinterface 506 1 0
    //   779: ifeq +36 -> 815
    //   782: aload_0
    //   783: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   786: new 203	java/lang/StringBuilder
    //   789: dup
    //   790: invokespecial 204	java/lang/StringBuilder:<init>	()V
    //   793: ldc_w 560
    //   796: invokevirtual 210	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   799: aload 10
    //   801: invokevirtual 555	org/apache/http/auth/AuthState:getState	()Lorg/apache/http/auth/AuthProtocolState;
    //   804: invokevirtual 213	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   807: invokevirtual 216	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   810: invokeinterface 240 2 0
    //   815: aload_0
    //   816: getfield 70	org/apache/http/impl/execchain/MainClientExec:authenticator	Lorg/apache/http/impl/auth/HttpAuthenticator;
    //   819: aload_2
    //   820: aload 10
    //   822: aload_3
    //   823: invokevirtual 186	org/apache/http/impl/auth/HttpAuthenticator:generateAuthResponse	(Lorg/apache/http/HttpRequest;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)V
    //   826: aload_0
    //   827: getfield 92	org/apache/http/impl/execchain/MainClientExec:requestExecutor	Lorg/apache/http/protocol/HttpRequestExecutor;
    //   830: aload_2
    //   831: aload 16
    //   833: aload_3
    //   834: invokevirtual 190	org/apache/http/protocol/HttpRequestExecutor:execute	(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    //   837: astore 13
    //   839: aload_0
    //   840: getfield 96	org/apache/http/impl/execchain/MainClientExec:reuseStrategy	Lorg/apache/http/ConnectionReuseStrategy;
    //   843: aload 13
    //   845: aload_3
    //   846: invokeinterface 232 3 0
    //   851: ifeq +179 -> 1030
    //   854: aload_0
    //   855: getfield 98	org/apache/http/impl/execchain/MainClientExec:keepAliveStrategy	Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    //   858: aload 13
    //   860: aload_3
    //   861: invokeinterface 566 3 0
    //   866: lstore 7
    //   868: aload_0
    //   869: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   872: invokeinterface 506 1 0
    //   877: ifeq +75 -> 952
    //   880: lload 7
    //   882: lconst_0
    //   883: lcmp
    //   884: ifle +286 -> 1170
    //   887: new 203	java/lang/StringBuilder
    //   890: dup
    //   891: invokespecial 204	java/lang/StringBuilder:<init>	()V
    //   894: ldc_w 568
    //   897: invokevirtual 210	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   900: lload 7
    //   902: invokevirtual 571	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   905: ldc_w 573
    //   908: invokevirtual 210	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   911: getstatic 432	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   914: invokevirtual 213	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   917: invokevirtual 216	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   920: astore 11
    //   922: aload_0
    //   923: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   926: new 203	java/lang/StringBuilder
    //   929: dup
    //   930: invokespecial 204	java/lang/StringBuilder:<init>	()V
    //   933: ldc_w 575
    //   936: invokevirtual 210	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   939: aload 11
    //   941: invokevirtual 210	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   944: invokevirtual 216	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   947: invokeinterface 240 2 0
    //   952: aload 14
    //   954: lload 7
    //   956: getstatic 432	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   959: invokevirtual 579	org/apache/http/impl/execchain/ConnectionHolder:setValidFor	(JLjava/util/concurrent/TimeUnit;)V
    //   962: aload 14
    //   964: invokevirtual 582	org/apache/http/impl/execchain/ConnectionHolder:markReusable	()V
    //   967: aload 13
    //   969: astore 11
    //   971: aload_0
    //   972: aload 9
    //   974: aload 10
    //   976: aload_1
    //   977: aload 13
    //   979: aload_3
    //   980: invokespecial 584	org/apache/http/impl/execchain/MainClientExec:needAuthentication	(Lorg/apache/http/auth/AuthState;Lorg/apache/http/auth/AuthState;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/protocol/HttpClientContext;)Z
    //   983: ifeq -409 -> 574
    //   986: aload 13
    //   988: invokeinterface 244 1 0
    //   993: astore 11
    //   995: aload 14
    //   997: invokevirtual 587	org/apache/http/impl/execchain/ConnectionHolder:isReusable	()Z
    //   1000: ifeq +46 -> 1046
    //   1003: aload 11
    //   1005: invokestatic 250	org/apache/http/util/EntityUtils:consume	(Lorg/apache/http/HttpEntity;)V
    //   1008: aload_2
    //   1009: ldc_w 545
    //   1012: invokevirtual 588	org/apache/http/client/methods/HttpRequestWrapper:removeHeaders	(Ljava/lang/String;)V
    //   1015: aload_2
    //   1016: ldc -77
    //   1018: invokevirtual 588	org/apache/http/client/methods/HttpRequestWrapper:removeHeaders	(Ljava/lang/String;)V
    //   1021: iload 5
    //   1023: iconst_1
    //   1024: iadd
    //   1025: istore 5
    //   1027: goto -719 -> 308
    //   1030: aload 14
    //   1032: invokevirtual 591	org/apache/http/impl/execchain/ConnectionHolder:markNonReusable	()V
    //   1035: goto -68 -> 967
    //   1038: astore_1
    //   1039: aload 14
    //   1041: invokevirtual 492	org/apache/http/impl/execchain/ConnectionHolder:abortConnection	()V
    //   1044: aload_1
    //   1045: athrow
    //   1046: aload 16
    //   1048: invokeinterface 253 1 0
    //   1053: aload 10
    //   1055: invokevirtual 555	org/apache/http/auth/AuthState:getState	()Lorg/apache/http/auth/AuthProtocolState;
    //   1058: getstatic 597	org/apache/http/auth/AuthProtocolState:SUCCESS	Lorg/apache/http/auth/AuthProtocolState;
    //   1061: if_acmpne +41 -> 1102
    //   1064: aload 10
    //   1066: invokevirtual 601	org/apache/http/auth/AuthState:getAuthScheme	()Lorg/apache/http/auth/AuthScheme;
    //   1069: ifnull +33 -> 1102
    //   1072: aload 10
    //   1074: invokevirtual 601	org/apache/http/auth/AuthState:getAuthScheme	()Lorg/apache/http/auth/AuthScheme;
    //   1077: invokeinterface 606 1 0
    //   1082: ifeq +20 -> 1102
    //   1085: aload_0
    //   1086: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   1089: ldc_w 608
    //   1092: invokeinterface 240 2 0
    //   1097: aload 10
    //   1099: invokevirtual 611	org/apache/http/auth/AuthState:reset	()V
    //   1102: aload 9
    //   1104: invokevirtual 555	org/apache/http/auth/AuthState:getState	()Lorg/apache/http/auth/AuthProtocolState;
    //   1107: getstatic 597	org/apache/http/auth/AuthProtocolState:SUCCESS	Lorg/apache/http/auth/AuthProtocolState;
    //   1110: if_acmpne -102 -> 1008
    //   1113: aload 9
    //   1115: invokevirtual 601	org/apache/http/auth/AuthState:getAuthScheme	()Lorg/apache/http/auth/AuthScheme;
    //   1118: ifnull -110 -> 1008
    //   1121: aload 9
    //   1123: invokevirtual 601	org/apache/http/auth/AuthState:getAuthScheme	()Lorg/apache/http/auth/AuthScheme;
    //   1126: invokeinterface 606 1 0
    //   1131: ifeq -123 -> 1008
    //   1134: aload_0
    //   1135: getfield 45	org/apache/http/impl/execchain/MainClientExec:log	Lorg/apache/commons/logging/Log;
    //   1138: ldc_w 613
    //   1141: invokeinterface 240 2 0
    //   1146: aload 9
    //   1148: invokevirtual 611	org/apache/http/auth/AuthState:reset	()V
    //   1151: goto -143 -> 1008
    //   1154: aload 11
    //   1156: aload 14
    //   1158: invokestatic 535	org/apache/http/impl/execchain/Proxies:enhanceResponse	(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    //   1161: astore_1
    //   1162: aload_1
    //   1163: areturn
    //   1164: iconst_1
    //   1165: istore 5
    //   1167: goto -859 -> 308
    //   1170: ldc_w 615
    //   1173: astore 11
    //   1175: goto -253 -> 922
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1178	0	this	MainClientExec
    //   0	1178	1	paramHttpRoute	HttpRoute
    //   0	1178	2	paramHttpRequestWrapper	org.apache.http.client.methods.HttpRequestWrapper
    //   0	1178	3	paramHttpClientContext	HttpClientContext
    //   0	1178	4	paramHttpExecutionAware	org.apache.http.client.methods.HttpExecutionAware
    //   178	988	5	i	int
    //   492	10	6	j	int
    //   188	767	7	l	long
    //   32	1115	9	localObject1	Object
    //   28	1070	10	localObject2	Object
    //   61	1113	11	localObject3	Object
    //   108	470	12	localObject4	Object
    //   837	150	13	localHttpResponse	HttpResponse
    //   289	868	14	localConnectionHolder	ConnectionHolder
    //   171	317	15	localRequestConfig	RequestConfig
    //   202	845	16	localHttpClientConnection	HttpClientConnection
    // Exception table:
    //   from	to	target	type
    //   296	305	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   314	332	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   408	429	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   437	476	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   476	487	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   487	494	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   499	508	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   513	534	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   543	568	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   568	574	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   582	601	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   605	611	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   611	619	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   623	632	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   632	644	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   644	688	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   688	743	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   743	754	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   754	815	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   815	826	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   826	880	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   887	922	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   922	952	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   952	967	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   971	1008	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   1008	1021	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   1030	1035	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   1046	1102	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   1102	1151	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   1154	1162	332	org/apache/http/impl/conn/ConnectionShutdownException
    //   173	180	358	java/lang/InterruptedException
    //   190	204	358	java/lang/InterruptedException
    //   173	180	377	java/util/concurrent/ExecutionException
    //   190	204	377	java/util/concurrent/ExecutionException
    //   296	305	429	org/apache/http/HttpException
    //   314	332	429	org/apache/http/HttpException
    //   408	429	429	org/apache/http/HttpException
    //   437	476	429	org/apache/http/HttpException
    //   476	487	429	org/apache/http/HttpException
    //   487	494	429	org/apache/http/HttpException
    //   499	508	429	org/apache/http/HttpException
    //   513	534	429	org/apache/http/HttpException
    //   543	568	429	org/apache/http/HttpException
    //   568	574	429	org/apache/http/HttpException
    //   582	601	429	org/apache/http/HttpException
    //   605	611	429	org/apache/http/HttpException
    //   611	619	429	org/apache/http/HttpException
    //   623	632	429	org/apache/http/HttpException
    //   632	644	429	org/apache/http/HttpException
    //   644	688	429	org/apache/http/HttpException
    //   688	743	429	org/apache/http/HttpException
    //   743	754	429	org/apache/http/HttpException
    //   754	815	429	org/apache/http/HttpException
    //   815	826	429	org/apache/http/HttpException
    //   826	880	429	org/apache/http/HttpException
    //   887	922	429	org/apache/http/HttpException
    //   922	952	429	org/apache/http/HttpException
    //   952	967	429	org/apache/http/HttpException
    //   971	1008	429	org/apache/http/HttpException
    //   1008	1021	429	org/apache/http/HttpException
    //   1030	1035	429	org/apache/http/HttpException
    //   1046	1102	429	org/apache/http/HttpException
    //   1102	1151	429	org/apache/http/HttpException
    //   1154	1162	429	org/apache/http/HttpException
    //   296	305	534	java/io/IOException
    //   314	332	534	java/io/IOException
    //   408	429	534	java/io/IOException
    //   437	476	534	java/io/IOException
    //   476	487	534	java/io/IOException
    //   487	494	534	java/io/IOException
    //   499	508	534	java/io/IOException
    //   513	534	534	java/io/IOException
    //   543	568	534	java/io/IOException
    //   568	574	534	java/io/IOException
    //   582	601	534	java/io/IOException
    //   605	611	534	java/io/IOException
    //   611	619	534	java/io/IOException
    //   623	632	534	java/io/IOException
    //   632	644	534	java/io/IOException
    //   644	688	534	java/io/IOException
    //   688	743	534	java/io/IOException
    //   743	754	534	java/io/IOException
    //   754	815	534	java/io/IOException
    //   815	826	534	java/io/IOException
    //   826	880	534	java/io/IOException
    //   887	922	534	java/io/IOException
    //   922	952	534	java/io/IOException
    //   952	967	534	java/io/IOException
    //   971	1008	534	java/io/IOException
    //   1008	1021	534	java/io/IOException
    //   1030	1035	534	java/io/IOException
    //   1046	1102	534	java/io/IOException
    //   1102	1151	534	java/io/IOException
    //   1154	1162	534	java/io/IOException
    //   476	487	542	org/apache/http/impl/execchain/TunnelRefusedException
    //   296	305	1038	java/lang/RuntimeException
    //   314	332	1038	java/lang/RuntimeException
    //   408	429	1038	java/lang/RuntimeException
    //   437	476	1038	java/lang/RuntimeException
    //   476	487	1038	java/lang/RuntimeException
    //   487	494	1038	java/lang/RuntimeException
    //   499	508	1038	java/lang/RuntimeException
    //   513	534	1038	java/lang/RuntimeException
    //   543	568	1038	java/lang/RuntimeException
    //   568	574	1038	java/lang/RuntimeException
    //   582	601	1038	java/lang/RuntimeException
    //   605	611	1038	java/lang/RuntimeException
    //   611	619	1038	java/lang/RuntimeException
    //   623	632	1038	java/lang/RuntimeException
    //   632	644	1038	java/lang/RuntimeException
    //   644	688	1038	java/lang/RuntimeException
    //   688	743	1038	java/lang/RuntimeException
    //   743	754	1038	java/lang/RuntimeException
    //   754	815	1038	java/lang/RuntimeException
    //   815	826	1038	java/lang/RuntimeException
    //   826	880	1038	java/lang/RuntimeException
    //   887	922	1038	java/lang/RuntimeException
    //   922	952	1038	java/lang/RuntimeException
    //   952	967	1038	java/lang/RuntimeException
    //   971	1008	1038	java/lang/RuntimeException
    //   1008	1021	1038	java/lang/RuntimeException
    //   1030	1035	1038	java/lang/RuntimeException
    //   1046	1102	1038	java/lang/RuntimeException
    //   1102	1151	1038	java/lang/RuntimeException
    //   1154	1162	1038	java/lang/RuntimeException
  }
}
