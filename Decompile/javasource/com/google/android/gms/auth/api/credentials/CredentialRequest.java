package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public final class CredentialRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<CredentialRequest> CREATOR = new zzc();
  final int mVersionCode;
  private final boolean zzRj;
  private final String[] zzRk;
  private final CredentialPickerConfig zzRl;
  private final CredentialPickerConfig zzRm;
  
  CredentialRequest(int paramInt, boolean paramBoolean, String[] paramArrayOfString, CredentialPickerConfig paramCredentialPickerConfig1, CredentialPickerConfig paramCredentialPickerConfig2)
  {
    mVersionCode = paramInt;
    zzRj = paramBoolean;
    zzRk = ((String[])zzx.zzv(paramArrayOfString));
    paramArrayOfString = paramCredentialPickerConfig1;
    if (paramCredentialPickerConfig1 == null) {
      paramArrayOfString = new CredentialPickerConfig.Builder().build();
    }
    zzRl = paramArrayOfString;
    paramArrayOfString = paramCredentialPickerConfig2;
    if (paramCredentialPickerConfig2 == null) {
      paramArrayOfString = new CredentialPickerConfig.Builder().build();
    }
    zzRm = paramArrayOfString;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String[] getAccountTypes()
  {
    return zzRk;
  }
  
  public CredentialPickerConfig getCredentialHintPickerConfig()
  {
    return zzRm;
  }
  
  public CredentialPickerConfig getCredentialPickerConfig()
  {
    return zzRl;
  }
  
  public boolean getSupportsPasswordLogin()
  {
    return zzRj;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }
}
