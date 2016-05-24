package com.adobe.creativesdk.aviary.internal.cds.json;

import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import java.io.IOException;
import java.io.InputStream;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class CdsJsonParser
{
  protected int mCode;
  protected String mStatus;
  
  public CdsJsonParser() {}
  
  public final int getCode()
  {
    return mCode;
  }
  
  public final String getStatus()
  {
    return mStatus;
  }
  
  protected abstract void onParseJson(JSONObject paramJSONObject)
    throws JSONException;
  
  public int parse(InputStream paramInputStream)
    throws IOException, JSONException
  {
    return parse(IOUtils.readFully(paramInputStream));
  }
  
  public int parse(String paramString)
    throws JSONException
  {
    return parse(new JSONObject(paramString));
  }
  
  public int parse(JSONObject paramJSONObject)
    throws JSONException
  {
    mCode = paramJSONObject.optInt("code", -1);
    mStatus = paramJSONObject.optString("status", "none");
    if (mCode == 0) {
      onParseJson(paramJSONObject);
    }
    return mCode;
  }
}
