package com.adobe.creativesdk.foundation.internal.storage.model.resources;

import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageErrorUtils;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageLastPathComponentUtil;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import com.adobe.creativesdk.foundation.internal.storage.model.util.ParsingDataException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetErrorCode;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

public class AdobeStorageResourceCollection
  extends AdobeStorageResource
{
  private ArrayList<AdobeStorageResource> children;
  String filterByType;
  private int limit;
  private String nextStartIndex;
  private AdobeStorageOrderRelation order;
  private AdobeStorageOrderByProperty orderBy;
  private String percentEncodedQuery;
  private String startIndex;
  private int total_children;
  
  public AdobeStorageResourceCollection()
  {
    type = "application/vnd.adobe.directory+json";
    isCollection = true;
  }
  
  public static AdobeStorageResourceCollection collectionFromHref(URI paramURI)
  {
    if (paramURI == null) {
      return null;
    }
    AdobeStorageResourceCollection localAdobeStorageResourceCollection = new AdobeStorageResourceCollection();
    String str = AdobeStorageLastPathComponentUtil.getLastPathComponent(paramURI.getPath());
    href = paramURI;
    name = str;
    return localAdobeStorageResourceCollection;
  }
  
  private static String mapToQueryString(HashMap<String, String> paramHashMap)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = paramHashMap.entrySet().iterator();
    if (localIterator.hasNext())
    {
      Object localObject = (Map.Entry)localIterator.next();
      if (localStringBuilder.length() > 0) {
        localStringBuilder.append("&");
      }
      paramHashMap = (String)((Map.Entry)localObject).getKey();
      localObject = (String)((Map.Entry)localObject).getValue();
      if (paramHashMap != null) {}
      for (;;)
      {
        try
        {
          paramHashMap = URLEncoder.encode(paramHashMap, "UTF-8");
          localStringBuilder.append(paramHashMap);
          localStringBuilder.append("=");
          if (localObject == null) {
            break label133;
          }
          paramHashMap = URLEncoder.encode((String)localObject, "UTF-8");
          localStringBuilder.append(paramHashMap);
        }
        catch (UnsupportedEncodingException paramHashMap)
        {
          throw new RuntimeException("Problem encoding the collection params into query string", paramHashMap);
        }
        paramHashMap = "";
        continue;
        label133:
        paramHashMap = "";
      }
    }
    return localStringBuilder.toString();
  }
  
  public ArrayList<AdobeStorageResource> getChildren()
  {
    return children;
  }
  
  public String getNextStartIndex()
  {
    return nextStartIndex;
  }
  
  public int getNumChildren()
  {
    return total_children;
  }
  
  public AdobeStorageOrderRelation getOrder()
  {
    return order;
  }
  
  public AdobeStorageOrderByProperty getOrderBy()
  {
    return orderBy;
  }
  
  public String getPercentEncodedQuery()
  {
    HashMap localHashMap;
    Object localObject1;
    if (percentEncodedQuery == null)
    {
      localHashMap = new HashMap();
      if (startIndex != null) {
        localHashMap.put("start", startIndex);
      }
      if (limit > 0) {
        localHashMap.put("limit", Integer.toString(limit));
      }
      if (order != AdobeStorageOrderRelation.ADOBE_STORAGE_ORDER_DESCENDING) {
        break label165;
      }
      localHashMap.put("order", "desc");
      Object localObject2 = null;
      localObject1 = localObject2;
      if (orderBy != null) {}
      switch (1.$SwitchMap$com$adobe$creativesdk$foundation$internal$storage$model$resources$AdobeStorageOrderByProperty[orderBy.ordinal()])
      {
      default: 
        localObject1 = localObject2;
        label122:
        if (localObject1 != null) {
          localHashMap.put("orderby", localObject1);
        }
        break;
      }
    }
    for (;;)
    {
      if (filterByType != null) {
        localHashMap.put("type", filterByType);
      }
      percentEncodedQuery = mapToQueryString(localHashMap);
      return percentEncodedQuery;
      label165:
      localHashMap.put("order", "asc");
      break;
      localObject1 = "name";
      break label122;
      localObject1 = "modified";
      break label122;
      localObject1 = "ordinal";
      break label122;
      localHashMap.put("orderby", "name");
    }
  }
  
  public boolean isComplete()
  {
    return nextStartIndex == null;
  }
  
  public void resetPageIndex()
  {
    startIndex = null;
    nextStartIndex = null;
    percentEncodedQuery = null;
  }
  
  public void setLimit(int paramInt)
  {
    if (paramInt != limit)
    {
      limit = paramInt;
      percentEncodedQuery = null;
    }
  }
  
  public void setNextStartIndex(String paramString)
  {
    nextStartIndex = paramString;
  }
  
  public void setOrder(AdobeStorageOrderRelation paramAdobeStorageOrderRelation)
  {
    if (paramAdobeStorageOrderRelation != order)
    {
      order = paramAdobeStorageOrderRelation;
      resetPageIndex();
    }
  }
  
  public void setOrderBy(AdobeStorageOrderByProperty paramAdobeStorageOrderByProperty)
  {
    if (paramAdobeStorageOrderByProperty != orderBy)
    {
      orderBy = paramAdobeStorageOrderByProperty;
      resetPageIndex();
    }
  }
  
  public void setStartIndex(String paramString)
  {
    if (paramString != startIndex)
    {
      startIndex = paramString;
      percentEncodedQuery = null;
    }
  }
  
  public void updateFromData(String paramString, boolean paramBoolean)
    throws ParsingDataException
  {
    paramString = AdobeStorageUtils.JSONObjectWithData(paramString);
    if (paramString != null)
    {
      updateFromDictionary(paramString, paramBoolean);
      return;
    }
    throw new ParsingDataException(AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorUnexpectedResponse, "Parsed collection data is not of type dictionary."));
  }
  
  void updateFromDictionary(JSONObject paramJSONObject, boolean paramBoolean)
    throws ParsingDataException
  {
    internalID = paramJSONObject.optString("id");
    name = paramJSONObject.optString("name");
    etag = paramJSONObject.optString("etag");
    modified = paramJSONObject.optString("modified");
    ordinal = paramJSONObject.optInt("ordinal");
    type = paramJSONObject.optString("type");
    int i;
    if (paramJSONObject.has("total_children")) {
      i = paramJSONObject.optInt("total_children");
    }
    for (;;)
    {
      total_children = i;
      if (name != null) {
        break;
      }
      throw new ParsingDataException(AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorUnexpectedResponse, "Collection doesn't have a name."));
      if (paramJSONObject.optJSONArray("children") != null) {
        i = paramJSONObject.optJSONArray("children").length();
      } else {
        i = 0;
      }
    }
    if (etag == null) {
      throw new ParsingDataException(AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorUnexpectedResponse, "Collection doesn't have an etag."));
    }
    if (modified == null) {
      throw new ParsingDataException(AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorUnexpectedResponse, "Collection doesn't have a modified time."));
    }
    Object localObject1 = paramJSONObject.optString("collaboration");
    if (localObject1 == null) {
      collaboration = AdobeCollaborationType.ADOBE_COLLABORATION_TYPE_PRIVATE;
    }
    for (;;)
    {
      paramJSONObject = paramJSONObject.optJSONArray("children");
      if (0 != 0) {
        break label500;
      }
      if (paramJSONObject == null) {
        break label494;
      }
      localObject1 = new ArrayList();
      i = 0;
      label234:
      if (i < paramJSONObject.length()) {
        try
        {
          JSONObject localJSONObject = paramJSONObject.optJSONObject(i);
          Object localObject2 = AdobeStorageResourceItem.escapeAssetName(localJSONObject.optString("name"));
          localObject2 = new URI(href.getRawPath().concat((String)localObject2));
          if (localJSONObject.optString("type").equals("application/vnd.adobe.directory+json"))
          {
            localObject2 = collectionFromHref(new URI(((URI)localObject2).getRawPath().concat("/")));
            ((AdobeStorageResourceCollection)localObject2).setCloud(getCloud());
            ((AdobeStorageResourceCollection)localObject2).updateFromDictionary(localJSONObject, false);
            ((ArrayList)localObject1).add(localObject2);
          }
          for (;;)
          {
            i += 1;
            break label234;
            if (((String)localObject1).toLowerCase().equals("outgoing"))
            {
              collaboration = AdobeCollaborationType.ADOBE_COLLABORATION_TYPE_SHAREDBYUSER;
              break;
            }
            if (!((String)localObject1).toLowerCase().equals("incoming")) {
              break;
            }
            collaboration = AdobeCollaborationType.ADOBE_COLLABORATION_TYPE_SHAREDWITHUSER;
            break;
            localObject2 = AdobeStorageResourceItem.resourceFromHref((URI)localObject2);
            ((AdobeStorageResourceItem)localObject2).setCloud(getCloud());
            ((AdobeStorageResourceItem)localObject2).updateFromCollectionDictionary(localJSONObject);
            ((ArrayList)localObject1).add(localObject2);
          }
        }
        catch (URISyntaxException localURISyntaxException)
        {
          for (;;)
          {
            localURISyntaxException.printStackTrace();
          }
        }
      }
    }
    if ((paramBoolean) && (children != null)) {
      i = 0;
    }
    while (i < ((ArrayList)localObject1).size())
    {
      children.add(((ArrayList)localObject1).get(i));
      i += 1;
      continue;
      children = ((ArrayList)localObject1);
    }
    return;
    label494:
    children = null;
    return;
    label500:
    children = null;
  }
}
