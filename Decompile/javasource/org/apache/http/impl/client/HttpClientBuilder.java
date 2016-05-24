package org.apache.http.impl.client;

import java.io.Closeable;
import java.net.ProxySelector;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.auth.AuthSchemeProvider;
import org.apache.http.client.AuthenticationStrategy;
import org.apache.http.client.BackoffManager;
import org.apache.http.client.ConnectionBackoffStrategy;
import org.apache.http.client.CookieStore;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.RedirectStrategy;
import org.apache.http.client.ServiceUnavailableRetryStrategy;
import org.apache.http.client.UserTokenHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.protocol.RequestAcceptEncoding;
import org.apache.http.client.protocol.RequestAddCookies;
import org.apache.http.client.protocol.RequestAuthCache;
import org.apache.http.client.protocol.RequestClientConnControl;
import org.apache.http.client.protocol.RequestDefaultHeaders;
import org.apache.http.client.protocol.RequestExpectContinue;
import org.apache.http.client.protocol.ResponseContentEncoding;
import org.apache.http.client.protocol.ResponseProcessCookies;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.Lookup;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.config.SocketConfig;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.conn.routing.HttpRoutePlanner;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.conn.ssl.X509HostnameVerifier;
import org.apache.http.cookie.CookieSpecProvider;
import org.apache.http.impl.DefaultConnectionReuseStrategy;
import org.apache.http.impl.NoConnectionReuseStrategy;
import org.apache.http.impl.auth.BasicSchemeFactory;
import org.apache.http.impl.auth.DigestSchemeFactory;
import org.apache.http.impl.auth.KerberosSchemeFactory;
import org.apache.http.impl.auth.NTLMSchemeFactory;
import org.apache.http.impl.auth.SPNegoSchemeFactory;
import org.apache.http.impl.conn.DefaultProxyRoutePlanner;
import org.apache.http.impl.conn.DefaultRoutePlanner;
import org.apache.http.impl.conn.DefaultSchemePortResolver;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.impl.conn.SystemDefaultRoutePlanner;
import org.apache.http.impl.cookie.BestMatchSpecFactory;
import org.apache.http.impl.cookie.BrowserCompatSpecFactory;
import org.apache.http.impl.cookie.IgnoreSpecFactory;
import org.apache.http.impl.cookie.NetscapeDraftSpecFactory;
import org.apache.http.impl.cookie.RFC2109SpecFactory;
import org.apache.http.impl.cookie.RFC2965SpecFactory;
import org.apache.http.impl.execchain.BackoffStrategyExec;
import org.apache.http.impl.execchain.ClientExecChain;
import org.apache.http.impl.execchain.MainClientExec;
import org.apache.http.impl.execchain.ProtocolExec;
import org.apache.http.impl.execchain.RedirectExec;
import org.apache.http.impl.execchain.RetryExec;
import org.apache.http.impl.execchain.ServiceUnavailableRetryExec;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpProcessorBuilder;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.protocol.RequestContent;
import org.apache.http.protocol.RequestTargetHost;
import org.apache.http.protocol.RequestUserAgent;
import org.apache.http.util.TextUtils;
import org.apache.http.util.VersionInfo;

@NotThreadSafe
public class HttpClientBuilder
{
  static final String DEFAULT_USER_AGENT;
  private boolean authCachingDisabled;
  private Lookup<AuthSchemeProvider> authSchemeRegistry;
  private boolean automaticRetriesDisabled;
  private BackoffManager backoffManager;
  private List<Closeable> closeables;
  private HttpClientConnectionManager connManager;
  private ConnectionBackoffStrategy connectionBackoffStrategy;
  private boolean connectionStateDisabled;
  private boolean contentCompressionDisabled;
  private boolean cookieManagementDisabled;
  private Lookup<CookieSpecProvider> cookieSpecRegistry;
  private CookieStore cookieStore;
  private CredentialsProvider credentialsProvider;
  private ConnectionConfig defaultConnectionConfig;
  private Collection<? extends Header> defaultHeaders;
  private RequestConfig defaultRequestConfig;
  private SocketConfig defaultSocketConfig;
  private X509HostnameVerifier hostnameVerifier;
  private HttpProcessor httpprocessor;
  private ConnectionKeepAliveStrategy keepAliveStrategy;
  private int maxConnPerRoute = 0;
  private int maxConnTotal = 0;
  private HttpHost proxy;
  private AuthenticationStrategy proxyAuthStrategy;
  private boolean redirectHandlingDisabled;
  private RedirectStrategy redirectStrategy;
  private HttpRequestExecutor requestExec;
  private LinkedList<HttpRequestInterceptor> requestFirst;
  private LinkedList<HttpRequestInterceptor> requestLast;
  private LinkedList<HttpResponseInterceptor> responseFirst;
  private LinkedList<HttpResponseInterceptor> responseLast;
  private HttpRequestRetryHandler retryHandler;
  private ConnectionReuseStrategy reuseStrategy;
  private HttpRoutePlanner routePlanner;
  private SchemePortResolver schemePortResolver;
  private ServiceUnavailableRetryStrategy serviceUnavailStrategy;
  private LayeredConnectionSocketFactory sslSocketFactory;
  private SSLContext sslcontext;
  private boolean systemProperties;
  private AuthenticationStrategy targetAuthStrategy;
  private String userAgent;
  private UserTokenHandler userTokenHandler;
  
