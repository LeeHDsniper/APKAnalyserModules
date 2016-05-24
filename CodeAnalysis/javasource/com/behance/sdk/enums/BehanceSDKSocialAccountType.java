package com.behance.sdk.enums;

public enum BehanceSDKSocialAccountType
{
  FACEBOOK,  TWITTER;
  
  private BehanceSDKSocialAccountType() {}
  
  public static BehanceSDKSocialAccountType fromName(String paramString)
  {
    if ((paramString != null) && (paramString.length() > 0))
    {
      BehanceSDKSocialAccountType[] arrayOfBehanceSDKSocialAccountType = values();
      int j = arrayOfBehanceSDKSocialAccountType.length;
      int i = 0;
      while (i < j)
      {
        BehanceSDKSocialAccountType localBehanceSDKSocialAccountType = arrayOfBehanceSDKSocialAccountType[i];
        if (localBehanceSDKSocialAccountType.name().equals(paramString)) {
          return localBehanceSDKSocialAccountType;
        }
        i += 1;
      }
    }
    return null;
  }
}
