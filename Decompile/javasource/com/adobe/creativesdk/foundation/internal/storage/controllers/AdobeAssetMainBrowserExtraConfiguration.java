package com.adobe.creativesdk.foundation.internal.storage.controllers;

public class AdobeAssetMainBrowserExtraConfiguration
{
  public static String SHOULD_USE_DROP_DOWN_KEY = "SHOULD_USE_DROP_DOWN";
  public static String START_WITH_COLLECTION_HREF_KEY = "START_WITH_COLLECTION_HREF_KEY";
  private boolean shouldUseDropDownActionBar = true;
  private String startWithCollectionHref;
  
  AdobeAssetMainBrowserExtraConfiguration(String paramString, boolean paramBoolean)
  {
    startWithCollectionHref = paramString;
    shouldUseDropDownActionBar = paramBoolean;
  }
  
  public String startWithCollectionHref()
  {
    return startWithCollectionHref;
  }
  
  public boolean useDropDownActionBar()
  {
    return shouldUseDropDownActionBar;
  }
}
