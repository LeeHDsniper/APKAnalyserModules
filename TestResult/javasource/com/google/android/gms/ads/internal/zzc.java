package com.google.android.gms.ads.internal;

import android.content.Context;
import android.os.Handler;
import android.os.RemoteException;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzcd;
import com.google.android.gms.internal.zzce;
import com.google.android.gms.internal.zzcg;
import com.google.android.gms.internal.zzch;
import com.google.android.gms.internal.zzeh;
import com.google.android.gms.internal.zzfc;
import com.google.android.gms.internal.zzga;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhj;
import com.google.android.gms.internal.zzhj.zza;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzhw;
import com.google.android.gms.internal.zzip;
import com.google.android.gms.internal.zziq;
import com.google.android.gms.internal.zzir;

@zzgk
public abstract class zzc
  extends zzb
  implements zzg, zzfc
{
  public zzc(Context paramContext, AdSizeParcel paramAdSizeParcel, String paramString, zzeh paramZzeh, VersionInfoParcel paramVersionInfoParcel, zzd paramZzd)
  {
    super(paramContext, paramAdSizeParcel, paramString, paramZzeh, paramVersionInfoParcel, paramZzd);
  }
  
  public void recordClick()
  {
    onAdClicked();
  }
  
  public void recordImpression()
  {
    zza(zzos.zzqg, false);
  }
  
  protected zzip zza(zzhj.zza paramZza, zze paramZze)
  {
    Object localObject = zzos.zzqc.getNextView();
    if ((localObject instanceof zzip))
    {
      com.google.android.gms.ads.internal.util.client.zzb.zzaC("Reusing webview...");
      localObject = (zzip)localObject;
      ((zzip)localObject).zza(zzos.context, zzos.zzqf);
    }
    for (;;)
    {
      ((zzip)localObject).zzgS().zzb(this, this, this, this, false, this, null, paramZze, this);
      ((zzip)localObject).zzaG(zzGL.zzDQ);
      ((zzip)localObject).zzaH(zzGL.zzDO);
      return localObject;
      if (localObject != null) {
        zzos.zzqc.removeView((View)localObject);
      }
      localObject = zzp.zzby().zza(zzos.context, zzos.zzqf, false, false, zzos.zzqa, zzos.zzqb, zzov);
      if (zzos.zzqf.zzsI == null) {
        zzb(((zzip)localObject).getWebView());
      }
    }
  }
  
  public void zza(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    zzaS();
  }
  
  public void zza(zzch paramZzch)
  {
    zzx.zzch("setOnCustomRenderedAdLoadedListener must be called on the main UI thread.");
    zzos.zzqu = paramZzch;
  }
  
  protected void zza(final zzhj.zza paramZza, final zzcd paramZzcd)
  {
    if (errorCode != -2)
    {
      zzhu.zzHK.post(new Runnable()
      {
        public void run()
        {
          zzb(new zzhj(paramZza, null, null, null, null, null, null));
        }
      });
      return;
    }
    if (zzqf != null) {
      zzos.zzqf = zzqf;
    }
    if (zzGM.zzDX)
    {
      zzos.zzqz = 0;
      zzos.zzqe = zzp.zzbw().zza(zzos.context, this, paramZza, zzos.zzqa, null, zzow, this, paramZzcd);
      return;
    }
    zzhu.zzHK.post(new Runnable()
    {
      public void run()
      {
        if ((paramZzazzGM.zzEg) && (zzos.zzqu != null))
        {
          Object localObject = null;
          if (paramZzazzGM.zzAT != null) {
            localObject = zzp.zzbx().zzaw(paramZzazzGM.zzAT);
          }
          localObject = new zzce(zzc.this, (String)localObject, paramZzazzGM.body);
          zzos.zzqz = 1;
          try
          {
            zzos.zzqu.zza((zzcg)localObject);
            return;
          }
          catch (RemoteException localRemoteException)
          {
            com.google.android.gms.ads.internal.util.client.zzb.zzd("Could not call the onCustomRenderedAdLoadedListener.", localRemoteException);
          }
        }
        final zze localZze = new zze();
        zzip localZzip = zza(paramZza, localZze);
        localZze.zza(new zze.zzb(paramZza, localZzip));
        localZzip.setOnTouchListener(new View.OnTouchListener()
        {
          public boolean onTouch(View paramAnonymous2View, MotionEvent paramAnonymous2MotionEvent)
          {
            localZze.recordClick();
            return false;
          }
        });
        localZzip.setOnClickListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymous2View)
          {
            localZze.recordClick();
          }
        });
        zzos.zzqz = 0;
        zzos.zzqe = zzp.zzbw().zza(zzos.context, zzc.this, paramZza, zzos.zzqa, localZzip, zzow, zzc.this, paramZzcd);
      }
    });
  }
  
  protected boolean zza(zzhj paramZzhj1, zzhj paramZzhj2)
  {
    if ((zzos.zzbP()) && (zzos.zzqc != null)) {
      zzos.zzqc.zzbT().zzaz(zzEc);
    }
    return super.zza(paramZzhj1, paramZzhj2);
  }
  
  public void zzbc()
  {
    zzaQ();
  }
  
  public void zzc(View paramView)
  {
    zzos.zzqy = paramView;
    zzb(new zzhj(zzos.zzqh, null, null, null, null, null, null));
  }
}
