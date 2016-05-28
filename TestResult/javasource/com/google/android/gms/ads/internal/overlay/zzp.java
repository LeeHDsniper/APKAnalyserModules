package com.google.android.gms.ads.internal.overlay;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.TextureView;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzbu;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzcc;
import com.google.android.gms.internal.zzcd;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzhx;
import com.google.android.gms.internal.zzhx.zza;
import com.google.android.gms.internal.zzhx.zzb;
import com.google.android.gms.internal.zzlm;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

public class zzp
{
  private final Context mContext;
  private boolean zzBA;
  private long zzBB = -1L;
  private final String zzBm;
  private final zzcc zzBn;
  private final zzcd zzBo;
  private final VersionInfoParcel zzBp;
  private final zzhx zzBq = new zzhx.zzb().zza("min_1", Double.MIN_VALUE, 1.0D).zza("1_5", 1.0D, 5.0D).zza("5_10", 5.0D, 10.0D).zza("10_20", 10.0D, 20.0D).zza("20_30", 20.0D, 30.0D).zza("30_max", 30.0D, Double.MAX_VALUE).zzgz();
  private final long[] zzBr;
  private final String[] zzBs;
  private zzcc zzBt;
  private zzcc zzBu;
  private zzcc zzBv;
  private zzcc zzBw;
  private boolean zzBx;
  private zzi zzBy;
  private boolean zzBz;
  
  public zzp(Context paramContext, VersionInfoParcel paramVersionInfoParcel, String paramString, zzcd paramZzcd, zzcc paramZzcc)
  {
    mContext = paramContext;
    zzBp = paramVersionInfoParcel;
    zzBm = paramString;
    zzBo = paramZzcd;
    zzBn = paramZzcc;
    paramContext = (String)zzby.zzuq.get();
    if (paramContext == null)
    {
      zzBs = new String[0];
      zzBr = new long[0];
      return;
    }
    paramContext = TextUtils.split(paramContext, ",");
    zzBs = new String[paramContext.length];
    zzBr = new long[paramContext.length];
    int i = 0;
    while (i < paramContext.length) {
      try
      {
        zzBr[i] = Long.parseLong(paramContext[i]);
        i += 1;
      }
      catch (NumberFormatException paramVersionInfoParcel)
      {
        for (;;)
        {
          zzb.zzd("Unable to parse frame hash target time number.", paramVersionInfoParcel);
          zzBr[i] = -1L;
        }
      }
    }
  }
  
  private void zzc(zzi paramZzi)
  {
    long l1 = ((Long)zzby.zzur.get()).longValue();
    long l2 = paramZzi.getCurrentPosition();
    int i = 0;
    if (i < zzBs.length)
    {
      if (zzBs[i] != null) {}
      while (l1 <= Math.abs(l2 - zzBr[i]))
      {
        i += 1;
        break;
      }
      zzBs[i] = zza(paramZzi);
    }
  }
  
  private void zzeX()
  {
    if ((zzBv != null) && (zzBw == null))
    {
      zzBo.zza(zzBv, new String[] { "vff" });
      zzBo.zza(zzBn, new String[] { "vtt" });
      zzBw = zzBo.zzdl();
    }
    long l = com.google.android.gms.ads.internal.zzp.zzbB().nanoTime();
    if ((zzBx) && (zzBA) && (zzBB != -1L))
    {
      double d = TimeUnit.SECONDS.toNanos(1L) / (l - zzBB);
      zzBq.zza(d);
    }
    zzBA = zzBx;
    zzBB = l;
  }
  
  public void onStop()
  {
    if ((((Boolean)zzby.zzup.get()).booleanValue()) && (!zzBz))
    {
      Bundle localBundle = new Bundle();
      localBundle.putString("type", "native-player-metrics");
      localBundle.putString("request", zzBm);
      localBundle.putString("player", zzBy.zzek());
      Object localObject = zzBq.getBuckets().iterator();
      while (((Iterator)localObject).hasNext())
      {
        zzhx.zza localZza = (zzhx.zza)((Iterator)localObject).next();
        localBundle.putString("fps_c_" + name, Integer.toString(count));
        localBundle.putString("fps_p_" + name, Double.toString(zzIb));
      }
      int i = 0;
      if (i < zzBr.length)
      {
        localObject = zzBs[i];
        if (localObject == null) {}
        for (;;)
        {
          i += 1;
          break;
          localBundle.putString("fh_" + Long.valueOf(zzBr[i]), (String)localObject);
        }
      }
      com.google.android.gms.ads.internal.zzp.zzbx().zza(mContext, zzBp.zzIz, "gmob-apps", localBundle, true);
      zzBz = true;
    }
  }
  
  String zza(TextureView paramTextureView)
  {
    paramTextureView = paramTextureView.getBitmap(8, 8);
    long l2 = 0L;
    long l1 = 63L;
    int i = 0;
    while (i < 8)
    {
      long l3 = l1;
      int j = 0;
      l1 = l2;
      l2 = l3;
      if (j < 8)
      {
        int k = paramTextureView.getPixel(j, i);
        int m = Color.blue(k);
        int n = Color.red(k);
        if (Color.green(k) + (m + n) > 128) {}
        for (l3 = 1L;; l3 = 0L)
        {
          l1 |= l3 << (int)l2;
          l2 -= 1L;
          j += 1;
          break;
        }
      }
      i += 1;
      l3 = l1;
      l1 = l2;
      l2 = l3;
    }
    return String.format("%016X", new Object[] { Long.valueOf(l2) });
  }
  
  public void zza(zzi paramZzi)
  {
    zzBo.zza(zzBn, new String[] { "vpc" });
    zzBt = zzBo.zzdl();
    zzBy = paramZzi;
  }
  
  public void zzb(zzi paramZzi)
  {
    zzeX();
    zzc(paramZzi);
  }
  
  public void zzeL()
  {
    if ((zzBt == null) || (zzBu != null)) {
      return;
    }
    zzBo.zza(zzBt, new String[] { "vfr" });
    zzBu = zzBo.zzdl();
  }
  
  public void zzeY()
  {
    zzBx = true;
    if ((zzBu != null) && (zzBv == null))
    {
      zzBo.zza(zzBu, new String[] { "vfp" });
      zzBv = zzBo.zzdl();
    }
  }
  
  public void zzeZ()
  {
    zzBx = false;
  }
}
