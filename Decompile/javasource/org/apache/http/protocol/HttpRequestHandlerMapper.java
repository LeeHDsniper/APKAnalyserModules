package org.apache.http.protocol;

import org.apache.http.HttpRequest;

public abstract interface HttpRequestHandlerMapper
{
  public abstract HttpRequestHandler lookup(HttpRequest paramHttpRequest);
}
