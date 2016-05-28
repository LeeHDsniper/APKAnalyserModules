package com.adobe.creativesdk.aviary.internal.cds.util;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import org.json.JSONException;
import org.json.JSONObject;

public class Purchase
  implements Parcelable
{
  public static final Parcelable.Creator<Purchase> CREATOR = new Parcelable.Creator()
  {
    public Purchase createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Purchase(paramAnonymousParcel);
    }
    
    public Purchase[] newArray(int paramAnonymousInt)
    {
      return new Purchase[0];
    }
  };
  String mDeveloperPayload;
  String mItemType;
  String mOrderId;
  String mOriginalJson;
  String mPackageName;
  int mPurchaseState;
  long mPurchaseTime;
  String mSignature;
  String mSku;
  String mToken;
  
  public Purchase(Parcel paramParcel)
  {
    mItemType = paramParcel.readString();
    mOrderId = paramParcel.readString();
    mPackageName = paramParcel.readString();
    mSku = paramParcel.readString();
    mPurchaseTime = paramParcel.readLong();
    mPurchaseState = paramParcel.readInt();
    mDeveloperPayload = paramParcel.readString();
    mToken = paramParcel.readString();
    mSignature = paramParcel.readString();
    mOriginalJson = paramParcel.readString();
  }
  
  public Purchase(String paramString1, String paramString2, String paramString3)
    throws JSONException
  {
    mItemType = paramString1;
    mOriginalJson = paramString2;
    paramString1 = new JSONObject(mOriginalJson);
    mOrderId = paramString1.optString("orderId");
    mPackageName = paramString1.optString("packageName");
    mSku = paramString1.optString("productId");
    mPurchaseTime = paramString1.optLong("purchaseTime");
    mPurchaseState = paramString1.optInt("purchaseState");
    mDeveloperPayload = paramString1.optString("developerPayload");
    mToken = paramString1.optString("token", paramString1.optString("purchaseToken"));
    mSignature = paramString3;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getOrderId()
  {
    return mOrderId;
  }
  
  public long getPurchaseTime()
  {
    return mPurchaseTime;
  }
  
  public String getSku()
  {
    return mSku;
  }
  
  public String getToken()
  {
    return mToken;
  }
  
  public String toString()
  {
    return "PurchaseInfo(type:" + mItemType + "):" + mOriginalJson;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(mItemType);
    paramParcel.writeString(mOrderId);
    paramParcel.writeString(mPackageName);
    paramParcel.writeString(mSku);
    paramParcel.writeLong(mPurchaseTime);
    paramParcel.writeInt(mPurchaseState);
    paramParcel.writeString(mDeveloperPayload);
    paramParcel.writeString(mToken);
    paramParcel.writeString(mSignature);
    paramParcel.writeString(mOriginalJson);
  }
}
