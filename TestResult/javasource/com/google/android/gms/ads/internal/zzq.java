package com.google.android.gms.ads.internal;

import android.app.Activity;
import android.content.Context;
import android.os.RemoteException;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.ViewTreeObserver.OnScrollChangedListener;
import android.widget.ViewSwitcher;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzm;
import com.google.android.gms.ads.internal.client.zzn;
import com.google.android.gms.ads.internal.client.zzt;
import com.google.android.gms.ads.internal.client.zzu;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzan;
import com.google.android.gms.internal.zzby;
import com.google.android.gms.internal.zzca;
import com.google.android.gms.internal.zzch;
import com.google.android.gms.internal.zzct;
import com.google.android.gms.internal.zzcu;
import com.google.android.gms.internal.zzcv;
import com.google.android.gms.internal.zzcw;
import com.google.android.gms.internal.zzei;
import com.google.android.gms.internal.zzfm;
import com.google.android.gms.internal.zzfq;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhj;
import com.google.android.gms.internal.zzhj.zza;
import com.google.android.gms.internal.zzhk;
import com.google.android.gms.internal.zzhl;
import com.google.android.gms.internal.zzho;
import com.google.android.gms.internal.zzhq;
import com.google.android.gms.internal.zzhw;
import com.google.android.gms.internal.zzib;
import com.google.android.gms.internal.zzid;
import com.google.android.gms.internal.zzip;
import com.google.android.gms.internal.zziq;
import com.google.android.gms.internal.zzlh;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

@zzgk
public final class zzq
  implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener
{
  public final Context context;
  final String zzpY;
  public String zzpZ;
  boolean zzpk = false;
  boolean zzqA = false;
  private HashSet<zzhk> zzqB = null;
  private int zzqC = -1;
  private int zzqD = -1;
  private zzib zzqE;
  final zzan zzqa;
  public final VersionInfoParcel zzqb;
  zza zzqc;
  public zzhq zzqd;
  public zzhq zzqe;
  public AdSizeParcel zzqf;
  public zzhj zzqg;
  public zzhj.zza zzqh;
  public zzhk zzqi;
  zzm zzqj;
  zzn zzqk;
  zzt zzql;
  zzu zzqm;
  zzfm zzqn;
  zzfq zzqo;
  zzct zzqp;
  zzcu zzqq;
  zzlh<String, zzcv> zzqr;
  zzlh<String, zzcw> zzqs;
  NativeAdOptionsParcel zzqt;
  zzch zzqu;
  List<String> zzqv;
  com.google.android.gms.ads.internal.purchase.zzk zzqw;
  public zzho zzqx = null;
  View zzqy = null;
  public int zzqz = 0;
  
  public zzq(Context paramContext, AdSizeParcel paramAdSizeParcel, String paramString, VersionInfoParcel paramVersionInfoParcel)
  {
    this(paramContext, paramAdSizeParcel, paramString, paramVersionInfoParcel, null);
  }
  
  zzq(Context paramContext, AdSizeParcel paramAdSizeParcel, String paramString, VersionInfoParcel paramVersionInfoParcel, zzan paramZzan)
  {
    zzby.zzw(paramContext);
    if (zzp.zzbA().zzgc() != null)
    {
      List localList = zzby.zzde();
      if (zzIA != 0) {
        localList.add(Integer.toString(zzIA));
      }
      zzp.zzbA().zzgc().zzb(localList);
    }
    zzpY = UUID.randomUUID().toString();
    if ((zzsH) || (zzsJ))
    {
      zzqc = null;
      zzqf = paramAdSizeParcel;
      zzpZ = paramString;
      context = paramContext;
      zzqb = paramVersionInfoParcel;
      if (paramZzan == null) {
        break label231;
      }
    }
    for (;;)
    {
      zzqa = paramZzan;
      zzqE = new zzib(200L);
      zzqs = new zzlh();
      return;
      zzqc = new zza(paramContext, this, this);
      zzqc.setMinimumWidth(widthPixels);
      zzqc.setMinimumHeight(heightPixels);
      zzqc.setVisibility(4);
      break;
      label231:
      paramZzan = new zzan(new zzh(this));
    }
  }
  
