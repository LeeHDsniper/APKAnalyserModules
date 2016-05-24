package org.apache.http.impl.client;

import java.io.IOException;
import java.net.Socket;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.StatusLine;
import org.apache.http.auth.AuthSchemeRegistry;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.AuthState;
import org.apache.http.auth.Credentials;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.params.HttpClientParamConfig;
import org.apache.http.client.protocol.RequestClientConnControl;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.conn.HttpConnectionFactory;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.RouteInfo.LayerType;
import org.apache.http.conn.routing.RouteInfo.TunnelType;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.impl.DefaultConnectionReuseStrategy;
import org.apache.http.impl.auth.BasicSchemeFactory;
import org.apache.http.impl.auth.DigestSchemeFactory;
import org.apache.http.impl.auth.HttpAuthenticator;
import org.apache.http.impl.auth.KerberosSchemeFactory;
import org.apache.http.impl.auth.NTLMSchemeFactory;
import org.apache.http.impl.auth.SPNegoSchemeFactory;
import org.apache.http.impl.conn.ManagedHttpClientConnectionFactory;
import org.apache.http.impl.execchain.TunnelRefusedException;
import org.apache.http.message.BasicHttpRequest;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParamConfig;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.protocol.ImmutableHttpProcessor;
import org.apache.http.protocol.RequestTargetHost;
import org.apache.http.protocol.RequestUserAgent;
import org.apache.http.util.Args;
import org.apache.http.util.EntityUtils;

public class ProxyClient
{
  private final AuthSchemeRegistry authSchemeRegistry;
  private final HttpAuthenticator authenticator;
  private final HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> connFactory;
  private final ConnectionConfig connectionConfig;
  private final HttpProcessor httpProcessor;
  private final AuthState proxyAuthState;
  private final ProxyAuthenticationStrategy proxyAuthStrategy;
  private final RequestConfig requestConfig;
  private final HttpRequestExecutor requestExec;
  private final ConnectionReuseStrategy reuseStrategy;
  
  public ProxyClient()
  {
    this(null, null, null);
  }
  
  public ProxyClient(RequestConfig paramRequestConfig)
  {
    this(null, null, paramRequestConfig);
  }
  
  public ProxyClient(HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> paramHttpConnectionFactory, ConnectionConfig paramConnectionConfig, RequestConfig paramRequestConfig)
  {
    if (paramHttpConnectionFactory != null)
    {
      connFactory = paramHttpConnectionFactory;
      if (paramConnectionConfig == null) {
        break label230;
      }
      label17:
      connectionConfig = paramConnectionConfig;
      if (paramRequestConfig == null) {
        break label237;
      }
    }
    for (;;)
    {
      requestConfig = paramRequestConfig;
      httpProcessor = new ImmutableHttpProcessor(new HttpRequestInterceptor[] { new RequestTargetHost(), new RequestClientConnControl(), new RequestUserAgent() });
      requestExec = new HttpRequestExecutor();
      proxyAuthStrategy = new ProxyAuthenticationStrategy();
      authenticator = new HttpAuthenticator();
      proxyAuthState = new AuthState();
      authSchemeRegistry = new AuthSchemeRegistry();
      authSchemeRegistry.register("Basic", new BasicSchemeFactory());
      authSchemeRegistry.register("Digest", new DigestSchemeFactory());
      authSchemeRegistry.register("NTLM", new NTLMSchemeFactory());
      authSchemeRegistry.register("negotiate", new SPNegoSchemeFactory());
      authSchemeRegistry.register("Kerberos", new KerberosSchemeFactory());
      reuseStrategy = new DefaultConnectionReuseStrategy();
      return;
      paramHttpConnectionFactory = ManagedHttpClientConnectionFactory.INSTANCE;
      break;
      label230:
      paramConnectionConfig = ConnectionConfig.DEFAULT;
      break label17;
      label237:
      paramRequestConfig = RequestConfig.DEFAULT;
    }
  }
  
  @Deprecated
  public ProxyClient(HttpParams paramHttpParams)
  {
    this(null, HttpParamConfig.getConnectionConfig(paramHttpParams), HttpClientParamConfig.getRequestConfig(paramHttpParams));
  }
  
  @Deprecated
  public AuthSchemeRegistry getAuthSchemeRegistry()
  {
    return authSchemeRegistry;
  }
  
