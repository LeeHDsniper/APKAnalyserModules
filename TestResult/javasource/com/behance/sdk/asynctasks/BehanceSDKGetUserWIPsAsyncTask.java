package com.behance.sdk.asynctasks;

import android.os.AsyncTask;
import com.behance.sdk.asynctask.listeners.IBehanceSDKGetUserWIPsTaskListener;
import com.behance.sdk.asynctask.params.BehanceSDKGetUserWIPsTaskParams;
import com.behance.sdk.dto.BehanceSDKWIPDTO;
import com.behance.sdk.dto.BehanceSDKWIPDTO.WIPRevisionImageType;
import com.behance.sdk.exception.BehanceSDKUserNotAuthenticatedException;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.managers.BehanceSDKUserManager;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class BehanceSDKGetUserWIPsAsyncTask
  extends AsyncTask<BehanceSDKGetUserWIPsTaskParams, Void, BehanceSDKGetUserWIPsTaskResult>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKGetUserWIPsAsyncTask.class);
  private IBehanceSDKGetUserWIPsTaskListener listener;
  private BehanceSDKGetUserWIPsTaskParams taskParams;
  
  public BehanceSDKGetUserWIPsAsyncTask(IBehanceSDKGetUserWIPsTaskListener paramIBehanceSDKGetUserWIPsTaskListener)
  {
    listener = paramIBehanceSDKGetUserWIPsTaskListener;
  }
  
  private List<BehanceSDKWIPDTO> getUserWips(BehanceSDKGetUserWIPsTaskParams paramBehanceSDKGetUserWIPsTaskParams, int paramInt, DefaultHttpClient paramDefaultHttpClient, BehanceSDKGetUserWIPsTaskResult paramBehanceSDKGetUserWIPsTaskResult)
    throws IOException, ClientProtocolException, JSONException, BehanceSDKUserNotAuthenticatedException
  {
    Object localObject1 = new HashMap();
    ((Map)localObject1).put("clientId", paramBehanceSDKGetUserWIPsTaskParams.getClientId());
    ((Map)localObject1).put("user_id", paramBehanceSDKGetUserWIPsTaskParams.getUserId());
    Object localObject2 = BehanceSDKUrlUtil.appendQueryStringParam(BehanceSDKUrlUtil.appendQueryStringParam(BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/users/{user_id}/wips?{key_client_id_param}={clientId}", (Map)localObject1), "page", Integer.valueOf(paramInt)), "per_page", Integer.valueOf(24));
    Object localObject3 = BehanceSDKUserManager.getInstance().checkExpiryAndGetAccessToken();
    localObject1 = localObject2;
    if (localObject3 != null) {
      localObject1 = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject2, "access_token", localObject3);
    }
    paramDefaultHttpClient = EntityUtils.toString(paramDefaultHttpClient.execute(new HttpGet((String)localObject1)).getEntity());
    logger.debug("Get user WIPs response: %s", new Object[] { paramDefaultHttpClient });
    localObject1 = new JSONObject(paramDefaultHttpClient);
    paramInt = ((JSONObject)localObject1).optInt("http_code");
    if (paramInt == 200) {
      paramDefaultHttpClient = new ArrayList();
    }
    for (;;)
    {
      int i;
      String str;
      try
      {
        paramBehanceSDKGetUserWIPsTaskResult = ((JSONObject)localObject1).optJSONArray("wips");
        paramInt = 0;
        paramBehanceSDKGetUserWIPsTaskParams = paramDefaultHttpClient;
        if (paramInt >= paramBehanceSDKGetUserWIPsTaskResult.length()) {
          break label641;
        }
        localObject1 = paramBehanceSDKGetUserWIPsTaskResult.getJSONObject(paramInt);
        paramBehanceSDKGetUserWIPsTaskParams = new BehanceSDKWIPDTO();
        paramBehanceSDKGetUserWIPsTaskParams.setId(((JSONObject)localObject1).optInt("id"));
        paramBehanceSDKGetUserWIPsTaskParams.setTitle(((JSONObject)localObject1).optString("title"));
        localObject2 = ((JSONObject)localObject1).optJSONObject("revisions");
        if (localObject2 == null) {
          break label557;
        }
        localObject3 = ((JSONObject)localObject2).names();
        if (localObject3 == null) {
          break label557;
        }
        i = 0;
        if (i >= ((JSONArray)localObject3).length()) {
          break label557;
        }
        localObject1 = ((JSONObject)localObject2).optJSONObject(((JSONArray)localObject3).getString(i));
        if (localObject1 == null) {
          break label652;
        }
        localObject1 = ((JSONObject)localObject1).optJSONObject("images");
        if (localObject1 == null) {
          break label652;
        }
        localObject2 = ((JSONObject)localObject1).names();
        i = 0;
        if (i >= ((JSONArray)localObject2).length()) {
          break label557;
        }
        localObject3 = ((JSONArray)localObject2).getString(i);
        str = ((JSONObject)localObject1).getJSONObject((String)localObject3).optString("url");
        if ("thumbnail_sm".equals(localObject3)) {
          paramBehanceSDKGetUserWIPsTaskParams.setLatestRevisionImageUrl(BehanceSDKWIPDTO.WIPRevisionImageType.THUMBNAIL_SM, str);
        } else if ("thumbnail".equals(localObject3)) {
          paramBehanceSDKGetUserWIPsTaskParams.setLatestRevisionImageUrl(BehanceSDKWIPDTO.WIPRevisionImageType.THUMBNAIL, str);
        }
      }
      catch (JSONException paramBehanceSDKGetUserWIPsTaskParams)
      {
        logger.error(paramBehanceSDKGetUserWIPsTaskParams, "Problem parsing WIP JSON response", new Object[0]);
        throw paramBehanceSDKGetUserWIPsTaskParams;
      }
      if ("normal_resolution".equals(localObject3))
      {
        paramBehanceSDKGetUserWIPsTaskParams.setLatestRevisionImageUrl(BehanceSDKWIPDTO.WIPRevisionImageType.NORMAL_RESOLUTION, str);
      }
      else if ("high_definition".equals(localObject3))
      {
        paramBehanceSDKGetUserWIPsTaskParams.setLatestRevisionImageUrl(BehanceSDKWIPDTO.WIPRevisionImageType.HIGH_DEFINITION, str);
      }
      else if ("thumb_40".equals(localObject3))
      {
        paramBehanceSDKGetUserWIPsTaskParams.setLatestRevisionImageUrl(BehanceSDKWIPDTO.WIPRevisionImageType.THUMB_40, str);
      }
      else if ("thumb_80".equals(localObject3))
      {
        paramBehanceSDKGetUserWIPsTaskParams.setLatestRevisionImageUrl(BehanceSDKWIPDTO.WIPRevisionImageType.THUMB_80, str);
      }
      else if ("thumb_120".equals(localObject3))
      {
        paramBehanceSDKGetUserWIPsTaskParams.setLatestRevisionImageUrl(BehanceSDKWIPDTO.WIPRevisionImageType.THUMB_120, str);
      }
      else if ("thumb_240".equals(localObject3))
      {
        paramBehanceSDKGetUserWIPsTaskParams.setLatestRevisionImageUrl(BehanceSDKWIPDTO.WIPRevisionImageType.THUMB_240, str);
      }
      else if ("limit_320".equals(localObject3))
      {
        paramBehanceSDKGetUserWIPsTaskParams.setLatestRevisionImageUrl(BehanceSDKWIPDTO.WIPRevisionImageType.LIMIT_320, str);
        break label643;
        label557:
        paramDefaultHttpClient.add(paramBehanceSDKGetUserWIPsTaskParams);
        paramInt += 1;
        continue;
        logger.error("Unexpected HTTP Response code when trying to fetch User WIPs. [User ID - %s] [Response code - %d]", new Object[] { paramBehanceSDKGetUserWIPsTaskParams.getUserId(), Integer.valueOf(paramInt) });
        paramBehanceSDKGetUserWIPsTaskResult.setException(new Exception("Invalid server response code " + paramInt));
        paramBehanceSDKGetUserWIPsTaskResult.setExceptionOccurred(true);
        paramBehanceSDKGetUserWIPsTaskParams = null;
        label641:
        return paramBehanceSDKGetUserWIPsTaskParams;
      }
      label643:
      i += 1;
      continue;
      label652:
      i += 1;
    }
  }
  
  protected BehanceSDKGetUserWIPsTaskResult doInBackground(BehanceSDKGetUserWIPsTaskParams... paramVarArgs)
  {
    localBehanceSDKGetUserWIPsTaskResult = new BehanceSDKGetUserWIPsTaskResult();
    try
    {
      taskParams = paramVarArgs[0];
      paramVarArgs = new DefaultHttpClient();
      int i = 1;
      ArrayList localArrayList = new ArrayList();
      for (;;)
      {
        List localList = getUserWips(taskParams, i, paramVarArgs, localBehanceSDKGetUserWIPsTaskResult);
        if (localList != null) {
          localArrayList.addAll(localList);
        }
        if ((localList == null) || (localList.size() < 24) || (localBehanceSDKGetUserWIPsTaskResult.isExceptionOccurred()))
        {
          localBehanceSDKGetUserWIPsTaskResult.setWipsList(localArrayList);
          return localBehanceSDKGetUserWIPsTaskResult;
        }
        i += 1;
      }
      return localBehanceSDKGetUserWIPsTaskResult;
    }
    catch (Exception paramVarArgs)
    {
      localBehanceSDKGetUserWIPsTaskResult.setExceptionOccurred(true);
      localBehanceSDKGetUserWIPsTaskResult.setException(paramVarArgs);
      logger.error(paramVarArgs, "Problem Getting user WIPs", new Object[0]);
      return localBehanceSDKGetUserWIPsTaskResult;
    }
    catch (Error paramVarArgs)
    {
      localBehanceSDKGetUserWIPsTaskResult.setExceptionOccurred(true);
      localBehanceSDKGetUserWIPsTaskResult.setException(new Exception(paramVarArgs));
      logger.error(paramVarArgs, "Problem Getting user WIPs", new Object[0]);
    }
  }
  
  protected void onPostExecute(BehanceSDKGetUserWIPsTaskResult paramBehanceSDKGetUserWIPsTaskResult)
  {
    if (paramBehanceSDKGetUserWIPsTaskResult.isExceptionOccurred())
    {
      listener.onGetUserWIPsTaskFailure(paramBehanceSDKGetUserWIPsTaskResult.getException(), taskParams);
      return;
    }
    listener.onGetUserWIPsTaskSuccess(paramBehanceSDKGetUserWIPsTaskResult.getWipsList(), taskParams);
  }
}
