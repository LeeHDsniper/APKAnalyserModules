package com.google.android.gms.auth.api.signin;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;

public class GoogleSignInConfig
  implements SafeParcelable
{
  public static final Parcelable.Creator<GoogleSignInConfig> CREATOR = new zzc();
  final int versionCode;
  private final ArrayList<Scope> zzRR;
  
  public GoogleSignInConfig()
  {
    this(1, new ArrayList());
  }
  
  GoogleSignInConfig(int paramInt, ArrayList<Scope> paramArrayList)
  {
    versionCode = paramInt;
    zzRR = paramArrayList;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }
  
  public ArrayList<Scope> zzlE()
  {
    return new ArrayList(zzRR);
  }
}
