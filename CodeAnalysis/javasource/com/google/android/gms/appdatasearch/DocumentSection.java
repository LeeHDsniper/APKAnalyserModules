package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public class DocumentSection
  implements SafeParcelable
{
  public static final zzd CREATOR = new zzd();
  public static final int zzPc = Integer.parseInt("-1");
  private static final RegisterSectionInfo zzPd = new RegisterSectionInfo.zza("SsbContext").zzM(true).zzby("blob").zzld();
  final int mVersionCode;
  public final String zzPe;
  final RegisterSectionInfo zzPf;
  public final int zzPg;
  public final byte[] zzPh;
  
  DocumentSection(int paramInt1, String paramString, RegisterSectionInfo paramRegisterSectionInfo, int paramInt2, byte[] paramArrayOfByte)
  {
    if ((paramInt2 == zzPc) || (zzh.zzaj(paramInt2) != null)) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zzb(bool, "Invalid section type " + paramInt2);
      mVersionCode = paramInt1;
      zzPe = paramString;
      zzPf = paramRegisterSectionInfo;
      zzPg = paramInt2;
      zzPh = paramArrayOfByte;
      paramString = zzla();
      if (paramString == null) {
        break;
      }
      throw new IllegalArgumentException(paramString);
    }
  }
  
  public int describeContents()
  {
    zzd localZzd = CREATOR;
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzd localZzd = CREATOR;
    zzd.zza(this, paramParcel, paramInt);
  }
  
  public RegisterSectionInfo zzkZ()
  {
    return zzPf;
  }
  
  public String zzla()
  {
    if ((zzPg != zzPc) && (zzh.zzaj(zzPg) == null)) {
      return "Invalid section type " + zzPg;
    }
    if ((zzPe != null) && (zzPh != null)) {
      return "Both content and blobContent set";
    }
    return null;
  }
}
