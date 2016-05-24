package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.os.Bundle;

public class AdobeMobilePackageCollectionConfiguration
  extends AdobeAssetsViewContainerConfiguration
{
  private String targetCollectionHref;
  private String targetParentCollectionHref;
  
  public AdobeMobilePackageCollectionConfiguration() {}
  
  public void createFromBundle(Bundle paramBundle)
  {
    super.createFromBundle(paramBundle);
    targetCollectionHref = ((String)paramBundle.get("mobilePackageCollectionHref"));
    targetParentCollectionHref = ((String)paramBundle.get("mobilePackageCollectionParentHref"));
  }
  
  public String getTargetCollectionHref()
  {
    return targetCollectionHref;
  }
  
  public String getTargetParentCollectionHref()
  {
    return targetParentCollectionHref;
  }
}
