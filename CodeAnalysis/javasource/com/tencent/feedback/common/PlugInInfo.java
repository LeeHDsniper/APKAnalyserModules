package com.tencent.feedback.common;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.io.Serializable;

public class PlugInInfo
  implements Parcelable, Serializable
{
  public static final Parcelable.Creator<PlugInInfo> CREATOR = new Parcelable.Creator() {};
  private static final long serialVersionUID = 1L;
  public final String plugInId;
  public final String plugInUUID;
  public final String plugInVersion;
  
  public PlugInInfo(Parcel paramParcel)
  {
    plugInId = paramParcel.readString();
    plugInVersion = paramParcel.readString();
    plugInUUID = paramParcel.readString();
  }
  
  public PlugInInfo(String paramString1, String paramString2, String paramString3)
  {
    plugInId = paramString1;
    plugInVersion = paramString2;
    plugInUUID = paramString3;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String toString()
  {
    return "plid:" + plugInId + " plV:" + plugInVersion + " plUUID:" + plugInUUID;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(plugInId);
    paramParcel.writeString(plugInVersion);
    paramParcel.writeString(plugInUUID);
  }
}
