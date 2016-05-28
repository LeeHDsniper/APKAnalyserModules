package com.behance.sdk.asynctasks;

import android.content.Context;
import android.net.Uri;
import android.os.AsyncTask;
import com.behance.sdk.BehanceSDKSocialAccountManager;
import com.behance.sdk.OAuth.TwitterClient;
import com.behance.sdk.asynctask.listeners.IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;
import com.behance.sdk.asynctask.params.BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;
import com.behance.sdk.dto.BehanceSDKSocialAccountDTO;
import com.behance.sdk.enums.BehanceSDKSocialAccountType;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.services.BehanceSDKPublishWIPService;
import java.net.URI;
import oauth.signpost.OAuthConsumer;
import oauth.signpost.commonshttp.CommonsHttpOAuthProvider;
import oauth.signpost.exception.OAuthCommunicationException;
import oauth.signpost.exception.OAuthExpectationFailedException;
import oauth.signpost.exception.OAuthMessageSignerException;
import oauth.signpost.exception.OAuthNotAuthorizedException;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

public class BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask
  extends AsyncTask<BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams, Void, BehanceSDKRetrieveAccessTokenFromTwitterTaskResult>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKPublishWIPService.class);
  private OAuthConsumer consumer;
  private String consumerSecret;
  private String consumerToken;
  private IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener listener;
  private CommonsHttpOAuthProvider provider;
  private BehanceSDKRetrieveAccessTokenFromTwitterTaskResult result;
  private BehanceSDKSocialAccountDTO socialAccountDTO;
  private BehanceSDKSocialAccountManager socialAccountManager;
  
  public BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask(IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener paramIBehanceSDKRetrieveAccessTokenFromTwitterTaskListener, Context paramContext)
  {
    listener = paramIBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;
    socialAccountManager = BehanceSDKSocialAccountManager.getInstance(paramContext);
    socialAccountDTO = socialAccountManager.getAccount(BehanceSDKSocialAccountType.TWITTER);
  }
  
  private void retrieveAccessTokenFromTwitter(String paramString1, String paramString2, String paramString3)
  {
    if ((paramString1 != null) && (paramString1.length() > 0))
    {
      paramString1 = Uri.parse(paramString1).getQueryParameter("oauth_verifier");
      if ((paramString1 == null) || (paramString1.length() <= 0)) {}
    }
    try
    {
      provider.retrieveAccessToken(consumer, paramString1, new String[0]);
      return;
    }
    catch (OAuthMessageSignerException paramString1)
    {
      result.setExceptionOccurred(true);
      result.setException(paramString1);
      return;
    }
    catch (OAuthNotAuthorizedException paramString1)
    {
      result.setExceptionOccurred(true);
      result.setException(paramString1);
      return;
    }
    catch (OAuthExpectationFailedException paramString1)
    {
      result.setExceptionOccurred(true);
      result.setException(paramString1);
      return;
    }
    catch (OAuthCommunicationException paramString1)
    {
      result.setExceptionOccurred(true);
      result.setException(paramString1);
      return;
    }
    catch (Exception paramString1)
    {
      result.setExceptionOccurred(true);
      result.setException(paramString1);
    }
  }
  
  private String retrieveUserNameFromTwitter()
  {
    try
    {
      Object localObject = new HttpPost(new URI("https://api.twitter.com/1.1/account/settings.json"));
      consumer.sign(localObject);
      localObject = new DefaultHttpClient().execute((HttpUriRequest)localObject);
      String str = EntityUtils.toString(((HttpResponse)localObject).getEntity());
      if (((HttpResponse)localObject).getStatusLine().getStatusCode() == 200) {
        return new JSONObject(str).optString("screen_name");
      }
      logger.error("Unexpected return code while retrieving user name from twitter. [return code - %s]", new Object[] { Integer.valueOf(((HttpResponse)localObject).getStatusLine().getStatusCode()) });
      return null;
    }
    catch (Throwable localThrowable)
    {
      logger.error(localThrowable, "Problem retrieving user name", new Object[0]);
    }
    return null;
  }
  
  protected BehanceSDKRetrieveAccessTokenFromTwitterTaskResult doInBackground(BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams... paramVarArgs)
  {
    result = new BehanceSDKRetrieveAccessTokenFromTwitterTaskResult();
    paramVarArgs = paramVarArgs[0];
    String str = paramVarArgs.getAuthURL();
    consumerToken = paramVarArgs.getConsumerKey();
    consumerSecret = paramVarArgs.getConsumerSecret();
    provider = TwitterClient.getInstance(consumerToken, consumerSecret).getOAuthProvider();
    consumer = TwitterClient.getInstance(consumerToken, consumerSecret).getOAuthConsumer();
    retrieveAccessTokenFromTwitter(str, consumerToken, consumerSecret);
    if ((consumer.getToken() == null) || (consumer.getToken().isEmpty()) || (consumer.getTokenSecret() == null) || (consumer.getTokenSecret().isEmpty()))
    {
      result.setExceptionOccurred(true);
      result.setException(new Exception("Twitter Access token or access secret is empty"));
      return result;
    }
    if (socialAccountDTO != null)
    {
      socialAccountDTO.setUserAuthToken(consumer.getToken());
      socialAccountDTO.setAdditionalData(consumer.getTokenSecret());
      paramVarArgs = retrieveUserNameFromTwitter();
      socialAccountDTO.setUserId(paramVarArgs);
      socialAccountManager.updateAccount(socialAccountDTO);
    }
    return result;
  }
  
  protected void onPostExecute(BehanceSDKRetrieveAccessTokenFromTwitterTaskResult paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult)
  {
    if (paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult.isExceptionOccurred())
    {
      listener.onRetrieveAccessTokenFromTwitterFailure(paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult);
      return;
    }
    listener.onRetrieveAccessTokenFromTwitterSuccess(paramBehanceSDKRetrieveAccessTokenFromTwitterTaskResult);
  }
}
