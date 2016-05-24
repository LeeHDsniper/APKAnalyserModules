package com.behance.sdk.asynctasks;

import android.os.AsyncTask;
import android.text.TextUtils;
import com.behance.sdk.IBehanceSDKSearchProjectListener;
import com.behance.sdk.asynctask.params.BehanceSDKSearchProjectsTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKAsyncTaskResultWrapper;
import com.behance.sdk.dto.parser.BehanceSDKProjectDTOParser;
import com.behance.sdk.dto.search.BehanceSDKProjectDTO;
import com.behance.sdk.enums.BehanceSDKProjectsSortOption;
import com.behance.sdk.enums.BehanceSDKProjectsTimeSpan;
import com.behance.sdk.exception.BehanceSDKException;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.managers.BehanceSDKUserManager;
import com.behance.sdk.util.BehanceSDKHTTPUtils;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import com.behance.sdk.util.HTTPResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.http.client.methods.HttpGet;

public class BehanceSDKSearchProjectsAsyncTask
  extends AsyncTask<BehanceSDKSearchProjectsTaskParams, Void, BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKProjectDTO>>>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKSearchProjectsAsyncTask.class);
  private IBehanceSDKSearchProjectListener taskHandler;
  private BehanceSDKSearchProjectsTaskParams taskParams;
  
  protected BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKProjectDTO>> doInBackground(BehanceSDKSearchProjectsTaskParams... paramVarArgs)
  {
    BehanceSDKAsyncTaskResultWrapper localBehanceSDKAsyncTaskResultWrapper = new BehanceSDKAsyncTaskResultWrapper();
    try
    {
      if ((paramVarArgs.length == 1) && (paramVarArgs[0] != null))
      {
        Object localObject2 = paramVarArgs[0];
        taskParams = ((BehanceSDKSearchProjectsTaskParams)localObject2);
        paramVarArgs = new HashMap();
        paramVarArgs.put("clientId", ((BehanceSDKSearchProjectsTaskParams)localObject2).getClientId());
        Object localObject3 = BehanceSDKUrlUtil.appendQueryStringParam(BehanceSDKUrlUtil.appendQueryStringParam(BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/projects?{key_client_id_param}={clientId}", paramVarArgs), "page", Integer.valueOf(((BehanceSDKSearchProjectsTaskParams)localObject2).getPageNumber())), "per_page", Integer.valueOf(((BehanceSDKSearchProjectsTaskParams)localObject2).getPageSize()));
        Object localObject1 = ((BehanceSDKSearchProjectsTaskParams)localObject2).getSortOption();
        paramVarArgs = (BehanceSDKSearchProjectsTaskParams[])localObject1;
        if (localObject1 == null) {
          paramVarArgs = BehanceSDKProjectsSortOption.FEATURED_DATE;
        }
        localObject1 = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject3, "sort", paramVarArgs.toString());
        localObject3 = ((BehanceSDKSearchProjectsTaskParams)localObject2).getTimeSpan();
        paramVarArgs = (BehanceSDKSearchProjectsTaskParams[])localObject1;
        if (localObject3 != null) {
          paramVarArgs = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject1, "time", ((BehanceSDKProjectsTimeSpan)localObject3).toString());
        }
        localObject3 = ((BehanceSDKSearchProjectsTaskParams)localObject2).getField();
        localObject1 = paramVarArgs;
        if (!TextUtils.isEmpty((CharSequence)localObject3)) {
          localObject1 = BehanceSDKUrlUtil.appendQueryStringParam(paramVarArgs, "field", localObject3);
        }
        localObject3 = ((BehanceSDKSearchProjectsTaskParams)localObject2).getCountry();
        paramVarArgs = (BehanceSDKSearchProjectsTaskParams[])localObject1;
        if (!TextUtils.isEmpty((CharSequence)localObject3)) {
          paramVarArgs = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject1, "country", localObject3);
        }
        localObject3 = ((BehanceSDKSearchProjectsTaskParams)localObject2).getState();
        localObject1 = paramVarArgs;
        if (!TextUtils.isEmpty((CharSequence)localObject3))
        {
          localObject1 = paramVarArgs;
          if (!((String)localObject3).equals("All States")) {
            localObject1 = BehanceSDKUrlUtil.appendQueryStringParam(paramVarArgs, "state", localObject3);
          }
        }
        localObject3 = ((BehanceSDKSearchProjectsTaskParams)localObject2).getCity();
        paramVarArgs = (BehanceSDKSearchProjectsTaskParams[])localObject1;
        if (!TextUtils.isEmpty((CharSequence)localObject3))
        {
          paramVarArgs = (BehanceSDKSearchProjectsTaskParams[])localObject1;
          if (!((String)localObject3).equals("All Cities")) {
            paramVarArgs = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject1, "city", localObject3);
          }
        }
        localObject2 = ((BehanceSDKSearchProjectsTaskParams)localObject2).getSearchString();
        localObject1 = paramVarArgs;
        if (!TextUtils.isEmpty((CharSequence)localObject2)) {
          localObject1 = BehanceSDKUrlUtil.appendQueryStringParam(paramVarArgs, "q", localObject2);
        }
        localObject2 = BehanceSDKUserManager.getInstance().checkExpiryAndGetAccessToken();
        paramVarArgs = (BehanceSDKSearchProjectsTaskParams[])localObject1;
        if (localObject2 != null) {
          paramVarArgs = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject1, "access_token", localObject2);
        }
        logger.debug("Get Projects async task request url - %s", new Object[] { paramVarArgs });
        paramVarArgs = BehanceSDKHTTPUtils.doHTTPGet(new HttpGet(paramVarArgs)).getResponseString();
        logger.debug("Get projects async task response: %s", new Object[] { paramVarArgs });
        localBehanceSDKAsyncTaskResultWrapper.setResult(new BehanceSDKProjectDTOParser().parseProjects(paramVarArgs));
        return localBehanceSDKAsyncTaskResultWrapper;
      }
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
      localBehanceSDKAsyncTaskResultWrapper.setException(new BehanceSDKException("BehanceSDKSearchProjectsTaskParams cannot be null"));
      return localBehanceSDKAsyncTaskResultWrapper;
    }
    catch (Exception paramVarArgs)
    {
      logger.error(paramVarArgs, "Problem getting Projects from server", new Object[0]);
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
      localBehanceSDKAsyncTaskResultWrapper.setException(paramVarArgs);
      return localBehanceSDKAsyncTaskResultWrapper;
    }
    catch (Throwable paramVarArgs)
    {
      logger.error(paramVarArgs, "Problem getting Projects from server", new Object[0]);
      localBehanceSDKAsyncTaskResultWrapper.setException(new BehanceSDKException(paramVarArgs));
      localBehanceSDKAsyncTaskResultWrapper.setExceptionOccurred(true);
    }
    return localBehanceSDKAsyncTaskResultWrapper;
  }
  
  protected void onPostExecute(BehanceSDKAsyncTaskResultWrapper<List<BehanceSDKProjectDTO>> paramBehanceSDKAsyncTaskResultWrapper)
  {
    if (paramBehanceSDKAsyncTaskResultWrapper.isExceptionOccurred())
    {
      taskHandler.onSearchProjectsFailure(paramBehanceSDKAsyncTaskResultWrapper.getException());
      return;
    }
    taskHandler.onSearchProjectsSuccess((List)paramBehanceSDKAsyncTaskResultWrapper.getResult());
  }
}
