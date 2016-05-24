package com.adobe.creativesdk.foundation.internal.storage.controllers.comments;

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
import com.adobe.creativesdk.foundation.internal.comments.AdobeAssetCommentsManager;
import com.adobe.creativesdk.foundation.internal.comments.IAdobeAddCommentCallback;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession;
import com.adobe.creativesdk.foundation.internal.utils.AdobeDialogFragment;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import java.util.HashMap;
import java.util.Observer;

public class AdobeAssetViewAddCommentsDialogFragment
  extends AdobeDialogFragment
{
  private AdobeCloud _cloud;
  AdobeAssetCommentsManager _commentsManager;
  private boolean _isAttached;
  private Observer _observer;
  private AdobeAsset _targetAsset;
  
  public AdobeAssetViewAddCommentsDialogFragment() {}
  
  private void addComment()
  {
    String str = getEnteredText();
    AdobeStorageSession localAdobeStorageSession = (AdobeStorageSession)_cloud.getSessionForService(AdobeCloudServiceType.AdobeCloudServiceTypeStorage);
    disablePositiveButton();
    disableNegativeButton();
    if (_commentsManager != null) {
      _commentsManager.addComments(str, new IAdobeAddCommentCallback()
      {
        public void onError()
        {
          AdobeAssetViewAddCommentsDialogFragment.this.handleCommentsError();
        }
        
        public void onSuccess(String paramAnonymousString)
        {
          AdobeAssetViewAddCommentsDialogFragment.this.handleAddComments(paramAnonymousString);
        }
      });
    }
  }
  
  private void finishDialog()
  {
    dismissKeyBoard();
    dismissAllowingStateLoss();
  }
  
  private String getResourceString(int paramInt)
  {
    return getResources().getString(paramInt);
  }
  
  private void handleAddComments(String paramString)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put(AdobeAssetViewCommentsKeys.ADOBE_ASSET_VIEW_ADD_COMMENTS_STATUS_KEY, AdobeAssetViewAddCommentOperationStatus.ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_COMPLETED);
    localHashMap.put(AdobeAssetViewCommentsKeys.ADOBE_ASSET_VIEW_ADD_COMMENTS_URL_KEY, paramString);
    _observer.update(null, localHashMap);
    finishDialog();
  }
  
  private void handleCancelOperation()
  {
    finishDialog();
  }
  
  private void handleCommentsError()
  {
    enableNegativeButton();
    if (_isAttached == true)
    {
      showErrorDialog(getResourceString(R.string.adobe_asset_view_add_comments_dialog_error_message));
      enablePositiveButton();
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put(AdobeAssetViewCommentsKeys.ADOBE_ASSET_VIEW_ADD_COMMENTS_STATUS_KEY, AdobeAssetViewAddCommentOperationStatus.ADOBE_CC_FILES_ADD_COMMENT_OPERATION_STATUS_ERROR);
    localHashMap.put(AdobeAssetViewCommentsKeys.ADOBE_ASSET_VIEW_ADD_COMMENTS_URL_KEY, null);
    _observer.update(null, localHashMap);
  }
  
  public void handleNegativeClick()
  {
    handleCancelOperation();
  }
  
  public void handlePositiveClick()
  {
    addComment();
  }
  
  public void handleTextChanged()
  {
    if ((getEnteredText() != null) && (getEnteredText().trim().length() > 0))
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
    setDialogTitle(getResourceString(R.string.adobe_asset_view_add_comments_dialog_title));
    setEditTextHint(getResourceString(R.string.adobe_asset_view_add_comments_dialog_hint_text));
    setNegativeButtonTitle(getResourceString(R.string.adobe_asset_view_add_comments_dialog_negative_button));
    setPositiveButtonTitle(getResourceString(R.string.adobe_asset_view_add_comments_dialog_positive_button));
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
  }
  
  public void setParameters(AdobeAsset paramAdobeAsset, AdobeCloud paramAdobeCloud, Observer paramObserver)
  {
    _targetAsset = paramAdobeAsset;
    if (_targetAsset != null) {
      _commentsManager = new AdobeAssetCommentsManager(_targetAsset);
    }
    _observer = paramObserver;
    _cloud = paramAdobeCloud;
  }
}
