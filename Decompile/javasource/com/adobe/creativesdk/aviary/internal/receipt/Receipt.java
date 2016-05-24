package com.adobe.creativesdk.aviary.internal.receipt;

import android.content.Context;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import junit.framework.Assert;
import junit.framework.AssertionFailedError;
import org.json.JSONException;
import org.json.JSONObject;

public final class Receipt
{
  String adobeId;
  final String apiKey;
  boolean isFree;
  boolean isNewPurchase;
  String orderId;
  String price;
  final String productId;
  final long purchaseTime;
  String purchaseToken;
  
  Receipt(String paramString1, long paramLong, String paramString2)
  {
    productId = paramString1;
    purchaseTime = paramLong;
    apiKey = paramString2;
  }
  
  public JSONObject toJSON(Context paramContext)
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    localJSONObject.put("apiKey", apiKey);
    localJSONObject.put("sdkVersion", String.valueOf(421));
    localJSONObject.put("binaryVersion", String.valueOf(ReceiptUtils.getBinaryVersion(paramContext)));
    localJSONObject.put("aviaryId", ReceiptUtils.getUserUUID(paramContext));
    localJSONObject.put("productId", productId);
    localJSONObject.put("packageName", paramContext.getPackageName());
    localJSONObject.put("country", ReceiptUtils.getCountry());
    localJSONObject.put("language", ReceiptUtils.getLanguage());
    localJSONObject.put("purchaseTime", purchaseTime);
    if (!PackageManagerUtils.isDebugVersion(paramContext)) {}
    for (boolean bool = true;; bool = false)
    {
      localJSONObject.put("isProduction", bool);
      if (!TextUtils.isEmpty(adobeId)) {
        localJSONObject.put("adobeId", adobeId);
      }
      if (!isFree)
      {
        localJSONObject.put("isNewPurchase", isNewPurchase);
        if (orderId != null) {
          localJSONObject.put("orderId", orderId);
        }
        if (purchaseToken != null) {
          localJSONObject.put("receipt", purchaseToken);
        }
        if (price != null) {
          localJSONObject.put("price", price);
        }
      }
      return localJSONObject;
    }
  }
  
  public static class Builder
  {
    private String adobeId;
    private final String apiKey;
    private final boolean mIsFree;
    private boolean mIsNewPurchase;
    private String mOrderId;
    private String mPrice;
    private String mProductId;
    private long mPurchaseTime;
    private String mToken;
    
    public Builder(boolean paramBoolean, String paramString)
    {
      mIsFree = paramBoolean;
      apiKey = paramString;
    }
    
    public Receipt build()
      throws AssertionFailedError
    {
      Receipt localReceipt = new Receipt(mProductId, mPurchaseTime, apiKey);
      isNewPurchase = mIsNewPurchase;
      if (mIsFree) {
        isFree = true;
      }
      for (;;)
      {
        adobeId = adobeId;
        return localReceipt;
        isFree = false;
        if (mIsNewPurchase)
        {
          Assert.assertNotNull("orderId cannot be null", mOrderId);
          Assert.assertNotNull("token cannot be null", mToken);
          Assert.assertNotNull("price cannot be null", mPrice);
          orderId = mOrderId;
          purchaseToken = mToken;
          price = mPrice;
        }
      }
    }
    
    public Builder isNewPurchase(boolean paramBoolean)
    {
      mIsNewPurchase = paramBoolean;
      return this;
    }
    
    public Builder withOrderId(String paramString)
    {
      mOrderId = paramString;
      return this;
    }
    
    public Builder withPrice(String paramString)
    {
      mPrice = paramString;
      return this;
    }
    
    public Builder withProductId(String paramString)
    {
      mProductId = paramString;
      return this;
    }
    
    public Builder withPurchaseTime(long paramLong)
    {
      mPurchaseTime = paramLong;
      return this;
    }
    
    public Builder withToken(String paramString)
    {
      mToken = paramString;
      return this;
    }
    
    public Builder withUserId(String paramString)
    {
      adobeId = paramString;
      return this;
    }
  }
}
