package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public final class BinderWrapper
  implements Parcelable
{
  public static final Parcelable.Creator<BinderWrapper> CREATOR = new Parcelable.Creator()
  {
    public BinderWrapper zzad(Parcel paramAnonymousParcel)
    {
      return new BinderWrapper(paramAnonymousParcel, null);
    }
    
    public BinderWrapper[] zzbx(int paramAnonymousInt)
    {
      return new BinderWrapper[paramAnonymousInt];
    }
  };
  private IBinder zzacE = null;
  
  public BinderWrapper() {}
  
  public BinderWrapper(IBinder paramIBinder)
  {
    zzacE = paramIBinder;
  }
  
  private BinderWrapper(Parcel paramParcel)
  {
    zzacE = paramParcel.readStrongBinder();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeStrongBinder(zzacE);
  }
}
