package com.google.android.gms.internal;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View.MeasureSpec;
import android.webkit.WebView;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;

@zzgk
public class zzfx
  implements Runnable
{
  private final Handler zzCs;
  private final long zzCt;
  private long zzCu;
  private zziq.zza zzCv;
  protected boolean zzCw;
  protected boolean zzCx;
  private final int zznP;
  private final int zznQ;
  protected final zzip zzoL;
  
  public zzfx(zziq.zza paramZza, zzip paramZzip, int paramInt1, int paramInt2)
  {
    this(paramZza, paramZzip, paramInt1, paramInt2, 200L, 50L);
  }
  
  public zzfx(zziq.zza paramZza, zzip paramZzip, int paramInt1, int paramInt2, long paramLong1, long paramLong2)
  {
    zzCt = paramLong1;
    zzCu = paramLong2;
    zzCs = new Handler(Looper.getMainLooper());
    zzoL = paramZzip;
    zzCv = paramZza;
    zzCw = false;
    zzCx = false;
    zznQ = paramInt2;
    zznP = paramInt1;
  }
  
  public void run()
  {
    if ((zzoL == null) || (zzfn()))
    {
      zzCv.zza(zzoL, true);
      return;
    }
    new zza(zzoL.getWebView()).execute(new Void[0]);
  }
  
  public void zza(AdResponseParcel paramAdResponseParcel)
  {
    zza(paramAdResponseParcel, new zzix(this, zzoL, zzEe));
  }
  
  public void zza(AdResponseParcel paramAdResponseParcel, zzix paramZzix)
  {
    zzoL.setWebViewClient(paramZzix);
    zzip localZzip = zzoL;
    if (TextUtils.isEmpty(zzAT)) {}
    for (paramZzix = null;; paramZzix = zzp.zzbx().zzaw(zzAT))
    {
      localZzip.loadDataWithBaseURL(paramZzix, body, "text/html", "UTF-8", null);
      return;
    }
  }
  
  public void zzfl()
  {
    zzCs.postDelayed(this, zzCt);
  }
  
  public void zzfm()
  {
    try
    {
      zzCw = true;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean zzfn()
  {
    try
    {
      boolean bool = zzCw;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean zzfo()
  {
    return zzCx;
  }
  
  protected final class zza
    extends AsyncTask<Void, Void, Boolean>
  {
    private final WebView zzCy;
    private Bitmap zzCz;
    
    public zza(WebView paramWebView)
    {
      zzCy = paramWebView;
    }
    
    protected void onPreExecute()
    {
      try
      {
        zzCz = Bitmap.createBitmap(zzfx.zza(zzfx.this), zzfx.zzb(zzfx.this), Bitmap.Config.ARGB_8888);
        zzCy.setVisibility(0);
        zzCy.measure(View.MeasureSpec.makeMeasureSpec(zzfx.zza(zzfx.this), 0), View.MeasureSpec.makeMeasureSpec(zzfx.zzb(zzfx.this), 0));
        zzCy.layout(0, 0, zzfx.zza(zzfx.this), zzfx.zzb(zzfx.this));
        Canvas localCanvas = new Canvas(zzCz);
        zzCy.draw(localCanvas);
        zzCy.invalidate();
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }
    
    protected Boolean zza(Void... paramVarArgs)
    {
      for (;;)
      {
        int i;
        int m;
        try
        {
          int n = zzCz.getWidth();
          int i1 = zzCz.getHeight();
          if ((n == 0) || (i1 == 0))
          {
            paramVarArgs = Boolean.valueOf(false);
            return paramVarArgs;
          }
          i = 0;
          j = 0;
          int k;
          if (i < n)
          {
            k = 0;
            if (k >= i1) {
              break label139;
            }
            m = j;
            if (zzCz.getPixel(i, k) != 0) {
              m = j + 1;
            }
          }
          else
          {
            if (j / (n * i1 / 100.0D) > 0.1D)
            {
              bool = true;
              paramVarArgs = Boolean.valueOf(bool);
              continue;
            }
            boolean bool = false;
            continue;
          }
          k += 10;
        }
        finally {}
        int j = m;
        continue;
        label139:
        i += 10;
      }
    }
    
    protected void zza(Boolean paramBoolean)
    {
      zzfx.zzc(zzfx.this);
      if ((paramBoolean.booleanValue()) || (zzfn()) || (zzfx.zzd(zzfx.this) <= 0L))
      {
        zzCx = paramBoolean.booleanValue();
        zzfx.zze(zzfx.this).zza(zzoL, true);
      }
      while (zzfx.zzd(zzfx.this) <= 0L) {
        return;
      }
      if (zzb.zzM(2)) {
        zzb.zzaC("Ad not detected, scheduling another run.");
      }
      zzfx.zzg(zzfx.this).postDelayed(zzfx.this, zzfx.zzf(zzfx.this));
    }
  }
}
