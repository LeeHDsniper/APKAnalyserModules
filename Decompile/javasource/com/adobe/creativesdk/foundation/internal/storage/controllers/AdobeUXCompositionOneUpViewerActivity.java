package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetCompPage;
import com.adobe.creativesdk.foundation.internal.storage.asset.AdobeAssetPSMixPage;
import com.adobe.creativesdk.foundation.internal.utils.AdobeLocalizedMgr;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPackagePages;

public class AdobeUXCompositionOneUpViewerActivity
  extends AdobeUXMobilePackageItemOneUpViewerActivity
{
  public AdobeUXCompositionOneUpViewerActivity() {}
  
  protected void updateTitleOfActivity()
  {
    mPhotoNumber.setVisibility(8);
    Object localObject2 = MobilePackageItemsOneUpViewController.getInstance().getPackage().getName();
    Object localObject1 = localObject2;
    if (localObject2 == null)
    {
      localObject2 = MobilePackageItemsOneUpViewController.getInstance().getItemAtPos(mPos);
      localObject1 = AdobeLocalizedMgr.getLocalizedString(R.string.adobe_lineordrawcollection_singular);
      if (!(localObject2 instanceof AdobeAssetCompPage)) {
        break label63;
      }
      localObject1 = AdobeLocalizedMgr.getLocalizedString(R.string.adobe_composition_collection_singular);
    }
    for (;;)
    {
      setActionBarTitle((String)localObject1);
      return;
      label63:
      if ((localObject2 instanceof AdobeAssetPSMixPage)) {
        localObject1 = AdobeLocalizedMgr.getLocalizedString(R.string.adobe_psmix_collection_singular);
      }
    }
  }
}
