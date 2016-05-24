package com.behance.sdk.asynctasks;

import android.os.AsyncTask;
import com.behance.sdk.IBehanceSDKADDProjectModuleListener;
import com.behance.sdk.asynctask.params.BehanceSDKAddProjectModuleTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKAsyncTaskResultWrapper;
import com.behance.sdk.exception.BehanceSDKException;
import com.behance.sdk.managers.BehanceSDKUserManager;
import com.behance.sdk.util.BehanceSDKHTTPUtils;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import com.behance.sdk.util.HTTPResponse;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;

public class BehanceSDKAddProjectModuleAsyncTask
  extends AsyncTask<BehanceSDKAddProjectModuleTaskParams, Void, BehanceSDKAsyncTaskResultWrapper>
{
  private IBehanceSDKADDProjectModuleListener listener;
  
  protected BehanceSDKAsyncTaskResultWrapper doInBackground(BehanceSDKAddProjectModuleTaskParams... paramVarArgs)
  {
    BehanceSDKAddProjectModuleTaskParams localBehanceSDKAddProjectModuleTaskParams = paramVarArgs[0];
    BehanceSDKAsyncTaskResultWrapper localBehanceSDKAsyncTaskResultWrapper = new BehanceSDKAsyncTaskResultWrapper();
    try
    {
      paramVarArgs = new HashMap(1);
      paramVarArgs.put("clientId", localBehanceSDKAddProjectModuleTaskParams.getClientId());
      Object localObject = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/project/editor/{PROJECTID}/modules?{key_client_id_param}={clientId}", paramVarArgs);
      String str = BehanceSDKUserManager.getInstance().checkExpiryAndGetAccessToken();
      paramVarArgs = (BehanceSDKAddProjectModuleTaskParams[])localObject;
      if (str != null) {
        paramVarArgs = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject, "access_token", str);
      }
      paramVarArgs = paramVarArgs.replace("{PROJECTID}", localBehanceSDKAddProjectModuleTaskParams.getProjectId());
      localObject = MultipartEntityBuilder.create();
      ((MultipartEntityBuilder)localObject).addTextBody("type", "image");
      ((MultipartEntityBuilder)localObject).addPart("image", new FileBody(localBehanceSDKAddProjectModuleTaskParams.getImage()));
      localObject = ((MultipartEntityBuilder)localObject).build();
      paramVarArgs = new HttpPost(paramVarArgs);
      paramVarArgs.setEntity((HttpEntity)localObject);
      paramVarArgs = BehanceSDKHTTPUtils.doHTTPPost(paramVarArgs);
      if (paramVarArgs.getStatusCode() != 201)
      {
        localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
        localBehanceSDKAsyncTaskResultWrapper.setException(new BehanceSDKException(paramVarArgs.getReasonPhrase()));
        return localBehanceSDKAsyncTaskResultWrapper;
      }
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(false);
      return localBehanceSDKAsyncTaskResultWrapper;
    }
    catch (Throwable paramVarArgs)
    {
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
      localBehanceSDKAsyncTaskResultWrapper.setException(new BehanceSDKException(paramVarArgs));
    }
    return localBehanceSDKAsyncTaskResultWrapper;
  }
  
  protected void onPostExecute(BehanceSDKAsyncTaskResultWrapper paramBehanceSDKAsyncTaskResultWrapper)
  {
    if (listener != null)
    {
      if (paramBehanceSDKAsyncTaskResultWrapper.isExceptionOccurred()) {
        listener.onFailure((BehanceSDKException)paramBehanceSDKAsyncTaskResultWrapper.getException());
      }
    }
    else {
      return;
    }
    listener.onSuccess();
  }
}
