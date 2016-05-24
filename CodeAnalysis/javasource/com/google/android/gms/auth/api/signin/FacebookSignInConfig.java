package com.google.android.gms.auth.api.signin;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;

public class FacebookSignInConfig
  implements SafeParcelable
{
  public static final Parcelable.Creator<FacebookSignInConfig> CREATOR = new zzb();
  private Intent mIntent;
  final int versionCode;
  private final ArrayList<String> zzRR;
  
  public FacebookSignInConfig()
  {
    this(1, null, new ArrayList());
  }
  
  FacebookSignInConfig(int paramInt, Intent paramIntent, ArrayList<String> paramArrayList)
  {
    versionCode = paramInt;
    mIntent = paramIntent;
    zzRR = paramArrayList;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }
  
  public Intent zzlD()
  {
    return mIntent;
  }
  
  public ArrayList<String> zzlE()
  {
    return new ArrayList(zzRR);
  }
}
