package com.behance.sdk.asynctasks;

import android.os.AsyncTask;
import com.behance.sdk.BehanceSDKUserProfile;
import com.behance.sdk.asynctask.listeners.IBehanceSDKGetUserProfileAsyncTaskListener;
import com.behance.sdk.asynctask.params.BehanceSDKGetUserProfileTaskParams;
import com.behance.sdk.asynctasks.result.BehanceSDKGetUserProfileTaskResult;
import com.behance.sdk.dto.location.BehanceSDKCountryDTO;
import com.behance.sdk.dto.location.BehanceSDKStateDTO;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import com.behance.sdk.managers.BehanceSDKUserManager;
import com.behance.sdk.util.BehanceSDKUrlUtil;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class BehanceSDKGetUserProfileAsyncTask
  extends AsyncTask<BehanceSDKGetUserProfileTaskParams, Void, BehanceSDKGetUserProfileTaskResult>
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceSDKGetUserProfileAsyncTask.class);
  private BehanceSDKGetUserProfileTaskParams getUserProfileTaskParams;
  private IBehanceSDKGetUserProfileAsyncTaskListener listener;
  
  public BehanceSDKGetUserProfileAsyncTask(IBehanceSDKGetUserProfileAsyncTaskListener paramIBehanceSDKGetUserProfileAsyncTaskListener)
  {
    listener = paramIBehanceSDKGetUserProfileAsyncTaskListener;
  }
  
  /* Error */
  private com.behance.sdk.dto.location.BehanceSDKCityDTO getCityDTO(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    // Byte code:
    //   0: new 36	org/apache/http/impl/client/DefaultHttpClient
    //   3: dup
    //   4: invokespecial 37	org/apache/http/impl/client/DefaultHttpClient:<init>	()V
    //   7: astore 7
    //   9: new 39	java/util/HashMap
    //   12: dup
    //   13: invokespecial 40	java/util/HashMap:<init>	()V
    //   16: astore 6
    //   18: aload 6
    //   20: ldc 42
    //   22: aload 4
    //   24: invokeinterface 48 3 0
    //   29: pop
    //   30: ldc 50
    //   32: aload 6
    //   34: invokestatic 56	com/behance/sdk/util/BehanceSDKUrlUtil:getUrlFromTemplate	(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    //   37: astore 6
    //   39: aload 6
    //   41: astore 4
    //   43: aload_2
    //   44: invokestatic 62	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   47: ifne +13 -> 60
    //   50: aload 6
    //   52: ldc 64
    //   54: aload_2
    //   55: invokestatic 68	com/behance/sdk/util/BehanceSDKUrlUtil:appendQueryStringParam	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    //   58: astore 4
    //   60: aload 4
    //   62: astore_2
    //   63: aload_3
    //   64: invokestatic 62	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   67: ifne +12 -> 79
    //   70: aload 4
    //   72: ldc 70
    //   74: aload_3
    //   75: invokestatic 68	com/behance/sdk/util/BehanceSDKUrlUtil:appendQueryStringParam	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    //   78: astore_2
    //   79: aload_2
    //   80: astore_3
    //   81: aload_1
    //   82: invokestatic 62	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   85: ifne +11 -> 96
    //   88: aload_2
    //   89: ldc 72
    //   91: aload_1
    //   92: invokestatic 68	com/behance/sdk/util/BehanceSDKUrlUtil:appendQueryStringParam	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    //   95: astore_3
    //   96: getstatic 21	com/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask:logger	Lcom/behance/sdk/logger/ILogger;
    //   99: ldc 74
    //   101: iconst_1
    //   102: anewarray 76	java/lang/Object
    //   105: dup
    //   106: iconst_0
    //   107: aload_3
    //   108: aastore
    //   109: invokeinterface 82 3 0
    //   114: aload 7
    //   116: new 84	org/apache/http/client/methods/HttpGet
    //   119: dup
    //   120: aload_3
    //   121: invokespecial 87	org/apache/http/client/methods/HttpGet:<init>	(Ljava/lang/String;)V
    //   124: invokevirtual 91	org/apache/http/impl/client/DefaultHttpClient:execute	(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    //   127: invokeinterface 97 1 0
    //   132: invokestatic 103	org/apache/http/util/EntityUtils:toString	(Lorg/apache/http/HttpEntity;)Ljava/lang/String;
    //   135: astore_2
    //   136: getstatic 21	com/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask:logger	Lcom/behance/sdk/logger/ILogger;
    //   139: ldc 105
    //   141: iconst_1
    //   142: anewarray 76	java/lang/Object
    //   145: dup
    //   146: iconst_0
    //   147: aload_2
    //   148: aastore
    //   149: invokeinterface 82 3 0
    //   154: new 107	org/json/JSONArray
    //   157: dup
    //   158: aload_2
    //   159: invokespecial 108	org/json/JSONArray:<init>	(Ljava/lang/String;)V
    //   162: astore_2
    //   163: iconst_0
    //   164: istore 5
    //   166: iload 5
    //   168: aload_2
    //   169: invokevirtual 112	org/json/JSONArray:length	()I
    //   172: if_icmpge +82 -> 254
    //   175: aload_2
    //   176: iload 5
    //   178: invokevirtual 116	org/json/JSONArray:opt	(I)Ljava/lang/Object;
    //   181: astore_3
    //   182: aload_3
    //   183: ifnull +46 -> 229
    //   186: aload_3
    //   187: checkcast 118	org/json/JSONObject
    //   190: astore_3
    //   191: aload_3
    //   192: ldc 120
    //   194: invokevirtual 124	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   197: aload_1
    //   198: invokevirtual 130	java/lang/String:equalsIgnoreCase	(Ljava/lang/String;)Z
    //   201: ifeq +28 -> 229
    //   204: new 132	com/behance/sdk/dto/location/BehanceSDKCityDTO
    //   207: dup
    //   208: invokespecial 133	com/behance/sdk/dto/location/BehanceSDKCityDTO:<init>	()V
    //   211: astore_2
    //   212: aload_2
    //   213: aload_3
    //   214: ldc -121
    //   216: invokevirtual 124	org/json/JSONObject:optString	(Ljava/lang/String;)Ljava/lang/String;
    //   219: invokevirtual 138	com/behance/sdk/dto/location/BehanceSDKCityDTO:setId	(Ljava/lang/String;)V
    //   222: aload_2
    //   223: aload_1
    //   224: invokevirtual 141	com/behance/sdk/dto/location/BehanceSDKCityDTO:setDisplayName	(Ljava/lang/String;)V
    //   227: aload_2
    //   228: areturn
    //   229: iload 5
    //   231: iconst_1
    //   232: iadd
    //   233: istore 5
    //   235: goto -69 -> 166
    //   238: astore_1
    //   239: getstatic 21	com/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask:logger	Lcom/behance/sdk/logger/ILogger;
    //   242: aload_1
    //   243: ldc -113
    //   245: iconst_0
    //   246: anewarray 76	java/lang/Object
    //   249: invokeinterface 146 4 0
    //   254: aconst_null
    //   255: areturn
    //   256: astore_1
    //   257: getstatic 21	com/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask:logger	Lcom/behance/sdk/logger/ILogger;
    //   260: aload_1
    //   261: ldc -113
    //   263: iconst_0
    //   264: anewarray 76	java/lang/Object
    //   267: invokeinterface 146 4 0
    //   272: goto -18 -> 254
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	275	0	this	BehanceSDKGetUserProfileAsyncTask
    //   0	275	1	paramString1	String
    //   0	275	2	paramString2	String
    //   0	275	3	paramString3	String
    //   0	275	4	paramString4	String
    //   164	70	5	i	int
    //   16	35	6	localObject	Object
    //   7	108	7	localDefaultHttpClient	DefaultHttpClient
    // Exception table:
    //   from	to	target	type
    //   0	39	238	java/lang/Exception
    //   43	60	238	java/lang/Exception
    //   63	79	238	java/lang/Exception
    //   81	96	238	java/lang/Exception
    //   96	163	238	java/lang/Exception
    //   166	182	238	java/lang/Exception
    //   186	227	238	java/lang/Exception
    //   0	39	256	java/lang/Throwable
    //   43	60	256	java/lang/Throwable
    //   63	79	256	java/lang/Throwable
    //   81	96	256	java/lang/Throwable
    //   96	163	256	java/lang/Throwable
    //   166	182	256	java/lang/Throwable
    //   186	227	256	java/lang/Throwable
  }
  
  private BehanceSDKCountryDTO getCountryDTO(String paramString1, String paramString2)
  {
    BehanceSDKCountryDTO localBehanceSDKCountryDTO = new BehanceSDKCountryDTO();
    localBehanceSDKCountryDTO.setDisplayName(paramString1);
    try
    {
      Object localObject1 = new DefaultHttpClient();
      Object localObject2 = new HashMap();
      ((Map)localObject2).put("clientId", paramString2);
      paramString2 = EntityUtils.toString(((DefaultHttpClient)localObject1).execute(new HttpGet(BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/utilities/location?level=1&{key_client_id_param}={clientId}", (Map)localObject2))).getEntity());
      logger.debug("Get Countries response: %s", new Object[] { paramString2 });
      paramString2 = new JSONObject(paramString2);
      localObject1 = paramString2.keys();
      do
      {
        do
        {
          if (!((Iterator)localObject1).hasNext()) {
            break;
          }
          localObject2 = paramString2.optJSONObject((String)((Iterator)localObject1).next());
        } while (localObject2 == null);
        localObject2 = (JSONObject)localObject2;
      } while (!((JSONObject)localObject2).optString("n").equalsIgnoreCase(paramString1));
      localBehanceSDKCountryDTO.setId(((JSONObject)localObject2).optString("id"));
      return localBehanceSDKCountryDTO;
    }
    catch (IOException paramString1)
    {
      logger.error(paramString1);
      return null;
    }
    catch (JSONException paramString1)
    {
      for (;;)
      {
        logger.error(paramString1);
      }
    }
  }
  
  private String getProfileImage(JSONObject paramJSONObject)
  {
    try
    {
      if (paramJSONObject.has("276")) {
        return paramJSONObject.getString("276");
      }
      if (paramJSONObject.has("138")) {
        return paramJSONObject.getString("138");
      }
      if (paramJSONObject.has("129")) {
        return paramJSONObject.getString("129");
      }
      if (paramJSONObject.has("115")) {
        return paramJSONObject.getString("115");
      }
      if (paramJSONObject.has("78")) {
        return paramJSONObject.getString("78");
      }
      if (paramJSONObject.has("50")) {
        return paramJSONObject.getString("50");
      }
      if (paramJSONObject.has("32"))
      {
        paramJSONObject = paramJSONObject.getString("32");
        return paramJSONObject;
      }
    }
    catch (JSONException paramJSONObject)
    {
      logger.error(paramJSONObject);
    }
    return null;
  }
  
  private BehanceSDKStateDTO getStateDTO(String paramString1, String paramString2, String paramString3)
  {
    BehanceSDKStateDTO localBehanceSDKStateDTO = new BehanceSDKStateDTO();
    localBehanceSDKStateDTO.setDisplayName(paramString1);
    try
    {
      Object localObject = new DefaultHttpClient();
      HashMap localHashMap = new HashMap();
      localHashMap.put("countryId", paramString2);
      localHashMap.put("clientId", paramString3);
      paramString3 = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/utilities/location?level=2&country={countryId}&{key_client_id_param}={clientId}", localHashMap);
      logger.debug("Get States of Country URL - %s", new Object[] { paramString3 });
      paramString3 = EntityUtils.toString(((DefaultHttpClient)localObject).execute(new HttpGet(paramString3)).getEntity());
      logger.debug("Get States of Country [Country id - %s ] response: %s", new Object[] { paramString2, paramString3 });
      paramString2 = new JSONObject(paramString3);
      paramString3 = paramString2.keys();
      do
      {
        do
        {
          if (!paramString3.hasNext()) {
            break;
          }
          localObject = paramString2.optJSONObject((String)paramString3.next());
        } while (localObject == null);
        localObject = (JSONObject)localObject;
      } while (!((JSONObject)localObject).optString("n").equalsIgnoreCase(paramString1));
      localBehanceSDKStateDTO.setId(((JSONObject)localObject).optString("id"));
      return localBehanceSDKStateDTO;
    }
    catch (Exception paramString1)
    {
      logger.debug(paramString1);
      return null;
    }
    catch (Throwable paramString1)
    {
      for (;;)
      {
        logger.debug(paramString1);
      }
    }
  }
  
  protected BehanceSDKGetUserProfileTaskResult doInBackground(BehanceSDKGetUserProfileTaskParams... paramVarArgs)
  {
    BehanceSDKGetUserProfileTaskResult localBehanceSDKGetUserProfileTaskResult = new BehanceSDKGetUserProfileTaskResult();
    if (paramVarArgs.length != 1) {
      localBehanceSDKGetUserProfileTaskResult.setExceptionOccurred(true);
    }
    String str1;
    int i;
    for (;;)
    {
      return localBehanceSDKGetUserProfileTaskResult;
      getUserProfileTaskParams = paramVarArgs[0];
      str1 = String.valueOf(getUserProfileTaskParams.getUserId());
      try
      {
        Object localObject2 = new DefaultHttpClient();
        String str2 = getUserProfileTaskParams.getClientId();
        paramVarArgs = new HashMap();
        paramVarArgs.put("clientId", str2);
        paramVarArgs.put("user_id", str1);
        Object localObject1 = BehanceSDKUrlUtil.getUrlFromTemplate("{server_root_url}/v2/users/{user_id}?{key_client_id_param}={clientId}", paramVarArgs);
        Object localObject3 = BehanceSDKUserManager.getInstance().checkExpiryAndGetAccessToken();
        paramVarArgs = (BehanceSDKGetUserProfileTaskParams[])localObject1;
        if (localObject3 != null) {
          paramVarArgs = BehanceSDKUrlUtil.appendQueryStringParam((String)localObject1, "access_token", localObject3);
        }
        localObject1 = new HttpGet(paramVarArgs);
        logger.debug("Get user details URL: %s", new Object[] { paramVarArgs });
        paramVarArgs = EntityUtils.toString(((DefaultHttpClient)localObject2).execute((HttpUriRequest)localObject1).getEntity());
        logger.debug("Get user details response: %s", new Object[] { paramVarArgs });
        i = new JSONObject(paramVarArgs).getInt("http_code");
        if (i == 200)
        {
          localObject2 = new JSONObject(paramVarArgs).optJSONObject("user");
          if (localObject2 == null) {
            continue;
          }
          localObject3 = new BehanceSDKUserProfile();
          ((BehanceSDKUserProfile)localObject3).setFirstName(((JSONObject)localObject2).optString("first_name"));
          ((BehanceSDKUserProfile)localObject3).setLastName(((JSONObject)localObject2).optString("last_name"));
          ((BehanceSDKUserProfile)localObject3).setCompany(((JSONObject)localObject2).optString("company"));
          ((BehanceSDKUserProfile)localObject3).setOccupation(((JSONObject)localObject2).optString("occupation"));
          ((BehanceSDKUserProfile)localObject3).setWebsite(((JSONObject)localObject2).optString("website"));
          BehanceSDKCountryDTO localBehanceSDKCountryDTO = getCountryDTO(((JSONObject)localObject2).optString("country"), str2);
          ((BehanceSDKUserProfile)localObject3).setCountry(localBehanceSDKCountryDTO);
          localObject1 = null;
          paramVarArgs = (BehanceSDKGetUserProfileTaskParams[])localObject1;
          if (BehanceSDKCountryDTO.COUNTRY_CODES_FOR_LOAD_STATES.contains(localBehanceSDKCountryDTO.getId()))
          {
            BehanceSDKStateDTO localBehanceSDKStateDTO = getStateDTO(((JSONObject)localObject2).optString("state"), localBehanceSDKCountryDTO.getId(), str2);
            ((BehanceSDKUserProfile)localObject3).setState(localBehanceSDKStateDTO);
            paramVarArgs = (BehanceSDKGetUserProfileTaskParams[])localObject1;
            if (localBehanceSDKStateDTO != null) {
              paramVarArgs = localBehanceSDKStateDTO.getId();
            }
          }
          ((BehanceSDKUserProfile)localObject3).setCity(getCityDTO(((JSONObject)localObject2).optString("city"), localBehanceSDKCountryDTO.getId(), paramVarArgs, str2));
          ((BehanceSDKUserProfile)localObject3).setProfileImageUrl(getProfileImage(((JSONObject)localObject2).optJSONObject("images")));
          localBehanceSDKGetUserProfileTaskResult.setBehanceUserProfile((BehanceSDKUserProfile)localObject3);
          return localBehanceSDKGetUserProfileTaskResult;
        }
      }
      catch (Exception paramVarArgs)
      {
        logger.error(paramVarArgs, "Unknown problem fetching User details [User ID - %s]", new Object[] { str1 });
        localBehanceSDKGetUserProfileTaskResult.setExceptionOccurred(true);
        localBehanceSDKGetUserProfileTaskResult.setException(paramVarArgs);
        return localBehanceSDKGetUserProfileTaskResult;
        if (i == 404)
        {
          logger.error("HTTP Response code 404 when trying to fetch User details. [User ID - %s]", new Object[] { str1 });
          localBehanceSDKGetUserProfileTaskResult.setException(new Exception("User not found"));
          localBehanceSDKGetUserProfileTaskResult.setExceptionOccurred(true);
          return localBehanceSDKGetUserProfileTaskResult;
        }
      }
      catch (Throwable paramVarArgs)
      {
        logger.error(paramVarArgs, "Unknown problem fetching User details [User ID - %s]", new Object[] { str1 });
        localBehanceSDKGetUserProfileTaskResult.setException(new Exception(paramVarArgs.getMessage()));
        localBehanceSDKGetUserProfileTaskResult.setExceptionOccurred(true);
        return localBehanceSDKGetUserProfileTaskResult;
      }
    }
    logger.error("Unexpected HTTP Response code when trying to fetch User details. [User ID - %s] [Response code - %d]", new Object[] { str1, Integer.valueOf(i) });
    localBehanceSDKGetUserProfileTaskResult.setException(new Exception("Invalid server response code " + i));
    localBehanceSDKGetUserProfileTaskResult.setExceptionOccurred(true);
    return localBehanceSDKGetUserProfileTaskResult;
  }
  
  protected void onPostExecute(BehanceSDKGetUserProfileTaskResult paramBehanceSDKGetUserProfileTaskResult)
  {
    if (paramBehanceSDKGetUserProfileTaskResult.isExceptionOccurred())
    {
      listener.onGetUserProfileFailure(paramBehanceSDKGetUserProfileTaskResult.getException(), getUserProfileTaskParams);
      return;
    }
    listener.onGetUserProfileSuccess(paramBehanceSDKGetUserProfileTaskResult, getUserProfileTaskParams);
  }
}
