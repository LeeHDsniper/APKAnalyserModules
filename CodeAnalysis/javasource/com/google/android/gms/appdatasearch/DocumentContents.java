package com.google.android.gms.appdatasearch;

import android.accounts.Account;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public class DocumentContents
  implements SafeParcelable
{
  public static final zzb CREATOR = new zzb();
  public final Account account;
  final int mVersionCode;
  final DocumentSection[] zzOS;
  public final String zzOT;
  public final boolean zzOU;
  
  DocumentContents(int paramInt, DocumentSection[] paramArrayOfDocumentSection, String paramString, boolean paramBoolean, Account paramAccount)
  {
    mVersionCode = paramInt;
    zzOS = paramArrayOfDocumentSection;
    zzOT = paramString;
    zzOU = paramBoolean;
    account = paramAccount;
  }
  
  public int describeContents()
  {
    zzb localZzb = CREATOR;
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb localZzb = CREATOR;
    zzb.zza(this, paramParcel, paramInt);
  }
  
  public DocumentSection zzbu(String paramString)
  {
    zzx.zzcs(paramString);
    if (zzOS == null) {}
    for (;;)
    {
      return null;
      DocumentSection[] arrayOfDocumentSection = zzOS;
      int j = arrayOfDocumentSection.length;
      int i = 0;
      while (i < j)
      {
        DocumentSection localDocumentSection = arrayOfDocumentSection[i];
        if (paramString.equals(zzkZname)) {
          return localDocumentSection;
        }
        i += 1;
      }
    }
  }
  
  public String zzkX()
  {
    DocumentSection localDocumentSection = zzbu("web_url");
    if (localDocumentSection != null) {
      return zzPe;
    }
    return null;
  }
}
