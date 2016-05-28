package com.behance.sdk.asynctask.params;

public class BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams
  extends BehanceSDKAbstractTaskParams
{
  private String authURL;
  private String consumerKey;
  private String consumerSecret;
  
  public BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams() {}
  
  public String getAuthURL()
  {
    return authURL;
  }
  
  public String getConsumerKey()
  {
    return consumerKey;
  }
  
  public String getConsumerSecret()
  {
    return consumerSecret;
  }
  
  public void setAuthURL(String paramString)
  {
    authURL = paramString;
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
