package com.behance.sdk.asynctask.params;

public class BehanceSDKGetAuthURLFromTwitterAsyncTaskParams
  extends BehanceSDKAbstractTaskParams
{
  private String consumerKey;
  private String consumerSecret;
  
  public BehanceSDKGetAuthURLFromTwitterAsyncTaskParams() {}
  
  public String getConsumerKey()
  {
    return consumerKey;
  }
  
  public String getConsumerSecret()
  {
    return consumerSecret;
  }
  
  public void setConsumerKey(String paramString)
  {
    consumerKey = paramString;
  }
  
  public void setConsumerSecret(String paramString)
  {
    consumerSecret = paramString;
  }
}
