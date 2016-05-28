package com.behance.sdk.fragments.headless;

import android.os.AsyncTask;
import android.support.v4.app.Fragment;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.asynctask.listeners.IBehanceSDKGetUserWIPsTaskListener;
import com.behance.sdk.asynctask.params.BehanceSDKAbstractTaskParams;
import com.behance.sdk.asynctask.params.BehanceSDKGetUserWIPsTaskParams;
import com.behance.sdk.asynctasks.BehanceSDKGetUserWIPsAsyncTask;
import com.behance.sdk.dto.BehanceSDKWIPDTO;
import com.behance.sdk.managers.AddWIPManager;
import com.facebook.Request;
import com.facebook.Request.GraphUserCallback;
import com.facebook.Response;
import com.facebook.Session;
import com.facebook.model.GraphUser;
import java.util.List;

public class BehanceSDKPublishWIPHeadlessFragment
  extends Fragment
  implements IBehanceSDKGetUserWIPsTaskListener
{
  private Callbacks callbacks;
  private boolean getFacebookUserIdInProgress = false;
  private BehanceSDKGetUserWIPsAsyncTask getUserWIPsTask;
  private boolean getUserWIPsTaskInProgress = false;
  private List<BehanceSDKWIPDTO> userWIPsList;
  
  public BehanceSDKPublishWIPHeadlessFragment()
  {
    setRetainInstance(true);
  }
  
  private void populateAuthParams(BehanceSDKAbstractTaskParams paramBehanceSDKAbstractTaskParams)
  {
    paramBehanceSDKAbstractTaskParams.setClientId(AddWIPManager.getInstance().getUserCredentials().getClientId());
  }
  
  private void setGetUserWIPsTaskInProgress(boolean paramBoolean)
  {
    getUserWIPsTaskInProgress = paramBoolean;
  }
  
  private void setUserWIPsList(List<BehanceSDKWIPDTO> paramList)
  {
    userWIPsList = paramList;
  }
  
  public List<BehanceSDKWIPDTO> getUserWIPsList()
  {
    return userWIPsList;
  }
  
  public boolean isGetUserWIPsTaskInProgress()
  {
    return getUserWIPsTaskInProgress;
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
  
  public void loadUserWIPsFromServer()
  {
    if ((!isGetUserWIPsTaskInProgress()) && (getUserWIPsTask == null))
    {
      setGetUserWIPsTaskInProgress(true);
      BehanceSDKGetUserWIPsTaskParams localBehanceSDKGetUserWIPsTaskParams = new BehanceSDKGetUserWIPsTaskParams();
      localBehanceSDKGetUserWIPsTaskParams.setUserId(AddWIPManager.getInstance().getUserCredentials().getUserBehanceAccountId());
      populateAuthParams(localBehanceSDKGetUserWIPsTaskParams);
      getUserWIPsTask = new BehanceSDKGetUserWIPsAsyncTask(this);
      getUserWIPsTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new BehanceSDKGetUserWIPsTaskParams[] { localBehanceSDKGetUserWIPsTaskParams });
    }
  }
  
  public void onGetUserWIPsTaskFailure(Exception paramException, BehanceSDKGetUserWIPsTaskParams paramBehanceSDKGetUserWIPsTaskParams)
  {
    if (callbacks != null) {
      callbacks.onGetUserWIPsFailure(paramException);
    }
    getUserWIPsTask = null;
    setGetUserWIPsTaskInProgress(false);
  }
  
  public void onGetUserWIPsTaskSuccess(List<BehanceSDKWIPDTO> paramList, BehanceSDKGetUserWIPsTaskParams paramBehanceSDKGetUserWIPsTaskParams)
  {
    setUserWIPsList(paramList);
    if (callbacks != null) {
      callbacks.onGetUserWIPsSuccess();
    }
    getUserWIPsTask = null;
    setGetUserWIPsTaskInProgress(false);
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
    public abstract void onGetFacebookUserIdComplete(String paramString);
    
    public abstract void onGetUserWIPsFailure(Exception paramException);
    
    public abstract void onGetUserWIPsSuccess();
  }
}