  @Deprecated
  public HttpParams getParams()
  {
    return new BasicHttpParams();
  }
  
  public Socket tunnel(HttpHost paramHttpHost1, HttpHost paramHttpHost2, Credentials paramCredentials)
    throws IOException, HttpException
  {
    Args.notNull(paramHttpHost1, "Proxy host");
    Args.notNull(paramHttpHost2, "Target host");
    Args.notNull(paramCredentials, "Credentials");
    Object localObject2 = paramHttpHost2;
    Object localObject1 = localObject2;
    if (((HttpHost)localObject2).getPort() <= 0) {
      localObject1 = new HttpHost(((HttpHost)localObject2).getHostName(), 80, ((HttpHost)localObject2).getSchemeName());
    }
    HttpRoute localHttpRoute = new HttpRoute((HttpHost)localObject1, requestConfig.getLocalAddress(), paramHttpHost1, false, RouteInfo.TunnelType.TUNNELLED, RouteInfo.LayerType.PLAIN);
    localObject2 = (ManagedHttpClientConnection)connFactory.create(localHttpRoute, connectionConfig);
    BasicHttpContext localBasicHttpContext = new BasicHttpContext();
    localObject1 = new BasicHttpRequest("CONNECT", ((HttpHost)localObject1).toHostString(), HttpVersion.HTTP_1_1);
    BasicCredentialsProvider localBasicCredentialsProvider = new BasicCredentialsProvider();
    localBasicCredentialsProvider.setCredentials(new AuthScope(paramHttpHost1), paramCredentials);
    localBasicHttpContext.setAttribute("http.target_host", paramHttpHost2);
    localBasicHttpContext.setAttribute("http.connection", localObject2);
    localBasicHttpContext.setAttribute("http.request", localObject1);
    localBasicHttpContext.setAttribute("http.route", localHttpRoute);
    localBasicHttpContext.setAttribute("http.auth.proxy-scope", proxyAuthState);
    localBasicHttpContext.setAttribute("http.auth.credentials-provider", localBasicCredentialsProvider);
    localBasicHttpContext.setAttribute("http.authscheme-registry", authSchemeRegistry);
    localBasicHttpContext.setAttribute("http.request-config", requestConfig);
    requestExec.preProcess((HttpRequest)localObject1, httpProcessor, localBasicHttpContext);
    if (!((ManagedHttpClientConnection)localObject2).isOpen()) {
      ((ManagedHttpClientConnection)localObject2).bind(new Socket(paramHttpHost1.getHostName(), paramHttpHost1.getPort()));
    }
    authenticator.generateAuthResponse((HttpRequest)localObject1, proxyAuthState, localBasicHttpContext);
    paramHttpHost2 = requestExec.execute((HttpRequest)localObject1, (HttpClientConnection)localObject2, localBasicHttpContext);
    if (paramHttpHost2.getStatusLine().getStatusCode() < 200) {
      throw new HttpException("Unexpected response to CONNECT request: " + paramHttpHost2.getStatusLine());
    }
    if ((authenticator.isAuthenticationRequested(paramHttpHost1, paramHttpHost2, proxyAuthStrategy, proxyAuthState, localBasicHttpContext)) && (authenticator.handleAuthChallenge(paramHttpHost1, paramHttpHost2, proxyAuthStrategy, proxyAuthState, localBasicHttpContext)))
    {
      if (reuseStrategy.keepAlive(paramHttpHost2, localBasicHttpContext)) {
        EntityUtils.consume(paramHttpHost2.getEntity());
      }
      for (;;)
      {
        ((HttpRequest)localObject1).removeHeaders("Proxy-Authorization");
        break;
        ((ManagedHttpClientConnection)localObject2).close();
      }
    }
    if (paramHttpHost2.getStatusLine().getStatusCode() > 299)
    {
      paramHttpHost1 = paramHttpHost2.getEntity();
      if (paramHttpHost1 != null) {
        paramHttpHost2.setEntity(new BufferedHttpEntity(paramHttpHost1));
      }
      ((ManagedHttpClientConnection)localObject2).close();
      throw new TunnelRefusedException("CONNECT refused by proxy: " + paramHttpHost2.getStatusLine(), paramHttpHost2);
    }
    return ((ManagedHttpClientConnection)localObject2).getSocket();
  }
}
