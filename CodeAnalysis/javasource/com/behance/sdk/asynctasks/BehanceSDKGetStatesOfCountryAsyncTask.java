package com.behance.sdk.asynctasks;

import android.os.AsyncTask;
import com.behance.sdk.asynctask.params.BehanceSDKGetStatesOfCountryAsyncTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKAsyncTaskResultWrapper;
import com.behance.sdk.dto.location.BehanceSDKStateDTO;
import com.behance.sdk.listeners.IGetStatesOfCountryAsyncTaskListener;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

public class BehanceSDKGetStatesOfCountryAsyncTask
  extends AsyncTask<BehanceSDKGetStatesOfCountryAsyncTaskParams, Void, BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKStateDTO>>>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKGetStatesOfCountryAsyncTask.class);
  private String countryId;
  private IGetStatesOfCountryAsyncTaskListener taskHandler;
  
  public BehanceSDKGetStatesOfCountryAsyncTask(IGetStatesOfCountryAsyncTaskListener paramIGetStatesOfCountryAsyncTaskListener)
  {
    taskHandler = paramIGetStatesOfCountryAsyncTaskListener;
  }
  
  protected BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKStateDTO>> doInBackground(BehanceSDKGetStatesOfCountryAsyncTaskParams... paramVarArgs)
  {
    localBehanceSDKAsyncTaskResultWrapper = new BehanceSDKAsyncTaskResultWrapper();
    Object localObject1 = paramVarArgs[0];
    if (paramVarArgs.length != 1)
    {
      localBehanceSDKAsyncTaskResultWrapper.setException(new Exception("Missing country ID"));
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
      return localBehanceSDKAsyncTaskResultWrapper;
    }
    try
    {
      paramVarArgs = new DefaultHttpClient();
      countryId = ((BehanceSDKGetStatesOfCountryAsyncTaskParams)localObject1).getCountryId();
      Object localObject2 = new HashMap();
      ((Map)localObject2).put("countryId", countryId);
      ((Map)localObject2).put("clientId", ((BehanceSDKGetStatesOfCountryAsyncTaskParams)localObject1).getClientId());
      localObject1 = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/utilities/location?level=2&country={countryId}&{key_client_id_param}={clientId}", (Map)localObject2);
      logger.debug("Get States of Country URL - %s", new Object[] { localObject1 });
      localObject1 = EntityUtils.toString(paramVarArgs.execute(new HttpGet((String)localObject1)).getEntity());
      logger.debug("Get States of Country [Country id - %s ] response: %s", new Object[] { countryId, localObject1 });
      paramVarArgs = new ArrayList();
      localObject1 = new JSONObject((String)localObject1);
      localObject2 = ((JSONObject)localObject1).keys();
      while (((Iterator)localObject2).hasNext())
      {
        JSONObject localJSONObject = ((JSONObject)localObject1).optJSONObject((String)((Iterator)localObject2).next());
        if (localJSONObject != null)
        {
          localJSONObject = (JSONObject)localJSONObject;
          BehanceSDKStateDTO localBehanceSDKStateDTO = new BehanceSDKStateDTO();
          localBehanceSDKStateDTO.setId(localJSONObject.optString("id"));
          localBehanceSDKStateDTO.setDisplayName(localJSONObject.optString("n"));
          paramVarArgs.add(localBehanceSDKStateDTO);
        }
      }
      return localBehanceSDKAsyncTaskResultWrapper;
    }
    catch (Exception paramVarArgs)
    {
      logger.error(paramVarArgs, "Problem getting States of Country from server", new Object[0]);
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
      localBehanceSDKAsyncTaskResultWrapper.setException(paramVarArgs);
      return localBehanceSDKAsyncTaskResultWrapper;
      Collections.sort(paramVarArgs);
      localBehanceSDKAsyncTaskResultWrapper.setResult(paramVarArgs);
      return localBehanceSDKAsyncTaskResultWrapper;
    }
    catch (Throwable paramVarArgs)
    {
      logger.error(paramVarArgs, "Problem getting States of Country from server", new Object[0]);
      localBehanceSDKAsyncTaskResultWrapper.setException(new Exception(paramVarArgs.getMessage()));
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
    }
  }
  
  protected void onPostExecute(BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKStateDTO>> paramBehanceSDKAsyncTaskResultWrapper)
  {
    if (paramBehanceSDKAsyncTaskResultWrapper.isExceptionOccurred())
    {
      taskHandler.onGetStatesFailure(countryId, paramBehanceSDKAsyncTaskResultWrapper.getException());
      return;
    }
    taskHandler.onGetStatesSuccess(countryId, (List)paramBehanceSDKAsyncTaskResultWrapper.getResult());
  }
}
