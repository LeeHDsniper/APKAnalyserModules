package com.google.android.gms.ads.internal.formats;

import android.os.Bundle;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.internal.zzcj;
import com.google.android.gms.internal.zzcp.zza;
import com.google.android.gms.internal.zzgk;
import java.util.List;

@zzgk
public class zze
  extends zzcp.zza
  implements zzh.zza
{
  private final Bundle mExtras;
  private final Object zzpc = new Object();
  private final String zzvK;
  private final List<zzc> zzvL;
  private final String zzvM;
  private final String zzvO;
  private final zza zzvS;
  private zzh zzvT;
  private final zzcj zzvU;
  private final String zzvV;
  
  public zze(String paramString1, List paramList, String paramString2, zzcj paramZzcj, String paramString3, String paramString4, zza paramZza, Bundle paramBundle)
  {
    zzvK = paramString1;
    zzvL = paramList;
    zzvM = paramString2;
    zzvU = paramZzcj;
    zzvO = paramString3;
    zzvV = paramString4;
    zzvS = paramZza;
    mExtras = paramBundle;
  }
  
  public String getAdvertiser()
  {
    return zzvV;
  }
  
  public String getBody()
  {
    return zzvM;
  }
  
  public String getCallToAction()
  {
    return zzvO;
  }
  
  public String getCustomTemplateId()
  {
    return "";
  }
  
  public Bundle getExtras()
  {
    return mExtras;
  }
  
  public String getHeadline()
  {
    return zzvK;
  }
  
  public List getImages()
  {
    return zzvL;
  }
  
  public void zza(zzh paramZzh)
  {
    synchronized (zzpc)
    {
      zzvT = paramZzh;
      return;
    }
  }
  
  public zzd zzdt()
  {
    return com.google.android.gms.dynamic.zze.zzx(zzvT);
  }
  
  public String zzdu()
  {
    return "1";
  }
  
  public zza zzdv()
  {
    return zzvS;
  }
  
  public zzcj zzdw()
  {
    return zzvU;
  }
}
