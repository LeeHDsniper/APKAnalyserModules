package com.behance.sdk.asynctasks;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.os.AsyncTask;
import android.text.TextUtils;
import com.behance.sdk.asynctask.listeners.IBehanceSDKEditProfileAsyncTaskListener;
import com.behance.sdk.asynctask.params.BehanceSDKEditProfileAsyncTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKEditProfileTaskResult;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.managers.BehanceSDKUserManager;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPatch;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.InputStreamBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

public class BehanceSDKEditProfileAsyncTask
  extends AsyncTask<BehanceSDKEditProfileAsyncTaskParams, Void, BehanceSDKEditProfileTaskResult>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKEditProfileAsyncTask.class);
  private IBehanceSDKEditProfileAsyncTaskListener taskHandler;
  
  public BehanceSDKEditProfileAsyncTask(IBehanceSDKEditProfileAsyncTaskListener paramIBehanceSDKEditProfileAsyncTaskListener)
  {
    taskHandler = paramIBehanceSDKEditProfileAsyncTaskListener;
  }
  
  protected BehanceSDKEditProfileTaskResult doInBackground(BehanceSDKEditProfileAsyncTaskParams... paramVarArgs)
  {
    BehanceSDKEditProfileTaskResult localBehanceSDKEditProfileTaskResult = new BehanceSDKEditProfileTaskResult();
    Object localObject2 = paramVarArgs[0];
    try
    {
      DefaultHttpClient localDefaultHttpClient = new DefaultHttpClient();
      paramVarArgs = new HashMap();
      paramVarArgs.put("clientId", ((BehanceSDKEditProfileAsyncTaskParams)localObject2).getClientId());
      Object localObject1 = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/profile/editor?{key_client_id_param}={clientId}", paramVarArgs);
      Object localObject3 = new ArrayList();
      ((ArrayList)localObject3).add(new BasicNameValuePair("token_type", "device_token"));
      String str = BehanceSDKUserManager.getInstance().checkExpiryAndGetAccessToken();
      paramVarArgs = (BehanceSDKEditProfileAsyncTaskParams[])localObject1;
      if (str != null) {
        paramVarArgs = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject1, "access_token", str);
      }
      localObject1 = ((BehanceSDKEditProfileAsyncTaskParams)localObject2).getFirstName();
      if (!TextUtils.isEmpty((CharSequence)localObject1)) {
        ((ArrayList)localObject3).add(new BasicNameValuePair("first_name", (String)localObject1));
      }
      localObject1 = ((BehanceSDKEditProfileAsyncTaskParams)localObject2).getLastName();
      if (!TextUtils.isEmpty((CharSequence)localObject1)) {
        ((ArrayList)localObject3).add(new BasicNameValuePair("last_name", (String)localObject1));
      }
      localObject1 = ((BehanceSDKEditProfileAsyncTaskParams)localObject2).getOccupation();
      if (localObject1 != null) {
        ((ArrayList)localObject3).add(new BasicNameValuePair("occupation", (String)localObject1));
      }
      localObject1 = ((BehanceSDKEditProfileAsyncTaskParams)localObject2).getCompany();
      if (localObject1 != null) {
        ((ArrayList)localObject3).add(new BasicNameValuePair("company", (String)localObject1));
      }
      localObject1 = ((BehanceSDKEditProfileAsyncTaskParams)localObject2).getWebsite();
      if (localObject1 != null) {
        ((ArrayList)localObject3).add(new BasicNameValuePair("website", (String)localObject1));
      }
      localObject1 = ((BehanceSDKEditProfileAsyncTaskParams)localObject2).getCountry();
      if (!TextUtils.isEmpty((CharSequence)localObject1)) {
        ((ArrayList)localObject3).add(new BasicNameValuePair("country", (String)localObject1));
      }
      localObject1 = ((BehanceSDKEditProfileAsyncTaskParams)localObject2).getState();
      if (!TextUtils.isEmpty((CharSequence)localObject1)) {
        ((ArrayList)localObject3).add(new BasicNameValuePair("state", (String)localObject1));
      }
      localObject1 = ((BehanceSDKEditProfileAsyncTaskParams)localObject2).getCity();
      if (!TextUtils.isEmpty((CharSequence)localObject1)) {
        ((ArrayList)localObject3).add(new BasicNameValuePair("city", (String)localObject1));
      }
      localObject1 = new UrlEncodedFormEntity((List)localObject3, "UTF-8");
      localObject3 = new HttpPost(paramVarArgs);
      ((HttpPost)localObject3).setEntity((HttpEntity)localObject1);
      localObject1 = EntityUtils.toString(localDefaultHttpClient.execute((HttpUriRequest)localObject3).getEntity());
      logger.debug("Update Profile server response - %s", new Object[] { localObject1 });
      localObject1 = new JSONObject((String)localObject1);
      i = ((JSONObject)localObject1).optInt("http_code");
      j = ((JSONObject)localObject1).optInt("updated");
      logger.debug("Update Profile [HTTP Response code - %s] [Updated - %s]", new Object[] { Integer.valueOf(i), Integer.valueOf(j) });
      if (i == 200) {
        if (j == 1) {
          localBehanceSDKEditProfileTaskResult.setProfileUpdateFailed(false);
        }
      }
      for (;;)
      {
        paramVarArgs = new HttpPatch(paramVarArgs);
        localObject3 = ((BehanceSDKEditProfileAsyncTaskParams)localObject2).getProfileImageBitmap();
        localObject1 = ((BehanceSDKEditProfileAsyncTaskParams)localObject2).getImage();
        if ((localObject3 == null) || (localObject1 == null)) {
          break label754;
        }
        localObject2 = new ByteArrayOutputStream();
        ((Bitmap)localObject3).compress(Bitmap.CompressFormat.JPEG, 100, (OutputStream)localObject2);
        localObject2 = ((ByteArrayOutputStream)localObject2).toByteArray();
        localObject3 = MultipartEntityBuilder.create();
        ((MultipartEntityBuilder)localObject3).addPart("image", new InputStreamBody(new ByteArrayInputStream((byte[])localObject2), ((ImageModule)localObject1).getName()));
        paramVarArgs.setEntity(((MultipartEntityBuilder)localObject3).build());
        if (!isCancelled()) {
          break;
        }
        return null;
        localBehanceSDKEditProfileTaskResult.setExceptionOccurred(true);
        localBehanceSDKEditProfileTaskResult.setProfileUpdateFailed(true);
        localBehanceSDKEditProfileTaskResult.addException(new Exception("Invalid server response saving user profile"));
      }
      paramVarArgs = new JSONObject(EntityUtils.toString(localDefaultHttpClient.execute(paramVarArgs).getEntity()));
    }
    catch (Exception paramVarArgs)
    {
      logger.error(paramVarArgs, "Unknown problem saving user profile", new Object[0]);
      localBehanceSDKEditProfileTaskResult.setExceptionOccurred(true);
      localBehanceSDKEditProfileTaskResult.addException(paramVarArgs);
      return localBehanceSDKEditProfileTaskResult;
    }
    int i = paramVarArgs.optInt("http_code");
    int j = paramVarArgs.optInt("updated");
    if (i == 200)
    {
      if (j == 1)
      {
        localBehanceSDKEditProfileTaskResult.setProfileAvatarUpdateFailed(false);
        return localBehanceSDKEditProfileTaskResult;
      }
    }
    else
    {
      localBehanceSDKEditProfileTaskResult.setProfileAvatarUpdateFailed(true);
      localBehanceSDKEditProfileTaskResult.setExceptionOccurred(true);
      localBehanceSDKEditProfileTaskResult.addException(new Exception("Invalid server response saving user profile avatar"));
      return localBehanceSDKEditProfileTaskResult;
      label754:
      localBehanceSDKEditProfileTaskResult.setProfileAvatarUpdateFailed(false);
    }
    return localBehanceSDKEditProfileTaskResult;
  }
  
  protected void onPostExecute(BehanceSDKEditProfileTaskResult paramBehanceSDKEditProfileTaskResult)
  {
    if (paramBehanceSDKEditProfileTaskResult.isExceptionOccurred())
    {
      taskHandler.onEditProfileTaskFailure(paramBehanceSDKEditProfileTaskResult);
      return;
    }
    taskHandler.onEditProfileTaskSuccess(paramBehanceSDKEditProfileTaskResult);
  }
}
