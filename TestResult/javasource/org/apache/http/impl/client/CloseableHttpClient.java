package org.apache.http.impl.client;

import java.io.Closeable;
import java.io.IOException;
import java.lang.reflect.UndeclaredThrowableException;
import java.net.URI;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.EntityUtils;

@ThreadSafe
public abstract class CloseableHttpClient
  implements Closeable, HttpClient
{
  private final Log log = LogFactory.getLog(getClass());
  
  public CloseableHttpClient() {}
  
  private static HttpHost determineTarget(HttpUriRequest paramHttpUriRequest)
    throws ClientProtocolException
  {
    HttpHost localHttpHost = null;
    URI localURI = paramHttpUriRequest.getURI();
    paramHttpUriRequest = localHttpHost;
    if (localURI.isAbsolute())
    {
      localHttpHost = URIUtils.extractHost(localURI);
      paramHttpUriRequest = localHttpHost;
      if (localHttpHost == null) {
        throw new ClientProtocolException("URI does not specify a valid host name: " + localURI);
      }
    }
    return paramHttpUriRequest;
  }
  
  protected abstract CloseableHttpResponse doExecute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws IOException, ClientProtocolException;
  
  public <T> T execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, ResponseHandler<? extends T> paramResponseHandler)
    throws IOException, ClientProtocolException
  {
    return execute(paramHttpHost, paramHttpRequest, paramResponseHandler, null);
  }
  
  public <T> T execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, ResponseHandler<? extends T> paramResponseHandler, HttpContext paramHttpContext)
    throws IOException, ClientProtocolException
  {
    Args.notNull(paramResponseHandler, "Response handler");
    paramHttpHost = execute(paramHttpHost, paramHttpRequest, paramHttpContext);
    try
    {
      paramHttpRequest = paramResponseHandler.handleResponse(paramHttpHost);
      EntityUtils.consume(paramHttpHost.getEntity());
      return paramHttpRequest;
    }
    catch (Exception paramHttpRequest)
    {
      paramHttpHost = paramHttpHost.getEntity();
      try
      {
        EntityUtils.consume(paramHttpHost);
        if ((paramHttpRequest instanceof RuntimeException)) {
          throw ((RuntimeException)paramHttpRequest);
        }
      }
      catch (Exception paramHttpHost)
      {
        for (;;)
        {
          log.warn("Error consuming content after an exception.", paramHttpHost);
        }
        if ((paramHttpRequest instanceof IOException)) {
          throw ((IOException)paramHttpRequest);
        }
        throw new UndeclaredThrowableException(paramHttpRequest);
      }
    }
  }
  
  public <T> T execute(HttpUriRequest paramHttpUriRequest, ResponseHandler<? extends T> paramResponseHandler)
    throws IOException, ClientProtocolException
  {
    return execute(paramHttpUriRequest, paramResponseHandler, null);
  }
  
  public <T> T execute(HttpUriRequest paramHttpUriRequest, ResponseHandler<? extends T> paramResponseHandler, HttpContext paramHttpContext)
    throws IOException, ClientProtocolException
  {
    return execute(determineTarget(paramHttpUriRequest), paramHttpUriRequest, paramResponseHandler, paramHttpContext);
  }
  
  public CloseableHttpResponse execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest)
    throws IOException, ClientProtocolException
  {
    return doExecute(paramHttpHost, paramHttpRequest, (HttpContext)null);
  }
  
  public CloseableHttpResponse execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws IOException, ClientProtocolException
  {
    return doExecute(paramHttpHost, paramHttpRequest, paramHttpContext);
  }
  
  public CloseableHttpResponse execute(HttpUriRequest paramHttpUriRequest)
    throws IOException, ClientProtocolException
  {
    return execute(paramHttpUriRequest, (HttpContext)null);
  }
  
  public CloseableHttpResponse execute(HttpUriRequest paramHttpUriRequest, HttpContext paramHttpContext)
    throws IOException, ClientProtocolException
  {
    Args.notNull(paramHttpUriRequest, "HTTP request");
    return doExecute(determineTarget(paramHttpUriRequest), paramHttpUriRequest, paramHttpContext);
  }
}
