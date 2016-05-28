package org.apache.http;

import java.io.IOException;
import org.apache.http.protocol.HttpContext;

public abstract interface HttpRequestInterceptor
{
  public abstract void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException;
}
