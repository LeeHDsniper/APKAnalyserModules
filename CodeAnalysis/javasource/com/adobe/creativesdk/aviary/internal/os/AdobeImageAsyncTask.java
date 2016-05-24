package com.adobe.creativesdk.aviary.internal.os;

import android.annotation.TargetApi;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Looper;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import java.util.concurrent.RejectedExecutionException;

public abstract class AdobeImageAsyncTask<Params, Progress, Result>
  extends AsyncTask<Params, Progress, Result>
{
  private static final Handler S_HANDLER = new Handler(Looper.getMainLooper());
  
  public AdobeImageAsyncTask() {}
  
  private boolean isUiThread()
  {
    return Thread.currentThread().getId() == Looper.getMainLooper().getThread().getId();
  }
  
  protected Result doInBackground(Params... paramVarArgs)
  {
    return null;
  }
  
  protected void doPostExecute(Result paramResult) {}
  
  protected void doPreExecute() {}
  
  protected void doProgressUpdate(Progress... paramVarArgs) {}
  
  @TargetApi(11)
  public final AsyncTask<Params, Progress, Result> executeInParallel(Params... paramVarArgs)
  {
    if (ApiHelper.AT_LEAST_11) {
      try
      {
        AsyncTask localAsyncTask = executeOnExecutor(THREAD_POOL_EXECUTOR, paramVarArgs);
        return localAsyncTask;
      }
      catch (RejectedExecutionException localRejectedExecutionException)
      {
        return execute(paramVarArgs);
      }
    }
    return execute(paramVarArgs);
  }
  
  @Deprecated
  protected final void onPostExecute(final Result paramResult)
  {
    if (isUiThread())
    {
      doPostExecute(paramResult);
      return;
    }
    S_HANDLER.post(new Runnable()
    {
      public void run()
      {
        doPostExecute(paramResult);
      }
    });
  }
  
  @Deprecated
  protected void onPreExecute()
  {
    if (isUiThread())
    {
      doPreExecute();
      return;
    }
    S_HANDLER.post(new Runnable()
    {
      public void run()
      {
        doPreExecute();
      }
    });
  }
  
  @Deprecated
  protected void onProgressUpdate(final Progress... paramVarArgs)
  {
    if (isUiThread())
    {
      doProgressUpdate(paramVarArgs);
      return;
    }
    S_HANDLER.post(new Runnable()
    {
      public void run()
      {
        doProgressUpdate(paramVarArgs);
      }
    });
  }
}
