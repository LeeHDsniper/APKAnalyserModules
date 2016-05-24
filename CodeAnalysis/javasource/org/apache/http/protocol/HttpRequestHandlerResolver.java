package org.apache.http.protocol;

@Deprecated
public abstract interface HttpRequestHandlerResolver
{
  public abstract HttpRequestHandler lookup(String paramString);
}
