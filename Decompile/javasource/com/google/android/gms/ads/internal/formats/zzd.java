package com.google.android.gms.ads.internal.formats;

import android.os.Bundle;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.internal.zzcj;
import com.google.android.gms.internal.zzcn.zza;
import com.google.android.gms.internal.zzgk;
import java.util.List;

@zzgk
public class zzd
  extends zzcn.zza
  implements zzh.zza
{
  private final Bundle mExtras;
  private final Object zzpc = new Object();
  private final String zzvK;
  private final List<zzc> zzvL;
  private final String zzvM;
  private final zzcj zzvN;
  private final String zzvO;
  private final double zzvP;
  private final String zzvQ;
  private final String zzvR;
  private final zza zzvS;
  private zzh zzvT;
  
  public zzd(String paramString1, List paramList, String paramString2, zzcj paramZzcj, String paramString3, double paramDouble, String paramString4, String paramString5, zza paramZza, Bundle paramBundle)
  {
    zzvK = paramString1;
    zzvL = paramList;
    zzvM = paramString2;
    zzvN = paramZzcj;
    zzvO = paramString3;
    zzvP = paramDouble;
    zzvQ = paramString4;
    zzvR = paramString5;
    zzvS = paramZza;
    mExtras = paramBundle;
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
  
  public String getPrice()
  {
    return zzvR;
  }
  
  public double getStarRating()
  {
    return zzvP;
  }
  
  public String getStore()
  {
    return zzvQ;
  }
  
  public void zza(zzh paramZzh)
  {
    synchronized (zzpc)
    {
      zzvT = paramZzh;
      return;
    }
  }
  
  public zzcj zzds()
  {
    return zzvN;
  }
  
  public com.google.android.gms.dynamic.zzd zzdt()
  {
    return zze.zzx(zzvT);
  }
  
  public String zzdu()
  {
    return "2";
  }
  
  public zza zzdv()
  {
    return zzvS;
  }
}
