package com.adobe.creativesdk.aviary.internal.utils;

import android.content.Context;
import com.adobe.creativesdk.aviary.IAviaryClientCredentials;

public final class CredentialsUtils
{
  private static String mApiKey;
  private static String mApiKeySecret;
  private static String mBillingKey;
  
  public static String getApiKey(Context paramContext)
  {
    if (mApiKey == null) {
      mApiKey = ((IAviaryClientCredentials)paramContext.getApplicationContext()).getClientID();
    }
    return mApiKey;
  }
  
  public static String getApiSecret(Context paramContext)
  {
    if (mApiKeySecret == null) {
      mApiKeySecret = ((IAviaryClientCredentials)paramContext.getApplicationContext()).getClientSecret();
    }
    return mApiKeySecret;
  }
  
  public static String getBillingKey(Context paramContext)
  {
    if (mBillingKey == null) {
      mBillingKey = ((IAviaryClientCredentials)paramContext.getApplicationContext()).getBillingKey();
    }
    return mBillingKey;
  }
}
