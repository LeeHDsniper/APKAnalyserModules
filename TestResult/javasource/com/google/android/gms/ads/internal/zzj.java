package com.google.android.gms.ads.internal;

import android.content.Context;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.client.zzn;
import com.google.android.gms.ads.internal.client.zzo;
import com.google.android.gms.ads.internal.client.zzp.zza;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzct;
import com.google.android.gms.internal.zzcu;
import com.google.android.gms.internal.zzcv;
import com.google.android.gms.internal.zzcw;
import com.google.android.gms.internal.zzeh;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzlh;

@zzgk
public class zzj
  extends zzp.zza
{
  private final Context mContext;
  private zzn zzoS;
  private NativeAdOptionsParcel zzoX;
  private final String zzoZ;
  private final zzeh zzow;
  private final VersionInfoParcel zzpa;
  private zzct zzpf;
  private zzcu zzpg;
  private zzlh<String, zzcv> zzph;
  private zzlh<String, zzcw> zzpi;
  
  public zzj(Context paramContext, String paramString, zzeh paramZzeh, VersionInfoParcel paramVersionInfoParcel)
  {
    mContext = paramContext;
    zzoZ = paramString;
    zzow = paramZzeh;
    zzpa = paramVersionInfoParcel;
    zzpi = new zzlh();
    zzph = new zzlh();
  }
  
  public void zza(NativeAdOptionsParcel paramNativeAdOptionsParcel)
  {
    zzoX = paramNativeAdOptionsParcel;
  }
  
  public void zza(zzct paramZzct)
  {
    zzpf = paramZzct;
  }
  
  public void zza(zzcu paramZzcu)
  {
    zzpg = paramZzcu;
  }
  
  public void zza(String paramString, zzcw paramZzcw, zzcv paramZzcv)
  {
    if (TextUtils.isEmpty(paramString)) {
      throw new IllegalArgumentException("Custom template ID for native custom template ad is empty. Please provide a valid template id.");
    }
    zzpi.put(paramString, paramZzcw);
    zzph.put(paramString, paramZzcv);
  }
  
  public void zzb(zzn paramZzn)
  {
    zzoS = paramZzn;
  }
  
  public zzo zzbk()
  {
    return new zzi(mContext, zzoZ, zzow, zzpa, zzoS, zzpf, zzpg, zzpi, zzph, zzoX);
  }
}
