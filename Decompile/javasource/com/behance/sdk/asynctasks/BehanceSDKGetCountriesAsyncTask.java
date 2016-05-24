package com.behance.sdk.asynctasks;

import android.os.AsyncTask;
import com.behance.sdk.asynctask.params.BehanceSDKAbstractTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKAsyncTaskResultWrapper;
import com.behance.sdk.dto.location.BehanceSDKCountryDTO;
import com.behance.sdk.listeners.IGetCountriesAsyncTaskListener;
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

public class BehanceSDKGetCountriesAsyncTask
  extends AsyncTask<BehanceSDKAbstractTaskParams, Void, BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKCountryDTO>>>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKGetCountriesAsyncTask.class);
  private IGetCountriesAsyncTaskListener taskHandler;
  
  public BehanceSDKGetCountriesAsyncTask(IGetCountriesAsyncTaskListener paramIGetCountriesAsyncTaskListener)
  {
    taskHandler = paramIGetCountriesAsyncTaskListener;
  }
  
  protected BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKCountryDTO>> doInBackground(BehanceSDKAbstractTaskParams... paramVarArgs)
  {
    localBehanceSDKAsyncTaskResultWrapper = new BehanceSDKAsyncTaskResultWrapper();
    paramVarArgs = paramVarArgs[0];
    try
    {
      Object localObject1 = new DefaultHttpClient();
      Object localObject2 = new HashMap();
      ((Map)localObject2).put("clientId", paramVarArgs.getClientId());
      localObject1 = EntityUtils.toString(((DefaultHttpClient)localObject1).execute(new HttpGet(BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/utilities/location?level=1&{key_client_id_param}={clientId}", (Map)localObject2))).getEntity());
      logger.debug("Get Countries response: %s", new Object[] { localObject1 });
      paramVarArgs = new ArrayList();
      localObject1 = new JSONObject((String)localObject1);
      localObject2 = ((JSONObject)localObject1).keys();
      while (((Iterator)localObject2).hasNext())
      {
        JSONObject localJSONObject = ((JSONObject)localObject1).optJSONObject((String)((Iterator)localObject2).next());
        if (localJSONObject != null)
        {
          localJSONObject = (JSONObject)localJSONObject;
          BehanceSDKCountryDTO localBehanceSDKCountryDTO = new BehanceSDKCountryDTO();
          localBehanceSDKCountryDTO.setId(localJSONObject.optString("id"));
          localBehanceSDKCountryDTO.setDisplayName(localJSONObject.optString("n"));
          paramVarArgs.add(localBehanceSDKCountryDTO);
        }
      }
      return localBehanceSDKAsyncTaskResultWrapper;
    }
    catch (Exception paramVarArgs)
    {
      logger.error(paramVarArgs, "Problem getting Countries from server", new Object[0]);
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
      localBehanceSDKAsyncTaskResultWrapper.setException(paramVarArgs);
      return localBehanceSDKAsyncTaskResultWrapper;
      Collections.sort(paramVarArgs);
      localBehanceSDKAsyncTaskResultWrapper.setResult(paramVarArgs);
      return localBehanceSDKAsyncTaskResultWrapper;
    }
    catch (Throwable paramVarArgs)
    {
      logger.error(paramVarArgs, "Problem getting Countries from server", new Object[0]);
      localBehanceSDKAsyncTaskResultWrapper.setException(new Exception(paramVarArgs.getMessage()));
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
    }
  }
  
  protected void onPostExecute(BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKCountryDTO>> paramBehanceSDKAsyncTaskResultWrapper)
  {
    if (paramBehanceSDKAsyncTaskResultWrapper.isExceptionOccurred())
    {
      taskHandler.onGetCountriesFailure(paramBehanceSDKAsyncTaskResultWrapper.getException());
      return;
    }
    taskHandler.onGetCountriesSuccess((List)paramBehanceSDKAsyncTaskResultWrapper.getResult());
  }
}
