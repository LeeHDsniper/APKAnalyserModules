package com.adobe.creativesdk.aviary.internal.cds.util;

import org.json.JSONException;
import org.json.JSONObject;

public class SkuDetails
{
  String mDescription;
  String mItemType;
  String mJson;
  String mPrice;
  String mSku;
  String mTitle;
  String mType;
  
  public SkuDetails(String paramString1, String paramString2)
    throws JSONException
  {
    mItemType = paramString1;
    mJson = paramString2;
    paramString1 = new JSONObject(mJson);
    mSku = paramString1.optString("productId");
    mType = paramString1.optString("type");
    mPrice = paramString1.optString("price");
    mTitle = paramString1.optString("title");
    mDescription = paramString1.optString("description");
  }
  
  public String getPrice()
  {
    return mPrice;
  }
  
  public String getSku()
  {
    return mSku;
  }
  
  public String toString()
  {
    return "SkuDetails:" + mJson;
  }
}
