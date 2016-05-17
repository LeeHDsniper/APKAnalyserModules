package oicq.wlogin_sdk.sharemem;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class a
  implements Parcelable.Creator<WloginLoginInfo>
{
  a() {}
  
  public WloginLoginInfo a(Parcel paramParcel)
  {
    return new WloginLoginInfo(paramParcel, null);
  }
  
  public WloginLoginInfo[] a(int paramInt)
  {
    return new WloginLoginInfo[paramInt];
  }
}
