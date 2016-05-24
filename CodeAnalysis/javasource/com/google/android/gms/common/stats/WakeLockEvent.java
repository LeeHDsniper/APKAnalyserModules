package com.google.android.gms.common.stats;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

public final class WakeLockEvent
  implements SafeParcelable
{
  public static final Parcelable.Creator<WakeLockEvent> CREATOR = new zzg();
  final int mVersionCode;
  private final String zzafS;
  private final int zzafT;
  private final List<String> zzafU;
  private final String zzafV;
  private int zzafW;
  private final String zzafX;
  private final String zzafY;
  private final float zzafZ;
  private final long zzafj;
  private int zzafk;
  private final long zzafr;
  private long zzaft;
  
  WakeLockEvent(int paramInt1, long paramLong1, int paramInt2, String paramString1, int paramInt3, List<String> paramList, String paramString2, long paramLong2, int paramInt4, String paramString3, String paramString4, float paramFloat)
  {
    mVersionCode = paramInt1;
    zzafj = paramLong1;
    zzafk = paramInt2;
    zzafS = paramString1;
    zzafX = paramString3;
    zzafT = paramInt3;
    zzaft = -1L;
    zzafU = paramList;
    zzafV = paramString2;
    zzafr = paramLong2;
    zzafW = paramInt4;
    zzafY = paramString4;
    zzafZ = paramFloat;
  }
  
  public WakeLockEvent(long paramLong1, int paramInt1, String paramString1, int paramInt2, List<String> paramList, String paramString2, long paramLong2, int paramInt3, String paramString3, String paramString4, float paramFloat)
  {
    this(1, paramLong1, paramInt1, paramString1, paramInt2, paramList, paramString2, paramLong2, paramInt3, paramString3, paramString4, paramFloat);
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
    zzg.zza(this, paramParcel, paramInt);
  }
  
  public String zzpA()
  {
    return zzafV;
  }
  
  public long zzpC()
  {
    return zzafr;
  }
  
  public String zzpE()
  {
    return zzafS;
  }
  
  public String zzpF()
  {
    return zzafX;
  }
  
  public int zzpG()
  {
    return zzafT;
  }
  
  public List<String> zzpH()
  {
    return zzafU;
  }
  
  public int zzpI()
  {
    return zzafW;
  }
  
  public String zzpJ()
  {
    return zzafY;
  }
  
  public float zzpK()
  {
    return zzafZ;
  }
}
