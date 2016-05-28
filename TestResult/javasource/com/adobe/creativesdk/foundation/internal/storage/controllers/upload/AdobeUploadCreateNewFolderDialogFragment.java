package com.adobe.creativesdk.foundation.internal.storage.controllers.upload;

import android.content.res.Resources;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.auth.AdobeAuthException;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetBrowserCommandMgr;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetDataSourceMgr;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewUtils;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.AdobeDialogFragment;
import com.adobe.creativesdk.foundation.storage.AdobeAssetErrorCode;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;

public class AdobeUploadCreateNewFolderDialogFragment
  extends AdobeDialogFragment
{
  AdobeAssetFolder _currentFolder;
  private boolean _dialogStopped;
  private FolderCreationSavedResult _savedFolderCreationResult;
  
  public AdobeUploadCreateNewFolderDialogFragment() {}
  
  private void finishDialog()
  {
    dismissKeyBoard();
    dismiss();
  }
  
  private void handleErrorFolderCreation(AdobeCSDKException paramAdobeCSDKException)
  {
    enableNegativeButton();
    showError(paramAdobeCSDKException);
  }
  
  private void handleNewFolderCreation(AdobeAssetFolder paramAdobeAssetFolder)
  {
    hideErrorDialog();
    AdobeAssetDataSourceMgr.getInstance().setFolderAsChanged(_currentFolder);
    AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_NEWFOLDER_CREATED, paramAdobeAssetFolder);
    finishDialog();
  }
  
  private void showError(AdobeCSDKException paramAdobeCSDKException)
  {
    int i = R.string.adobe_common_error_while_creating_folder;
    if ((paramAdobeCSDKException instanceof AdobeAssetException))
    {
      paramAdobeCSDKException = (AdobeAssetException)paramAdobeCSDKException;
      if (paramAdobeCSDKException.getErrorCode() == AdobeAssetErrorCode.AdobeAssetErrorFileReadFailure) {
        i = R.string.adobe_common_error_folder_invalid_chars;
      }
    }
    for (;;)
    {
      showErrorDialog(getResources().getString(i));
      return;
      if (paramAdobeCSDKException.getHttpStatusCode().intValue() == 409)
      {
        i = R.string.storage_create_folder_already_exists_error;
        continue;
        if ((paramAdobeCSDKException instanceof AdobeAuthException)) {
          i = R.string.storage_create_folder_authention_requires_error;
        }
      }
    }
  }
  
  public void cancelNewFolder()
  {
    dismissKeyBoard();
    dismiss();
  }
  
  public void createNewFolder()
  {
    String str = getEnteredText();
    _dialogStopped = false;
    str = str.trim();
    if ((str != null) && (str.length() != 0))
    {
      disableNegativeButton();
      disablePositiveButton();
      IAdobeGenericCompletionCallback local1 = new IAdobeGenericCompletionCallback()
      {
        public void onCompletion(AdobeAssetFolder paramAnonymousAdobeAssetFolder)
        {
          if (_dialogStopped)
          {
            AdobeUploadCreateNewFolderDialogFragment.access$102(AdobeUploadCreateNewFolderDialogFragment.this, new AdobeUploadCreateNewFolderDialogFragment.FolderCreationSavedResult(AdobeUploadCreateNewFolderDialogFragment.this));
            _savedFolderCreationResult.newlyCreatedFolderObj = paramAnonymousAdobeAssetFolder;
            return;
          }
          AdobeUploadCreateNewFolderDialogFragment.this.handleNewFolderCreation(paramAnonymousAdobeAssetFolder);
        }
      };
      IAdobeGenericErrorCallback local2 = new IAdobeGenericErrorCallback()
      {
        public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
        {
          if (_dialogStopped)
          {
            AdobeUploadCreateNewFolderDialogFragment.access$102(AdobeUploadCreateNewFolderDialogFragment.this, new AdobeUploadCreateNewFolderDialogFragment.FolderCreationSavedResult(AdobeUploadCreateNewFolderDialogFragment.this));
            _savedFolderCreationResult.errorObj = paramAnonymousAdobeCSDKException;
            return;
          }
          AdobeUploadCreateNewFolderDialogFragment.this.handleErrorFolderCreation(paramAnonymousAdobeCSDKException);
        }
      };
      AdobeAssetFolder.create(str, _currentFolder, local1, local2);
      return;
    }
  }
  
  public void handleNegativeClick()
  {
    cancelNewFolder();
  }
  
  public void handlePositiveClick()
  {
    createNewFolder();
  }
  
  public void handleTextChanged()
  {
    hideErrorDialog();
    if ((getEnteredText() != null) && (getEnteredText().trim().length() > 0))
    {
      enablePositiveButton();
      return;
    }
    disablePositiveButton();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    _currentFolder = AdobeAssetViewUtils.getAssetFolderFromHref(getArguments().getString(AdobeUploadCreateNewFolderMgr.PARENT_COLLECTION_KEY), false);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    setDialogTitle(getResources().getString(R.string.CREATE_NEW_FOLDER_DIALOG_TITLE));
    setPositiveButtonTitle(getResources().getString(R.string.CREATE_NEW_FOLDER_BUTTON_CREATE));
    setNegativeButtonTitle(getResources().getString(R.string.CREATE_NEW_FOLDER_BUTTON_CANCEL));
    setEditTextHint(getResources().getString(R.string.CREATE_NEW_FOLDER_EDIT_TEXT_HINT));
    return super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onStart()
  {
    super.onStart();
    _dialogStopped = false;
    if (_savedFolderCreationResult != null)
    {
      if (_savedFolderCreationResult.newlyCreatedFolderObj != null) {
        handleNewFolderCreation(_savedFolderCreationResult.newlyCreatedFolderObj);
      }
    }
    else {
      return;
    }
    if (_savedFolderCreationResult.errorObj != null) {
      handleErrorFolderCreation(_savedFolderCreationResult.errorObj);
    }
    _savedFolderCreationResult = null;
  }
  
  public void onStop()
  {
    super.onStop();
    _dialogStopped = true;
  }
  
  class FolderCreationSavedResult
  {
    public AdobeCSDKException errorObj;
    public AdobeAssetFolder newlyCreatedFolderObj;
    
    FolderCreationSavedResult() {}
  }
}
