package com.google.android.gms.ads.internal;

import android.net.Uri.Builder;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzbu;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhj.zza;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzip;

@zzgk
public class zze
{
  private zza zzoH;
  private boolean zzoI;
  private boolean zzoJ;
  
  public zze()
  {
    zzoJ = ((Boolean)zzby.zzud.get()).booleanValue();
  }
  
  public zze(boolean paramBoolean)
  {
    zzoJ = paramBoolean;
  }
  
  public void recordClick()
  {
    zzoI = true;
  }
  
  public void zza(zza paramZza)
  {
    zzoH = paramZza;
  }
  
  public boolean zzbe()
  {
    return (!zzoJ) || (zzoI);
  }
  
  public void zzp(String paramString)
  {
    zzb.zzaC("Action was blocked because no click was detected.");
    if (zzoH != null) {
      zzoH.zzq(paramString);
    }
  }
  
  public static abstract interface zza
  {
    public abstract void zzq(String paramString);
  }
  
  @zzgk
  public static class zzb
    implements zze.zza
  {
    private final zzhj.zza zzoK;
    private final zzip zzoL;
    
    public zzb(zzhj.zza paramZza, zzip paramZzip)
    {
      zzoK = paramZza;
      zzoL = paramZzip;
    }
    
    public void zzq(String paramString)
    {
      zzb.zzaC("An auto-clicking creative is blocked");
      Uri.Builder localBuilder = new Uri.Builder();
      localBuilder.scheme("https");
      localBuilder.path("//pagead2.googlesyndication.com/pagead/gen_204");
      localBuilder.appendQueryParameter("id", "gmob-apps-blocked-navigation");
      if (!TextUtils.isEmpty(paramString)) {
        localBuilder.appendQueryParameter("navigationURL", paramString);
      }
      if ((zzoK != null) && (zzoK.zzGM != null) && (!TextUtils.isEmpty(zzoK.zzGM.zzEc))) {
        localBuilder.appendQueryParameter("debugDialog", zzoK.zzGM.zzEc);
      }
      zzp.zzbx().zzc(zzoL.getContext(), zzoL.zzgV().zzIz, localBuilder.toString());
    }
  }
}
