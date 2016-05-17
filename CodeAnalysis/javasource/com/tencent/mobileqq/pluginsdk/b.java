package com.tencent.mobileqq.pluginsdk;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class b
  implements Parcelable.Creator
{
  b() {}
  
  public PluginBaseInfo a(Parcel paramParcel)
  {
    return new PluginBaseInfo(paramParcel);
  }
  
  public PluginBaseInfo[] a(int paramInt)
  {
    return new PluginBaseInfo[paramInt];
  }
}
