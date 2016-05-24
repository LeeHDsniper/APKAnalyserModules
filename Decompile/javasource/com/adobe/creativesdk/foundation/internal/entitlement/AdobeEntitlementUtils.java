package com.adobe.creativesdk.foundation.internal.entitlement;

import com.adobe.creativesdk.foundation.adobeinternal.entitlement.AdobeEntitlementErrorCode;
import com.adobe.creativesdk.foundation.adobeinternal.entitlement.AdobeEntitlementException;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIMSEnvironment;
import com.adobe.creativesdk.foundation.internal.auth.AdobeAuthIdentityManagementService;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeEntitlementUtils
{
  public static JSONObject JSONObjectWithData(String paramString)
    throws AdobeEntitlementException
  {
    if (paramString == null) {
      throw new AdobeEntitlementException(AdobeEntitlementErrorCode.AdobeEntitlementErrorMissingJSONData);
    }
    try
    {
      Matcher localMatcher = Pattern.compile("while \\(1\\) \\{\\}").matcher(paramString);
      if (localMatcher.find()) {
        paramString = localMatcher.replaceAll("").trim();
      }
      paramString = new JSONObject(paramString);
      return paramString;
    }
    catch (JSONException paramString)
    {
      throw new AdobeEntitlementException(AdobeEntitlementErrorCode.AdobeEntitlementErrorUnexpectedResponse, "Parsed collection data is not of type dictionary.", paramString);
    }
  }
  
  public static boolean areValuesEqual(JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    int i = 0;
    int j = 0;
    Iterator localIterator1 = paramJSONObject1.keys();
    while (localIterator1.hasNext())
    {
      localIterator1.next();
      i += 1;
    }
    localIterator1 = paramJSONObject2.keys();
    while (localIterator1.hasNext())
    {
      localIterator1.next();
      j += 1;
    }
    boolean bool1;
    boolean bool3;
    boolean bool2;
    label93:
    Object localObject;
    JSONObject localJSONObject;
    label160:
    String str;
    if (i == j)
    {
      bool1 = true;
      bool3 = bool1;
      if (bool1)
      {
        localIterator1 = paramJSONObject1.keys();
        bool2 = bool1;
        bool3 = bool2;
        if (localIterator1.hasNext())
        {
          localObject = (String)localIterator1.next();
          localJSONObject = paramJSONObject1.optJSONObject((String)localObject);
          localObject = paramJSONObject2.optJSONObject((String)localObject);
          bool1 = bool2;
          if (localJSONObject != null)
          {
            bool1 = bool2;
            if (localObject != null)
            {
              Iterator localIterator2 = localJSONObject.keys();
              do
              {
                bool1 = bool2;
                if (!localIterator2.hasNext()) {
                  break;
                }
                str = (String)localIterator2.next();
                if (!localJSONObject.opt(str).getClass().equals(String.class)) {
                  break label249;
                }
              } while (localJSONObject.optString(str).equals(((JSONObject)localObject).optString(str)));
              bool1 = false;
            }
          }
        }
      }
    }
    for (;;)
    {
      bool2 = bool1;
      if (bool1) {
        break label93;
      }
      bool3 = bool1;
      return bool3;
      bool1 = false;
      break;
      label249:
      if (localJSONObject.opt(str).getClass().equals(JSONObject.class))
      {
        if (areValuesEqual(localJSONObject.optJSONObject(str), ((JSONObject)localObject).optJSONObject(str))) {
          break label160;
        }
        bool1 = false;
        continue;
      }
      if (localJSONObject.optBoolean(str) == ((JSONObject)localObject).optBoolean(str)) {
        break label160;
      }
      bool1 = false;
    }
  }
  
  public static JSONObject fallbackEndpointsData()
  {
    JSONObject localJSONObject1 = null;
    AdobeAuthIMSEnvironment localAdobeAuthIMSEnvironment = AdobeAuthIdentityManagementService.getSharedInstance().getEnvironment();
    if (localAdobeAuthIMSEnvironment == AdobeAuthIMSEnvironment.AdobeAuthIMSEnvironmentTestUS) {}
    do
    {
      try
      {
        localJSONObject1 = new JSONObject("{\nendpoints:\n\t[\n\t{\"features\" : {\"photos\" : {\"service\" : {\"uri\" : \"https://api.oznext.com\"}}},\n\t\t\"id\" : \"00000000-0000-0000-0000-000000000000\",\n\t\t\"name\" : \"Adobe Creative Cloud [QA1]\",\n\t\t\"private\" : NO,\n\t\t\"status\" : \"ONLINE\"}\n\t]\n};");
        return localJSONObject1;
      }
      catch (JSONException localJSONException1)
      {
        localJSONException1.printStackTrace();
        return null;
      }
      if (localAdobeAuthIMSEnvironment == AdobeAuthIMSEnvironment.AdobeAuthIMSEnvironmentStageUS) {
        try
        {
          JSONObject localJSONObject2 = new JSONObject("{\nendpoints:\n\t[\n\t{\"features\" : {\n\t\t\"files\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage-stage.adobe.io\"},\"archive\" :{ \"uri\" : \"https://cc-api-storage-stage.adobe.io\"}},\n\t\t\"assets\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage-stage.adobe.io\"}},\n\t\t\"libraries\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage-stage.adobe.io\"}},\n\t\t\"imageservices\" : {\"service\" : {\"uri\" : \"https://cc-api-image-stage.adobe.io\"}},\n\t\t\"clipboard\" : {\"service\" : {\"uri\" : \"https://cc-api-storage-stage.adobe.io\"}}\n\t},\n\t\t\"id\" : \"00000000-0000-0000-0000-000000000000\",\n\t\t\"name\" : \"Adobe Creative Cloud [Stage] (static)\",\n\t\t\"private\" : NO,\n\t\t\"status\" : \"ONLINE\"},\n\t]\n};");
          return localJSONObject2;
        }
        catch (JSONException localJSONException2)
        {
          localJSONException2.printStackTrace();
          return null;
        }
      }
    } while (localAdobeAuthIMSEnvironment != AdobeAuthIMSEnvironment.AdobeAuthIMSEnvironmentProductionUS);
    try
    {
      JSONObject localJSONObject3 = new JSONObject("{\nendpoints:\n\t[\n\t{\"features\" : {\n\t\t\"files\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage.adobe.io\"}, \"archive\" :{ \"uri\" : \"https://cc-api-storage.adobe.io\"} },\n\t\t\"assets\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage.adobe.io\"}},\n\t\t\"libraries\" : {\"storage\" : {\"uri\" : \"https://cc-api-storage.adobe.io\"}},\n\t\t\"imageservices\" : {\"service\" : {\"uri\" : \"https://cc-api-image.adobe.io\"}},\n\t\t\"clipboard\" : {\"service\" : {\"uri\" : \"https://cc-api-storage.adobe.io\"}}\n\t},\n\t\t\"id\" : \"00000000-0000-0000-0000-000000000000\",\n\t\t\"name\" : \"Adobe Creative Cloud\",\n\t\t\"private\" : NO,\n\t\t\"status\" : \"ONLINE\"},\n\t]\n};");
      return localJSONObject3;
    }
    catch (JSONException localJSONException3)
    {
      localJSONException3.printStackTrace();
    }
    return null;
  }
  
  public static JSONObject fallbackServicesData()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("endpoints", fallbackEndpointsData().optJSONArray("endpoints"));
      localJSONObject.put("services", new JSONObject("\t\t\t{\nBehance: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nccv: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\ncollaboration: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\ncolor: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\ndesign_assets: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nedge_inspect: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nextract: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nfile_sync: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nimage: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nlibraries: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nlightroom: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nphonegap_build: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\npreview: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nstorage: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nstory: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nsync_metadata: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\nsync_settings: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            },\ntypekit: {\n                \"allow_private_endpoint\": YES,\nentitled: YES\n            }\n        }"));
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
    return localJSONObject;
  }
  
  public static JSONObject getServicesForUserProfile(JSONObject paramJSONObject)
    throws AdobeEntitlementException
  {
    if ((paramJSONObject != null) && (paramJSONObject.opt("services") != null)) {
      return paramJSONObject.optJSONObject("services");
    }
    if ((paramJSONObject != null) && (paramJSONObject.opt("services") == null)) {
      throw new AdobeEntitlementException(AdobeEntitlementErrorCode.AdobeEntitlementErrorNoServicesAvailable, "No Public Services are available for this user.");
    }
    throw new AdobeEntitlementException(AdobeEntitlementErrorCode.AdobeEntitlementErrorUnexpectedResponse, "Query for Public Services returned an unexpected response.");
  }
}
