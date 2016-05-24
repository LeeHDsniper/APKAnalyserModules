package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import android.os.Bundle;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import java.util.HashMap;

public class AdobeAssetViewEditActivityConfiguration
{
  public static String ADOBE_CLOUD_KEY = "ADOBE_CLOUD";
  private AdobeCloud _cloud;
  private HashMap<String, Object> _configuration = new HashMap();
  
  private AdobeAssetViewEditActivityConfiguration(AdobeAssetViewEditActivityOperationMode paramAdobeAssetViewEditActivityOperationMode)
  {
    _configuration.put("EDIT_ACTIVITY_OPERATION_MODE", paramAdobeAssetViewEditActivityOperationMode);
  }
  
  public static AdobeAssetViewEditActivityConfiguration getConfigurationFromBundle(Bundle paramBundle)
  {
    AdobeAssetViewEditActivityConfiguration localAdobeAssetViewEditActivityConfiguration = new AdobeAssetViewEditActivityConfiguration((AdobeAssetViewEditActivityOperationMode)paramBundle.getSerializable("EDIT_ACTIVITY_OPERATION_MODE"));
    if (localAdobeAssetViewEditActivityConfiguration.getEditActivityOperationMode() == AdobeAssetViewEditActivityOperationMode.ADOBE_ASSET_VIEW_EDIT_ACTIVITY_OPERATION_MODE_MULTI_SELECT_EDIT) {
      localAdobeAssetViewEditActivityConfiguration.setMultiSelectEditTargetHref(paramBundle.getString("MULTI_SELECT_EDIT_TARGET_HREF"));
    }
    paramBundle = (AdobeCloud)paramBundle.getSerializable(ADOBE_CLOUD_KEY);
    if (paramBundle != null) {
      localAdobeAssetViewEditActivityConfiguration.setCloud(AdobeCloudManager.getSharedCloudManager().getMatchingCloud(paramBundle));
    }
    return localAdobeAssetViewEditActivityConfiguration;
  }
  
  public AdobeCloud getCloud()
  {
    return _cloud;
  }
  
  public AdobeAssetViewEditActivityOperationMode getEditActivityOperationMode()
  {
    return (AdobeAssetViewEditActivityOperationMode)_configuration.get("EDIT_ACTIVITY_OPERATION_MODE");
  }
  
  public String getSourceHref()
  {
    return (String)_configuration.get("MULTI_SELECT_EDIT_TARGET_HREF");
  }
  
  public void setCloud(AdobeCloud paramAdobeCloud)
  {
    _cloud = paramAdobeCloud;
  }
  
  public void setMultiSelectEditTargetHref(String paramString)
  {
    _configuration.put("MULTI_SELECT_EDIT_TARGET_HREF", paramString);
  }
}
