package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class UsageInfo
  implements SafeParcelable
{
  public static final zzj CREATOR = new zzj();
  final int mVersionCode;
  final DocumentId zzPP;
  final long zzPQ;
  int zzPR;
  final DocumentContents zzPS;
  final boolean zzPT;
  int zzPU;
  int zzPV;
  public final String zztM;
  
  UsageInfo(int paramInt1, DocumentId paramDocumentId, long paramLong, int paramInt2, String paramString, DocumentContents paramDocumentContents, boolean paramBoolean, int paramInt3, int paramInt4)
  {
    mVersionCode = paramInt1;
    zzPP = paramDocumentId;
    zzPQ = paramLong;
    zzPR = paramInt2;
    zztM = paramString;
    zzPS = paramDocumentContents;
    zzPT = paramBoolean;
    zzPU = paramInt3;
    zzPV = paramInt4;
  }
  
  public int describeContents()
  {
    zzj localZzj = CREATOR;
    return 0;
  }
  
  public String toString()
  {
    return String.format("UsageInfo[documentId=%s, timestamp=%d, usageType=%d, status=%d]", new Object[] { zzPP, Long.valueOf(zzPQ), Integer.valueOf(zzPR), Integer.valueOf(zzPV) });
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzj localZzj = CREATOR;
    zzj.zza(this, paramParcel, paramInt);
  }
  
  public DocumentContents zzle()
  {
    return zzPS;
  }
}
