package com.adobe.creativesdk.aviary.internal.cds.json;

import android.util.Log;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CdsContentParser
  extends CdsJsonParser
{
  String author;
  String authorHyperlink;
  String contentURL;
  String contentVersion;
  String detailImageURL;
  String detailImageVersion;
  String displayDescription;
  String displayName;
  String featureImageURL;
  String featureImageVersion;
  boolean free;
  boolean freeWithLogin;
  String iconURL;
  String iconVersion;
  String identifier;
  List<ContentItem> mItems;
  String packType;
  String previewURL;
  String previewVersion;
  String shopBackgroundColor;
  String socialMediaString;
  String versionKey;
  
  public CdsContentParser() {}
  
  public String getAuthor()
  {
    return author;
  }
  
  public String getAuthorHyperlink()
  {
    return authorHyperlink;
  }
  
  public String getContentURL()
  {
    return contentURL;
  }
  
  public String getContentVersion()
  {
    return contentVersion;
  }
  
  public String getDetailImageURL()
  {
    return detailImageURL;
  }
  
  public String getDetailImageVersion()
  {
    return detailImageVersion;
  }
  
  public String getDisplayDescription()
  {
    return displayDescription;
  }
  
  public String getDisplayName()
  {
    return displayName;
  }
  
  public String getFeatureImageURL()
  {
    return featureImageURL;
  }
  
  public String getFeatureImageVersion()
  {
    return featureImageVersion;
  }
  
  public String getIconURL()
  {
    return iconURL;
  }
  
  public String getIconVersion()
  {
    return iconVersion;
  }
  
  public String getIdentifier()
  {
    return identifier;
  }
  
  public List<ContentItem> getItems()
  {
    return mItems;
  }
  
  public String getPackType()
  {
    return packType;
  }
  
  public String getPreviewURL()
  {
    return previewURL;
  }
  
  public String getPreviewVersion()
  {
    return previewVersion;
  }
  
  public String getShopBackgroundColor()
  {
    return shopBackgroundColor;
  }
  
  public String getSocialMediaString()
  {
    return socialMediaString;
  }
  
  public String getVersionKey()
  {
    return versionKey;
  }
  
  public boolean isFree()
  {
    return free;
  }
  
  public boolean isFreeWithLogin()
  {
    return freeWithLogin;
  }
  
  protected void onParseJson(JSONObject paramJSONObject)
    throws JSONException
  {
    mItems = new ArrayList();
    identifier = paramJSONObject.getString("identifier");
    versionKey = paramJSONObject.getString("versionKey");
    packType = paramJSONObject.getString("packType");
    displayName = paramJSONObject.getString("displayName");
    displayDescription = paramJSONObject.getString("displayDescription");
    iconURL = paramJSONObject.getString("icon");
    iconVersion = paramJSONObject.getString("iconVersion");
    previewURL = paramJSONObject.getString("previewURL");
    previewVersion = paramJSONObject.getString("previewVersion");
    contentURL = paramJSONObject.getString("contentURL");
    contentVersion = paramJSONObject.getString("contentVersion");
    free = paramJSONObject.getBoolean("isFree");
    freeWithLogin = paramJSONObject.optBoolean("isFreeWithLogin");
    author = paramJSONObject.optString("author", "");
    authorHyperlink = paramJSONObject.optString("authorHyperlink", "");
    socialMediaString = paramJSONObject.optString("socialMediaString", "");
    shopBackgroundColor = paramJSONObject.optString("shopBackgroundColor", "");
    featureImageURL = paramJSONObject.optString("featureImageURL");
    featureImageVersion = paramJSONObject.optString("featureImageVersion");
    detailImageURL = paramJSONObject.optString("detailImageURL");
    detailImageVersion = paramJSONObject.optString("detailImageVersion");
    if (freeWithLogin) {
      Log.v(getClass().getSimpleName(), displayName + " (" + packType + ") is free with AdobeID");
    }
    paramJSONObject = paramJSONObject.getJSONArray("items");
    int i = 0;
    while (i < paramJSONObject.length())
    {
      ContentItem localContentItem = ContentItem.create(paramJSONObject.getJSONObject(i));
      mItems.add(localContentItem);
      i += 1;
    }
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("ContentParser:\n");
    localStringBuilder.append("  identifier: ").append(identifier).append("\n");
    localStringBuilder.append("  versionKey: ").append(versionKey).append("\n");
    localStringBuilder.append("  packType: ").append(packType).append("\n");
    localStringBuilder.append("  displayName: ").append(displayName).append("\n");
    localStringBuilder.append("  displayDescription: ").append(displayDescription).append("\n");
    localStringBuilder.append("  iconURL: ").append(iconURL).append(", iconVersion: ").append(iconVersion).append("\n");
    localStringBuilder.append("  previewURL: ").append(previewURL).append(", previewVersion: ").append(previewVersion).append("\n");
    localStringBuilder.append("  contentURL: ").append(contentURL).append(", contentVersion: ").append(contentVersion).append("\n");
    localStringBuilder.append("  isFree: ").append(free).append("\n");
    localStringBuilder.append("  isFreeWithLogin: ").append(freeWithLogin).append("\n");
    localStringBuilder.append("  items: ").append(mItems).append("\n");
    localStringBuilder.append("    author: ").append(author).append("\n");
    localStringBuilder.append("    authorHyperlink: ").append(authorHyperlink).append("\n");
    localStringBuilder.append("    socialMediaString: ").append(socialMediaString).append("\n");
    localStringBuilder.append("    shopBackgroundColor: ").append(shopBackgroundColor).append("\n");
    localStringBuilder.append("    featureImageURL: ").append(featureImageURL).append("\n");
    localStringBuilder.append("    featureImageVersion: ").append(featureImageVersion).append("\n");
    localStringBuilder.append("    detailImageURL: ").append(detailImageURL).append("\n");
    localStringBuilder.append("    detailImageVersion: ").append(detailImageVersion).append("\n");
    return localStringBuilder.toString();
  }
  
  public static class ContentItem
  {
    final String displayName;
    final String identifier;
    final byte[] options;
    
    ContentItem(String paramString1, String paramString2, JSONObject paramJSONObject)
    {
      identifier = paramString1;
      displayName = paramString2;
      if (paramJSONObject != null)
      {
        options = paramJSONObject.toString().getBytes();
        return;
      }
      options = null;
    }
    
    public static ContentItem create(JSONObject paramJSONObject)
      throws JSONException
    {
      return new ContentItem(paramJSONObject.getString("identifier"), paramJSONObject.getString("displayName"), paramJSONObject.optJSONObject("options"));
    }
    
    public String getDisplayName()
    {
      return displayName;
    }
    
    public String getIdentifier()
    {
      return identifier;
    }
    
    public byte[] getOptions()
    {
      return options;
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder().append("{").append(identifier).append(", ").append(displayName).append(", ");
      if (options != null) {}
      for (Object localObject = options;; localObject = "null") {
        return localObject + "}";
      }
    }
  }
}
