package com.adobe.creativesdk.aviary.internal.account;

import com.adobe.creativesdk.aviary.AdobeImageBillingService;
import rx.Observable;

public abstract interface AdobeImageAccountDelegate
{
  public abstract AdobeImageBillingService getContentService();
  
  public abstract boolean isContentServiceConnected();
  
  public abstract Observable<AdobeImageBillingService> tryConnectToContentService();
}
