package com.behance.sdk.project.validator;

import android.content.Context;
import android.widget.Toast;
import com.behance.sdk.R.string;
import com.behance.sdk.factory.BehanceSDKImageProperties;
import com.behance.sdk.factory.IBehanceSDKImageValidator;
import com.behance.sdk.util.BehanceSDKUtils;
import java.util.ArrayList;
import java.util.List;

public class BehanceSDKWIPImageModuleValidator
  implements IBehanceSDKImageValidator
{
  public BehanceSDKWIPImageModuleValidator() {}
  
  private void displayToastMessage(Context paramContext, String paramString)
  {
    if ((paramContext != null) && (paramString != null)) {
      Toast.makeText(paramContext, paramString, 1).show();
    }
  }
  
  private boolean imageMatchesRequirements(Context paramContext, BehanceSDKImageProperties paramBehanceSDKImageProperties)
  {
    String str1 = paramBehanceSDKImageProperties.getName();
    String str2 = paramBehanceSDKImageProperties.getType();
    ArrayList localArrayList = BehanceSDKUtils.getAllowedFileExtensionsForWIPImage();
    if ((str2 != null) && (str2.length() > 0))
    {
      if (0 != 0) {
        throw new NullPointerException();
      }
      if ((localArrayList != null) && (!localArrayList.isEmpty()) && (!localArrayList.contains(str2)))
      {
        displayToastMessage(paramContext, paramContext.getString(R.string.bsdk_image_selector_view_image_file_type_allowed_msg, new Object[] { str1, localArrayList.toString() }));
        return false;
      }
    }
    else
    {
      displayToastMessage(paramContext, paramContext.getString(R.string.bsdk_image_selector_view_image_file_type_invalid_msg, new Object[] { str1 }));
      return false;
    }
    int j = paramBehanceSDKImageProperties.getWidth();
    int i = paramBehanceSDKImageProperties.getHeight();
    long l = paramBehanceSDKImageProperties.getSize();
    if (l > 0L)
    {
      if ((-1L > 0L) && (l < -1L))
      {
        paramBehanceSDKImageProperties = -1L / 1048576L + " MB";
        displayToastMessage(paramContext, paramContext.getString(R.string.bsdk_image_selector_view_image_size_less_than_min_required_msg, new Object[] { paramBehanceSDKImageProperties }));
        return false;
      }
      if ((12582912L > 0L) && (l > 12582912L))
      {
        paramBehanceSDKImageProperties = 12582912L / 1048576L + " MB";
        displayToastMessage(paramContext, paramContext.getString(R.string.bsdk_image_selector_view_image_size_more_than_max_allowed_msg, new Object[] { paramBehanceSDKImageProperties }));
        return false;
      }
    }
    else
    {
      displayToastMessage(paramContext, paramContext.getString(R.string.bsdk_image_selector_view_image_size_invalid_msg));
      return false;
    }
    if ((j > 0) && (i > 0))
    {
      if (('ʀ' > 0) && ('ŀ' > 0) && ((j < 640) || (i < 320)))
      {
        displayToastMessage(paramContext, paramContext.getString(R.string.bsdk_image_selector_view_image_dimensions_less_than_min_required_msg, new Object[] { Integer.valueOf(640), Integer.valueOf(320), Integer.valueOf(j), Integer.valueOf(i) }));
        return false;
      }
      if ((-1 > 0) && (-1 > 0) && ((j > -1) || (i > -1)))
      {
        displayToastMessage(paramContext, paramContext.getString(R.string.bsdk_image_selector_view_image_dimensions_more_than_max_allowed_msg, new Object[] { Integer.valueOf(-1), Integer.valueOf(-1), Integer.valueOf(j), Integer.valueOf(i) }));
        return false;
      }
      return true;
    }
    displayToastMessage(paramContext, paramContext.getString(R.string.bsdk_image_selector_view_image_dimensions_invalid_msg));
    return false;
  }
  
  public boolean validate(Context paramContext, BehanceSDKImageProperties paramBehanceSDKImageProperties)
  {
    return imageMatchesRequirements(paramContext, paramBehanceSDKImageProperties);
  }
}
