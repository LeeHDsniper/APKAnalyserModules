package com.google.android.gms.ads.internal;

import android.os.Build.VERSION;
import com.google.android.gms.ads.internal.overlay.zze;
import com.google.android.gms.ads.internal.purchase.zzi;
import com.google.android.gms.internal.zzbv;
import com.google.android.gms.internal.zzbw;
import com.google.android.gms.internal.zzbx;
import com.google.android.gms.internal.zzcb;
import com.google.android.gms.internal.zzdq;
import com.google.android.gms.internal.zzef;
import com.google.android.gms.internal.zzga;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzgs;
import com.google.android.gms.internal.zzhl;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzhv;
import com.google.android.gms.internal.zzhz;
import com.google.android.gms.internal.zzir;
import com.google.android.gms.internal.zzlm;
import com.google.android.gms.internal.zzlo;

@zzgk
public class zzp
{
  private static zzp zzpF;
  private static final Object zzpm = new Object();
  private final com.google.android.gms.ads.internal.request.zza zzpG = new com.google.android.gms.ads.internal.request.zza();
  private final com.google.android.gms.ads.internal.overlay.zza zzpH = new com.google.android.gms.ads.internal.overlay.zza();
  private final zze zzpI = new zze();
  private final zzga zzpJ = new zzga();
  private final zzhu zzpK = new zzhu();
  private final zzir zzpL = new zzir();
  private final zzhv zzpM = zzhv.zzL(Build.VERSION.SDK_INT);
  private final zzhl zzpN = new zzhl(zzpK);
  private final zzlm zzpO = new zzlo();
  private final zzcb zzpP = new zzcb();
  private final zzgs zzpQ = new zzgs();
  private final zzbw zzpR = new zzbw();
  private final zzbv zzpS = new zzbv();
  private final zzbx zzpT = new zzbx();
  private final zzi zzpU = new zzi();
  private final zzhz zzpV = new zzhz();
  private final zzef zzpW = new zzef();
  private final zzdq zzpX = new zzdq();
  
  static
  {
    zza(new zzp());
  }
  
  protected zzp() {}
  
  protected static void zza(zzp paramZzp)
  {
    synchronized (zzpm)
    {
      zzpF = paramZzp;
      return;
    }
  }
  
  public static zzhl zzbA()
  {
    return zzbszzpN;
  }
  
  public static zzlm zzbB()
  {
    return zzbszzpO;
  }
  
  public static zzcb zzbC()
  {
    return zzbszzpP;
  }
  
  public static zzgs zzbD()
  {
    return zzbszzpQ;
  }
  
  public static zzbw zzbE()
  {
    return zzbszzpR;
  }
  
  public static zzbv zzbF()
  {
    return zzbszzpS;
  }
  
  public static zzbx zzbG()
  {
    return zzbszzpT;
  }
  
  public static zzi zzbH()
  {
    return zzbszzpU;
  }
  
  public static zzhz zzbI()
  {
    return zzbszzpV;
  }
  
  public static zzef zzbJ()
  {
    return zzbszzpW;
  }
  
  public static zzdq zzbK()
  {
    return zzbszzpX;
  }
  
  private static zzp zzbs()
  {
    synchronized (zzpm)
    {
      zzp localZzp = zzpF;
      return localZzp;
    }
  }
  
  public static com.google.android.gms.ads.internal.request.zza zzbt()
  {
    return zzbszzpG;
  }
  
  public static com.google.android.gms.ads.internal.overlay.zza zzbu()
  {
    return zzbszzpH;
  }
  
  public static zze zzbv()
  {
    return zzbszzpI;
  }
  
  public static zzga zzbw()
  {
    return zzbszzpJ;
  }
  
  public static zzhu zzbx()
  {
    return zzbszzpK;
  }
  
  public static zzir zzby()
  {
    return zzbszzpL;
  }
  
  public static zzhv zzbz()
  {
    return zzbszzpM;
  }
}
