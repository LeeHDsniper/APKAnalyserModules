package com.behance.sdk.dto;

import com.behance.sdk.enums.BehanceSDKSocialAccountType;

public class BehanceSDKSocialAccountDTO
{
  private String accountClientId;
  private String accountClientSecret;
  private int accountDisplayNameResourceId;
  private BehanceSDKSocialAccountType accountType;
  private String additionalData;
  private boolean sharingEnabledLastTime;
  private String userAuthToken;
  private long userAuthTokenExpiryTime;
  private boolean userAuthenticated;
  private String userId;
  
  public BehanceSDKSocialAccountDTO() {}
  
  public String getAccountClientId()
  {
    return accountClientId;
  }
  
  public String getAccountClientSecret()
  {
    return accountClientSecret;
  }
  
  public int getAccountDisplayNameResourceId()
  {
    return accountDisplayNameResourceId;
  }
  
  public BehanceSDKSocialAccountType getAccountType()
  {
    return accountType;
  }
  
  public String getAdditionalData()
  {
    return additionalData;
  }
  
  public String getUserAuthToken()
  {
    return userAuthToken;
  }
  
  public long getUserAuthTokenExpiryTime()
  {
    return userAuthTokenExpiryTime;
  }
  
  public String getUserId()
  {
    return userId;
  }
  
  public boolean isSharingEnabledLastTime()
  {
    return sharingEnabledLastTime;
  }
  
  public boolean isUserAuthenticated()
  {
    return userAuthenticated;
  }
  
  public void setAccountClientId(String paramString)
  {
    accountClientId = paramString;
  }
  
  public void setAccountClientSecret(String paramString)
  {
    accountClientSecret = paramString;
  }
  
  public void setAccountDisplayNameResourceId(int paramInt)
  {
    accountDisplayNameResourceId = paramInt;
  }
  
  public void setAccountType(BehanceSDKSocialAccountType paramBehanceSDKSocialAccountType)
  {
    accountType = paramBehanceSDKSocialAccountType;
  }
  
  public void setAdditionalData(String paramString)
  {
    additionalData = paramString;
  }
  
  public void setSharingEnabledLastTime(boolean paramBoolean)
  {
    sharingEnabledLastTime = paramBoolean;
  }
  
  public void setUserAuthToken(String paramString)
  {
    userAuthToken = paramString;
  }
  
  public void setUserAuthTokenExpiryTime(long paramLong)
  {
    userAuthTokenExpiryTime = paramLong;
  }
  
  public void setUserAuthenticated(boolean paramBoolean)
  {
    userAuthenticated = paramBoolean;
  }
  
  public void setUserId(String paramString)
  {
    userId = paramString;
  }
}
