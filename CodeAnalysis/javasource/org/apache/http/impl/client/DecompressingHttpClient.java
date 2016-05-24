package org.apache.http.impl.client;

import java.io.IOException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.protocol.RequestAcceptEncoding;
import org.apache.http.client.protocol.ResponseContentEncoding;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;

@Deprecated
public class DecompressingHttpClient
  implements HttpClient
{
  private final HttpRequestInterceptor acceptEncodingInterceptor;
  private final HttpClient backend;
  private final HttpResponseInterceptor contentEncodingInterceptor;
  
  public DecompressingHttpClient()
  {
    this(new DefaultHttpClient());
  }
  
  public DecompressingHttpClient(HttpClient paramHttpClient)
  {
    this(paramHttpClient, new RequestAcceptEncoding(), new ResponseContentEncoding());
  }
  
  DecompressingHttpClient(HttpClient paramHttpClient, HttpRequestInterceptor paramHttpRequestInterceptor, HttpResponseInterceptor paramHttpResponseInterceptor)
  {
    backend = paramHttpClient;
    acceptEncodingInterceptor = paramHttpRequestInterceptor;
    contentEncodingInterceptor = paramHttpResponseInterceptor;
  }
  
  public <T> T execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, ResponseHandler<? extends T> paramResponseHandler)
    throws IOException, ClientProtocolException
  {
    return execute(paramHttpHost, paramHttpRequest, paramResponseHandler, null);
  }
  
  public <T> T execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, ResponseHandler<? extends T> paramResponseHandler, HttpContext paramHttpContext)
    throws IOException, ClientProtocolException
  {
    paramHttpHost = execute(paramHttpHost, paramHttpRequest, paramHttpContext);
    try
    {
      paramHttpRequest = paramResponseHandler.handleResponse(paramHttpHost);
      return paramHttpRequest;
    }
    finally
    {
      paramHttpHost = paramHttpHost.getEntity();
      if (paramHttpHost != null) {
        EntityUtils.consume(paramHttpHost);
      }
    }
  }
  
  public <T> T execute(HttpUriRequest paramHttpUriRequest, ResponseHandler<? extends T> paramResponseHandler)
    throws IOException, ClientProtocolException
  {
    return execute(getHttpHost(paramHttpUriRequest), paramHttpUriRequest, paramResponseHandler);
  }
  
  public <T> T execute(HttpUriRequest paramHttpUriRequest, ResponseHandler<? extends T> paramResponseHandler, HttpContext paramHttpContext)
    throws IOException, ClientProtocolException
  {
    return execute(getHttpHost(paramHttpUriRequest), paramHttpUriRequest, paramResponseHandler, paramHttpContext);
  }
  
  public HttpResponse execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest)
    throws IOException, ClientProtocolException
  {
    return execute(paramHttpHost, paramHttpRequest, (HttpContext)null);
  }
  
  /* Error */
  public HttpResponse execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws IOException, ClientProtocolException
  {
    // Byte code:
    //   0: aload_3
    //   1: ifnull +100 -> 101
    //   4: aload_2
    //   5: instanceof 92
    //   8: ifeq +114 -> 122
    //   11: new 94	org/apache/http/impl/client/EntityEnclosingRequestWrapper
    //   14: dup
    //   15: aload_2
    //   16: checkcast 92	org/apache/http/HttpEntityEnclosingRequest
    //   19: invokespecial 97	org/apache/http/impl/client/EntityEnclosingRequestWrapper:<init>	(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    //   22: astore_2
    //   23: aload_0
    //   24: getfield 37	org/apache/http/impl/client/DecompressingHttpClient:acceptEncodingInterceptor	Lorg/apache/http/HttpRequestInterceptor;
    //   27: aload_2
    //   28: aload_3
    //   29: invokeinterface 103 3 0
    //   34: aload_0
    //   35: getfield 35	org/apache/http/impl/client/DecompressingHttpClient:backend	Lorg/apache/http/client/HttpClient;
    //   38: aload_1
    //   39: aload_2
    //   40: aload_3
    //   41: invokeinterface 104 4 0
    //   46: astore_1
    //   47: aload_0
    //   48: getfield 39	org/apache/http/impl/client/DecompressingHttpClient:contentEncodingInterceptor	Lorg/apache/http/HttpResponseInterceptor;
    //   51: aload_1
    //   52: aload_3
    //   53: invokeinterface 109 3 0
    //   58: getstatic 115	java/lang/Boolean:TRUE	Ljava/lang/Boolean;
    //   61: aload_3
    //   62: ldc 117
    //   64: invokeinterface 121 2 0
    //   69: invokevirtual 125	java/lang/Boolean:equals	(Ljava/lang/Object;)Z
    //   72: ifeq +27 -> 99
    //   75: aload_1
    //   76: ldc 127
    //   78: invokeinterface 131 2 0
    //   83: aload_1
    //   84: ldc -123
    //   86: invokeinterface 131 2 0
    //   91: aload_1
    //   92: ldc -121
    //   94: invokeinterface 131 2 0
    //   99: aload_1
    //   100: areturn
    //   101: new 137	org/apache/http/protocol/BasicHttpContext
    //   104: dup
    //   105: invokespecial 138	org/apache/http/protocol/BasicHttpContext:<init>	()V
    //   108: astore_3
    //   109: goto -105 -> 4
    //   112: astore_1
    //   113: new 45	org/apache/http/client/ClientProtocolException
    //   116: dup
    //   117: aload_1
    //   118: invokespecial 141	org/apache/http/client/ClientProtocolException:<init>	(Ljava/lang/Throwable;)V
    //   121: athrow
    //   122: new 143	org/apache/http/impl/client/RequestWrapper
    //   125: dup
    //   126: aload_2
    //   127: invokespecial 146	org/apache/http/impl/client/RequestWrapper:<init>	(Lorg/apache/http/HttpRequest;)V
    //   130: astore_2
    //   131: goto -108 -> 23
    //   134: astore_2
    //   135: aload_1
    //   136: invokeinterface 66 1 0
    //   141: invokestatic 72	org/apache/http/util/EntityUtils:consume	(Lorg/apache/http/HttpEntity;)V
    //   144: aload_2
    //   145: athrow
    //   146: astore_2
    //   147: aload_1
    //   148: invokeinterface 66 1 0
    //   153: invokestatic 72	org/apache/http/util/EntityUtils:consume	(Lorg/apache/http/HttpEntity;)V
    //   156: aload_2
    //   157: athrow
    //   158: astore_2
    //   159: aload_1
    //   160: invokeinterface 66 1 0
    //   165: invokestatic 72	org/apache/http/util/EntityUtils:consume	(Lorg/apache/http/HttpEntity;)V
    //   168: aload_2
    //   169: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	170	0	this	DecompressingHttpClient
    //   0	170	1	paramHttpHost	HttpHost
    //   0	170	2	paramHttpRequest	HttpRequest
    //   0	170	3	paramHttpContext	HttpContext
    // Exception table:
    //   from	to	target	type
    //   4	23	112	org/apache/http/HttpException
    //   23	47	112	org/apache/http/HttpException
    //   101	109	112	org/apache/http/HttpException
    //   122	131	112	org/apache/http/HttpException
    //   135	146	112	org/apache/http/HttpException
    //   147	158	112	org/apache/http/HttpException
    //   159	170	112	org/apache/http/HttpException
    //   47	99	134	org/apache/http/HttpException
    //   47	99	146	java/io/IOException
    //   47	99	158	java/lang/RuntimeException
  }
  
  public HttpResponse execute(HttpUriRequest paramHttpUriRequest)
    throws IOException, ClientProtocolException
  {
    return execute(getHttpHost(paramHttpUriRequest), paramHttpUriRequest, (HttpContext)null);
  }
  
  public HttpResponse execute(HttpUriRequest paramHttpUriRequest, HttpContext paramHttpContext)
    throws IOException, ClientProtocolException
  {
    return execute(getHttpHost(paramHttpUriRequest), paramHttpUriRequest, paramHttpContext);
  }
  
  public ClientConnectionManager getConnectionManager()
  {
    return backend.getConnectionManager();
  }
  
  public HttpClient getHttpClient()
  {
    return backend;
  }
  
  HttpHost getHttpHost(HttpUriRequest paramHttpUriRequest)
  {
    return URIUtils.extractHost(paramHttpUriRequest.getURI());
  }
  
  public HttpParams getParams()
  {
    return backend.getParams();
  }
}