  private void zze(boolean paramBoolean)
  {
    boolean bool = true;
    if ((zzqc == null) || (zzqg == null) || (zzqg.zzAR == null)) {}
    do
    {
      do
      {
        return;
      } while ((!zzqg.zzAR.zzgS().zzbY()) || ((paramBoolean) && (!zzqE.tryAcquire())));
      localObject = new int[2];
      zzqc.getLocationOnScreen((int[])localObject);
      i = com.google.android.gms.ads.internal.client.zzk.zzcE().zzc(context, localObject[0]);
      j = com.google.android.gms.ads.internal.client.zzk.zzcE().zzc(context, localObject[1]);
    } while ((i == zzqC) && (j == zzqD));
    zzqC = i;
    zzqD = j;
    Object localObject = zzqg.zzAR.zzgS();
    int i = zzqC;
    int j = zzqD;
    if (!paramBoolean) {}
    for (paramBoolean = bool;; paramBoolean = false)
    {
      ((zziq)localObject).zza(i, j, paramBoolean);
      return;
    }
  }
  
  public void destroy()
  {
    zzbR();
    zzqk = null;
    zzql = null;
    zzqo = null;
    zzqn = null;
    zzqu = null;
    zzqm = null;
    zzf(false);
    if (zzqc != null) {
      zzqc.removeAllViews();
    }
    zzbM();
    zzbO();
    zzqg = null;
  }
  
  public void onGlobalLayout()
  {
    zze(false);
  }
  
  public void onScrollChanged()
  {
    zze(true);
  }
  
  public void zza(HashSet<zzhk> paramHashSet)
  {
    zzqB = paramHashSet;
  }
  
  public HashSet<zzhk> zzbL()
  {
    return zzqB;
  }
  
  public void zzbM()
  {
    if ((zzqg != null) && (zzqg.zzAR != null)) {
      zzqg.zzAR.destroy();
    }
  }
  
  public void zzbN()
  {
    if ((zzqg != null) && (zzqg.zzAR != null)) {
      zzqg.zzAR.stopLoading();
    }
  }
  
  public void zzbO()
  {
    if ((zzqg != null) && (zzqg.zzyR != null)) {}
    try
    {
      zzqg.zzyR.destroy();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzaE("Could not destroy mediation adapter.");
    }
  }
  
  public boolean zzbP()
  {
    return zzqz == 0;
  }
  
  public boolean zzbQ()
  {
    return zzqz == 1;
  }
  
  public void zzbR()
  {
    if (zzqc != null) {
      zzqc.zzbR();
    }
  }
  
  public void zzbS()
  {
    zzqi.zzl(zzqg.zzGI);
    zzqi.zzm(zzqg.zzGJ);
    zzqi.zzy(zzqf.zzsH);
    zzqi.zzz(zzqg.zzDX);
  }
  
  public void zzf(boolean paramBoolean)
  {
    if (zzqz == 0) {
      zzbN();
    }
    if (zzqd != null) {
      zzqd.cancel();
    }
    if (zzqe != null) {
      zzqe.cancel();
    }
    if (paramBoolean) {
      zzqg = null;
    }
  }
  
  public static final class zza
    extends ViewSwitcher
  {
    private final zzhw zzqF;
    private final zzid zzqG;
    
    public zza(Context paramContext, ViewTreeObserver.OnGlobalLayoutListener paramOnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener paramOnScrollChangedListener)
    {
      super();
      zzqF = new zzhw(paramContext);
      if ((paramContext instanceof Activity))
      {
        zzqG = new zzid((Activity)paramContext, paramOnGlobalLayoutListener, paramOnScrollChangedListener);
        zzqG.zzgD();
        return;
      }
      zzqG = null;
    }
    
    protected void onAttachedToWindow()
    {
      super.onAttachedToWindow();
      if (zzqG != null) {
        zzqG.onAttachedToWindow();
      }
    }
    
    protected void onDetachedFromWindow()
    {
      super.onDetachedFromWindow();
      if (zzqG != null) {
        zzqG.onDetachedFromWindow();
      }
    }
    
    public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
    {
      zzqF.zze(paramMotionEvent);
      return false;
    }
    
    public void removeAllViews()
    {
      Object localObject = new ArrayList();
      int i = 0;
      while (i < getChildCount())
      {
        View localView = getChildAt(i);
        if ((localView != null) && ((localView instanceof zzip))) {
          ((List)localObject).add((zzip)localView);
        }
        i += 1;
      }
      super.removeAllViews();
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext()) {
        ((zzip)((Iterator)localObject).next()).destroy();
      }
    }
    
    public void zzbR()
    {
      zzb.v("Disable position monitoring on adFrame.");
      if (zzqG != null) {
        zzqG.zzgE();
      }
    }
    
    public zzhw zzbT()
    {
      return zzqF;
    }
  }
}
