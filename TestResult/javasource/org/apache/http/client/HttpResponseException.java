package org.apache.http.client;

import org.apache.http.annotation.Immutable;

@Immutable
public class HttpResponseException
  extends ClientProtocolException
{
  private static final long serialVersionUID = -7186627969477257933L;
  private final int statusCode;
  
  public HttpResponseException(int paramInt, String paramString)
  {
    super(paramString);
    statusCode = paramInt;
  }
  
  public int getStatusCode()
  {
    return statusCode;
  }
}
