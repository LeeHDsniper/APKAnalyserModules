package com.tencent.mobileqq.pluginsdk.ipc;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class a
  implements Parcelable.Creator
{
  a() {}
  
  public ParcelableBinder a(Parcel paramParcel)
  {
    return new ParcelableBinder(paramParcel, null);
  }
  
  public ParcelableBinder[] a(int paramInt)
  {
    return new ParcelableBinder[paramInt];
  }
}
