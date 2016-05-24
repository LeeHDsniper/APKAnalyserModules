package com.behance.sdk.fragments.headless;

import android.content.Context;
import android.os.AsyncTask;
import android.support.v4.app.Fragment;
import com.behance.sdk.asynctask.listeners.IBehanceSDKGetAlbumsTaskListener;
import com.behance.sdk.asynctask.params.BehanceSDKGetAlbumsTaskParams;
import com.behance.sdk.asynctasks.BehanceSDKGetAlbumsAsyncTask;
import com.behance.sdk.dto.BehanceSDKAlbumDTO;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

public class BehanceSDKImageSelectorHeadlessFragment
  extends Fragment
  implements IBehanceSDKGetAlbumsTaskListener
{
  private List<BehanceSDKAlbumDTO> albumsList;
  private boolean albumsLoadingInProgress = false;
  private Callbacks callbacks;
  private BehanceSDKGetAlbumsAsyncTask getAlbumsTask;
  
  public BehanceSDKImageSelectorHeadlessFragment()
  {
    setRetainInstance(true);
  }
  
  private void setAlbumsLoadingInProgress(boolean paramBoolean)
  {
    albumsLoadingInProgress = paramBoolean;
  }
  
  public void clearAlbumsCache()
  {
    if (albumsList != null)
    {
      albumsList.clear();
      albumsList = null;
    }
  }
  
  public List<BehanceSDKAlbumDTO> getAlbumsList()
  {
    return albumsList;
  }
  
  public boolean isAlbumsLoadingInProgress()
  {
    return albumsLoadingInProgress;
  }
  
  public void loadAlbums(Context paramContext, boolean paramBoolean)
  {
    if (!isAlbumsLoadingInProgress())
    {
      setAlbumsLoadingInProgress(true);
      BehanceSDKGetAlbumsTaskParams localBehanceSDKGetAlbumsTaskParams = new BehanceSDKGetAlbumsTaskParams();
      localBehanceSDKGetAlbumsTaskParams.setContextWeakReference(new WeakReference(paramContext));
      localBehanceSDKGetAlbumsTaskParams.setShowImageSelectionSources(paramBoolean);
      getAlbumsTask = new BehanceSDKGetAlbumsAsyncTask(this);
      getAlbumsTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new BehanceSDKGetAlbumsTaskParams[] { localBehanceSDKGetAlbumsTaskParams });
    }
  }
  
  public void onGetAlbumsTaskFailure(Exception paramException)
  {
    setAlbumsLoadingInProgress(false);
    getAlbumsTask = null;
    if (callbacks != null) {
      callbacks.onGetAlbumsFailure(paramException);
    }
  }
  
  public void onGetAlbumsTaskSuccess(List<BehanceSDKAlbumDTO> paramList)
  {
    if (paramList != null)
    {
      if (albumsList == null) {
        albumsList = new ArrayList();
      }
      albumsList.clear();
      albumsList.addAll(paramList);
    }
    setAlbumsLoadingInProgress(false);
    getAlbumsTask = null;
    if (callbacks != null) {
      callbacks.onGetAlbumsSuccess();
    }
  }
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onGetAlbumsFailure(Exception paramException);
    
    public abstract void onGetAlbumsSuccess();
  }
}
