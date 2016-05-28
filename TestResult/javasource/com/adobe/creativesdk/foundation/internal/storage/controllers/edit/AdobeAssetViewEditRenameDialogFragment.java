package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceType;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetBrowserCommandMgr;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewBrowserCommandName;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession;
import com.adobe.creativesdk.foundation.internal.storage.model.services.IAdobeStorageSessionEditCallback;
import com.adobe.creativesdk.foundation.internal.utils.AdobeDialogFragment;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import java.util.Observer;

public class AdobeAssetViewEditRenameDialogFragment
  extends AdobeDialogFragment
{
  private AdobeCloud _cloud;
  private boolean _isAttached;
  private Observer _observer;
  private AdobeAsset _targetAsset;
  private IAdobeCCFilesRenameDialogDismissController controller;
  
  public AdobeAssetViewEditRenameDialogFragment() {}
  
  private void finishDialog()
  {
    dismissKeyBoard();
    dismissAllowingStateLoss();
  }
  
  private String getResourceString(int paramInt)
  {
    return getResources().getString(paramInt);
  }
  
  private void handleAssetRename()
  {
    _observer.update(null, AdobeCCFilesEditRenameOperationStatus.ADOBE_CC_FILES_EDIT_RENAME_OPERATION_STATUS_COMPLETED);
    finishDialog();
  }
  
  private void handleCancelOperation()
  {
    finishDialog();
  }
  
  private void handleRenameError()
  {
    enableNegativeButton();
    if (_isAttached == true) {
      showErrorDialog(getResourceString(R.string.adobe_asset_view_edit_rename_dialog_error_message));
    }
    _observer.update(null, AdobeCCFilesEditRenameOperationStatus.ADOBE_CC_FILES_EDIT_RENAME_OPERATION_STATUS_FAILED);
  }
  
  private void notifiyEditStarted()
  {
    AdobeCCFilesEditManager.setEditInProgress(true);
    AdobeCCFilesEditManager.setEditStarted(true);
    AdobeAssetBrowserCommandMgr.getInstance().postCommand(AdobeAssetViewBrowserCommandName.ACTION_ASSETVIEW_EDIT_STARTED);
  }
  
  private void renameAsset()
  {
    String str = getEnteredText();
    AdobeStorageSession localAdobeStorageSession = (AdobeStorageSession)_cloud.getSessionForService(AdobeCloudServiceType.AdobeCloudServiceTypeStorage);
    disablePositiveButton();
    disableNegativeButton();
    notifiyEditStarted();
    localAdobeStorageSession.renameAsset(_targetAsset, str, new IAdobeStorageSessionEditCallback()
    {
      public void onComplete()
      {
        AdobeAssetViewEditRenameDialogFragment.this.handleAssetRename();
      }
      
      public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
      {
        AdobeAssetViewEditRenameDialogFragment.this.handleRenameError();
      }
    });
  }
  
  public void handleNegativeClick()
  {
    handleCancelOperation();
  }
  
  public void handlePositiveClick()
  {
    renameAsset();
  }
  
  public void handleTextChanged()
  {
    if ((getEnteredText() != null) && (getEnteredText().length() > 0))
    {
      enablePositiveButton();
      return;
    }
    disablePositiveButton();
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    _isAttached = true;
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    setDialogTitle(getResourceString(R.string.adobe_asset_view_edit_rename_dialog_title));
    setEditTextHint(getResourceString(R.string.adobe_asset_view_edit_rename_dialog_hint_text));
    setNegativeButtonTitle(getResourceString(R.string.adobe_asset_view_edit_rename_dialog_negative_button));
    setPositiveButtonTitle(getResourceString(R.string.adobe_asset_view_edit_rename_dialog_positive_button));
    return super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onDetach()
  {
    super.onDetach();
    _isAttached = false;
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    super.onDismiss(paramDialogInterface);
    controller.dialogClosed();
  }
  
  public void setDismissController(IAdobeCCFilesRenameDialogDismissController paramIAdobeCCFilesRenameDialogDismissController)
  {
    controller = paramIAdobeCCFilesRenameDialogDismissController;
  }
  
  public void setParameters(AdobeAsset paramAdobeAsset, Observer paramObserver, AdobeCloud paramAdobeCloud)
  {
    _targetAsset = paramAdobeAsset;
    _observer = paramObserver;
    _cloud = paramAdobeCloud;
  }
}
