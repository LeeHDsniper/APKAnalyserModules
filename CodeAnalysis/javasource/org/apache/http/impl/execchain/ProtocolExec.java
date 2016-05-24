package org.apache.http.impl.execchain;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.ProtocolException;
import org.apache.http.RequestLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpExecutionAware;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.util.Args;

@Immutable
public class ProtocolExec
  implements ClientExecChain
{
  private final HttpProcessor httpProcessor;
  private final Log log = LogFactory.getLog(getClass());
  private final ClientExecChain requestExecutor;
  
  public ProtocolExec(ClientExecChain paramClientExecChain, HttpProcessor paramHttpProcessor)
  {
    Args.notNull(paramClientExecChain, "HTTP client request executor");
    Args.notNull(paramHttpProcessor, "HTTP protocol processor");
    requestExecutor = paramClientExecChain;
    httpProcessor = paramHttpProcessor;
  }
  
  public CloseableHttpResponse execute(HttpRoute paramHttpRoute, HttpRequestWrapper paramHttpRequestWrapper, HttpClientContext paramHttpClientContext, HttpExecutionAware paramHttpExecutionAware)
    throws IOException, HttpException
  {
    Args.notNull(paramHttpRoute, "HTTP route");
    Args.notNull(paramHttpRequestWrapper, "HTTP request");
    Args.notNull(paramHttpClientContext, "HTTP context");
    Object localObject2 = paramHttpRequestWrapper.getOriginal();
    Object localObject1 = null;
    Object localObject4;
    Object localObject3;
    if ((localObject2 instanceof HttpUriRequest))
    {
      localObject2 = ((HttpUriRequest)localObject2).getURI();
      paramHttpRequestWrapper.setURI((URI)localObject2);
      rewriteRequestURI(paramHttpRequestWrapper, paramHttpRoute);
      localObject4 = (HttpHost)paramHttpRequestWrapper.getParams().getParameter("http.virtual-host");
      localObject1 = localObject4;
      if (localObject4 != null)
      {
        localObject1 = localObject4;
        if (((HttpHost)localObject4).getPort() == -1)
        {
          int i = paramHttpRoute.getTargetHost().getPort();
          localObject3 = localObject4;
          if (i != -1) {
            localObject3 = new HttpHost(((HttpHost)localObject4).getHostName(), i, ((HttpHost)localObject4).getSchemeName());
          }
          localObject1 = localObject3;
          if (log.isDebugEnabled())
          {
            log.debug("Using virtual host" + localObject3);
            localObject1 = localObject3;
          }
        }
      }
      localObject3 = null;
      if (localObject1 == null) {
        break label442;
      }
    }
    for (;;)
    {
      localObject3 = localObject1;
      if (localObject1 == null) {
        localObject3 = paramHttpRoute.getTargetHost();
      }
      if (localObject2 != null)
      {
        localObject4 = ((URI)localObject2).getUserInfo();
        if (localObject4 != null)
        {
          localObject2 = paramHttpClientContext.getCredentialsProvider();
          localObject1 = localObject2;
          if (localObject2 == null)
          {
            localObject1 = new BasicCredentialsProvider();
            paramHttpClientContext.setCredentialsProvider((CredentialsProvider)localObject1);
          }
          ((CredentialsProvider)localObject1).setCredentials(new AuthScope((HttpHost)localObject3), new UsernamePasswordCredentials((String)localObject4));
        }
      }
      paramHttpClientContext.setAttribute("http.target_host", localObject3);
      paramHttpClientContext.setAttribute("http.route", paramHttpRoute);
      paramHttpClientContext.setAttribute("http.request", paramHttpRequestWrapper);
      httpProcessor.process(paramHttpRequestWrapper, paramHttpClientContext);
      paramHttpRoute = requestExecutor.execute(paramHttpRoute, paramHttpRequestWrapper, paramHttpClientContext, paramHttpExecutionAware);
      try
      {
        paramHttpClientContext.setAttribute("http.response", paramHttpRoute);
        httpProcessor.process(paramHttpRoute, paramHttpClientContext);
        return paramHttpRoute;
      }
      catch (RuntimeException paramHttpRequestWrapper)
      {
        paramHttpRoute.close();
        throw paramHttpRequestWrapper;
      }
      catch (IOException paramHttpRequestWrapper)
      {
        paramHttpRoute.close();
        throw paramHttpRequestWrapper;
      }
      catch (HttpException paramHttpRequestWrapper)
      {
        label442:
        paramHttpRoute.close();
        throw paramHttpRequestWrapper;
      }
      localObject3 = ((HttpRequest)localObject2).getRequestLine().getUri();
      try
      {
        localObject2 = URI.create((String)localObject3);
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        localObject2 = localObject1;
      }
      if (!log.isDebugEnabled()) {
        break;
      }
      log.debug("Unable to parse '" + (String)localObject3 + "' as a valid URI; " + "request URI and Host header may be inconsistent", localIllegalArgumentException);
      localObject2 = localObject1;
      break;
      localObject1 = localObject3;
      if (localObject2 != null)
      {
        localObject1 = localObject3;
        if (((URI)localObject2).isAbsolute())
        {
          localObject1 = localObject3;
          if (((URI)localObject2).getHost() != null) {
            localObject1 = new HttpHost(((URI)localObject2).getHost(), ((URI)localObject2).getPort(), ((URI)localObject2).getScheme());
          }
        }
      }
    }
  }
  
  void rewriteRequestURI(HttpRequestWrapper paramHttpRequestWrapper, HttpRoute paramHttpRoute)
    throws ProtocolException
  {
    try
    {
      URI localURI = paramHttpRequestWrapper.getURI();
      if (localURI != null)
      {
        if ((paramHttpRoute.getProxyHost() != null) && (!paramHttpRoute.isTunnelled())) {
          if (!localURI.isAbsolute()) {
            paramHttpRoute = URIUtils.rewriteURI(localURI, paramHttpRoute.getTargetHost(), true);
          }
        }
        for (;;)
        {
          paramHttpRequestWrapper.setURI(paramHttpRoute);
          return;
          paramHttpRoute = URIUtils.rewriteURI(localURI);
          continue;
          if (localURI.isAbsolute()) {
            paramHttpRoute = URIUtils.rewriteURI(localURI, null, true);
          } else {
            paramHttpRoute = URIUtils.rewriteURI(localURI);
          }
        }
      }
      return;
    }
    catch (URISyntaxException paramHttpRoute)
    {
      throw new ProtocolException("Invalid URI: " + paramHttpRequestWrapper.getRequestLine().getUri(), paramHttpRoute);
    }
  }
}
