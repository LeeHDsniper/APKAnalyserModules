package com.behance.sdk.util;

import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import com.behance.sdk.BehanceSDKImageSelectorOptions;
import com.behance.sdk.ui.fragments.BehanceSDKImageSelectorDialogFragment;
import com.behance.sdk.ui.fragments.BehanceSDKImageSelectorDialogFragment.Callbacks;

public class BehanceSDKLaunchUtil
{
  public static void launchAlbumsViewToPickPicture(BehanceSDKImageSelectorDialogFragment.Callbacks paramCallbacks, BehanceSDKImageSelectorOptions paramBehanceSDKImageSelectorOptions, FragmentManager paramFragmentManager, String paramString)
  {
    paramCallbacks = BehanceSDKImageSelectorDialogFragment.getInstance(paramCallbacks, paramBehanceSDKImageSelectorOptions);
    paramBehanceSDKImageSelectorOptions = paramFragmentManager.beginTransaction();
    paramFragmentManager = paramFragmentManager.findFragmentByTag(paramString);
    if (paramFragmentManager != null) {
      paramBehanceSDKImageSelectorOptions.remove(paramFragmentManager);
    }
    paramCallbacks.show(paramBehanceSDKImageSelectorOptions, paramString);
  }
}
