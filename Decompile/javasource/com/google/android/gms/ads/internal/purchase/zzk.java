package com.google.android.gms.ads.internal.purchase;

import android.content.Intent;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhu;

@zzgk
public class zzk
{
  private final String zztn;
  
  public zzk(String paramString)
  {
    zztn = paramString;
  }
  
  public boolean zza(String paramString, int paramInt, Intent paramIntent)
  {
    if ((paramString == null) || (paramIntent == null)) {}
    String str;
    do
    {
      return false;
      str = zzp.zzbH().zze(paramIntent);
      paramIntent = zzp.zzbH().zzf(paramIntent);
    } while ((str == null) || (paramIntent == null));
    if (!paramString.equals(zzp.zzbH().zzal(str)))
    {
      zzb.zzaE("Developer payload not match.");
      return false;
    }
    if ((zztn != null) && (!zzl.zzc(zztn, str, paramIntent)))
    {
      zzb.zzaE("Fail to verify signature.");
      return false;
    }
    return true;
  }
  
  public String zzfk()
  {
    return zzp.zzbx().zzgs();
  }
}
