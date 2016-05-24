package com.google.android.gms.ads.internal.formats;

import android.content.Context;
import android.os.RemoteException;
import android.view.View;
import android.view.View.OnClickListener;
import com.google.android.gms.ads.internal.zzn;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.internal.zzan;
import com.google.android.gms.internal.zzek;
import com.google.android.gms.internal.zzel;
import com.google.android.gms.internal.zzip;
import java.lang.ref.WeakReference;
import java.util.Map;

public class zzg
  extends zzh
{
  private Object zzpc = new Object();
  private zzek zzvZ;
  private zzel zzwa;
  private final zzn zzwb;
  private zzh zzwc;
  private boolean zzwd = false;
  
  private zzg(Context paramContext, zzn paramZzn, zzan paramZzan)
  {
    super(paramContext, paramZzn, null, paramZzan, null, null, null);
    zzwb = paramZzn;
  }
  
  public zzg(Context paramContext, zzn paramZzn, zzan paramZzan, zzek paramZzek)
  {
    this(paramContext, paramZzn, paramZzan);
    zzvZ = paramZzek;
  }
  
  public zzg(Context paramContext, zzn paramZzn, zzan paramZzan, zzel paramZzel)
  {
    this(paramContext, paramZzn, paramZzan);
    zzwa = paramZzel;
  }
  
  public void recordImpression()
  {
    zzx.zzch("recordImpression must be called on the main UI thread.");
    for (;;)
    {
      synchronized (zzpc)
      {
        zzl(true);
        if (zzwc != null)
        {
          zzwc.recordImpression();
          zzwb.recordImpression();
          return;
        }
        try
        {
          if ((zzvZ != null) && (!zzvZ.getOverrideClickHandling())) {
            zzvZ.recordImpression();
          }
        }
        catch (RemoteException localRemoteException)
        {
          com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to call recordImpression", localRemoteException);
        }
      }
      if ((zzwa != null) && (!zzwa.getOverrideClickHandling())) {
        zzwa.recordImpression();
      }
    }
  }
  
  public zzb zza(View.OnClickListener paramOnClickListener)
  {
    return null;
  }
  
  public void zzb(View paramView, Map<String, WeakReference<View>> paramMap)
  {
    zzx.zzch("performClick must be called on the main UI thread.");
    synchronized (zzpc)
    {
      if (zzwc != null) {
        zzwc.zzb(paramView, paramMap);
      }
      for (;;)
      {
        zzwb.onAdClicked();
        return;
        try
        {
          if ((zzvZ != null) && (!zzvZ.getOverrideClickHandling())) {
            zzvZ.zzc(zze.zzx(paramView));
          }
          if ((zzwa == null) || (zzwa.getOverrideClickHandling())) {
            continue;
          }
          zzvZ.zzc(zze.zzx(paramView));
        }
        catch (RemoteException paramView)
        {
          com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to call performClick", paramView);
        }
      }
    }
  }
  
  public void zzb(zzh paramZzh)
  {
    synchronized (zzpc)
    {
      zzwc = paramZzh;
      return;
    }
  }
  
  public boolean zzdx()
  {
    synchronized (zzpc)
    {
      boolean bool = zzwd;
      return bool;
    }
  }
  
  public zzip zzdy()
  {
    return null;
  }
  
  public void zzh(View paramView)
  {
    synchronized (zzpc)
    {
      zzwd = true;
      try
      {
        if (zzvZ != null) {
          zzvZ.zzd(zze.zzx(paramView));
        }
        for (;;)
        {
          zzwd = false;
          return;
          if (zzwa != null) {
            zzwa.zzd(zze.zzx(paramView));
          }
        }
      }
      catch (RemoteException paramView)
      {
        for (;;)
        {
          com.google.android.gms.ads.internal.util.client.zzb.zzd("Failed to call prepareAd", paramView);
        }
      }
    }
  }
}
