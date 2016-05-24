package com.adobe.creativesdk.aviary;

import com.adobe.creativesdk.foundation.auth.IAdobeAuthClientCredentials;

public abstract interface IAviaryClientCredentials
  extends IAdobeAuthClientCredentials
{
  public abstract String getBillingKey();
}
