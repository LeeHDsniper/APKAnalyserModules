package org.apache.http.client;

import java.io.IOException;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.protocol.HttpContext;

@Deprecated
public abstract interface RequestDirector
{
  public abstract HttpResponse execute(HttpHost paramHttpHost, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException;
}
