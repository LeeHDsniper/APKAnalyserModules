package com.google.android.gms.ads.internal.client;

import android.location.Location;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.internal.zzgk;
import java.util.List;

@zzgk
public final class AdRequestParcel
  implements SafeParcelable
{
  public static final zzf CREATOR = new zzf();
  public final Bundle extras;
  public final int versionCode;
  public final Bundle zzsA;
  public final Bundle zzsB;
  public final List<String> zzsC;
  public final String zzsD;
  public final String zzsE;
  public final long zzsq;
  public final int zzsr;
  public final List<String> zzss;
  public final boolean zzst;
  public final int zzsu;
  public final boolean zzsv;
  public final String zzsw;
  public final SearchAdRequestParcel zzsx;
  public final Location zzsy;
  public final String zzsz;
  
  public AdRequestParcel(int paramInt1, long paramLong, Bundle paramBundle1, int paramInt2, List<String> paramList1, boolean paramBoolean1, int paramInt3, boolean paramBoolean2, String paramString1, SearchAdRequestParcel paramSearchAdRequestParcel, Location paramLocation, String paramString2, Bundle paramBundle2, Bundle paramBundle3, List<String> paramList2, String paramString3, String paramString4)
  {
    versionCode = paramInt1;
    zzsq = paramLong;
    Bundle localBundle = paramBundle1;
    if (paramBundle1 == null) {
      localBundle = new Bundle();
    }
    extras = localBundle;
    zzsr = paramInt2;
    zzss = paramList1;
    zzst = paramBoolean1;
    zzsu = paramInt3;
    zzsv = paramBoolean2;
    zzsw = paramString1;
    zzsx = paramSearchAdRequestParcel;
    zzsy = paramLocation;
    zzsz = paramString2;
    zzsA = paramBundle2;
    zzsB = paramBundle3;
    zzsC = paramList2;
    zzsD = paramString3;
    zzsE = paramString4;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof AdRequestParcel)) {}
    do
    {
      return false;
      paramObject = (AdRequestParcel)paramObject;
    } while ((versionCode != versionCode) || (zzsq != zzsq) || (!zzw.equal(extras, extras)) || (zzsr != zzsr) || (!zzw.equal(zzss, zzss)) || (zzst != zzst) || (zzsu != zzsu) || (zzsv != zzsv) || (!zzw.equal(zzsw, zzsw)) || (!zzw.equal(zzsx, zzsx)) || (!zzw.equal(zzsy, zzsy)) || (!zzw.equal(zzsz, zzsz)) || (!zzw.equal(zzsA, zzsA)) || (!zzw.equal(zzsB, zzsB)) || (!zzw.equal(zzsC, zzsC)) || (!zzw.equal(zzsD, zzsD)) || (!zzw.equal(zzsE, zzsE)));
    return true;
  }
  
  public int hashCode()
  {
    return zzw.hashCode(new Object[] { Integer.valueOf(versionCode), Long.valueOf(zzsq), extras, Integer.valueOf(zzsr), zzss, Boolean.valueOf(zzst), Integer.valueOf(zzsu), Boolean.valueOf(zzsv), zzsw, zzsx, zzsy, zzsz, zzsA, zzsB, zzsC, zzsD, zzsE });
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzf.zza(this, paramParcel, paramInt);
  }
}
