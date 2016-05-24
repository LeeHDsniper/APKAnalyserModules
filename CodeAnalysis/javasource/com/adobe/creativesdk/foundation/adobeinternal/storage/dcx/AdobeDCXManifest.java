package com.adobe.creativesdk.foundation.adobeinternal.storage.dcx;

import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageErrorUtils;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.TimeZone;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeDCXManifest
  implements Cloneable
{
  private static SimpleDateFormat staticDateFormatter;
  private JSONObject _absolutePaths;
  private LinkedHashMap<String, AdobeDCXManifestNode> _allChildren;
  private LinkedHashMap<String, AdobeDCXComponent> _allComponents;
  private JSONObject _dictionary;
  public boolean isDirty;
  
  static
  {
    if (!AdobeDCXManifest.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      staticDateFormatter = null;
      return;
    }
  }
  
  public AdobeDCXManifest(String paramString)
    throws AdobeDCXException
  {
    if (paramString == null) {
      throw AdobeStorageErrorUtils.createDCXError(AdobeDCXErrorCode.AdobeDCXErrorMissingManifest, "Missing Data");
    }
    Object localObject = null;
    Exception localException = null;
    try
    {
      paramString = new JSONObject(paramString);
      if (paramString == null) {
        throw AdobeStorageErrorUtils.createDCXError(AdobeDCXErrorCode.AdobeDCXErrorInvalidManifest, "Invalid JSON", localException);
      }
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        paramString = localObject;
      }
      recursiveRemoveEmptyArrays(paramString);
      init(paramString);
    }
  }
  
  private void buildHashes()
  {
    _allComponents = new LinkedHashMap();
    _allChildren = new LinkedHashMap();
    _absolutePaths = new JSONObject();
    recursiveBuildHashesFrom(_dictionary, "/");
  }
  
  private ArrayList<AdobeDCXManifestNode> createChildListFromArray(JSONArray paramJSONArray, String paramString)
  {
    ArrayList localArrayList = new ArrayList();
    if (paramJSONArray != null)
    {
      int i = 0;
      while (i < paramJSONArray.length())
      {
        localArrayList.add(AdobeDCXManifestNode.createManifestNodeFromDictionary(paramJSONArray.optJSONObject(i), this, paramString));
        i += 1;
      }
    }
    return localArrayList;
  }
  
  private ArrayList<AdobeDCXComponent> createComponentListFromArray(JSONArray paramJSONArray, String paramString)
  {
    ArrayList localArrayList = new ArrayList();
    if (paramJSONArray != null)
    {
      int i = 0;
      while (i < paramJSONArray.length())
      {
        localArrayList.add(AdobeDCXComponent.createComponentFromDictionary(paramJSONArray.optJSONObject(i), this, paramString));
        i += 1;
      }
    }
    return localArrayList;
  }
  
  private JSONObject findNodeById(String paramString)
  {
    return recursiveFindNodeById(paramString, _dictionary);
  }
  
  private void init(JSONObject paramJSONObject)
    throws AdobeDCXException
  {
    
    if (paramJSONObject == null) {
      throw AdobeStorageErrorUtils.createDCXError(AdobeDCXErrorCode.AdobeDCXErrorInvalidManifest, "dict is missing");
    }
    try
    {
      long l = paramJSONObject.optLong("manifest-format-version", 0L);
      if (l < 5L)
      {
        if (AdobeDCXManifestFormatConverter.updateManifestDictionary(paramJSONObject, l)) {}
      }
      else if (l > 5L) {
        paramJSONObject.putOpt("manifest-format-version", Long.valueOf(5L));
      }
      _dictionary = paramJSONObject;
      if (_dictionary.isNull("id")) {
        _dictionary.putOpt("id", AdobeStorageUtils.generateUuid());
      }
      verify();
      buildHashes();
      isDirty = false;
      return;
    }
    catch (JSONException paramJSONObject) {}
  }
  
  private static void initialize()
  {
    if (staticDateFormatter == null)
    {
      staticDateFormatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS", Locale.US);
      staticDateFormatter.setTimeZone(TimeZone.getTimeZone("GMT"));
    }
  }
  
  private String parentPathForDescendantsOf(AdobeDCXManifestNode paramAdobeDCXManifestNode)
  {
    if (paramAdobeDCXManifestNode == null) {
      return "/";
    }
    if (paramAdobeDCXManifestNode.getPath() == null) {
      return paramAdobeDCXManifestNode.getParentPath();
    }
    return paramAdobeDCXManifestNode.getAbsolutePath();
  }
  
  private void recursiveBuildHashesFrom(JSONObject paramJSONObject, String paramString)
  {
    Object localObject3 = paramJSONObject.optJSONArray("components");
    if (localObject3 != null)
    {
      i = 0;
      while (i < ((JSONArray)localObject3).length())
      {
        try
        {
          JSONObject localJSONObject = ((JSONArray)localObject3).getJSONObject(i);
          localObject2 = localJSONObject.optString("id", null);
          localObject1 = localObject2;
          if (localObject2 == null)
          {
            localObject1 = AdobeStorageUtils.generateUuid();
            localJSONObject.putOpt("id", localObject1);
          }
          localObject2 = AdobeDCXComponent.createComponentFromDictionary(localJSONObject, this, paramString);
          _allComponents.put(localObject1, localObject2);
          _absolutePaths.put(((AdobeDCXComponent)localObject2).getAbsolutePath().toLowerCase(), localObject2);
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            Object localObject2;
            Object localObject1;
            continue;
            i += 1;
          }
        }
        i += 1;
      }
    }
    localObject2 = paramJSONObject.optJSONArray("children");
    if (localObject2 != null)
    {
      i = 0;
      if (i < ((JSONArray)localObject2).length()) {
        try
        {
          localObject3 = ((JSONArray)localObject2).getJSONObject(i);
          localObject1 = ((JSONObject)localObject3).optString("id", null);
          paramJSONObject = (JSONObject)localObject1;
          if (localObject1 == null)
          {
            paramJSONObject = AdobeStorageUtils.generateUuid();
            ((JSONObject)localObject3).putOpt("id", paramJSONObject);
          }
          localObject1 = AdobeDCXManifestNode.createManifestNodeFromDictionary((JSONObject)localObject3, this, paramString);
          _allChildren.put(paramJSONObject, localObject1);
          if (((AdobeDCXManifestNode)localObject1).getPath() != null)
          {
            _absolutePaths.put(((AdobeDCXManifestNode)localObject1).getAbsolutePath().toLowerCase(), localObject1);
            recursiveBuildHashesFrom((JSONObject)localObject3, AdobeDCXUtils.stringByAppendingLastPathComponent(paramString, ((AdobeDCXManifestNode)localObject1).getPath()));
          }
          else
          {
            recursiveBuildHashesFrom((JSONObject)localObject3, paramString);
          }
        }
        catch (JSONException paramJSONObject) {}
      }
    }
  }
  
  private JSONObject recursiveFindNodeById(String paramString, JSONObject paramJSONObject)
  {
    if (paramJSONObject.optString("id").equals(paramString)) {
      return paramJSONObject;
    }
    paramJSONObject = paramJSONObject.optJSONArray("children");
    if (paramJSONObject != null)
    {
      int i = 0;
      while (i < paramJSONObject.length())
      {
        JSONObject localJSONObject = recursiveFindNodeById(paramString, paramJSONObject.optJSONObject(i));
        if (localJSONObject != null) {
          return localJSONObject;
        }
        i += 1;
      }
    }
    return null;
  }
  
  private long recursiveGetAbsoluteIndexOfNodeId(String paramString, JSONObject paramJSONObject, AdobeDCXIndexWrapper paramAdobeDCXIndexWrapper)
  {
    paramJSONObject = paramJSONObject.optJSONArray("children");
    if (paramJSONObject != null)
    {
      int i = 0;
      while (i < paramJSONObject.length())
      {
        JSONObject localJSONObject = paramJSONObject.optJSONObject(i);
        long l1;
        if (localJSONObject.optString("id").equals(paramString)) {
          l1 = index;
        }
        long l2;
        do
        {
          return l1;
          index += 1L;
          l2 = recursiveGetAbsoluteIndexOfNodeId(paramString, localJSONObject, paramAdobeDCXIndexWrapper);
          l1 = l2;
        } while (l2 != -1L);
        i += 1;
      }
    }
    return -1L;
  }
  
  private void recursiveRemoveEmptyArrays(JSONObject paramJSONObject)
  {
    removeArrayIfEmptyWithName("_links", paramJSONObject);
    removeArrayIfEmptyWithName("components", paramJSONObject);
    if (!removeArrayIfEmptyWithName("children", paramJSONObject))
    {
      paramJSONObject = paramJSONObject.optJSONArray("children");
      if (paramJSONObject != null)
      {
        int i = 0;
        while (i < paramJSONObject.length())
        {
          JSONObject localJSONObject = paramJSONObject.optJSONObject(i);
          if (localJSONObject != null) {
            recursiveRemoveEmptyArrays(localJSONObject);
          }
          i += 1;
        }
      }
    }
  }
  
  private boolean removeArrayIfEmptyWithName(String paramString, JSONObject paramJSONObject)
  {
    JSONArray localJSONArray = paramJSONObject.optJSONArray(paramString);
    if ((localJSONArray != null) && (localJSONArray.length() == 0))
    {
      paramJSONObject.remove(paramString);
      return true;
    }
    return false;
  }
  
  private void verify()
    throws AdobeDCXException
  {
    if (_dictionary.isNull("id")) {
      throw AdobeStorageErrorUtils.createDCXError(AdobeDCXErrorCode.AdobeDCXErrorInvalidManifest, "Manifest is missing an id");
    }
    if (_dictionary.isNull("name")) {
      throw AdobeStorageErrorUtils.createDCXError(AdobeDCXErrorCode.AdobeDCXErrorInvalidManifest, "Manifest is missing a name");
    }
    if (_dictionary.isNull("type")) {
      throw AdobeStorageErrorUtils.createDCXError(AdobeDCXErrorCode.AdobeDCXErrorInvalidManifest, "Manifest is missing a type");
    }
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    throw new CloneNotSupportedException("Yet to be implemented");
  }
  
  long getAbsoluteIndexOf(AdobeDCXManifestNode paramAdobeDCXManifestNode)
  {
    AdobeDCXIndexWrapper localAdobeDCXIndexWrapper = new AdobeDCXIndexWrapper();
    index = 0L;
    return recursiveGetAbsoluteIndexOfNodeId(paramAdobeDCXManifestNode.getNodeId(), _dictionary, localAdobeDCXIndexWrapper);
  }
  
  public final LinkedHashMap<String, AdobeDCXManifestNode> getAllChildren()
  {
    return _allChildren;
  }
  
  public ArrayList<AdobeDCXManifestNode> getChildrenOf(AdobeDCXManifestNode paramAdobeDCXManifestNode)
  {
    assert (paramAdobeDCXManifestNode != null) : "Node must not be null";
    JSONObject localJSONObject = findNodeById(paramAdobeDCXManifestNode.getNodeId());
    if (localJSONObject == null) {
      return null;
    }
    return createChildListFromArray(localJSONObject.optJSONArray("children"), parentPathForDescendantsOf(paramAdobeDCXManifestNode));
  }
  
  public ArrayList<AdobeDCXComponent> getComponents()
  {
    return createComponentListFromArray(_dictionary.optJSONArray("components"), parentPathForDescendantsOf(null));
  }
  
  public ArrayList<AdobeDCXComponent> getComponentsOfChild(AdobeDCXManifestNode paramAdobeDCXManifestNode)
  {
    assert (paramAdobeDCXManifestNode != null) : "Node must not be null";
    JSONObject localJSONObject = findNodeById(paramAdobeDCXManifestNode.getNodeId());
    if (localJSONObject == null) {
      return null;
    }
    return createComponentListFromArray(localJSONObject.optJSONArray("components"), parentPathForDescendantsOf(paramAdobeDCXManifestNode));
  }
  
  public String getCompositeId()
  {
    return _dictionary.optString("id", null);
  }
  
  public String getName()
  {
    return _dictionary.optString("name", null);
  }
}
