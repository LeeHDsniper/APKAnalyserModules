package com.behance.sdk.asynctasks;

import android.content.Context;
import android.os.AsyncTask;
import com.behance.sdk.asynctask.listeners.IBehanceSDKGetAlbumsTaskListener;
import com.behance.sdk.asynctask.params.BehanceSDKGetAlbumsTaskParams;
import com.behance.sdk.files.LocalImageLoader;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import java.lang.ref.WeakReference;

public class BehanceSDKGetAlbumsAsyncTask
  extends AsyncTask<BehanceSDKGetAlbumsTaskParams, Void, BehanceSDKGetAlbumsTaskResult>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKGetAlbumsAsyncTask.class);
  private IBehanceSDKGetAlbumsTaskListener listener;
  
  public BehanceSDKGetAlbumsAsyncTask(IBehanceSDKGetAlbumsTaskListener paramIBehanceSDKGetAlbumsTaskListener)
  {
    listener = paramIBehanceSDKGetAlbumsTaskListener;
  }
  
  protected BehanceSDKGetAlbumsTaskResult doInBackground(BehanceSDKGetAlbumsTaskParams... paramVarArgs)
  {
    BehanceSDKGetAlbumsTaskResult localBehanceSDKGetAlbumsTaskResult = new BehanceSDKGetAlbumsTaskResult();
    paramVarArgs = paramVarArgs[0];
    try
    {
      Context localContext = (Context)paramVarArgs.getContextWeakReference().get();
      if (localContext != null)
      {
        localBehanceSDKGetAlbumsTaskResult.setAlbumsList(LocalImageLoader.getAlbumsList(localContext, false, paramVarArgs.isShowImageSelectionSources()));
        return localBehanceSDKGetAlbumsTaskResult;
      }
      localBehanceSDKGetAlbumsTaskResult.setExceptionOccurred(true);
      localBehanceSDKGetAlbumsTaskResult.setException(new Exception("Context is null"));
      return localBehanceSDKGetAlbumsTaskResult;
    }
    catch (Exception paramVarArgs)
    {
      localBehanceSDKGetAlbumsTaskResult.setExceptionOccurred(true);
      localBehanceSDKGetAlbumsTaskResult.setException(paramVarArgs);
      logger.error(paramVarArgs, "Problem loading albums", new Object[0]);
      return localBehanceSDKGetAlbumsTaskResult;
    }
    catch (Error paramVarArgs)
    {
      localBehanceSDKGetAlbumsTaskResult.setExceptionOccurred(true);
      localBehanceSDKGetAlbumsTaskResult.setException(new Exception(paramVarArgs));
      logger.error(paramVarArgs, "Problem loading albums", new Object[0]);
    }
    return localBehanceSDKGetAlbumsTaskResult;
  }
  
  protected void onPostExecute(BehanceSDKGetAlbumsTaskResult paramBehanceSDKGetAlbumsTaskResult)
  {
    if (paramBehanceSDKGetAlbumsTaskResult.isExceptionOccurred())
    {
      listener.onGetAlbumsTaskFailure(paramBehanceSDKGetAlbumsTaskResult.getException());
      return;
    }
    listener.onGetAlbumsTaskSuccess(paramBehanceSDKGetAlbumsTaskResult.getAlbumsList());
  }
}