  static
  {
    Object localObject = VersionInfo.loadVersionInfo("org.apache.http.client", HttpClientBuilder.class.getClassLoader());
    if (localObject != null) {}
    for (localObject = ((VersionInfo)localObject).getRelease();; localObject = "UNAVAILABLE")
    {
      DEFAULT_USER_AGENT = "Apache-HttpClient/" + (String)localObject + " (java 1.5)";
      return;
    }
  }
  
  protected HttpClientBuilder() {}
  
  public static HttpClientBuilder create()
  {
    return new HttpClientBuilder();
  }
  
  private static String[] split(String paramString)
  {
    if (TextUtils.isBlank(paramString)) {
      return null;
    }
    return paramString.split(" *, *");
  }
  
  protected void addCloseable(Closeable paramCloseable)
  {
    if (paramCloseable == null) {
      return;
    }
    if (closeables == null) {
      closeables = new ArrayList();
    }
    closeables.add(paramCloseable);
  }
  
  public final HttpClientBuilder addInterceptorFirst(HttpRequestInterceptor paramHttpRequestInterceptor)
  {
    if (paramHttpRequestInterceptor == null) {
      return this;
    }
    if (requestFirst == null) {
      requestFirst = new LinkedList();
    }
    requestFirst.addFirst(paramHttpRequestInterceptor);
    return this;
  }
  
  public final HttpClientBuilder addInterceptorFirst(HttpResponseInterceptor paramHttpResponseInterceptor)
  {
    if (paramHttpResponseInterceptor == null) {
      return this;
    }
    if (responseFirst == null) {
      responseFirst = new LinkedList();
    }
    responseFirst.addFirst(paramHttpResponseInterceptor);
    return this;
  }
  
  public final HttpClientBuilder addInterceptorLast(HttpRequestInterceptor paramHttpRequestInterceptor)
  {
    if (paramHttpRequestInterceptor == null) {
      return this;
    }
    if (requestLast == null) {
      requestLast = new LinkedList();
    }
    requestLast.addLast(paramHttpRequestInterceptor);
    return this;
  }
  
  public final HttpClientBuilder addInterceptorLast(HttpResponseInterceptor paramHttpResponseInterceptor)
  {
    if (paramHttpResponseInterceptor == null) {
      return this;
    }
    if (responseLast == null) {
      responseLast = new LinkedList();
    }
    responseLast.addLast(paramHttpResponseInterceptor);
    return this;
  }
  
