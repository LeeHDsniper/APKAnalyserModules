package oicq.wlogin_sdk.sharemem;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.io.Serializable;

public class WloginLoginInfo
  implements Parcelable, Serializable
{
  public static final Parcelable.Creator<WloginLoginInfo> CREATOR = new a();
  public static int TYPE_LOACL = 1;
  public static int TYPE_REMOTE = 2;
  private static final long serialVersionUID = 5551948389726789420L;
  public String mAccount;
  public long mAppid;
  public long mCreateTime;
  public String mFaceUrl = "";
  public int mLoginBitmap;
  public int mType;
  public long mUin;
  
  private WloginLoginInfo(Parcel paramParcel)
  {
    readFromParcel(paramParcel);
  }
  
  public WloginLoginInfo(String paramString1, long paramLong1, long paramLong2, String paramString2, long paramLong3, int paramInt1, int paramInt2)
  {
    mAccount = paramString1;
    mUin = paramLong1;
    mAppid = paramLong2;
    mFaceUrl = paramString2;
    mCreateTime = paramLong3;
    mType = paramInt1;
    mLoginBitmap = paramInt2;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    mAccount = paramParcel.readString();
    mUin = paramParcel.readLong();
    mAppid = paramParcel.readLong();
    mCreateTime = paramParcel.readLong();
    mType = paramParcel.readInt();
    mLoginBitmap = paramParcel.readInt();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(mAccount);
    paramParcel.writeLong(mUin);
    paramParcel.writeLong(mAppid);
    paramParcel.writeLong(mCreateTime);
    paramParcel.writeInt(mType);
    paramParcel.writeInt(mLoginBitmap);
  }
}
