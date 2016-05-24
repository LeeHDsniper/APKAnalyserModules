package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolVersion;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;

@Immutable
public class ResponseConnControl
  implements HttpResponseInterceptor
{
  public ResponseConnControl() {}
  
  public void process(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    paramHttpContext = HttpCoreContext.adapt(paramHttpContext);
    int i = paramHttpResponse.getStatusLine().getStatusCode();
    if ((i == 400) || (i == 408) || (i == 411) || (i == 413) || (i == 414) || (i == 503) || (i == 501)) {
      paramHttpResponse.setHeader("Connection", "Close");
    }
    do
    {
      do
      {
        do
        {
          return;
          localObject = paramHttpResponse.getFirstHeader("Connection");
        } while ((localObject != null) && ("Close".equalsIgnoreCase(((Header)localObject).getValue())));
        localObject = paramHttpResponse.getEntity();
        if (localObject != null)
        {
          ProtocolVersion localProtocolVersion = paramHttpResponse.getStatusLine().getProtocolVersion();
          if ((((HttpEntity)localObject).getContentLength() < 0L) && ((!((HttpEntity)localObject).isChunked()) || (localProtocolVersion.lessEquals(HttpVersion.HTTP_1_0))))
          {
            paramHttpResponse.setHeader("Connection", "Close");
            return;
          }
        }
        paramHttpContext = paramHttpContext.getRequest();
      } while (paramHttpContext == null);
      Object localObject = paramHttpContext.getFirstHeader("Connection");
      if (localObject != null)
      {
        paramHttpResponse.setHeader("Connection", ((Header)localObject).getValue());
        return;
      }
    } while (!paramHttpContext.getProtocolVersion().lessEquals(HttpVersion.HTTP_1_0));
    paramHttpResponse.setHeader("Connection", "Close");
  }
}
