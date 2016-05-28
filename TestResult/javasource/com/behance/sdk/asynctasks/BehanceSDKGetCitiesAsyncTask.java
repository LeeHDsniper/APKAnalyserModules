package com.behance.sdk.asynctasks;

import android.os.AsyncTask;
import com.behance.sdk.asynctask.params.BehanceSDKGetCitiesAsyncTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKAsyncTaskResultWrapper;
import com.behance.sdk.dto.location.BehanceSDKCityDTO;
import com.behance.sdk.listeners.IGetCitiesAsyncTaskListener;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

public class BehanceSDKGetCitiesAsyncTask
  extends AsyncTask<BehanceSDKGetCitiesAsyncTaskParams, Void, BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKCityDTO>>>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKGetCitiesAsyncTask.class);
  private IGetCitiesAsyncTaskListener taskHandler;
  private BehanceSDKGetCitiesAsyncTaskParams taskParams;
  
  public BehanceSDKGetCitiesAsyncTask(IGetCitiesAsyncTaskListener paramIGetCitiesAsyncTaskListener)
  {
    taskHandler = paramIGetCitiesAsyncTaskListener;
  }
  
  protected BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKCityDTO>> doInBackground(BehanceSDKGetCitiesAsyncTaskParams... paramVarArgs)
  {
    BehanceSDKAsyncTaskResultWrapper localBehanceSDKAsyncTaskResultWrapper = new BehanceSDKAsyncTaskResultWrapper();
    for (;;)
    {
      int i;
      try
      {
        Object localObject2 = new DefaultHttpClient();
        taskParams = paramVarArgs[0];
        paramVarArgs = new HashMap();
        paramVarArgs.put("clientId", taskParams.getClientId());
        Object localObject1 = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/utilities/location?level=3&{key_client_id_param}={clientId}", paramVarArgs);
        paramVarArgs = (BehanceSDKGetCitiesAsyncTaskParams[])localObject1;
        if (taskParams.getCountryId() != null)
        {
          paramVarArgs = (BehanceSDKGetCitiesAsyncTaskParams[])localObject1;
          if (taskParams.getCountryId().length() > 0) {
            paramVarArgs = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject1, "country", taskParams.getCountryId());
          }
        }
        localObject1 = paramVarArgs;
        if (taskParams.getStateId() != null)
        {
          localObject1 = paramVarArgs;
          if (taskParams.getStateId().length() > 0) {
            localObject1 = BehanceSDKUrlUtil.appendQueryStringParam(paramVarArgs, "stateprov", taskParams.getStateId());
          }
        }
        paramVarArgs = (BehanceSDKGetCitiesAsyncTaskParams[])localObject1;
        if (taskParams.getCitySearchStr() != null)
        {
          paramVarArgs = (BehanceSDKGetCitiesAsyncTaskParams[])localObject1;
          if (taskParams.getCitySearchStr().length() > 0) {
            paramVarArgs = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject1, "city", taskParams.getCitySearchStr());
          }
        }
        logger.debug("Get Cities URL - %s", new Object[] { paramVarArgs });
        localObject1 = EntityUtils.toString(((DefaultHttpClient)localObject2).execute(new HttpGet(paramVarArgs)).getEntity());
        logger.debug("Get cities response: %s", new Object[] { localObject1 });
        paramVarArgs = new ArrayList();
        localObject1 = new JSONArray((String)localObject1);
        i = 0;
        if (i < ((JSONArray)localObject1).length())
        {
          localObject2 = ((JSONArray)localObject1).opt(i);
          if (localObject2 != null)
          {
            localObject2 = (JSONObject)localObject2;
            BehanceSDKCityDTO localBehanceSDKCityDTO = new BehanceSDKCityDTO();
            localBehanceSDKCityDTO.setId(((JSONObject)localObject2).optString("id"));
            localBehanceSDKCityDTO.setDisplayName(((JSONObject)localObject2).optString("n"));
            paramVarArgs.add(localBehanceSDKCityDTO);
          }
        }
        else
        {
          Collections.sort(paramVarArgs);
          localBehanceSDKAsyncTaskResultWrapper.setResult(paramVarArgs);
          return localBehanceSDKAsyncTaskResultWrapper;
        }
      }
      catch (Exception paramVarArgs)
      {
        logger.error(paramVarArgs, "Problem getting Cities from server", new Object[0]);
        localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
        localBehanceSDKAsyncTaskResultWrapper.setException(paramVarArgs);
        return localBehanceSDKAsyncTaskResultWrapper;
      }
      catch (Throwable paramVarArgs)
      {
        logger.error(paramVarArgs, "Problem getting Cities from server", new Object[0]);
        localBehanceSDKAsyncTaskResultWrapper.setException(new Exception(paramVarArgs.getMessage()));
        localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
        return localBehanceSDKAsyncTaskResultWrapper;
      }
      i += 1;
    }
  }
  
  protected void onPostExecute(BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKCityDTO>> paramBehanceSDKAsyncTaskResultWrapper)
  {
    if (paramBehanceSDKAsyncTaskResultWrapper.isExceptionOccurred())
    {
      taskHandler.onGetCitiesFailure(taskParams, paramBehanceSDKAsyncTaskResultWrapper.getException());
      return;
    }
    taskHandler.onGetCitiesSuccess(taskParams, (List)paramBehanceSDKAsyncTaskResultWrapper.getResult());
  }
}
