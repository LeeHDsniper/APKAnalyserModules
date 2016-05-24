package com.behance.sdk.fragments.headless;

import android.support.v4.app.Fragment;
import com.behance.sdk.dto.BehanceSDKCreativeFieldDTO;
import com.behance.sdk.enums.BehanceSDKCopyrightOption;
import com.behance.sdk.ui.fragments.BehanceSDKCopyrightSettingsDialog.Callbacks;
import com.behance.sdk.ui.fragments.BehanceSDKCreativeFieldsFilterDialog.Callbacks;
import com.facebook.Request;
import com.facebook.Request.GraphUserCallback;
import com.facebook.Response;
import com.facebook.Session;
import com.facebook.model.GraphUser;
import java.util.List;

public class BehanceSDKPublishProjectHeadlessFragment
  extends Fragment
  implements BehanceSDKCopyrightSettingsDialog.Callbacks, BehanceSDKCreativeFieldsFilterDialog.Callbacks
{
  private Callbacks callbacks;
  private boolean getFacebookUserIdInProgress = false;
  
  public BehanceSDKPublishProjectHeadlessFragment()
  {
    setRetainInstance(true);
  }
  
  public void loadFacebookUserId(Session paramSession)
  {
    setGetFacebookUserIdInProgress(true);
    Request.executeBatchAsync(new Request[] { Request.newMeRequest(paramSession, new Request.GraphUserCallback()
    {
      public void onCompleted(GraphUser paramAnonymousGraphUser, Response paramAnonymousResponse)
      {
        setGetFacebookUserIdInProgress(false);
        if (callbacks != null)
        {
          if (paramAnonymousGraphUser != null) {
            callbacks.onGetFacebookUserIdComplete(paramAnonymousGraphUser.getName());
          }
        }
        else {
          return;
        }
        callbacks.onGetFacebookUserIdComplete(null);
      }
    }) });
  }
  
  public void onCopyrightSettingSelected(BehanceSDKCopyrightOption paramBehanceSDKCopyrightOption)
  {
    if (callbacks != null) {
      callbacks.onCopyrightSettingSelected(paramBehanceSDKCopyrightOption);
    }
  }
  
  public void onCreativeFieldsSelected(List<BehanceSDKCreativeFieldDTO> paramList)
  {
    if (callbacks != null) {
      callbacks.onCreativeFieldsSelected(paramList);
    }
  }
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public void setGetFacebookUserIdInProgress(boolean paramBoolean)
  {
    getFacebookUserIdInProgress = paramBoolean;
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onCopyrightSettingSelected(BehanceSDKCopyrightOption paramBehanceSDKCopyrightOption);
    
    public abstract void onCreativeFieldsSelected(List<BehanceSDKCreativeFieldDTO> paramList);
    
    public abstract void onGetFacebookUserIdComplete(String paramString);
  }
}
