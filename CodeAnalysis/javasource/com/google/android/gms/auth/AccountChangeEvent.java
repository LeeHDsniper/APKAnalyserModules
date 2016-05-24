package com.google.android.gms.auth;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;

public class AccountChangeEvent
  implements SafeParcelable
{
  public static final Parcelable.Creator<AccountChangeEvent> CREATOR = new zza();
  final int mVersion;
  final long zzQD;
  final String zzQE;
  final int zzQF;
  final int zzQG;
  final String zzQH;
  
  AccountChangeEvent(int paramInt1, long paramLong, String paramString1, int paramInt2, int paramInt3, String paramString2)
  {
    mVersion = paramInt1;
    zzQD = paramLong;
    zzQE = ((String)zzx.zzv(paramString1));
    zzQF = paramInt2;
    zzQG = paramInt3;
    zzQH = paramString2;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof AccountChangeEvent)) {
        break;
      }
      paramObject = (AccountChangeEvent)paramObject;
    } while ((mVersion == mVersion) && (zzQD == zzQD) && (zzw.equal(zzQE, zzQE)) && (zzQF == zzQF) && (zzQG == zzQG) && (zzw.equal(zzQH, zzQH)));
    return false;
    return false;
  }
  
  public int hashCode()
  {
    return zzw.hashCode(new Object[] { Integer.valueOf(mVersion), Long.valueOf(zzQD), zzQE, Integer.valueOf(zzQF), Integer.valueOf(zzQG), zzQH });
  }
  
  public String toString()
  {
    String str = "UNKNOWN";
    switch (zzQF)
    {
    }
    for (;;)
    {
      return "AccountChangeEvent {accountName = " + zzQE + ", changeType = " + str + ", changeData = " + zzQH + ", eventIndex = " + zzQG + "}";
      str = "ADDED";
      continue;
      str = "REMOVED";
      continue;
      str = "RENAMED_TO";
      continue;
      str = "RENAMED_FROM";
    }
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
}
