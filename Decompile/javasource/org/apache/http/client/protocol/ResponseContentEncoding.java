package org.apache.http.client.protocol;

import java.io.IOException;
import java.util.Locale;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.entity.DeflateDecompressingEntity;
import org.apache.http.client.entity.GzipDecompressingEntity;
import org.apache.http.protocol.HttpContext;

@Immutable
public class ResponseContentEncoding
  implements HttpResponseInterceptor
{
  public static final String UNCOMPRESSED = "http.client.response.uncompressed";
  
  public ResponseContentEncoding() {}
  
  public void process(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    paramHttpContext = paramHttpResponse.getEntity();
    int i;
    String str;
    if ((paramHttpContext != null) && (paramHttpContext.getContentLength() != 0L))
    {
      paramHttpContext = paramHttpContext.getContentEncoding();
      if (paramHttpContext != null)
      {
        paramHttpContext = paramHttpContext.getElements();
        i = 0;
        if (paramHttpContext.length < 0)
        {
          paramHttpContext = paramHttpContext[0];
          str = paramHttpContext.getName().toLowerCase(Locale.US);
          if ((!"gzip".equals(str)) && (!"x-gzip".equals(str))) {
            break label135;
          }
          paramHttpResponse.setEntity(new GzipDecompressingEntity(paramHttpResponse.getEntity()));
          i = 1;
        }
        if (i != 0)
        {
          paramHttpResponse.removeHeaders("Content-Length");
          paramHttpResponse.removeHeaders("Content-Encoding");
          paramHttpResponse.removeHeaders("Content-MD5");
        }
      }
    }
    label135:
    do
    {
      return;
      if ("deflate".equals(str))
      {
        paramHttpResponse.setEntity(new DeflateDecompressingEntity(paramHttpResponse.getEntity()));
        i = 1;
        break;
      }
    } while ("identity".equals(str));
    throw new HttpException("Unsupported Content-Coding: " + paramHttpContext.getName());
  }
}
