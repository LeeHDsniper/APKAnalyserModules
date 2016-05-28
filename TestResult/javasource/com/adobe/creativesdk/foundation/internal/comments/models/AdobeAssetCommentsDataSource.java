package com.adobe.creativesdk.foundation.internal.comments.models;

import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import java.net.URI;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeAssetCommentsDataSource
{
  private ArrayList<AdobeAssetCommentData> comments = new ArrayList();
  private AdobeAsset resource;
  
  private AdobeAssetCommentsDataSource(AdobeAsset paramAdobeAsset)
  {
    resource = paramAdobeAsset;
  }
  
  public static AdobeAssetCommentsDataSource commentsFromJSONData(JSONArray paramJSONArray, AdobeAsset paramAdobeAsset)
  {
    AdobeAssetCommentsDataSource localAdobeAssetCommentsDataSource = new AdobeAssetCommentsDataSource(paramAdobeAsset);
    int i = 0;
    if (i < paramJSONArray.length()) {
      for (;;)
      {
        try
        {
          JSONObject localJSONObject = paramJSONArray.getJSONObject(i);
          String str1 = localJSONObject.getString("username");
          String str2 = localJSONObject.getString("url");
          String str3 = localJSONObject.getString("avatar");
          String str4 = paramAdobeAsset.getHref().toString();
          if (localJSONObject.getString("content") == null) {
            continue;
          }
          localObject = localJSONObject.getString("content").replace("\n", "<br/>");
          localObject = new AdobeAssetCommentData(str1, (String)localObject, localJSONObject.getLong("created"), str3, str2, str4);
          comments.add(localObject);
        }
        catch (JSONException localJSONException)
        {
          Object localObject;
          localJSONException.printStackTrace();
          continue;
        }
        i += 1;
        break;
        localObject = null;
      }
    }
    return localAdobeAssetCommentsDataSource;
  }
  
  public ArrayList<AdobeAssetCommentData> getComments()
  {
    return comments;
  }
}
