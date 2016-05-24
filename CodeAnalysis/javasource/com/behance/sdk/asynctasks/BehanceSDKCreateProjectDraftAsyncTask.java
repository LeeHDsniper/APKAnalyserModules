package com.behance.sdk.asynctasks;

import android.os.AsyncTask;
import android.text.TextUtils;
import com.behance.sdk.BehanceSDKProjectDraftOptions;
import com.behance.sdk.IBehanceSDKCreateProjectDraftListener;
import com.behance.sdk.asynctask.params.BehanceSDKCreateProjectDraftTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKAsyncTaskResultWrapper;
import com.behance.sdk.enums.BehanceSDKCopyrightOption;
import com.behance.sdk.exception.BehanceSDKException;
import com.behance.sdk.managers.BehanceSDKUserManager;
import com.behance.sdk.util.BehanceSDKHTTPUtils;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import com.behance.sdk.util.HTTPResponse;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.json.JSONObject;

public class BehanceSDKCreateProjectDraftAsyncTask
  extends AsyncTask<BehanceSDKCreateProjectDraftTaskParams, Void, BehanceSDKAsyncTaskResultWrapper<String>>
{
  private IBehanceSDKCreateProjectDraftListener listener;
  
  protected BehanceSDKAsyncTaskResultWrapper<String> doInBackground(BehanceSDKCreateProjectDraftTaskParams... paramVarArgs)
  {
    BehanceSDKAsyncTaskResultWrapper localBehanceSDKAsyncTaskResultWrapper = new BehanceSDKAsyncTaskResultWrapper();
    Object localObject2 = paramVarArgs[0];
    for (;;)
    {
      try
      {
        paramVarArgs = new HashMap(1);
        paramVarArgs.put("clientId", ((BehanceSDKCreateProjectDraftTaskParams)localObject2).getClientId());
        Object localObject1 = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/project/editor?{key_client_id_param}={clientId}", paramVarArgs);
        Object localObject3 = BehanceSDKUserManager.getInstance().checkExpiryAndGetAccessToken();
        paramVarArgs = (BehanceSDKCreateProjectDraftTaskParams[])localObject1;
        if (localObject3 != null) {
          paramVarArgs = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject1, "access_token", localObject3);
        }
        localObject1 = ((BehanceSDKCreateProjectDraftTaskParams)localObject2).getBehanceSDKProjectDraftOptions();
        localObject2 = new HttpPost(paramVarArgs);
        if (localObject1 != null)
        {
          localObject3 = MultipartEntityBuilder.create();
          ContentType localContentType = ContentType.create("text/plain", "UTF-8");
          paramVarArgs = ((BehanceSDKProjectDraftOptions)localObject1).getProjectTitle();
          if (!TextUtils.isEmpty(paramVarArgs)) {
            ((MultipartEntityBuilder)localObject3).addTextBody("title", paramVarArgs, localContentType);
          }
          paramVarArgs = ((BehanceSDKProjectDraftOptions)localObject1).getProjectDescription();
          if (!TextUtils.isEmpty(paramVarArgs)) {
            ((MultipartEntityBuilder)localObject3).addTextBody("description", paramVarArgs, localContentType);
          }
          paramVarArgs = ((BehanceSDKProjectDraftOptions)localObject1).getProjectTags();
          if (!TextUtils.isEmpty(paramVarArgs)) {
            ((MultipartEntityBuilder)localObject3).addTextBody("tags", paramVarArgs, localContentType);
          }
          paramVarArgs = ((BehanceSDKProjectDraftOptions)localObject1).getCreativeFields();
          if (!TextUtils.isEmpty(paramVarArgs)) {
            ((MultipartEntityBuilder)localObject3).addTextBody("fields", paramVarArgs, localContentType);
          }
          if (((BehanceSDKProjectDraftOptions)localObject1).isProjectContainsAdultContent())
          {
            paramVarArgs = "1";
            ((MultipartEntityBuilder)localObject3).addTextBody("mature_content", paramVarArgs, localContentType);
            paramVarArgs = ((BehanceSDKProjectDraftOptions)localObject1).getProjectCopyrightSettings();
            if (paramVarArgs != null) {
              ((MultipartEntityBuilder)localObject3).addTextBody("license", paramVarArgs.getValue(), localContentType);
            }
            paramVarArgs = ((BehanceSDKProjectDraftOptions)localObject1).getCoverImage();
            if (paramVarArgs != null) {
              ((MultipartEntityBuilder)localObject3).addPart("image", new FileBody(paramVarArgs));
            }
            ((HttpPost)localObject2).setEntity(((MultipartEntityBuilder)localObject3).build());
          }
        }
        else
        {
          paramVarArgs = BehanceSDKHTTPUtils.doHTTPPost((HttpPost)localObject2);
          if (paramVarArgs.getStatusCode() != 201)
          {
            localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
            localBehanceSDKAsyncTaskResultWrapper.setException(new BehanceSDKException(paramVarArgs.getReasonPhrase()));
            return localBehanceSDKAsyncTaskResultWrapper;
          }
          localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(false);
          localBehanceSDKAsyncTaskResultWrapper.setResult(((JSONObject)new JSONObject(paramVarArgs.getResponseString()).get("project")).optString("id"));
          return localBehanceSDKAsyncTaskResultWrapper;
        }
      }
      catch (Throwable paramVarArgs)
      {
        localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
        localBehanceSDKAsyncTaskResultWrapper.setException(new BehanceSDKException(paramVarArgs));
        return localBehanceSDKAsyncTaskResultWrapper;
      }
      paramVarArgs = "0";
    }
  }
  
  protected void onPostExecute(BehanceSDKAsyncTaskResultWrapper<String> paramBehanceSDKAsyncTaskResultWrapper)
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
    listener.onSuccess((String)paramBehanceSDKAsyncTaskResultWrapper.getResult());
  }
}
