package oicq.wlogin_sdk.request;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.io.Serializable;

public class WFastLoginInfo
  implements Parcelable, Serializable
{
  public static final Parcelable.Creator<WFastLoginInfo> CREATOR = new WFastLoginInfo.1();
  private static final long serialVersionUID = 1L;
  public byte[] _outA1 = new byte[0];
  public String adUrl = "";
  public String iconUrl = "";
  public String profileUrl = "";
  
  public WFastLoginInfo()
  {
    _outA1 = new byte[0];
  }
  
  private WFastLoginInfo(Parcel paramParcel)
  {
    readFromParcel(paramParcel);
  }
  
  public WFastLoginInfo(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte != null)
    {
      _outA1 = ((byte[])paramArrayOfByte.clone());
      return;
    }
    _outA1 = new byte[0];
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void get_clone(WFastLoginInfo paramWFastLoginInfo)
  {
    if (paramWFastLoginInfo != null) {
      if (_outA1 == null) {
        break label50;
      }
    }
    label50:
    for (_outA1 = ((byte[])_outA1.clone());; _outA1 = new byte[0])
    {
      iconUrl = iconUrl;
      adUrl = adUrl;
      profileUrl = profileUrl;
      return;
    }
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    _outA1 = paramParcel.createByteArray();
    iconUrl = paramParcel.readString();
    adUrl = paramParcel.readString();
    profileUrl = paramParcel.readString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeByteArray(_outA1);
    paramParcel.writeString(iconUrl);
    paramParcel.writeString(adUrl);
    paramParcel.writeString(profileUrl);
  }
}
