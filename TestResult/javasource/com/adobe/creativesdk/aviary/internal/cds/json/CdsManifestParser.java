package com.adobe.creativesdk.aviary.internal.cds.json;

import com.adobe.creativesdk.aviary.internal.utils.StringUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CdsManifestParser
  extends CdsJsonParser
{
  private String assetsBaseURL;
  final HashMap<String, List<ManifestPackItem>> deletedPacks = new HashMap();
  final HashMap<String, List<ManifestPackItem>> enabledMessages = new HashMap();
  final HashMap<String, Boolean> enabledMessagesNames = new HashMap();
  final HashMap<String, List<ManifestPackItem>> enabledPacks = new HashMap();
  final HashMap<String, Boolean> enabledPacksNames = new HashMap();
  private String formatListId;
  private boolean mHasContent;
  final List<String> permissions = new ArrayList();
  private String versionKey;
  
  public CdsManifestParser() {}
  
  private void parsePackArray(JSONArray paramJSONArray, List<ManifestPackItem> paramList, HashMap<String, Boolean> paramHashMap, boolean paramBoolean)
    throws JSONException
  {
    if (paramJSONArray != null)
    {
      int i = 0;
      while (i < paramJSONArray.length())
      {
        ManifestPackItem localManifestPackItem = new ManifestPackItem(paramJSONArray.getJSONObject(i), paramBoolean);
        paramList.add(localManifestPackItem);
        if (paramHashMap != null) {
          paramHashMap.put(localManifestPackItem.getIdentifier(), Boolean.valueOf(true));
        }
        i += 1;
      }
    }
  }
  
  private void parsePackArray(JSONObject paramJSONObject, String paramString, List<ManifestPackItem> paramList, HashMap<String, Boolean> paramHashMap, boolean paramBoolean)
    throws JSONException
  {
    parsePackArray(paramJSONObject.getJSONArray(paramString), paramList, paramHashMap, paramBoolean);
  }
  
  public boolean containsEnabledPack(String paramString)
  {
    return enabledPacksNames.containsKey(paramString);
  }
  
  public boolean containsMessage(String paramString)
  {
    return enabledMessagesNames.containsKey(paramString);
  }
  
  public String getAssetsBaseURL()
  {
    return assetsBaseURL;
  }
  
  public List<ManifestPackItem> getDeletedPacks()
  {
    ArrayList localArrayList = new ArrayList();
    List localList = getDeletedPacks("effects");
    if (localList != null) {
      localArrayList.addAll(localList);
    }
    localList = getDeletedPacks("frames");
    if (localList != null) {
      localArrayList.addAll(localList);
    }
    localList = getDeletedPacks("stickers");
    if (localList != null) {
      localArrayList.addAll(localList);
    }
    localList = getDeletedPacks("overlays");
    if (localList != null) {
      localArrayList.addAll(localList);
    }
    return localArrayList;
  }
  
  public List<ManifestPackItem> getDeletedPacks(String paramString)
  {
    return (List)deletedPacks.get(paramString);
  }
  
  public HashMap<String, List<ManifestPackItem>> getEnabledPacks()
  {
    return enabledPacks;
  }
  
  public String getFormatListId()
  {
    return formatListId;
  }
  
  public HashMap<String, List<ManifestPackItem>> getMessages()
  {
    return enabledMessages;
  }
  
  public List<String> getPermissions()
  {
    Collections.sort(permissions);
    return permissions;
  }
  
  public String getPermissionsKey()
  {
    return StringUtils.hashCode(permissions);
  }
  
  public String getVersionKey()
  {
    return versionKey;
  }
  
  public boolean hasContent()
  {
    return mHasContent;
  }
  
  public boolean hasDeletedPacks()
  {
    return deletedPacks.size() > 0;
  }
  
  public boolean hasEnabledPacks()
  {
    return enabledPacks.size() > 0;
  }
  
  public boolean hasMessages()
  {
    return enabledMessages.size() > 0;
  }
  
  protected void onParseJson(JSONObject paramJSONObject)
    throws JSONException
  {
    assetsBaseURL = paramJSONObject.getString("assetsBaseURL");
    versionKey = paramJSONObject.getString("versionKey");
    formatListId = paramJSONObject.getString("formatListId");
    JSONObject localJSONObject1 = paramJSONObject.optJSONObject("packs");
    if (localJSONObject1 != null) {}
    for (boolean bool = true;; bool = false)
    {
      mHasContent = bool;
      if (localJSONObject1 != null)
      {
        JSONObject localJSONObject2 = localJSONObject1.optJSONObject("effects");
        if (localJSONObject2 != null) {
          onParsePackEntry(localJSONObject2, "effects");
        }
        localJSONObject2 = localJSONObject1.optJSONObject("frames");
        if (localJSONObject2 != null) {
          onParsePackEntry(localJSONObject2, "frames");
        }
        localJSONObject2 = localJSONObject1.optJSONObject("stickers");
        if (localJSONObject2 != null) {
          onParsePackEntry(localJSONObject2, "stickers");
        }
        localJSONObject1 = localJSONObject1.optJSONObject("overlays");
        if (localJSONObject1 != null) {
          onParsePackEntry(localJSONObject1, "overlays");
        }
      }
      localJSONObject1 = paramJSONObject.optJSONObject("messages");
      if (localJSONObject1 != null) {
        onParseMessageEntry(localJSONObject1.getJSONObject("launch"), "launch");
      }
      paramJSONObject = paramJSONObject.optJSONArray("permissions");
      if (paramJSONObject != null) {
        onParsePermissions(paramJSONObject);
      }
      return;
    }
  }
  
  protected void onParseMessageEntry(JSONObject paramJSONObject, String paramString)
    throws JSONException
  {
    ArrayList localArrayList = new ArrayList();
    parsePackArray(paramJSONObject, "enabled", localArrayList, enabledMessagesNames, true);
    if (localArrayList.size() > 0) {
      enabledMessages.put(paramString, localArrayList);
    }
  }
  
  protected void onParsePackEntry(JSONObject paramJSONObject, String paramString)
    throws JSONException
  {
    ArrayList localArrayList = new ArrayList();
    parsePackArray(paramJSONObject, "enabled", localArrayList, enabledPacksNames, true);
    if (localArrayList.size() > 0) {
      enabledPacks.put(paramString, localArrayList);
    }
    localArrayList = new ArrayList();
    parsePackArray(paramJSONObject, "deleted", localArrayList, null, false);
    if (localArrayList.size() > 0) {
      deletedPacks.put(paramString, localArrayList);
    }
  }
  
  protected void onParsePermissions(JSONArray paramJSONArray)
  {
    int i = 0;
    for (;;)
    {
      if (i < paramJSONArray.length()) {
        try
        {
          permissions.add(paramJSONArray.getString(i));
          i += 1;
        }
        catch (JSONException localJSONException)
        {
          for (;;)
          {
            localJSONException.printStackTrace();
          }
        }
      }
    }
  }
  
  public static class ManifestPackItem
  {
    final String identifier;
    final String versionKey;
    
    public ManifestPackItem(JSONObject paramJSONObject, boolean paramBoolean)
      throws JSONException
    {
      identifier = paramJSONObject.getString("identifier");
      if (paramBoolean)
      {
        versionKey = paramJSONObject.getString("versionKey");
        return;
      }
      versionKey = paramJSONObject.optString("versionKey");
    }
    
    public String getIdentifier()
    {
      return identifier;
    }
    
    public String getVersionKey()
    {
      return versionKey;
    }
    
    public String toString()
    {
      return "ManifestPackItem{ identifier: " + identifier + ", versionKey: " + versionKey + "}";
    }
  }
}
