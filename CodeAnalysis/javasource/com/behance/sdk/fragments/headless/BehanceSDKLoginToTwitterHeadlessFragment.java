package com.behance.sdk.fragments.headless;

import android.os.AsyncTask;
import android.support.v4.app.Fragment;
import com.behance.sdk.asynctask.listeners.IBehanceSDKGetAuthURLFromTwitterTaskListener;
import com.behance.sdk.asynctask.listeners.IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;
import com.behance.sdk.asynctask.params.BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;
import com.behance.sdk.asynctask.params.BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;
import com.behance.sdk.asynctasks.BehanceSDKGetAuthURLFromTwitterAsyncTask;
import com.behance.sdk.asynctasks.BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;
import com.behance.sdk.asynctasks.result.BehanceSDKGetAuthUrlFromTwitterTaskResult;
import com.behance.sdk.asynctasks.result.BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

public class BehanceSDKLoginToTwitterHeadlessFragment
  extends Fragment
  implements IBehanceSDKGetAuthURLFromTwitterTaskListener, IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener
{
  private Callbacks callbacks;
  private BehanceSDKGetAuthURLFromTwitterAsyncTask getAuthURLFromTwitterAsyncTask;
  private boolean getAuthURLFromTwitterTaskInProgress;
  private BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask retrieveAccessTokenFromTwitterAsyncTask;
  private boolean retrieveAccessTokenFromTwitterTaskInProgress;
  
  public BehanceSDKLoginToTwitterHeadlessFragment()
  {
    setRetainInstance(true);
  }
  
  private boolean isGetAuthURLFromTwitterTaskInProgress()
  {
    return getAuthURLFromTwitterTaskInProgress;
  }
  
  private boolean isRetrieveAccessTokenFromTwitterTaskInProgress()
  {
    return retrieveAccessTokenFromTwitterTaskInProgress;
  }
  
  private void setGetAuthURLFromTwitterTaskInProgress(boolean paramBoolean)
  {
    getAuthURLFromTwitterTaskInProgress = paramBoolean;
  }
  
  private void setRetrieveAccessTokenFromTwitterTaskInProgress(boolean paramBoolean)
  {
    retrieveAccessTokenFromTwitterTaskInProgress = paramBoolean;
  }
  
  public void getAuthURLFromTwitter(BehanceSDKGetAuthURLFromTwitterAsyncTaskParams paramBehanceSDKGetAuthURLFromTwitterAsyncTaskParams)
  {
    if ((!isGetAuthURLFromTwitterTaskInProgress()) && (getAuthURLFromTwitterAsyncTask == null))
    {
      getAuthURLFromTwitterAsyncTask = new BehanceSDKGetAuthURLFromTwitterAsyncTask(this);
      getAuthURLFromTwitterAsyncTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new BehanceSDKGetAuthURLFromTwitterAsyncTaskParams[] { paramBehanceSDKGetAuthURLFromTwitterAsyncTaskParams });
      setGetAuthURLFromTwitterTaskInProgress(true);
    }
  }
  
  public void onGetAuthURLFromTwitterFailure(BehanceSDKGetAuthUrlFromTwitterTaskResult paramBehanceSDKGetAuthUrlFromTwitterTaskResult)
  {
    if (callbacks != null) {
      callbacks.onGetAuthURLFromTwitterFailure(paramBehanceSDKGetAuthUrlFromTwitterTaskResult.getException());
    }
    getAuthURLFromTwitterAsyncTask = null;
    setGetAuthURLFromTwitterTaskInProgress(false);
  }
  
  public void onGetAuthURLFromTwitterSuccess(BehanceSDKGetAuthUrlFromTwitterTaskResult paramBehanceSDKGetAuthUrlFromTwitterTaskResult)
  {
    if (callbacks != null) {
      callbacks.onGetAuthURLFromTwitterSuccess(paramBehanceSDKGetAuthUrlFromTwitterTaskResult);
    }
    getAuthURLFromTwitterAsyncTask = null;
    setGetAuthURLFromTwitterTaskInProgress(false);
  }
  
  public void onRetrieveAccessTokenFromTwitterFailure(BehanceSDKRetrieveAccessTokenFromTwitterTaskResult paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult)
  {
    if (callbacks != null) {
      callbacks.onRetrieveAccessTokenFromTwitterFailure(paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult.getException());
    }
    setRetrieveAccessTokenFromTwitterTaskInProgress(false);
    retrieveAccessTokenFromTwitterAsyncTask = null;
  }
  
  public void onRetrieveAccessTokenFromTwitterSuccess(BehanceSDKRetrieveAccessTokenFromTwitterTaskResult paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult)
  {
    if (callbacks != null) {
      callbacks.onRetrieveAccessTokenFromTwitterSuccess(paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult);
    }
    setRetrieveAccessTokenFromTwitterTaskInProgress(false);
    retrieveAccessTokenFromTwitterAsyncTask = null;
  }
  
  public void retrieveAccessTokenFromTwitter(BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams paramBehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams)
  {
    if ((!isRetrieveAccessTokenFromTwitterTaskInProgress()) && (retrieveAccessTokenFromTwitterAsyncTask == null))
    {
      retrieveAccessTokenFromTwitterAsyncTask = new BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask(this, getActivity());
      retrieveAccessTokenFromTwitterAsyncTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams[] { paramBehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams });
      setRetrieveAccessTokenFromTwitterTaskInProgress(true);
    }
  }
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onGetAuthURLFromTwitterFailure(Exception paramException);
    
    public abstract void onGetAuthURLFromTwitterSuccess(BehanceSDKGetAuthUrlFromTwitterTaskResult paramBehanceSDKGetAuthUrlFromTwitterTaskResult);
    
    public abstract void onRetrieveAccessTokenFromTwitterFailure(Exception paramException);
    
    public abstract void onRetrieveAccessTokenFromTwitterSuccess(BehanceSDKRetrieveAccessTokenFromTwitterTaskResult paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult);
  }
}
