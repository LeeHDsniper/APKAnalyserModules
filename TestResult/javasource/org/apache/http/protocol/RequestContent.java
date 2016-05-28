package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolException;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;

@Immutable
public class RequestContent
  implements HttpRequestInterceptor
{
  private final boolean overwrite;
  
  public RequestContent()
  {
    this(false);
  }
  
  public RequestContent(boolean paramBoolean)
  {
    overwrite = paramBoolean;
  }
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    if ((paramHttpRequest instanceof HttpEntityEnclosingRequest))
    {
      if (!overwrite) {
        break label74;
      }
      paramHttpRequest.removeHeaders("Transfer-Encoding");
      paramHttpRequest.removeHeaders("Content-Length");
    }
    HttpEntity localHttpEntity;
    label74:
    do
    {
      paramHttpContext = paramHttpRequest.getRequestLine().getProtocolVersion();
      localHttpEntity = ((HttpEntityEnclosingRequest)paramHttpRequest).getEntity();
      if (localHttpEntity != null) {
        break;
      }
      paramHttpRequest.addHeader("Content-Length", "0");
      return;
      if (paramHttpRequest.containsHeader("Transfer-Encoding")) {
        throw new ProtocolException("Transfer-encoding header already present");
      }
    } while (!paramHttpRequest.containsHeader("Content-Length"));
    throw new ProtocolException("Content-Length header already present");
    if ((localHttpEntity.isChunked()) || (localHttpEntity.getContentLength() < 0L))
    {
      if (paramHttpContext.lessEquals(HttpVersion.HTTP_1_0)) {
        throw new ProtocolException("Chunked transfer encoding not allowed for " + paramHttpContext);
      }
      paramHttpRequest.addHeader("Transfer-Encoding", "chunked");
    }
    for (;;)
    {
      if ((localHttpEntity.getContentType() != null) && (!paramHttpRequest.containsHeader("Content-Type"))) {
        paramHttpRequest.addHeader(localHttpEntity.getContentType());
      }
      if ((localHttpEntity.getContentEncoding() == null) || (paramHttpRequest.containsHeader("Content-Encoding"))) {
        break;
      }
      paramHttpRequest.addHeader(localHttpEntity.getContentEncoding());
      return;
      paramHttpRequest.addHeader("Content-Length", Long.toString(localHttpEntity.getContentLength()));
    }
  }
}
