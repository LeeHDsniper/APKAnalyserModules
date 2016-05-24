package com.google.android.gms.common.stats;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class ConnectionEvent
  implements SafeParcelable
{
  public static final Parcelable.Creator<ConnectionEvent> CREATOR = new zza();
  final int mVersionCode;
  private final long zzafj;
  private int zzafk;
  private final String zzafl;
  private final String zzafm;
  private final String zzafn;
  private final String zzafo;
  private final String zzafp;
  private final String zzafq;
  private final long zzafr;
  private final long zzafs;
  private long zzaft;
  
  ConnectionEvent(int paramInt1, long paramLong1, int paramInt2, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, long paramLong2, long paramLong3)
  {
    mVersionCode = paramInt1;
    zzafj = paramLong1;
    zzafk = paramInt2;
    zzafl = paramString1;
    zzafm = paramString2;
    zzafn = paramString3;
    zzafo = paramString4;
    zzaft = -1L;
    zzafp = paramString5;
    zzafq = paramString6;
    zzafr = paramLong2;
    zzafs = paramLong3;
  }
  
  public ConnectionEvent(long paramLong1, int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, long paramLong2, long paramLong3)
  {
    this(1, paramLong1, paramInt, paramString1, paramString2, paramString3, paramString4, paramString5, paramString6, paramLong2, paramLong3);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public int getEventType()
  {
    return zzafk;
  }
  
  public long getTimeMillis()
  {
    return zzafj;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }
  
  public String zzpA()
  {
    return zzafq;
  }
  
  public long zzpB()
  {
    return zzafs;
  }
  
  public long zzpC()
  {
    return zzafr;
  }
  
  public String zzpv()
  {
    return zzafl;
  }
  
  public String zzpw()
  {
    return zzafm;
  }
  
  public String zzpx()
  {
    return zzafn;
  }
  
  public String zzpy()
  {
    return zzafo;
  }
  
  public String zzpz()
  {
    return zzafp;
  }
}
