package com.tencent.qphone.base.remote;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class MsfServiceBindInfo
  implements Parcelable
{
  public static final Parcelable.Creator CREATOR = new MsfServiceBindInfo.1();
  private int appid;
  private String bootBoradcastName;
  private IMsfServiceCallbacker msfServiceCallbacker;
  private String processName;
  
  public MsfServiceBindInfo(int paramInt, String paramString1, String paramString2, IMsfServiceCallbacker paramIMsfServiceCallbacker)
  {
    appid = paramInt;
    processName = paramString1;
    bootBoradcastName = paramString2;
    msfServiceCallbacker = paramIMsfServiceCallbacker;
  }
  
  public MsfServiceBindInfo(Parcel paramParcel)
  {
    readFromParcel(paramParcel);
  }
  
  private void readFromParcel(Parcel paramParcel)
  {
    appid = paramParcel.readInt();
    processName = paramParcel.readString();
    bootBoradcastName = paramParcel.readString();
    msfServiceCallbacker = IMsfServiceCallbacker.Stub.asInterface(paramParcel.readStrongBinder());
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public int getAppid()
  {
    return appid;
  }
  
  public String getBootBoradcastName()
  {
    return bootBoradcastName;
  }
  
  public IMsfServiceCallbacker getMsfServiceCallbacker()
  {
    return msfServiceCallbacker;
  }
  
  public String getProcessName()
  {
    return processName;
  }
  
  public void setAppid(int paramInt)
  {
    appid = paramInt;
  }
  
  public void setBootBoradcastName(String paramString)
  {
    bootBoradcastName = paramString;
  }
  
  public void setMsfSericeCallbacker(IMsfServiceCallbacker paramIMsfServiceCallbacker)
  {
    msfServiceCallbacker = paramIMsfServiceCallbacker;
  }
  
  public void setProcessName(String paramString)
  {
    processName = paramString;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(appid);
    paramParcel.writeString(processName);
    paramParcel.writeString(bootBoradcastName);
    paramParcel.writeStrongInterface(msfServiceCallbacker);
  }
}
