package com.adobe.creativesdk.aviary.internal.account;

import android.content.Context;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.internal.utils.ConnectionUtils;
import com.adobe.creativesdk.aviary.internal.utils.Objects;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.io.IOException;
import java.util.HashMap;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class AdobeAccountUtils
{
  static final LoggerFactory.Logger LOGGER = LoggerFactory.getLogger("AdobeAccountUtils");
  
  private static HashMap<String, String[]> encodeResultMap(String paramString1, String paramString2, String paramString3)
    throws JSONException
  {
    LOGGER.info("encodeResultMap: %s", new Object[] { paramString1 });
    if (!TextUtils.isEmpty(paramString1))
    {
      Object localObject = new JSONObject(paramString1);
      if (paramString2.equals(((JSONObject)localObject).getString("applicationId")))
      {
        paramString1 = ((JSONObject)localObject).getJSONObject("content");
        paramString2 = ((JSONObject)localObject).optString("adobeId");
        localObject = new HashMap();
        if (Objects.equal(paramString3, paramString2))
        {
          populateMap((HashMap)localObject, paramString1, "effect");
          populateMap((HashMap)localObject, paramString1, "frame");
          populateMap((HashMap)localObject, paramString1, "sticker");
          populateMap((HashMap)localObject, paramString1, "overlay");
          return localObject;
        }
        LOGGER.warn("userId doesn't match!");
        return localObject;
      }
    }
    return null;
  }
  
  private static String generateJsonRequest(String paramString1, String paramString2)
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("adobeId", paramString2);
    localJSONObject.put("applicationId", paramString1);
    localJSONObject.put("isProduction", true);
    localJSONObject.put("content", new JSONArray());
    return localJSONObject.toString();
  }
  
  private static void populateMap(HashMap<String, String[]> paramHashMap, JSONObject paramJSONObject, String paramString)
    throws JSONException
  {
    paramJSONObject = paramJSONObject.optJSONArray(paramString);
    if ((paramJSONObject == null) || (paramJSONObject.length() == 0))
    {
      paramHashMap.put(paramString, new String[0]);
      return;
    }
    String[] arrayOfString = new String[paramJSONObject.length()];
    int i = 0;
    while (i < paramJSONObject.length())
    {
      arrayOfString[i] = paramJSONObject.getString(i);
      i += 1;
    }
    paramHashMap.put(paramString, arrayOfString);
  }
  
  public static HashMap<String, String[]> queryPurchases(Context paramContext, String paramString1, String paramString2)
    throws IOException, JSONException
  {
    LOGGER.log("queryPurchases");
    if ((paramContext != null) && (!ConnectionUtils.isConnectedOrConnecting(paramContext, true))) {
      throw new IOException("Not Connected to internet");
    }
    Object localObject2 = generateJsonRequest(paramString1, paramString2);
    Object localObject1 = new DefaultHttpClient();
    paramContext = new HttpPost("http://receipts.aviary.com/v2/content");
    localObject2 = new StringEntity((String)localObject2);
    paramContext.setHeader("Accept", "application/json");
    paramContext.setHeader("Content-Type", "application/json");
    paramContext.setEntity((HttpEntity)localObject2);
    try
    {
      localObject1 = ((HttpClient)localObject1).execute(paramContext);
      int i = ((HttpResponse)localObject1).getStatusLine().getStatusCode();
      localObject1 = EntityUtils.toString(((HttpResponse)localObject1).getEntity());
      LOGGER.verbose("code: %d", new Object[] { Integer.valueOf(i) });
      if (i == 200) {
        return encodeResultMap((String)localObject1, paramString1, paramString2);
      }
      throw new IOException("Invalid response. Response code is " + i);
    }
    catch (IOException paramString1)
    {
      paramString1.printStackTrace();
      paramContext.abort();
      throw paramString1;
    }
  }
}
