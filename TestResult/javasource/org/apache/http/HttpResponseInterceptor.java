package org.apache.http;

import java.io.IOException;
import org.apache.http.protocol.HttpContext;

public abstract interface HttpResponseInterceptor
{
  public abstract void process(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws HttpException, IOException;
}
