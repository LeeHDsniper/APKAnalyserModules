package com.google.android.gms.internal;

import android.app.Activity;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.ViewTreeObserver.OnScrollChangedListener;
import com.google.android.gms.ads.internal.zzp;

public final class zzid
{
  private Activity zzIs;
  private boolean zzIt;
  private boolean zzIu;
  private boolean zzIv;
  private ViewTreeObserver.OnGlobalLayoutListener zzIw;
  private ViewTreeObserver.OnScrollChangedListener zzIx;
  
  public zzid(Activity paramActivity, ViewTreeObserver.OnGlobalLayoutListener paramOnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener paramOnScrollChangedListener)
  {
    zzIs = paramActivity;
    zzIw = paramOnGlobalLayoutListener;
    zzIx = paramOnScrollChangedListener;
  }
  
  private void zzgF()
  {
    if (zzIs == null) {}
    while (zzIt) {
      return;
    }
    if (zzIw != null) {
      zzp.zzbx().zza(zzIs, zzIw);
    }
    if (zzIx != null) {
      zzp.zzbx().zza(zzIs, zzIx);
    }
    zzIt = true;
  }
  
  private void zzgG()
  {
    if (zzIs == null) {}
    while (!zzIt) {
      return;
    }
    if (zzIw != null) {
      zzp.zzbz().zzb(zzIs, zzIw);
    }
    if (zzIx != null) {
      zzp.zzbx().zzb(zzIs, zzIx);
    }
    zzIt = false;
  }
  
  public void onAttachedToWindow()
  {
    zzIu = true;
    if (zzIv) {
      zzgF();
    }
  }
  
  public void onDetachedFromWindow()
  {
    zzIu = false;
    zzgG();
  }
  
  public void zzgD()
  {
    zzIv = true;
    if (zzIu) {
      zzgF();
    }
  }
  
  public void zzgE()
  {
    zzIv = false;
    zzgG();
  }
  
  public void zzl(Activity paramActivity)
  {
    zzIs = paramActivity;
  }
}
