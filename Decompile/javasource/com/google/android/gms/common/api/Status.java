package com.google.android.gms.common.api;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public final class Status
  implements Result, SafeParcelable
{
  public static final Parcelable.Creator<Status> CREATOR = new zzn();
  public static final Status zzaaD = new Status(0);
  public static final Status zzaaE = new Status(14);
  public static final Status zzaaF = new Status(8);
  public static final Status zzaaG = new Status(15);
  public static final Status zzaaH = new Status(16);
  private final PendingIntent mPendingIntent;
  private final int mVersionCode;
  private final int zzWu;
  private final String zzaaI;
  
  public Status(int paramInt)
  {
    this(paramInt, null);
  }
  
  Status(int paramInt1, int paramInt2, String paramString, PendingIntent paramPendingIntent)
  {
    mVersionCode = paramInt1;
    zzWu = paramInt2;
    zzaaI = paramString;
    mPendingIntent = paramPendingIntent;
  }
  
  public Status(int paramInt, String paramString)
  {
    this(1, paramInt, paramString, null);
  }
  
  public Status(int paramInt, String paramString, PendingIntent paramPendingIntent)
  {
    this(1, paramInt, paramString, paramPendingIntent);
  }
  
  private String zznI()
  {
    if (zzaaI != null) {
      return zzaaI;
    }
    return CommonStatusCodes.getStatusCodeString(zzWu);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof Status)) {}
    do
    {
      return false;
      paramObject = (Status)paramObject;
    } while ((mVersionCode != mVersionCode) || (zzWu != zzWu) || (!zzw.equal(zzaaI, zzaaI)) || (!zzw.equal(mPendingIntent, mPendingIntent)));
    return true;
  }
  
  public Status getStatus()
  {
    return this;
  }
  
  public int getStatusCode()
  {
    return zzWu;
  }
  
  public String getStatusMessage()
  {
    return zzaaI;
  }
  
  int getVersionCode()
  {
    return mVersionCode;
  }
  
  public int hashCode()
  {
    return zzw.hashCode(new Object[] { Integer.valueOf(mVersionCode), Integer.valueOf(zzWu), zzaaI, mPendingIntent });
  }
  
  public boolean isSuccess()
  {
    return zzWu <= 0;
  }
  
  public String toString()
  {
    return zzw.zzu(this).zzg("statusCode", zznI()).zzg("resolution", mPendingIntent).toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzn.zza(this, paramParcel, paramInt);
  }
  
  PendingIntent zznH()
  {
    return mPendingIntent;
  }
}