  public CloseableHttpClient build()
  {
    Object localObject1 = requestExec;
    Object localObject3 = localObject1;
    if (localObject1 == null) {
      localObject3 = new HttpRequestExecutor();
    }
    localObject1 = connManager;
    Object localObject4 = localObject1;
    label76:
    Object localObject5;
    if (localObject1 == null)
    {
      localObject2 = sslSocketFactory;
      localObject1 = localObject2;
      if (localObject2 == null)
      {
        if (!systemProperties) {
          break label499;
        }
        localObject1 = split(System.getProperty("https.protocols"));
        if (!systemProperties) {
          break label504;
        }
        localObject2 = split(System.getProperty("https.cipherSuites"));
        localObject5 = hostnameVerifier;
        localObject4 = localObject5;
        if (localObject5 == null) {
          localObject4 = SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER;
        }
        if (sslcontext == null) {
          break label509;
        }
        localObject1 = new SSLConnectionSocketFactory(sslcontext, (String[])localObject1, (String[])localObject2, (X509HostnameVerifier)localObject4);
      }
      label119:
      localObject4 = new PoolingHttpClientConnectionManager(RegistryBuilder.create().register("http", PlainConnectionSocketFactory.getSocketFactory()).register("https", localObject1).build());
      if (defaultSocketConfig != null) {
        ((PoolingHttpClientConnectionManager)localObject4).setDefaultSocketConfig(defaultSocketConfig);
      }
      if (defaultConnectionConfig != null) {
        ((PoolingHttpClientConnectionManager)localObject4).setDefaultConnectionConfig(defaultConnectionConfig);
      }
      if ((systemProperties) && ("true".equalsIgnoreCase(System.getProperty("http.keepAlive", "true"))))
      {
        int i = Integer.parseInt(System.getProperty("http.maxConnections", "5"));
        ((PoolingHttpClientConnectionManager)localObject4).setDefaultMaxPerRoute(i);
        ((PoolingHttpClientConnectionManager)localObject4).setMaxTotal(i * 2);
      }
      if (maxConnTotal > 0) {
        ((PoolingHttpClientConnectionManager)localObject4).setMaxTotal(maxConnTotal);
      }
      if (maxConnPerRoute > 0) {
        ((PoolingHttpClientConnectionManager)localObject4).setDefaultMaxPerRoute(maxConnPerRoute);
      }
    }
    Object localObject2 = reuseStrategy;
    localObject1 = localObject2;
    label304:
    Object localObject6;
    Object localObject7;
    Object localObject8;
    if (localObject2 == null)
    {
      if (!systemProperties) {
        break label560;
      }
      if ("true".equalsIgnoreCase(System.getProperty("http.keepAlive", "true"))) {
        localObject1 = DefaultConnectionReuseStrategy.INSTANCE;
      }
    }
    else
    {
      localObject2 = keepAliveStrategy;
      localObject5 = localObject2;
      if (localObject2 == null) {
        localObject5 = DefaultConnectionKeepAliveStrategy.INSTANCE;
      }
      localObject2 = targetAuthStrategy;
      localObject6 = localObject2;
      if (localObject2 == null) {
        localObject6 = TargetAuthenticationStrategy.INSTANCE;
      }
      localObject2 = proxyAuthStrategy;
      localObject7 = localObject2;
      if (localObject2 == null) {
        localObject7 = ProxyAuthenticationStrategy.INSTANCE;
      }
      localObject8 = userTokenHandler;
      localObject2 = localObject8;
      if (localObject8 == null) {
        if (connectionStateDisabled) {
          break label567;
        }
      }
    }
    label499:
    label504:
    label509:
    label560:
    label567:
    for (localObject2 = DefaultUserTokenHandler.INSTANCE;; localObject2 = NoopUserTokenHandler.INSTANCE)
    {
      localObject3 = decorateMainExec(new MainClientExec((HttpRequestExecutor)localObject3, (HttpClientConnectionManager)localObject4, (ConnectionReuseStrategy)localObject1, (ConnectionKeepAliveStrategy)localObject5, (AuthenticationStrategy)localObject6, (AuthenticationStrategy)localObject7, (UserTokenHandler)localObject2));
      localObject2 = httpprocessor;
      localObject1 = localObject2;
      if (localObject2 != null) {
        break label875;
      }
      localObject2 = userAgent;
      localObject1 = localObject2;
      if (localObject2 == null)
      {
        if (systemProperties) {
          localObject2 = System.getProperty("http.agent");
        }
        localObject1 = localObject2;
        if (localObject2 == null) {
          localObject1 = DEFAULT_USER_AGENT;
        }
      }
      localObject2 = HttpProcessorBuilder.create();
      if (requestFirst == null) {
        break label574;
      }
      localObject5 = requestFirst.iterator();
      while (((Iterator)localObject5).hasNext()) {
        ((HttpProcessorBuilder)localObject2).addFirst((HttpRequestInterceptor)((Iterator)localObject5).next());
      }
      localObject1 = null;
      break;
      localObject2 = null;
      break label76;
      if (systemProperties)
      {
        localObject1 = new SSLConnectionSocketFactory((SSLSocketFactory)SSLSocketFactory.getDefault(), (String[])localObject1, (String[])localObject2, (X509HostnameVerifier)localObject4);
        break label119;
      }
      localObject1 = new SSLConnectionSocketFactory(SSLContexts.createDefault(), (X509HostnameVerifier)localObject4);
      break label119;
      localObject1 = NoConnectionReuseStrategy.INSTANCE;
      break label304;
      localObject1 = DefaultConnectionReuseStrategy.INSTANCE;
      break label304;
    }
    label574:
    if (responseFirst != null)
    {
      localObject5 = responseFirst.iterator();
      while (((Iterator)localObject5).hasNext()) {
        ((HttpProcessorBuilder)localObject2).addFirst((HttpResponseInterceptor)((Iterator)localObject5).next());
      }
    }
    ((HttpProcessorBuilder)localObject2).addAll(new HttpRequestInterceptor[] { new RequestDefaultHeaders(defaultHeaders), new RequestContent(), new RequestTargetHost(), new RequestClientConnControl(), new RequestUserAgent((String)localObject1), new RequestExpectContinue() });
    if (!cookieManagementDisabled) {
      ((HttpProcessorBuilder)localObject2).add(new RequestAddCookies());
    }
    if (!contentCompressionDisabled) {
      ((HttpProcessorBuilder)localObject2).add(new RequestAcceptEncoding());
    }
    if (!authCachingDisabled) {
      ((HttpProcessorBuilder)localObject2).add(new RequestAuthCache());
    }
    if (!cookieManagementDisabled) {
      ((HttpProcessorBuilder)localObject2).add(new ResponseProcessCookies());
    }
    if (!contentCompressionDisabled) {
      ((HttpProcessorBuilder)localObject2).add(new ResponseContentEncoding());
    }
    if (requestLast != null)
    {
      localObject1 = requestLast.iterator();
      while (((Iterator)localObject1).hasNext()) {
        ((HttpProcessorBuilder)localObject2).addLast((HttpRequestInterceptor)((Iterator)localObject1).next());
      }
    }
    if (responseLast != null)
    {
      localObject1 = responseLast.iterator();
      while (((Iterator)localObject1).hasNext()) {
        ((HttpProcessorBuilder)localObject2).addLast((HttpResponseInterceptor)((Iterator)localObject1).next());
      }
    }
    localObject1 = ((HttpProcessorBuilder)localObject2).build();
    label875:
    localObject3 = decorateProtocolExec(new ProtocolExec((ClientExecChain)localObject3, (HttpProcessor)localObject1));
    localObject2 = localObject3;
    if (!automaticRetriesDisabled)
    {
      localObject2 = retryHandler;
      localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = DefaultHttpRequestRetryHandler.INSTANCE;
      }
      localObject2 = new RetryExec((ClientExecChain)localObject3, (HttpRequestRetryHandler)localObject1);
    }
    localObject3 = routePlanner;
    localObject1 = localObject3;
    if (localObject3 == null)
    {
      localObject3 = schemePortResolver;
      localObject1 = localObject3;
      if (localObject3 == null) {
        localObject1 = DefaultSchemePortResolver.INSTANCE;
      }
      if (proxy != null) {
        localObject1 = new DefaultProxyRoutePlanner(proxy, (SchemePortResolver)localObject1);
      }
    }
    else
    {
      localObject3 = localObject2;
      if (!redirectHandlingDisabled)
      {
        localObject5 = redirectStrategy;
        localObject3 = localObject5;
        if (localObject5 == null) {
          localObject3 = DefaultRedirectStrategy.INSTANCE;
        }
        localObject3 = new RedirectExec((ClientExecChain)localObject2, (HttpRoutePlanner)localObject1, (RedirectStrategy)localObject3);
      }
      localObject5 = serviceUnavailStrategy;
      localObject2 = localObject3;
      if (localObject5 != null) {
        localObject2 = new ServiceUnavailableRetryExec((ClientExecChain)localObject3, (ServiceUnavailableRetryStrategy)localObject5);
      }
      localObject5 = backoffManager;
      localObject6 = connectionBackoffStrategy;
      localObject3 = localObject2;
      if (localObject5 != null)
      {
        localObject3 = localObject2;
        if (localObject6 != null) {
          localObject3 = new BackoffStrategyExec((ClientExecChain)localObject2, (ConnectionBackoffStrategy)localObject6, (BackoffManager)localObject5);
        }
      }
      localObject2 = authSchemeRegistry;
      localObject5 = localObject2;
      if (localObject2 == null) {
        localObject5 = RegistryBuilder.create().register("Basic", new BasicSchemeFactory()).register("Digest", new DigestSchemeFactory()).register("NTLM", new NTLMSchemeFactory()).register("negotiate", new SPNegoSchemeFactory()).register("Kerberos", new KerberosSchemeFactory()).build();
      }
      localObject2 = cookieSpecRegistry;
      localObject6 = localObject2;
      if (localObject2 == null) {
        localObject6 = RegistryBuilder.create().register("best-match", new BestMatchSpecFactory()).register("standard", new RFC2965SpecFactory()).register("compatibility", new BrowserCompatSpecFactory()).register("netscape", new NetscapeDraftSpecFactory()).register("ignoreCookies", new IgnoreSpecFactory()).register("rfc2109", new RFC2109SpecFactory()).register("rfc2965", new RFC2965SpecFactory()).build();
      }
      localObject2 = cookieStore;
      localObject7 = localObject2;
      if (localObject2 == null) {
        localObject7 = new BasicCookieStore();
      }
      localObject8 = credentialsProvider;
      localObject2 = localObject8;
      if (localObject8 == null)
      {
        if (!systemProperties) {
          break label1427;
        }
        localObject2 = new SystemDefaultCredentialsProvider();
      }
      label1336:
      if (defaultRequestConfig == null) {
        break label1438;
      }
      localObject8 = defaultRequestConfig;
      label1349:
      if (closeables == null) {
        break label1446;
      }
    }
    label1427:
    label1438:
    label1446:
    for (ArrayList localArrayList = new ArrayList(closeables);; localArrayList = null)
    {
      return new InternalHttpClient((ClientExecChain)localObject3, (HttpClientConnectionManager)localObject4, (HttpRoutePlanner)localObject1, (Lookup)localObject6, (Lookup)localObject5, (CookieStore)localObject7, (CredentialsProvider)localObject2, (RequestConfig)localObject8, localArrayList);
      if (systemProperties)
      {
        localObject1 = new SystemDefaultRoutePlanner((SchemePortResolver)localObject1, ProxySelector.getDefault());
        break;
      }
      localObject1 = new DefaultRoutePlanner((SchemePortResolver)localObject1);
      break;
      localObject2 = new BasicCredentialsProvider();
      break label1336;
      localObject8 = RequestConfig.DEFAULT;
      break label1349;
    }
  }
  
  protected ClientExecChain decorateMainExec(ClientExecChain paramClientExecChain)
  {
    return paramClientExecChain;
  }
  
  protected ClientExecChain decorateProtocolExec(ClientExecChain paramClientExecChain)
  {
    return paramClientExecChain;
  }
  
  public final HttpClientBuilder disableAuthCaching()
  {
    authCachingDisabled = true;
    return this;
  }
  
  public final HttpClientBuilder disableAutomaticRetries()
  {
    automaticRetriesDisabled = true;
    return this;
  }
  
  public final HttpClientBuilder disableConnectionState()
  {
    connectionStateDisabled = true;
    return this;
  }
  
  public final HttpClientBuilder disableContentCompression()
  {
    contentCompressionDisabled = true;
    return this;
  }
  
  public final HttpClientBuilder disableCookieManagement()
  {
    cookieManagementDisabled = true;
    return this;
  }
  
  public final HttpClientBuilder disableRedirectHandling()
  {
    redirectHandlingDisabled = true;
    return this;
  }
  
  public final HttpClientBuilder setBackoffManager(BackoffManager paramBackoffManager)
  {
    backoffManager = paramBackoffManager;
    return this;
  }
  
  public final HttpClientBuilder setConnectionBackoffStrategy(ConnectionBackoffStrategy paramConnectionBackoffStrategy)
  {
    connectionBackoffStrategy = paramConnectionBackoffStrategy;
    return this;
  }
  
  public final HttpClientBuilder setConnectionManager(HttpClientConnectionManager paramHttpClientConnectionManager)
  {
    connManager = paramHttpClientConnectionManager;
    return this;
  }
  
  public final HttpClientBuilder setConnectionReuseStrategy(ConnectionReuseStrategy paramConnectionReuseStrategy)
  {
    reuseStrategy = paramConnectionReuseStrategy;
    return this;
  }
  
  public final HttpClientBuilder setDefaultAuthSchemeRegistry(Lookup<AuthSchemeProvider> paramLookup)
  {
    authSchemeRegistry = paramLookup;
    return this;
  }
  
  public final HttpClientBuilder setDefaultConnectionConfig(ConnectionConfig paramConnectionConfig)
  {
    defaultConnectionConfig = paramConnectionConfig;
    return this;
  }
  
  public final HttpClientBuilder setDefaultCookieSpecRegistry(Lookup<CookieSpecProvider> paramLookup)
  {
    cookieSpecRegistry = paramLookup;
    return this;
  }
  
  public final HttpClientBuilder setDefaultCookieStore(CookieStore paramCookieStore)
  {
    cookieStore = paramCookieStore;
    return this;
  }
  
  public final HttpClientBuilder setDefaultCredentialsProvider(CredentialsProvider paramCredentialsProvider)
  {
    credentialsProvider = paramCredentialsProvider;
    return this;
  }
  
  public final HttpClientBuilder setDefaultHeaders(Collection<? extends Header> paramCollection)
  {
    defaultHeaders = paramCollection;
    return this;
  }
  
  public final HttpClientBuilder setDefaultRequestConfig(RequestConfig paramRequestConfig)
  {
    defaultRequestConfig = paramRequestConfig;
    return this;
  }
  
  public final HttpClientBuilder setDefaultSocketConfig(SocketConfig paramSocketConfig)
  {
    defaultSocketConfig = paramSocketConfig;
    return this;
  }
  
  public final HttpClientBuilder setHostnameVerifier(X509HostnameVerifier paramX509HostnameVerifier)
  {
    hostnameVerifier = paramX509HostnameVerifier;
    return this;
  }
  
  public final HttpClientBuilder setHttpProcessor(HttpProcessor paramHttpProcessor)
  {
    httpprocessor = paramHttpProcessor;
    return this;
  }
  
  public final HttpClientBuilder setKeepAliveStrategy(ConnectionKeepAliveStrategy paramConnectionKeepAliveStrategy)
  {
    keepAliveStrategy = paramConnectionKeepAliveStrategy;
    return this;
  }
  
  public final HttpClientBuilder setMaxConnPerRoute(int paramInt)
  {
    maxConnPerRoute = paramInt;
    return this;
  }
  
  public final HttpClientBuilder setMaxConnTotal(int paramInt)
  {
    maxConnTotal = paramInt;
    return this;
  }
  
  public final HttpClientBuilder setProxy(HttpHost paramHttpHost)
  {
    proxy = paramHttpHost;
    return this;
  }
  
  public final HttpClientBuilder setProxyAuthenticationStrategy(AuthenticationStrategy paramAuthenticationStrategy)
  {
    proxyAuthStrategy = paramAuthenticationStrategy;
    return this;
  }
  
  public final HttpClientBuilder setRedirectStrategy(RedirectStrategy paramRedirectStrategy)
  {
    redirectStrategy = paramRedirectStrategy;
    return this;
  }
  
  public final HttpClientBuilder setRequestExecutor(HttpRequestExecutor paramHttpRequestExecutor)
  {
    requestExec = paramHttpRequestExecutor;
    return this;
  }
  
  public final HttpClientBuilder setRetryHandler(HttpRequestRetryHandler paramHttpRequestRetryHandler)
  {
    retryHandler = paramHttpRequestRetryHandler;
    return this;
  }
  
  public final HttpClientBuilder setRoutePlanner(HttpRoutePlanner paramHttpRoutePlanner)
  {
    routePlanner = paramHttpRoutePlanner;
    return this;
  }
  
  public final HttpClientBuilder setSSLSocketFactory(LayeredConnectionSocketFactory paramLayeredConnectionSocketFactory)
  {
    sslSocketFactory = paramLayeredConnectionSocketFactory;
    return this;
  }
  
  public final HttpClientBuilder setSchemePortResolver(SchemePortResolver paramSchemePortResolver)
  {
    schemePortResolver = paramSchemePortResolver;
    return this;
  }
  
  public final HttpClientBuilder setServiceUnavailableRetryStrategy(ServiceUnavailableRetryStrategy paramServiceUnavailableRetryStrategy)
  {
    serviceUnavailStrategy = paramServiceUnavailableRetryStrategy;
    return this;
  }
  
  public final HttpClientBuilder setSslcontext(SSLContext paramSSLContext)
  {
    sslcontext = paramSSLContext;
    return this;
  }
  
  public final HttpClientBuilder setTargetAuthenticationStrategy(AuthenticationStrategy paramAuthenticationStrategy)
  {
    targetAuthStrategy = paramAuthenticationStrategy;
    return this;
  }
  
  public final HttpClientBuilder setUserAgent(String paramString)
  {
    userAgent = paramString;
    return this;
  }
  
  public final HttpClientBuilder setUserTokenHandler(UserTokenHandler paramUserTokenHandler)
  {
    userTokenHandler = paramUserTokenHandler;
    return this;
  }
  
  public final HttpClientBuilder useSystemProperties()
  {
    systemProperties = true;
    return this;
  }
}
