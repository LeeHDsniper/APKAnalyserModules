package org.apache.http.impl.client;

import java.util.concurrent.TimeUnit;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ClientConnectionRequest;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.impl.DefaultConnectionReuseStrategy;
import org.apache.http.impl.execchain.MinimalClientExec;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.util.Args;

@ThreadSafe
class MinimalHttpClient
  extends CloseableHttpClient
{
  private final HttpClientConnectionManager connManager;
  private final HttpParams params;
  private final MinimalClientExec requestExecutor;
  
  public MinimalHttpClient(HttpClientConnectionManager paramHttpClientConnectionManager)
  {
    connManager = ((HttpClientConnectionManager)Args.notNull(paramHttpClientConnectionManager, "HTTP connection manager"));
    requestExecutor = new MinimalClientExec(new HttpRequestExecutor(), paramHttpClientConnectionManager, DefaultConnectionReuseStrategy.INSTANCE, DefaultConnectionKeepAliveStrategy.INSTANCE);
    params = new BasicHttpParams();
  }
  
  public void close()
  {
    connManager.shutdown();
  }
  
  /* Error */
  protected org.apache.http.client.methods.CloseableHttpResponse doExecute(org.apache.http.HttpHost paramHttpHost, org.apache.http.HttpRequest paramHttpRequest, org.apache.http.protocol.HttpContext paramHttpContext)
    throws java.io.IOException, org.apache.http.client.ClientProtocolException
  {
    // Byte code:
    //   0: aload_1
    //   1: ldc 73
    //   3: invokestatic 26	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   6: pop
    //   7: aload_2
    //   8: ldc 75
    //   10: invokestatic 26	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   13: pop
    //   14: aconst_null
    //   15: astore 4
    //   17: aload_2
    //   18: instanceof 77
    //   21: ifeq +9 -> 30
    //   24: aload_2
    //   25: checkcast 77	org/apache/http/client/methods/HttpExecutionAware
    //   28: astore 4
    //   30: aload_2
    //   31: invokestatic 83	org/apache/http/client/methods/HttpRequestWrapper:wrap	(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/HttpRequestWrapper;
    //   34: astore 5
    //   36: aload_3
    //   37: ifnull +61 -> 98
    //   40: aload_3
    //   41: invokestatic 89	org/apache/http/client/protocol/HttpClientContext:adapt	(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;
    //   44: astore_3
    //   45: new 91	org/apache/http/conn/routing/HttpRoute
    //   48: dup
    //   49: aload_1
    //   50: invokespecial 94	org/apache/http/conn/routing/HttpRoute:<init>	(Lorg/apache/http/HttpHost;)V
    //   53: astore 6
    //   55: aconst_null
    //   56: astore_1
    //   57: aload_2
    //   58: instanceof 96
    //   61: ifeq +13 -> 74
    //   64: aload_2
    //   65: checkcast 96	org/apache/http/client/methods/Configurable
    //   68: invokeinterface 100 1 0
    //   73: astore_1
    //   74: aload_1
    //   75: ifnull +8 -> 83
    //   78: aload_3
    //   79: aload_1
    //   80: invokevirtual 104	org/apache/http/client/protocol/HttpClientContext:setRequestConfig	(Lorg/apache/http/client/config/RequestConfig;)V
    //   83: aload_0
    //   84: getfield 51	org/apache/http/impl/client/MinimalHttpClient:requestExecutor	Lorg/apache/http/impl/execchain/MinimalClientExec;
    //   87: aload 6
    //   89: aload 5
    //   91: aload_3
    //   92: aload 4
    //   94: invokevirtual 108	org/apache/http/impl/execchain/MinimalClientExec:execute	(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    //   97: areturn
    //   98: new 110	org/apache/http/protocol/BasicHttpContext
    //   101: dup
    //   102: invokespecial 111	org/apache/http/protocol/BasicHttpContext:<init>	()V
    //   105: astore_3
    //   106: goto -66 -> 40
    //   109: astore_1
    //   110: new 69	org/apache/http/client/ClientProtocolException
    //   113: dup
    //   114: aload_1
    //   115: invokespecial 114	org/apache/http/client/ClientProtocolException:<init>	(Ljava/lang/Throwable;)V
    //   118: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	119	0	this	MinimalHttpClient
    //   0	119	1	paramHttpHost	org.apache.http.HttpHost
    //   0	119	2	paramHttpRequest	org.apache.http.HttpRequest
    //   0	119	3	paramHttpContext	org.apache.http.protocol.HttpContext
    //   15	78	4	localHttpExecutionAware	org.apache.http.client.methods.HttpExecutionAware
    //   34	56	5	localHttpRequestWrapper	org.apache.http.client.methods.HttpRequestWrapper
    //   53	35	6	localHttpRoute	HttpRoute
    // Exception table:
    //   from	to	target	type
    //   30	36	109	org/apache/http/HttpException
    //   40	55	109	org/apache/http/HttpException
    //   57	74	109	org/apache/http/HttpException
    //   78	83	109	org/apache/http/HttpException
    //   83	98	109	org/apache/http/HttpException
    //   98	106	109	org/apache/http/HttpException
  }
  
  public ClientConnectionManager getConnectionManager()
  {
    new ClientConnectionManager()
    {
      public void closeExpiredConnections()
      {
        connManager.closeExpiredConnections();
      }
      
      public void closeIdleConnections(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
      {
        connManager.closeIdleConnections(paramAnonymousLong, paramAnonymousTimeUnit);
      }
      
      public SchemeRegistry getSchemeRegistry()
      {
        throw new UnsupportedOperationException();
      }
      
      public void releaseConnection(ManagedClientConnection paramAnonymousManagedClientConnection, long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
      {
        throw new UnsupportedOperationException();
      }
      
      public ClientConnectionRequest requestConnection(HttpRoute paramAnonymousHttpRoute, Object paramAnonymousObject)
      {
        throw new UnsupportedOperationException();
      }
      
      public void shutdown()
      {
        connManager.shutdown();
      }
    };
  }
  
  public HttpParams getParams()
  {
    return params;
  }
}
