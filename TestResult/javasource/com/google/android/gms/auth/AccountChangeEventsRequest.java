package com.google.android.gms.auth;

import android.accounts.Account;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class AccountChangeEventsRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<AccountChangeEventsRequest> CREATOR = new zzb();
  final int mVersion;
  Account zzOY;
  @Deprecated
  String zzQE;
  int zzQG;
  
  public AccountChangeEventsRequest()
  {
    mVersion = 1;
  }
  
  AccountChangeEventsRequest(int paramInt1, int paramInt2, String paramString, Account paramAccount)
  {
    mVersion = paramInt1;
    zzQG = paramInt2;
    zzQE = paramString;
    if ((paramAccount == null) && (!TextUtils.isEmpty(paramString)))
    {
      zzOY = new Account(paramString, "com.google");
      return;
    }
    zzOY = paramAccount;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
}
