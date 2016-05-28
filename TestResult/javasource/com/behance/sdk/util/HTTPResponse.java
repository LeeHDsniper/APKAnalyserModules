package com.behance.sdk.util;

public class HTTPResponse
{
  private String reasonPhrase;
  private int responseCode;
  private String responseString;
  
  public HTTPResponse() {}
  
  public String getReasonPhrase()
  {
    return reasonPhrase;
  }
  
  public String getResponseString()
  {
    return responseString;
  }
  
  public int getStatusCode()
  {
    return responseCode;
  }
  
  public void setReasonPhrase(String paramString)
  {
    reasonPhrase = paramString;
  }
  
  public void setResponseString(String paramString)
  {
    responseString = paramString;
  }
  
  public void setStatusCode(int paramInt)
  {
    responseCode = paramInt;
  }
}
