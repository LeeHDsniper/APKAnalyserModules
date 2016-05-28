package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.HttpException;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.StatusLine;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.util.Args;

@ThreadSafe
public class ResponseDate
  implements HttpResponseInterceptor
{
  private static final HttpDateGenerator DATE_GENERATOR = new HttpDateGenerator();
  
  public ResponseDate() {}
  
  public void process(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    if ((paramHttpResponse.getStatusLine().getStatusCode() >= 200) && (!paramHttpResponse.containsHeader("Date"))) {
      paramHttpResponse.setHeader("Date", DATE_GENERATOR.getCurrentDate());
    }
  }
}
