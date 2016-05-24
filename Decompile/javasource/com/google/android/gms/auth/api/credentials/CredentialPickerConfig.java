package com.google.android.gms.auth.api.credentials;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class CredentialPickerConfig
  implements SafeParcelable
{
  public static final Parcelable.Creator<CredentialPickerConfig> CREATOR = new zzb();
  private final boolean mShowCancelButton;
  final int mVersionCode;
  private final boolean zzRi;
  
  CredentialPickerConfig(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    mVersionCode = paramInt;
    zzRi = paramBoolean1;
    mShowCancelButton = paramBoolean2;
  }
  
  private CredentialPickerConfig(Builder paramBuilder)
  {
    this(1, Builder.zza(paramBuilder), Builder.zzb(paramBuilder));
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean shouldShowAddAccountButton()
  {
    return zzRi;
  }
  
  public boolean shouldShowCancelButton()
  {
    return mShowCancelButton;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
  
  public static class Builder
  {
    private boolean mShowCancelButton = true;
    private boolean zzRi = false;
    
    public Builder() {}
    
    public CredentialPickerConfig build()
    {
      return new CredentialPickerConfig(this, null);
    }
  }
}
