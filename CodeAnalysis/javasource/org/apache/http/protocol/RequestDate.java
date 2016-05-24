package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.util.Args;

@ThreadSafe
public class RequestDate
  implements HttpRequestInterceptor
{
  private static final HttpDateGenerator DATE_GENERATOR = new HttpDateGenerator();
  
  public RequestDate() {}
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    if (((paramHttpRequest instanceof HttpEntityEnclosingRequest)) && (!paramHttpRequest.containsHeader("Date"))) {
      paramHttpRequest.setHeader("Date", DATE_GENERATOR.getCurrentDate());
    }
  }
}
