package com.google.android.gms.signin.internal;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class RecordConsentRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<RecordConsentRequest> CREATOR = new zzg();
  final int mVersionCode;
  private final Account zzOY;
  private final String zzRU;
  private final Scope[] zzaOm;
  
  RecordConsentRequest(int paramInt, Account paramAccount, Scope[] paramArrayOfScope, String paramString)
  {
    mVersionCode = paramInt;
    zzOY = paramAccount;
    zzaOm = paramArrayOfScope;
    zzRU = paramString;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public Account getAccount()
  {
    return zzOY;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzg.zza(this, paramParcel, paramInt);
  }
  
  public String zzlG()
  {
    return zzRU;
  }
  
  public Scope[] zzzs()
  {
    return zzaOm;
  }
}
