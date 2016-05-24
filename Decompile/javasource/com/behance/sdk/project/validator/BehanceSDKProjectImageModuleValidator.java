package com.behance.sdk.project.validator;

import android.content.Context;
import android.widget.Toast;
import com.behance.sdk.R.string;
import com.behance.sdk.factory.BehanceSDKImageProperties;
import com.behance.sdk.factory.IBehanceSDKImageValidator;
import com.behance.sdk.util.BehanceSDKUtils;
import java.util.ArrayList;
import java.util.List;

public class BehanceSDKProjectImageModuleValidator
  implements IBehanceSDKImageValidator
{
  public BehanceSDKProjectImageModuleValidator() {}
  
  private void displayToastMessage(Context paramContext, String paramString)
  {
    if (paramString != null) {
      Toast.makeText(paramContext, paramString, 1).show();
    }
  }
  
  private boolean imageMatchesRequirements(Context paramContext, BehanceSDKImageProperties paramBehanceSDKImageProperties)
  {
    String str1 = paramBehanceSDKImageProperties.getType();
    String str2 = paramBehanceSDKImageProperties.getName();
    ArrayList localArrayList = BehanceSDKUtils.getAllowedFileExtensionsForProjectImage();
    if ((str1 != null) && (str1.length() > 0))
    {
      if ((localArrayList != null) && (!localArrayList.isEmpty()) && (!localArrayList.contains(str1)))
      {
        displayToastMessage(paramContext, paramContext.getString(R.string.bsdk_publish_project_from_cc_invalid_file_type, new Object[] { str1, localArrayList.toString() }));
        return false;
      }
    }
    else
    {
      displayToastMessage(paramContext, paramContext.getString(R.string.bsdk_image_selector_view_image_file_type_invalid_msg, new Object[] { str2 }));
      return false;
    }
    long l = paramBehanceSDKImageProperties.getSize();
    if ((l < 0L) || ((8388608L > 0L) && (l > 8388608L)))
    {
      displayToastMessage(paramContext, paramContext.getString(R.string.bsdk_publish_project_from_cc_invalid_image_size, new Object[] { str2, "8 MB" }));
      return false;
    }
    return true;
  }
  
  public boolean validate(Context paramContext, BehanceSDKImageProperties paramBehanceSDKImageProperties)
  {
    return imageMatchesRequirements(paramContext, paramBehanceSDKImageProperties);
  }
}
