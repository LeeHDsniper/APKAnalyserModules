package com.behance.sdk.asynctasks;

import android.os.AsyncTask;
import com.behance.sdk.OAuth.TwitterClient;
import com.behance.sdk.asynctask.listeners.IBehanceSDKGetAuthURLFromTwitterTaskListener;
import com.behance.sdk.asynctask.params.BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKGetAuthUrlFromTwitterTaskResult;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import oauth.signpost.commonshttp.CommonsHttpOAuthProvider;
import oauth.signpost.exception.OAuthCommunicationException;
import oauth.signpost.exception.OAuthExpectationFailedException;
import oauth.signpost.exception.OAuthMessageSignerException;
import oauth.signpost.exception.OAuthNotAuthorizedException;

public class BehanceSDKGetAuthURLFromTwitterAsyncTask
  extends AsyncTask<BehanceSDKGetAuthURLFromTwitterAsyncTaskParams, Void, BehanceSDKGetAuthUrlFromTwitterTaskResult>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKGetAuthURLFromTwitterAsyncTask.class);
  private IBehanceSDKGetAuthURLFromTwitterTaskListener listener;
  
  public BehanceSDKGetAuthURLFromTwitterAsyncTask(IBehanceSDKGetAuthURLFromTwitterTaskListener paramIBehanceSDKGetAuthURLFromTwitterTaskListener)
  {
    listener = paramIBehanceSDKGetAuthURLFromTwitterTaskListener;
  }
  
  protected BehanceSDKGetAuthUrlFromTwitterTaskResult doInBackground(BehanceSDKGetAuthURLFromTwitterAsyncTaskParams... paramVarArgs)
  {
    BehanceSDKGetAuthUrlFromTwitterTaskResult localBehanceSDKGetAuthUrlFromTwitterTaskResult = new BehanceSDKGetAuthUrlFromTwitterTaskResult();
    Object localObject1 = null;
    Object localObject2 = paramVarArgs[0];
    paramVarArgs = ((BehanceSDKGetAuthURLFromTwitterAsyncTaskParams)localObject2).getConsumerKey();
    String str = ((BehanceSDKGetAuthURLFromTwitterAsyncTaskParams)localObject2).getConsumerSecret();
    localObject2 = TwitterClient.getInstance(paramVarArgs, str).getOAuthProvider();
    paramVarArgs = TwitterClient.getInstance(paramVarArgs, str).getOAuthConsumer();
    try
    {
      paramVarArgs = ((CommonsHttpOAuthProvider)localObject2).retrieveRequestToken(paramVarArgs, "com.behance.behance://oauth.callback", new String[0]);
      logger.debug("Auth URL returned from twitter is %s", new Object[] { paramVarArgs });
      localBehanceSDKGetAuthUrlFromTwitterTaskResult.setAuthURL(paramVarArgs);
      return localBehanceSDKGetAuthUrlFromTwitterTaskResult;
    }
    catch (OAuthMessageSignerException paramVarArgs)
    {
      for (;;)
      {
        localBehanceSDKGetAuthUrlFromTwitterTaskResult.setExceptionOccurred(true);
        localBehanceSDKGetAuthUrlFromTwitterTaskResult.setException(paramVarArgs);
        paramVarArgs = localObject1;
      }
    }
    catch (OAuthNotAuthorizedException paramVarArgs)
    {
      for (;;)
      {
        localBehanceSDKGetAuthUrlFromTwitterTaskResult.setExceptionOccurred(true);
        localBehanceSDKGetAuthUrlFromTwitterTaskResult.setException(paramVarArgs);
        paramVarArgs = localObject1;
      }
    }
    catch (OAuthExpectationFailedException paramVarArgs)
    {
      for (;;)
      {
        localBehanceSDKGetAuthUrlFromTwitterTaskResult.setExceptionOccurred(true);
        localBehanceSDKGetAuthUrlFromTwitterTaskResult.setException(paramVarArgs);
        paramVarArgs = localObject1;
      }
    }
    catch (OAuthCommunicationException paramVarArgs)
    {
      for (;;)
      {
        localBehanceSDKGetAuthUrlFromTwitterTaskResult.setExceptionOccurred(true);
        localBehanceSDKGetAuthUrlFromTwitterTaskResult.setException(paramVarArgs);
        paramVarArgs = localObject1;
      }
    }
    catch (Exception paramVarArgs)
    {
      for (;;)
      {
        localBehanceSDKGetAuthUrlFromTwitterTaskResult.setExceptionOccurred(true);
        localBehanceSDKGetAuthUrlFromTwitterTaskResult.setException(paramVarArgs);
        paramVarArgs = localObject1;
      }
    }
  }
  
  protected void onPostExecute(BehanceSDKGetAuthUrlFromTwitterTaskResult paramBehanceSDKGetAuthUrlFromTwitterTaskResult)
  {
    if (paramBehanceSDKGetAuthUrlFromTwitterTaskResult.isExceptionOccurred())
    {
      listener.onGetAuthURLFromTwitterFailure(paramBehanceSDKGetAuthUrlFromTwitterTaskResult);
      return;
    }
    listener.onGetAuthURLFromTwitterSuccess(paramBehanceSDKGetAuthUrlFromTwitterTaskResult);
  }
}
