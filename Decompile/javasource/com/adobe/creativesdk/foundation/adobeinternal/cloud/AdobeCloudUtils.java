package com.adobe.creativesdk.foundation.adobeinternal.cloud;

import com.adobe.creativesdk.foundation.adobeinternal.auth.AdobeUXAuthManagerRestricted;
import com.adobe.creativesdk.foundation.adobeinternal.entitlement.AdobeEntitlementErrorCode;
import com.adobe.creativesdk.foundation.adobeinternal.entitlement.AdobeEntitlementException;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;

public class AdobeCloudUtils
{
  public static boolean areValuesEqual(ArrayList<AdobeCloud> paramArrayList1, ArrayList<AdobeCloud> paramArrayList2)
  {
    if (paramArrayList1.size() == paramArrayList2.size()) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      boolean bool2 = bool1;
      if (bool1)
      {
        paramArrayList1 = paramArrayList1.iterator();
        AdobeCloud localAdobeCloud;
        int i;
        do
        {
          bool2 = bool1;
          if (!paramArrayList1.hasNext()) {
            break;
          }
          localAdobeCloud = (AdobeCloud)paramArrayList1.next();
          if (!paramArrayList2.contains(localAdobeCloud)) {
            break label98;
          }
          i = paramArrayList2.indexOf(localAdobeCloud);
          if (i == -1) {
            break label96;
          }
        } while (((AdobeCloud)paramArrayList2.get(i)).isStrictlyEqual(localAdobeCloud));
        bool2 = false;
      }
      return bool2;
    }
    label96:
    return false;
    label98:
    return false;
  }
  
  public static boolean getCloudsFromUserProfile(JSONObject paramJSONObject, ArrayList<AdobeCloud> paramArrayList)
    throws AdobeCSDKException
  {
    boolean bool = paramJSONObject.optBoolean("public_cloud", true);
    if (AdobeUXAuthManagerRestricted.getSharedAuthManagerRestricted().isAdobeApplication()) {
      if ((paramJSONObject != null) && (paramJSONObject.opt("endpoints") != null))
      {
        paramJSONObject = paramJSONObject.optJSONArray("endpoints");
        int i = 0;
        if (i < paramJSONObject.length())
        {
          Object localObject = paramJSONObject.optJSONObject(i);
          AdobeCloud localAdobeCloud1 = new AdobeCloud();
          if ((localObject != null) && (localAdobeCloud1.updateFromDictionary((JSONObject)localObject)))
          {
            int j = 1;
            if (!localAdobeCloud1.isPrivateCloud()) {
              j = bool;
            }
            if ((j == 0) || (paramArrayList.contains(localAdobeCloud1))) {
              break label119;
            }
            paramArrayList.add(localAdobeCloud1);
          }
          for (;;)
          {
            i += 1;
            break;
            label119:
            localObject = new ArrayList(paramArrayList);
            Iterator localIterator = paramArrayList.iterator();
            while (localIterator.hasNext())
            {
              AdobeCloud localAdobeCloud2 = (AdobeCloud)localIterator.next();
              if (!localAdobeCloud2.isStrictlyEqual(localAdobeCloud1))
              {
                ((ArrayList)localObject).remove(localAdobeCloud2);
                ((ArrayList)localObject).add(localAdobeCloud1);
              }
            }
            paramArrayList.clear();
            paramArrayList.addAll((Collection)localObject);
          }
        }
      }
      else
      {
        if ((paramJSONObject != null) && (paramJSONObject.opt("endpoints") == null)) {
          throw new AdobeEntitlementException(AdobeEntitlementErrorCode.AdobeEntitlementErrorNoCloudsAvailable, "No clouds are available for this user.");
        }
        throw new AdobeEntitlementException(AdobeEntitlementErrorCode.AdobeEntitlementErrorUnexpectedResponse, "Query for clouds returned an unexpected response.");
      }
    }
    return true;
  }
  
  public static boolean isCloudValid(AdobeCloud paramAdobeCloud)
  {
    paramAdobeCloud = paramAdobeCloud.getEndpoints();
    if ((paramAdobeCloud == null) || (paramAdobeCloud.size() == 0)) {}
    do
    {
      return false;
      paramAdobeCloud = (AdobeCloudEndpoint)paramAdobeCloud.get(AdobeCloudServiceType.AdobeCloudServiceTypeStorage);
    } while ((paramAdobeCloud == null) || (paramAdobeCloud.getServiceURLs().size() == 0) || (paramAdobeCloud.getServiceURLs().size() == 0));
    return true;
  }
}
