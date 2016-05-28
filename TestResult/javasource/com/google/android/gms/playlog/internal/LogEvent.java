package com.google.android.gms.playlog.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Iterator;
import java.util.Set;

public class LogEvent
  implements SafeParcelable
{
  public static final zzc CREATOR = new zzc();
  public final String tag;
  public final int versionCode;
  public final long zzaKG;
  public final long zzaKH;
  public final byte[] zzaKI;
  public final Bundle zzaKJ;
  
  LogEvent(int paramInt, long paramLong1, long paramLong2, String paramString, byte[] paramArrayOfByte, Bundle paramBundle)
  {
    versionCode = paramInt;
    zzaKG = paramLong1;
    zzaKH = paramLong2;
    tag = paramString;
    zzaKI = paramArrayOfByte;
    zzaKJ = paramBundle;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("tag=").append(tag).append(",");
    localStringBuilder.append("eventTime=").append(zzaKG).append(",");
    localStringBuilder.append("eventUptime=").append(zzaKH).append(",");
    if ((zzaKJ != null) && (!zzaKJ.isEmpty()))
    {
      localStringBuilder.append("keyValues=");
      Iterator localIterator = zzaKJ.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localStringBuilder.append("(").append(str).append(",");
        localStringBuilder.append(zzaKJ.getString(str)).append(")");
        localStringBuilder.append(" ");
      }
    }
    return localStringBuilder.toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }
}
