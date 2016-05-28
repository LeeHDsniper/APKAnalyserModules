package com.adobe.creativesdk.aviary.internal.cds.json;

import org.json.JSONException;
import org.json.JSONObject;

public class CdsMessageContentParser
  extends CdsJsonParser
{
  String actionButtonText;
  long beginDate;
  String contentIdentifier;
  String contentURL;
  String dismissButtonText;
  long endDate;
  String identifier;
  String layoutStyle;
  String paragraph;
  boolean showNewBanner;
  boolean splitButton;
  String title;
  String versionKey;
  
  public CdsMessageContentParser() {}
  
  public String getActionButtonText()
  {
    return actionButtonText;
  }
  
  public long getBeginDate()
  {
    return beginDate;
  }
  
  public String getContentIdentifier()
  {
    return contentIdentifier;
  }
  
  public String getContentURL()
  {
    return contentURL;
  }
  
  public String getDismissButtonText()
  {
    return dismissButtonText;
  }
  
  public long getEndDate()
  {
    return endDate;
  }
  
  public String getIdentifier()
  {
    return identifier;
  }
  
  public String getLayoutStyle()
  {
    return layoutStyle;
  }
  
  public String getParagraph()
  {
    return paragraph;
  }
  
  public String getTitle()
  {
    return title;
  }
  
  public String getVersionKey()
  {
    return versionKey;
  }
  
  public boolean isShowNewBanner()
  {
    return showNewBanner;
  }
  
  public boolean isSplitButton()
  {
    return splitButton;
  }
  
  protected void onParseJson(JSONObject paramJSONObject)
    throws JSONException
  {
    identifier = paramJSONObject.getString("identifier");
    versionKey = paramJSONObject.getString("versionKey");
    contentIdentifier = paramJSONObject.getString("contentIdentifier");
    beginDate = paramJSONObject.getLong("beginDate");
    endDate = paramJSONObject.getLong("endDate");
    contentURL = paramJSONObject.getString("contentURL");
    title = paramJSONObject.getString("title");
    paragraph = paramJSONObject.getString("paragraph");
    dismissButtonText = paramJSONObject.getString("dismissButtonText");
    actionButtonText = paramJSONObject.optString("actionButtonText", "Yes");
    layoutStyle = paramJSONObject.getString("layoutStyle");
    showNewBanner = paramJSONObject.getBoolean("showsNewBanner");
    splitButton = paramJSONObject.getBoolean("isSplitButton");
  }
}
