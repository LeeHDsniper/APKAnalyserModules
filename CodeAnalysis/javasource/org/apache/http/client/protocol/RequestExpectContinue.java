package org.apache.http.client.protocol;

import java.io.IOException;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
public class RequestExpectContinue
  implements HttpRequestInterceptor
{
  public RequestExpectContinue() {}
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    if ((!paramHttpRequest.containsHeader("Expect")) && ((paramHttpRequest instanceof HttpEntityEnclosingRequest)))
    {
      ProtocolVersion localProtocolVersion = paramHttpRequest.getRequestLine().getProtocolVersion();
      HttpEntity localHttpEntity = ((HttpEntityEnclosingRequest)paramHttpRequest).getEntity();
      if ((localHttpEntity != null) && (localHttpEntity.getContentLength() != 0L) && (!localProtocolVersion.lessEquals(HttpVersion.HTTP_1_0)) && (HttpClientContext.adapt(paramHttpContext).getRequestConfig().isExpectContinueEnabled())) {
        paramHttpRequest.addHeader("Expect", "100-continue");
      }
    }
  }
}
