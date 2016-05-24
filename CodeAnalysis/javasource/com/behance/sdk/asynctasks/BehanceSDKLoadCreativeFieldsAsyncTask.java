package com.behance.sdk.asynctasks;

import android.os.AsyncTask;
import com.behance.sdk.IBehanceSDKUserCredentials;
import com.behance.sdk.asynctasks.result.BehanceSDKCreativeFieldsTaskResult;
import com.behance.sdk.datamanager.listeners.interfaces.IGetCreativeFieldsAsyncTaskListener;
import com.behance.sdk.dto.BehanceSDKCreativeFieldDTO;
import com.behance.sdk.enums.BehanceSDKCreativeFieldCategory;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

public class BehanceSDKLoadCreativeFieldsAsyncTask
  extends AsyncTask<Void, Void, BehanceSDKCreativeFieldsTaskResult<List<BehanceSDKCreativeFieldDTO>>>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKLoadCreativeFieldsAsyncTask.class);
  private IBehanceSDKUserCredentials iUserCredentials;
  private IGetCreativeFieldsAsyncTaskListener taskHandler;
  
  public BehanceSDKLoadCreativeFieldsAsyncTask(IGetCreativeFieldsAsyncTaskListener paramIGetCreativeFieldsAsyncTaskListener)
  {
    taskHandler = paramIGetCreativeFieldsAsyncTaskListener;
  }
  
  protected BehanceSDKCreativeFieldsTaskResult<List<BehanceSDKCreativeFieldDTO>> doInBackground(Void... paramVarArgs)
  {
    BehanceSDKCreativeFieldsTaskResult localBehanceSDKCreativeFieldsTaskResult = new BehanceSDKCreativeFieldsTaskResult();
    try
    {
      paramVarArgs = new HashMap();
      paramVarArgs.put("clientId", iUserCredentials.getClientId());
      paramVarArgs = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/fields?{key_client_id_param}={clientId}", paramVarArgs);
      paramVarArgs = EntityUtils.toString(new DefaultHttpClient().execute(new HttpGet(paramVarArgs)).getEntity());
      logger.debug("Get creative fields response: %s", new Object[] { paramVarArgs });
      ArrayList localArrayList = new ArrayList();
      HashMap localHashMap = new HashMap();
      paramVarArgs = new JSONObject(paramVarArgs);
      JSONArray localJSONArray = paramVarArgs.optJSONArray("popular");
      int i = 0;
      JSONObject localJSONObject;
      Object localObject;
      while (i < localJSONArray.length())
      {
        localJSONObject = localJSONArray.getJSONObject(i);
        localObject = new BehanceSDKCreativeFieldDTO();
        String str = localJSONObject.optString("id");
        ((BehanceSDKCreativeFieldDTO)localObject).setId(str);
        ((BehanceSDKCreativeFieldDTO)localObject).setName(localJSONObject.optString("name"));
        ((BehanceSDKCreativeFieldDTO)localObject).setCategory(BehanceSDKCreativeFieldCategory.POPULAR);
        localHashMap.put(str, localObject);
        i += 1;
      }
      localJSONArray = paramVarArgs.optJSONArray("fields");
      i = 0;
      if (i < localJSONArray.length())
      {
        localJSONObject = localJSONArray.getJSONObject(i);
        localObject = localJSONObject.optString("id");
        if (localHashMap.containsKey(localObject)) {
          paramVarArgs = (BehanceSDKCreativeFieldDTO)localHashMap.get(localObject);
        }
        for (;;)
        {
          localArrayList.add(paramVarArgs);
          i += 1;
          break;
          paramVarArgs = new BehanceSDKCreativeFieldDTO();
          paramVarArgs.setId((String)localObject);
          paramVarArgs.setName(localJSONObject.optString("name"));
        }
      }
      localBehanceSDKCreativeFieldsTaskResult.setResult(localArrayList);
    }
    catch (Exception paramVarArgs)
    {
      localBehanceSDKCreativeFieldsTaskResult.setExceptionOccurred(true);
      localBehanceSDKCreativeFieldsTaskResult.setException(paramVarArgs);
      return localBehanceSDKCreativeFieldsTaskResult;
    }
    return localBehanceSDKCreativeFieldsTaskResult;
  }
  
  protected void onPostExecute(BehanceSDKCreativeFieldsTaskResult<List<BehanceSDKCreativeFieldDTO>> paramBehanceSDKCreativeFieldsTaskResult)
  {
    if (paramBehanceSDKCreativeFieldsTaskResult.isExceptionOccurred())
    {
      taskHandler.onLoadCreativeFieldsFailure(paramBehanceSDKCreativeFieldsTaskResult.getException());
      return;
    }
    taskHandler.onLoadCreativeFieldsSuccess((List)paramBehanceSDKCreativeFieldsTaskResult.getResult());
  }
  
  public void setUserCredentials(IBehanceSDKUserCredentials paramIBehanceSDKUserCredentials)
  {
    iUserCredentials = paramIBehanceSDKUserCredentials;
  }
}
