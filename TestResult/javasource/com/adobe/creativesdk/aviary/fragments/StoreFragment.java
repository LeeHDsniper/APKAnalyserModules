package com.adobe.creativesdk.aviary.fragments;

import android.content.Context;
import android.os.Bundle;
import com.adobe.creativesdk.aviary.AdobeImageBillingService;

public abstract interface StoreFragment
{
  public abstract Context getActivity();
  
  public abstract Bundle getArguments();
  
  public abstract AdobeImageBillingService getContentService();
  
  public abstract String getUUID();
  
  public abstract boolean isContentServiceConnected();
  
  public abstract boolean isFragmentVisible();
}
