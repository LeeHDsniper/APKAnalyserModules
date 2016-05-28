package com.adobe.creativesdk.foundation.internal.storage.controllers.collaboration;

import android.content.res.Resources;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.auth.AdobeAuthUserProfile;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeCollaborationException;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeCollaborationSession;
import com.adobe.creativesdk.foundation.internal.collaboration.IAdobeCollaborationInviteUserCallBack;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaborationInvite;
import com.adobe.creativesdk.foundation.internal.collaboration.models.AdobeCollaboratorInvitation;
import com.adobe.creativesdk.foundation.internal.utils.AdobeDialogFragment;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Observer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AdobeAssetViewCollaborationInviteDialogFragment
  extends AdobeDialogFragment
{
  private Observer _clientObserver = null;
  private ArrayList<AdobeCollaboratorInvitation> _collaboratorsInviteesList;
  private AdobeAssetFolder _currentFolder = null;
  private boolean _dialogStopped = false;
  EmailInviteSaveResult _emailInviteSaveResult;
  
  public AdobeAssetViewCollaborationInviteDialogFragment() {}
  
  private void finishDialog()
  {
    dismissKeyBoard();
    dismiss();
  }
  
  private void handleErrorInviteCreation(String paramString)
  {
    showError(paramString);
  }
  
  private void handleNewInviteCreation(AdobeCollaborationInvite paramAdobeCollaborationInvite)
  {
    hideErrorDialog();
    HashMap localHashMap = new HashMap();
    localHashMap.put("Invite", paramAdobeCollaborationInvite);
    if (_clientObserver != null) {
      _clientObserver.update(null, localHashMap);
    }
    finishDialog();
  }
  
  private boolean isEmail(String paramString)
  {
    if ((paramString == null) || (paramString == "") || (paramString.length() < 3)) {
      return false;
    }
    String str = paramString;
    if (paramString != null) {
      str = paramString.trim();
    }
    return Pattern.compile("^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}").matcher(str).find();
  }
  
  private void showError(String paramString)
  {
    enableNegativeButton();
    showErrorDialog(paramString);
  }
  
  public void createNewInvite()
  {
    String str;
    int k;
    int i;
    if (getEnteredText() != null)
    {
      str = getEnteredText();
      k = 0;
      if (_collaboratorsInviteesList == null) {
        break label105;
      }
      i = 0;
      j = k;
      if (i < _collaboratorsInviteesList.size()) {
        if (!str.equals(((AdobeCollaboratorInvitation)_collaboratorsInviteesList.get(i)).getEmail())) {
          break label98;
        }
      }
    }
    for (int j = 1;; j = k)
    {
      if ((j != 1) && (!AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().getUserProfile().getEmail().equals(str))) {
        break label114;
      }
      showError(getResources().getString(R.string.COLLABORATION_ALREADY_USED));
      return;
      label98:
      i += 1;
      break;
      label105:
      finishDialog();
    }
    label114:
    hideErrorDialog();
    _dialogStopped = false;
    disableNegativeButton();
    disablePositiveButton();
    AdobeCollaborationSession.getSharedSession().createInvite(_currentFolder, str, new IAdobeCollaborationInviteUserCallBack()
    {
      public void onComplete(AdobeCollaborationInvite paramAnonymousAdobeCollaborationInvite)
      {
        if (_dialogStopped)
        {
          _emailInviteSaveResult = new AdobeAssetViewCollaborationInviteDialogFragment.EmailInviteSaveResult(AdobeAssetViewCollaborationInviteDialogFragment.this);
          _emailInviteSaveResult.newlyCreatedInvite = paramAnonymousAdobeCollaborationInvite;
          return;
        }
        AdobeAssetViewCollaborationInviteDialogFragment.this.handleNewInviteCreation(paramAnonymousAdobeCollaborationInvite);
      }
      
      public void onError(AdobeCollaborationException paramAnonymousAdobeCollaborationException)
      {
        if (paramAnonymousAdobeCollaborationException.getHttpStatusCode().intValue() == 404)
        {
          AdobeAssetViewCollaborationInviteDialogFragment.this.handleErrorInviteCreation(getResources().getString(R.string.collaboration_create_invite_error_network));
          return;
        }
        AdobeAssetViewCollaborationInviteDialogFragment.this.handleErrorInviteCreation(getResources().getString(R.string.collaboration_create_invite_error));
      }
    });
  }
  
  public void handleNegativeClick()
  {
    finishDialog();
  }
  
  public void handlePositiveClick()
  {
    createNewInvite();
  }
  
  public void handleTextChanged()
  {
    if ((getEnteredText() != null) && (isEmail(getEnteredText())))
    {
      enablePositiveButton();
      return;
    }
    disablePositiveButton();
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    setDialogTitle(getResources().getString(R.string.CREATE_NEW_INVITE_TITLE));
    setPositiveButtonTitle(getResources().getString(R.string.COLLABORATION_INVITE));
    setNegativeButtonTitle(getResources().getString(R.string.COLLABORATION_INVITE_CANCEL));
    setEditTextHint(getResources().getString(R.string.COLLABORATE_INVITE_EDIT_TEXT_HINT));
    setEditTextSingleLine();
    return super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onStart()
  {
    _dialogStopped = false;
    super.onStart();
    if (_emailInviteSaveResult != null)
    {
      if (_emailInviteSaveResult.newlyCreatedInvite != null) {
        handleNewInviteCreation(_emailInviteSaveResult.newlyCreatedInvite);
      }
    }
    else {
      return;
    }
    _emailInviteSaveResult = null;
  }
  
  public void onStop()
  {
    super.onStop();
    _dialogStopped = true;
  }
  
  public void setCollaboratorsList(ArrayList<AdobeCollaboratorInvitation> paramArrayList)
  {
    _collaboratorsInviteesList = paramArrayList;
  }
  
  public void setFolderAndObserver(AdobeAssetFolder paramAdobeAssetFolder, Observer paramObserver)
  {
    _currentFolder = paramAdobeAssetFolder;
    _clientObserver = paramObserver;
  }
  
  class EmailInviteSaveResult
  {
    AdobeCollaborationInvite newlyCreatedInvite;
    
    EmailInviteSaveResult() {}
  }
}
