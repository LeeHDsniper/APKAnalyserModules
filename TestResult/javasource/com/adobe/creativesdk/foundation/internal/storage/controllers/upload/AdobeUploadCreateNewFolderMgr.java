package com.adobe.creativesdk.foundation.internal.storage.controllers.upload;

import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.net.URI;

public class AdobeUploadCreateNewFolderMgr
{
  public static String PARENT_COLLECTION_KEY = "parent";
  
  public static DialogFragment getCreateNewFolderDialogFragment(AdobeAssetFolder paramAdobeAssetFolder)
  {
    AdobeUploadCreateNewFolderDialogFragment localAdobeUploadCreateNewFolderDialogFragment = new AdobeUploadCreateNewFolderDialogFragment();
    Bundle localBundle = new Bundle();
    localBundle.putString(PARENT_COLLECTION_KEY, paramAdobeAssetFolder.getHref().toString());
    localAdobeUploadCreateNewFolderDialogFragment.setArguments(localBundle);
    return localAdobeUploadCreateNewFolderDialogFragment;
  }
}
