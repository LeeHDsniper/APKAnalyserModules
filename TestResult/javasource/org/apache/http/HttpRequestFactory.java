package org.apache.http;

public abstract interface HttpRequestFactory
{
  public abstract HttpRequest newHttpRequest(String paramString1, String paramString2)
    throws MethodNotSupportedException;
  
  public abstract HttpRequest newHttpRequest(RequestLine paramRequestLine)
    throws MethodNotSupportedException;
}
