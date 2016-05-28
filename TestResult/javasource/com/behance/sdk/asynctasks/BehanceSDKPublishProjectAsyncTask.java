package com.behance.sdk.asynctasks;

import android.os.AsyncTask;
import com.behance.sdk.IBehanceSDKProjectPublishListener;
import com.behance.sdk.asynctask.params.BehanceSDKPublishProjectTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKAsyncTaskResultWrapper;
import com.behance.sdk.exception.BehanceSDKException;
import com.behance.sdk.managers.BehanceSDKUserManager;
import com.behance.sdk.util.BehanceSDKHTTPUtils;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import com.behance.sdk.util.HTTPResponse;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;

public class BehanceSDKPublishProjectAsyncTask
  extends AsyncTask<BehanceSDKPublishProjectTaskParams, Void, BehanceSDKAsyncTaskResultWrapper<Boolean>>
{
  private IBehanceSDKProjectPublishListener listener;
  
  protected BehanceSDKAsyncTaskResultWrapper<Boolean> doInBackground(BehanceSDKPublishProjectTaskParams... paramVarArgs)
  {
    BehanceSDKAsyncTaskResultWrapper localBehanceSDKAsyncTaskResultWrapper = new BehanceSDKAsyncTaskResultWrapper();
    paramVarArgs = paramVarArgs[0];
    try
    {
      Object localObject = new HashMap();
      ((Map)localObject).put("clientId", paramVarArgs.getClientId());
      localObject = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/project/editor/{PROJECTID}?{key_client_id_param}={clientId}", (Map)localObject).replace("{PROJECTID}", paramVarArgs.getProjectId());
      String str = BehanceSDKUserManager.getInstance().checkExpiryAndGetAccessToken();
      paramVarArgs = (BehanceSDKPublishProjectTaskParams[])localObject;
      if (str != null) {
        paramVarArgs = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject, "access_token", str);
      }
      paramVarArgs = new HttpPut(paramVarArgs);
      localObject = MultipartEntityBuilder.create();
      ((MultipartEntityBuilder)localObject).setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
      ((MultipartEntityBuilder)localObject).addTextBody("published", "1", ContentType.create("text/plain", "UTF-8"));
      paramVarArgs.setEntity(((MultipartEntityBuilder)localObject).build());
      paramVarArgs = BehanceSDKHTTPUtils.doHTTPPut(paramVarArgs);
      if (paramVarArgs.getStatusCode() == 200)
      {
        localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(false);
        return localBehanceSDKAsyncTaskResultWrapper;
      }
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
      localBehanceSDKAsyncTaskResultWrapper.setException(new BehanceSDKException(paramVarArgs.getReasonPhrase()));
      return localBehanceSDKAsyncTaskResultWrapper;
    }
    catch (Throwable paramVarArgs)
    {
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
      localBehanceSDKAsyncTaskResultWrapper.setException(new BehanceSDKException(paramVarArgs));
    }
    return localBehanceSDKAsyncTaskResultWrapper;
  }
  
  protected void onPostExecute(BehanceSDKAsyncTaskResultWrapper<Boolean> paramBehanceSDKAsyncTaskResultWrapper)
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
