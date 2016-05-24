package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.os.Bundle;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDesignLibraryItemFilter;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDesignLibraryItemFilterType;
import java.util.EnumSet;

public class AdobeDesignLibraryCollectionConfiguration
  extends AdobeAssetsViewContainerConfiguration
{
  private AdobeAssetDesignLibraryItemFilter designLibraryItemFilter;
  private String targetCollectionHref;
  private String targetParentCollectionHref;
  
  public AdobeDesignLibraryCollectionConfiguration() {}
  
  public void createFromBundle(Bundle paramBundle)
  {
    super.createFromBundle(paramBundle);
    targetCollectionHref = ((String)paramBundle.get("designCollectionHref"));
    targetParentCollectionHref = ((String)paramBundle.get("designCollectionParentHref"));
    designLibraryItemFilter = AdobeAssetDesignLibraryItemFilter.createFromDesignLibraryItems((EnumSet)paramBundle.getSerializable("design_library_items_key"), (AdobeAssetDesignLibraryItemFilterType)paramBundle.getSerializable("design_library_items_filtertype"));
  }
  
  AdobeAssetDesignLibraryItemFilter getDesignLibraryItemFilter()
  {
    return designLibraryItemFilter;
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
