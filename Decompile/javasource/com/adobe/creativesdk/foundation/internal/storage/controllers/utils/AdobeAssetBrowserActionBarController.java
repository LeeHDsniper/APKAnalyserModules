package com.adobe.creativesdk.foundation.internal.storage.controllers.utils;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.internal.storage.controllers.actionbar.AdobeUxActionBarDropDownController;

public class AdobeAssetBrowserActionBarController
{
  public static void setActionBarDropDownDetails(boolean paramBoolean, String paramString, AdobeCloud paramAdobeCloud)
  {
    if (AdobeUxActionBarDropDownController.getInstance() != null) {
      AdobeUxActionBarDropDownController.getInstance().setDropDownDetails(paramBoolean, paramString, paramAdobeCloud);
    }
  }
  
  public static void setTitle(String paramString, AdobeCloud paramAdobeCloud)
  {
    setActionBarDropDownDetails(false, paramString, paramAdobeCloud);
  }
}
