package org.apache.http;

public abstract interface HttpRequest
  extends HttpMessage
{
  public abstract RequestLine getRequestLine();
}
