package org.apache.http.impl.execchain;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.protocol.RequestClientConnControl;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.protocol.ImmutableHttpProcessor;
import org.apache.http.protocol.RequestContent;
import org.apache.http.protocol.RequestTargetHost;
import org.apache.http.protocol.RequestUserAgent;
import org.apache.http.util.Args;
import org.apache.http.util.VersionInfo;

@Immutable
public class MinimalClientExec
  implements ClientExecChain
{
  private final HttpClientConnectionManager connManager;
  private final HttpProcessor httpProcessor;
  private final ConnectionKeepAliveStrategy keepAliveStrategy;
  private final Log log = LogFactory.getLog(getClass());
  private final HttpRequestExecutor requestExecutor;
  private final ConnectionReuseStrategy reuseStrategy;
  
  public MinimalClientExec(HttpRequestExecutor paramHttpRequestExecutor, HttpClientConnectionManager paramHttpClientConnectionManager, ConnectionReuseStrategy paramConnectionReuseStrategy, ConnectionKeepAliveStrategy paramConnectionKeepAliveStrategy)
  {
    Args.notNull(paramHttpRequestExecutor, "HTTP request executor");
    Args.notNull(paramHttpClientConnectionManager, "Client connection manager");
    Args.notNull(paramConnectionReuseStrategy, "Connection reuse strategy");
    Args.notNull(paramConnectionKeepAliveStrategy, "Connection keep alive strategy");
    httpProcessor = new ImmutableHttpProcessor(new HttpRequestInterceptor[] { new RequestContent(), new RequestTargetHost(), new RequestClientConnControl(), new RequestUserAgent(VersionInfo.getUserAgent("Apache-HttpClient", "org.apache.http.client", getClass())) });
    requestExecutor = paramHttpRequestExecutor;
    connManager = paramHttpClientConnectionManager;
    reuseStrategy = paramConnectionReuseStrategy;
    keepAliveStrategy = paramConnectionKeepAliveStrategy;
  }
  
  /* Error */
  public org.apache.http.client.methods.CloseableHttpResponse execute(org.apache.http.conn.routing.HttpRoute paramHttpRoute, org.apache.http.client.methods.HttpRequestWrapper paramHttpRequestWrapper, org.apache.http.client.protocol.HttpClientContext paramHttpClientContext, org.apache.http.client.methods.HttpExecutionAware paramHttpExecutionAware)
    throws java.io.IOException, org.apache.http.HttpException
  {
    // Byte code:
    //   0: aload_1
    //   1: ldc 108
    //   3: invokestatic 44	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   6: pop
    //   7: aload_2
    //   8: ldc 110
    //   10: invokestatic 44	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   13: pop
    //   14: aload_3
    //   15: ldc 112
    //   17: invokestatic 44	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   20: pop
    //   21: aload_0
    //   22: getfield 87	org/apache/http/impl/execchain/MinimalClientExec:connManager	Lorg/apache/http/conn/HttpClientConnectionManager;
    //   25: aload_1
    //   26: aconst_null
    //   27: invokeinterface 118 3 0
    //   32: astore 9
    //   34: aload 4
    //   36: ifnull +40 -> 76
    //   39: aload 4
    //   41: invokeinterface 124 1 0
    //   46: ifeq +21 -> 67
    //   49: aload 9
    //   51: invokeinterface 129 1 0
    //   56: pop
    //   57: new 131	org/apache/http/impl/execchain/RequestAbortedException
    //   60: dup
    //   61: ldc -123
    //   63: invokespecial 134	org/apache/http/impl/execchain/RequestAbortedException:<init>	(Ljava/lang/String;)V
    //   66: athrow
    //   67: aload 4
    //   69: aload 9
    //   71: invokeinterface 138 2 0
    //   76: aload_3
    //   77: invokevirtual 144	org/apache/http/client/protocol/HttpClientContext:getRequestConfig	()Lorg/apache/http/client/config/RequestConfig;
    //   80: astore 8
    //   82: aload 8
    //   84: invokevirtual 150	org/apache/http/client/config/RequestConfig:getConnectionRequestTimeout	()I
    //   87: istore 5
    //   89: iload 5
    //   91: ifle +90 -> 181
    //   94: iload 5
    //   96: i2l
    //   97: lstore 6
    //   99: aload 9
    //   101: lload 6
    //   103: getstatic 156	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   106: invokeinterface 160 4 0
    //   111: astore 10
    //   113: new 162	org/apache/http/impl/execchain/ConnectionHolder
    //   116: dup
    //   117: aload_0
    //   118: getfield 36	org/apache/http/impl/execchain/MinimalClientExec:log	Lorg/apache/commons/logging/Log;
    //   121: aload_0
    //   122: getfield 87	org/apache/http/impl/execchain/MinimalClientExec:connManager	Lorg/apache/http/conn/HttpClientConnectionManager;
    //   125: aload 10
    //   127: invokespecial 165	org/apache/http/impl/execchain/ConnectionHolder:<init>	(Lorg/apache/commons/logging/Log;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/HttpClientConnection;)V
    //   130: astore 9
    //   132: aload 4
    //   134: ifnull +105 -> 239
    //   137: aload 4
    //   139: invokeinterface 124 1 0
    //   144: ifeq +86 -> 230
    //   147: aload 9
    //   149: invokevirtual 168	org/apache/http/impl/execchain/ConnectionHolder:close	()V
    //   152: new 131	org/apache/http/impl/execchain/RequestAbortedException
    //   155: dup
    //   156: ldc -123
    //   158: invokespecial 134	org/apache/http/impl/execchain/RequestAbortedException:<init>	(Ljava/lang/String;)V
    //   161: athrow
    //   162: astore_1
    //   163: new 170	java/io/InterruptedIOException
    //   166: dup
    //   167: ldc -84
    //   169: invokespecial 173	java/io/InterruptedIOException:<init>	(Ljava/lang/String;)V
    //   172: astore_2
    //   173: aload_2
    //   174: aload_1
    //   175: invokevirtual 177	java/io/InterruptedIOException:initCause	(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    //   178: pop
    //   179: aload_2
    //   180: athrow
    //   181: lconst_0
    //   182: lstore 6
    //   184: goto -85 -> 99
    //   187: astore_1
    //   188: invokestatic 183	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   191: invokevirtual 186	java/lang/Thread:interrupt	()V
    //   194: new 131	org/apache/http/impl/execchain/RequestAbortedException
    //   197: dup
    //   198: ldc -123
    //   200: aload_1
    //   201: invokespecial 189	org/apache/http/impl/execchain/RequestAbortedException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   204: athrow
    //   205: astore_2
    //   206: aload_2
    //   207: invokevirtual 193	java/util/concurrent/ExecutionException:getCause	()Ljava/lang/Throwable;
    //   210: astore_3
    //   211: aload_3
    //   212: astore_1
    //   213: aload_3
    //   214: ifnonnull +5 -> 219
    //   217: aload_2
    //   218: astore_1
    //   219: new 131	org/apache/http/impl/execchain/RequestAbortedException
    //   222: dup
    //   223: ldc -61
    //   225: aload_1
    //   226: invokespecial 189	org/apache/http/impl/execchain/RequestAbortedException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   229: athrow
    //   230: aload 4
    //   232: aload 9
    //   234: invokeinterface 138 2 0
    //   239: aload 10
    //   241: invokeinterface 200 1 0
    //   246: ifne +47 -> 293
    //   249: aload 8
    //   251: invokevirtual 203	org/apache/http/client/config/RequestConfig:getConnectTimeout	()I
    //   254: istore 5
    //   256: aload_0
    //   257: getfield 87	org/apache/http/impl/execchain/MinimalClientExec:connManager	Lorg/apache/http/conn/HttpClientConnectionManager;
    //   260: astore 4
    //   262: iload 5
    //   264: ifle +312 -> 576
    //   267: aload 4
    //   269: aload 10
    //   271: aload_1
    //   272: iload 5
    //   274: aload_3
    //   275: invokeinterface 207 5 0
    //   280: aload_0
    //   281: getfield 87	org/apache/http/impl/execchain/MinimalClientExec:connManager	Lorg/apache/http/conn/HttpClientConnectionManager;
    //   284: aload 10
    //   286: aload_1
    //   287: aload_3
    //   288: invokeinterface 211 4 0
    //   293: aload 8
    //   295: invokevirtual 214	org/apache/http/client/config/RequestConfig:getSocketTimeout	()I
    //   298: istore 5
    //   300: iload 5
    //   302: iflt +12 -> 314
    //   305: aload 10
    //   307: iload 5
    //   309: invokeinterface 218 2 0
    //   314: aconst_null
    //   315: astore 8
    //   317: aload_2
    //   318: invokevirtual 224	org/apache/http/client/methods/HttpRequestWrapper:getOriginal	()Lorg/apache/http/HttpRequest;
    //   321: astore 11
    //   323: aload 8
    //   325: astore 4
    //   327: aload 11
    //   329: instanceof 226
    //   332: ifeq +51 -> 383
    //   335: aload 11
    //   337: checkcast 226	org/apache/http/client/methods/HttpUriRequest
    //   340: invokeinterface 230 1 0
    //   345: astore 11
    //   347: aload 8
    //   349: astore 4
    //   351: aload 11
    //   353: invokevirtual 235	java/net/URI:isAbsolute	()Z
    //   356: ifeq +27 -> 383
    //   359: new 237	org/apache/http/HttpHost
    //   362: dup
    //   363: aload 11
    //   365: invokevirtual 241	java/net/URI:getHost	()Ljava/lang/String;
    //   368: aload 11
    //   370: invokevirtual 244	java/net/URI:getPort	()I
    //   373: aload 11
    //   375: invokevirtual 247	java/net/URI:getScheme	()Ljava/lang/String;
    //   378: invokespecial 250	org/apache/http/HttpHost:<init>	(Ljava/lang/String;ILjava/lang/String;)V
    //   381: astore 4
    //   383: aload 4
    //   385: astore 8
    //   387: aload 4
    //   389: ifnonnull +9 -> 398
    //   392: aload_1
    //   393: invokevirtual 256	org/apache/http/conn/routing/HttpRoute:getTargetHost	()Lorg/apache/http/HttpHost;
    //   396: astore 8
    //   398: aload_3
    //   399: ldc_w 258
    //   402: aload 8
    //   404: invokevirtual 262	org/apache/http/client/protocol/HttpClientContext:setAttribute	(Ljava/lang/String;Ljava/lang/Object;)V
    //   407: aload_3
    //   408: ldc_w 264
    //   411: aload_2
    //   412: invokevirtual 262	org/apache/http/client/protocol/HttpClientContext:setAttribute	(Ljava/lang/String;Ljava/lang/Object;)V
    //   415: aload_3
    //   416: ldc_w 266
    //   419: aload 10
    //   421: invokevirtual 262	org/apache/http/client/protocol/HttpClientContext:setAttribute	(Ljava/lang/String;Ljava/lang/Object;)V
    //   424: aload_3
    //   425: ldc_w 268
    //   428: aload_1
    //   429: invokevirtual 262	org/apache/http/client/protocol/HttpClientContext:setAttribute	(Ljava/lang/String;Ljava/lang/Object;)V
    //   432: aload_0
    //   433: getfield 83	org/apache/http/impl/execchain/MinimalClientExec:httpProcessor	Lorg/apache/http/protocol/HttpProcessor;
    //   436: aload_2
    //   437: aload_3
    //   438: invokeinterface 274 3 0
    //   443: aload_0
    //   444: getfield 85	org/apache/http/impl/execchain/MinimalClientExec:requestExecutor	Lorg/apache/http/protocol/HttpRequestExecutor;
    //   447: aload_2
    //   448: aload 10
    //   450: aload_3
    //   451: invokevirtual 279	org/apache/http/protocol/HttpRequestExecutor:execute	(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    //   454: astore_1
    //   455: aload_0
    //   456: getfield 83	org/apache/http/impl/execchain/MinimalClientExec:httpProcessor	Lorg/apache/http/protocol/HttpProcessor;
    //   459: aload_1
    //   460: aload_3
    //   461: invokeinterface 282 3 0
    //   466: aload_0
    //   467: getfield 89	org/apache/http/impl/execchain/MinimalClientExec:reuseStrategy	Lorg/apache/http/ConnectionReuseStrategy;
    //   470: aload_1
    //   471: aload_3
    //   472: invokeinterface 288 3 0
    //   477: ifeq +58 -> 535
    //   480: aload 9
    //   482: aload_0
    //   483: getfield 91	org/apache/http/impl/execchain/MinimalClientExec:keepAliveStrategy	Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    //   486: aload_1
    //   487: aload_3
    //   488: invokeinterface 294 3 0
    //   493: getstatic 156	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   496: invokevirtual 298	org/apache/http/impl/execchain/ConnectionHolder:setValidFor	(JLjava/util/concurrent/TimeUnit;)V
    //   499: aload 9
    //   501: invokevirtual 301	org/apache/http/impl/execchain/ConnectionHolder:markReusable	()V
    //   504: aload_1
    //   505: invokeinterface 307 1 0
    //   510: astore_2
    //   511: aload_2
    //   512: ifnull +12 -> 524
    //   515: aload_2
    //   516: invokeinterface 312 1 0
    //   521: ifne +30 -> 551
    //   524: aload 9
    //   526: invokevirtual 315	org/apache/http/impl/execchain/ConnectionHolder:releaseConnection	()V
    //   529: aload_1
    //   530: aconst_null
    //   531: invokestatic 321	org/apache/http/impl/execchain/Proxies:enhanceResponse	(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    //   534: areturn
    //   535: aload 9
    //   537: invokevirtual 324	org/apache/http/impl/execchain/ConnectionHolder:markNonReusable	()V
    //   540: goto -36 -> 504
    //   543: astore_1
    //   544: aload 9
    //   546: invokevirtual 327	org/apache/http/impl/execchain/ConnectionHolder:abortConnection	()V
    //   549: aload_1
    //   550: athrow
    //   551: aload_1
    //   552: aload 9
    //   554: invokestatic 321	org/apache/http/impl/execchain/Proxies:enhanceResponse	(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    //   557: astore_1
    //   558: aload_1
    //   559: areturn
    //   560: astore_1
    //   561: aload 9
    //   563: invokevirtual 327	org/apache/http/impl/execchain/ConnectionHolder:abortConnection	()V
    //   566: aload_1
    //   567: athrow
    //   568: astore_1
    //   569: aload 9
    //   571: invokevirtual 327	org/apache/http/impl/execchain/ConnectionHolder:abortConnection	()V
    //   574: aload_1
    //   575: athrow
    //   576: iconst_0
    //   577: istore 5
    //   579: goto -312 -> 267
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	582	0	this	MinimalClientExec
    //   0	582	1	paramHttpRoute	org.apache.http.conn.routing.HttpRoute
    //   0	582	2	paramHttpRequestWrapper	org.apache.http.client.methods.HttpRequestWrapper
    //   0	582	3	paramHttpClientContext	org.apache.http.client.protocol.HttpClientContext
    //   0	582	4	paramHttpExecutionAware	org.apache.http.client.methods.HttpExecutionAware
    //   87	491	5	i	int
    //   97	86	6	l	long
    //   80	323	8	localObject1	Object
    //   32	538	9	localObject2	Object
    //   111	338	10	localHttpClientConnection	org.apache.http.HttpClientConnection
    //   321	53	11	localObject3	Object
    // Exception table:
    //   from	to	target	type
    //   137	162	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   230	239	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   239	262	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   267	293	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   293	300	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   305	314	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   317	323	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   327	347	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   351	383	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   392	398	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   398	504	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   504	511	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   515	524	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   524	535	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   535	540	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   551	558	162	org/apache/http/impl/conn/ConnectionShutdownException
    //   82	89	187	java/lang/InterruptedException
    //   99	113	187	java/lang/InterruptedException
    //   82	89	205	java/util/concurrent/ExecutionException
    //   99	113	205	java/util/concurrent/ExecutionException
    //   137	162	543	org/apache/http/HttpException
    //   230	239	543	org/apache/http/HttpException
    //   239	262	543	org/apache/http/HttpException
    //   267	293	543	org/apache/http/HttpException
    //   293	300	543	org/apache/http/HttpException
    //   305	314	543	org/apache/http/HttpException
    //   317	323	543	org/apache/http/HttpException
    //   327	347	543	org/apache/http/HttpException
    //   351	383	543	org/apache/http/HttpException
    //   392	398	543	org/apache/http/HttpException
    //   398	504	543	org/apache/http/HttpException
    //   504	511	543	org/apache/http/HttpException
    //   515	524	543	org/apache/http/HttpException
    //   524	535	543	org/apache/http/HttpException
    //   535	540	543	org/apache/http/HttpException
    //   551	558	543	org/apache/http/HttpException
    //   137	162	560	java/io/IOException
    //   230	239	560	java/io/IOException
    //   239	262	560	java/io/IOException
    //   267	293	560	java/io/IOException
    //   293	300	560	java/io/IOException
    //   305	314	560	java/io/IOException
    //   317	323	560	java/io/IOException
    //   327	347	560	java/io/IOException
    //   351	383	560	java/io/IOException
    //   392	398	560	java/io/IOException
    //   398	504	560	java/io/IOException
    //   504	511	560	java/io/IOException
    //   515	524	560	java/io/IOException
    //   524	535	560	java/io/IOException
    //   535	540	560	java/io/IOException
    //   551	558	560	java/io/IOException
    //   137	162	568	java/lang/RuntimeException
    //   230	239	568	java/lang/RuntimeException
    //   239	262	568	java/lang/RuntimeException
    //   267	293	568	java/lang/RuntimeException
    //   293	300	568	java/lang/RuntimeException
    //   305	314	568	java/lang/RuntimeException
    //   317	323	568	java/lang/RuntimeException
    //   327	347	568	java/lang/RuntimeException
    //   351	383	568	java/lang/RuntimeException
    //   392	398	568	java/lang/RuntimeException
    //   398	504	568	java/lang/RuntimeException
    //   504	511	568	java/lang/RuntimeException
    //   515	524	568	java/lang/RuntimeException
    //   524	535	568	java/lang/RuntimeException
    //   535	540	568	java/lang/RuntimeException
    //   551	558	568	java/lang/RuntimeException
  }
}
