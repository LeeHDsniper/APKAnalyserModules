package com.google.android.gms.ads.internal;

import android.content.Context;
import android.os.Handler;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzo.zza;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.internal.zzct;
import com.google.android.gms.internal.zzcu;
import com.google.android.gms.internal.zzcv;
import com.google.android.gms.internal.zzcw;
import com.google.android.gms.internal.zzeh;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzlh;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

@zzgk
public class zzi
  extends zzo.zza
{
  private final Context mContext;
  private final com.google.android.gms.ads.internal.client.zzn zzoS;
  private final zzct zzoT;
  private final zzcu zzoU;
  private final zzlh<String, zzcw> zzoV;
  private final zzlh<String, zzcv> zzoW;
  private final NativeAdOptionsParcel zzoX;
  private final List<String> zzoY;
  private final String zzoZ;
  private final zzeh zzow;
  private final VersionInfoParcel zzpa;
  private WeakReference<zzn> zzpb;
  private Object zzpc = new Object();
  
  zzi(Context paramContext, String paramString, zzeh paramZzeh, VersionInfoParcel paramVersionInfoParcel, com.google.android.gms.ads.internal.client.zzn paramZzn, zzct paramZzct, zzcu paramZzcu, zzlh<String, zzcw> paramZzlh, zzlh<String, zzcv> paramZzlh1, NativeAdOptionsParcel paramNativeAdOptionsParcel)
  {
    mContext = paramContext;
    zzoZ = paramString;
    zzow = paramZzeh;
    zzpa = paramVersionInfoParcel;
    zzoS = paramZzn;
    zzoU = paramZzcu;
    zzoT = paramZzct;
    zzoV = paramZzlh;
    zzoW = paramZzlh1;
    zzoX = paramNativeAdOptionsParcel;
    zzoY = zzbi();
  }
  
  private List<String> zzbi()
  {
    ArrayList localArrayList = new ArrayList();
    if (zzoU != null) {
      localArrayList.add("1");
    }
    if (zzoT != null) {
      localArrayList.add("2");
    }
    if (zzoV.size() > 0) {
      localArrayList.add("3");
    }
    return localArrayList;
  }
  
  public String getMediationAdapterClassName()
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzpb != null)
        {
          Object localObject1 = (zzn)zzpb.get();
          if (localObject1 != null)
          {
            localObject1 = ((zzn)localObject1).getMediationAdapterClassName();
            return localObject1;
          }
        }
        else
        {
          return null;
        }
      }
      Object localObject3 = null;
    }
  }
  
  public boolean isLoading()
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzpb != null)
        {
          zzn localZzn = (zzn)zzpb.get();
          if (localZzn != null)
          {
            bool = localZzn.isLoading();
            return bool;
          }
        }
        else
        {
          return false;
        }
      }
      boolean bool = false;
    }
  }
  
  protected void runOnUiThread(Runnable paramRunnable)
  {
    zzhu.zzHK.post(paramRunnable);
  }
  
  protected zzn zzbj()
  {
    return new zzn(mContext, AdSizeParcel.zzs(mContext), zzoZ, zzow, zzpa);
  }
  
  public void zze(final AdRequestParcel paramAdRequestParcel)
  {
    runOnUiThread(new Runnable()
    {
      public void run()
      {
        synchronized (zzi.zza(zzi.this))
        {
          zzn localZzn = zzbj();
          zzi.zza(zzi.this, new WeakReference(localZzn));
          localZzn.zzb(zzi.zzb(zzi.this));
          localZzn.zzb(zzi.zzc(zzi.this));
          localZzn.zza(zzi.zzd(zzi.this));
          localZzn.zza(zzi.zze(zzi.this));
          localZzn.zzb(zzi.zzf(zzi.this));
          localZzn.zza(zzi.zzg(zzi.this));
          localZzn.zzb(zzi.zzh(zzi.this));
          localZzn.zza(paramAdRequestParcel);
          return;
        }
      }
    });
  }
}
