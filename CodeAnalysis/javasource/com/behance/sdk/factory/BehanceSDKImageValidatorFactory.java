package com.behance.sdk.factory;

import com.behance.sdk.project.validator.BehanceSDKProjectImageModuleValidator;
import com.behance.sdk.project.validator.BehanceSDKWIPImageModuleValidator;

public class BehanceSDKImageValidatorFactory
{
  public BehanceSDKImageValidatorFactory() {}
  
  public static BehanceSDKImageValidatorFactory getInstance()
  {
    return new BehanceSDKImageValidatorFactory();
  }
  
  public IBehanceSDKImageValidator getImageValidator(String paramString)
  {
    if ("PUBLISH_PROJECT_IMAGE_VALIDATOR".equals(paramString)) {
      return new BehanceSDKProjectImageModuleValidator();
    }
    if ("PUBLISH_WIP_IMAGE_VALIDATOR".equals(paramString)) {
      return new BehanceSDKWIPImageModuleValidator();
    }
    return null;
  }
}
