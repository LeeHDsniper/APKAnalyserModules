package com.tencent.mobileqq.pluginsdk.ipc;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class ParcelableBinder
  implements Parcelable
{
  public static final Parcelable.Creator CREATOR = new a();
  private IBinder a;
  
  public ParcelableBinder(IBinder paramIBinder)
  {
    a = paramIBinder;
  }
  
  private ParcelableBinder(Parcel paramParcel)
  {
    a = paramParcel.readStrongBinder();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public IBinder getBinder()
  {
    return a;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeStrongBinder(a);
  }
}
