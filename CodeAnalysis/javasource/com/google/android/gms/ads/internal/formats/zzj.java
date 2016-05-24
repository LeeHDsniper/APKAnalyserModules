package com.google.android.gms.ads.internal.formats;

import android.graphics.Point;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.ViewTreeObserver.OnScrollChangedListener;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import com.google.android.gms.internal.zzcl.zza;
import com.google.android.gms.internal.zzhu;
import com.google.android.gms.internal.zzil;
import com.google.android.gms.internal.zzip;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

public class zzj
  extends zzcl.zza
  implements View.OnClickListener, View.OnTouchListener, ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener
{
  private final FrameLayout zznY;
  private final Object zzpc = new Object();
  private zzh zzvT;
  private final FrameLayout zzwq;
  private final Map<String, WeakReference<View>> zzwr = new HashMap();
  private zzb zzws;
  boolean zzwt = false;
  
  public zzj(FrameLayout paramFrameLayout1, FrameLayout paramFrameLayout2)
  {
    zzwq = paramFrameLayout1;
    zznY = paramFrameLayout2;
    zzil.zza(zzwq, this);
    zzil.zza(zzwq, this);
    zzwq.setOnTouchListener(this);
  }
  
  int getMeasuredHeight()
  {
    return zzwq.getMeasuredHeight();
  }
  
  int getMeasuredWidth()
  {
    return zzwq.getMeasuredWidth();
  }
  
  public void onClick(View paramView)
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzvT == null) {
          return;
        }
        if ((zzws != null) && (zzws.zzdq().equals(paramView)))
        {
          zzvT.performClick("1007");
          return;
        }
      }
      zzvT.zzb(paramView, zzwr);
    }
  }
  
  public void onGlobalLayout()
  {
    synchronized (zzpc)
    {
      if (zzwt)
      {
        int i = getMeasuredWidth();
        int j = getMeasuredHeight();
        if ((i != 0) && (j != 0))
        {
          zznY.setLayoutParams(new FrameLayout.LayoutParams(i, j));
          zzwt = false;
        }
      }
      if (zzvT != null) {
        zzvT.zzi(zzwq);
      }
      return;
    }
  }
  
  public void onScrollChanged()
  {
    synchronized (zzpc)
    {
      if (zzvT != null) {
        zzvT.zzi(zzwq);
      }
      return;
    }
  }
  
  public boolean onTouch(View arg1, MotionEvent paramMotionEvent)
  {
    synchronized (zzpc)
    {
      if (zzvT == null) {
        return false;
      }
      Point localPoint = zzc(paramMotionEvent);
      paramMotionEvent = MotionEvent.obtain(paramMotionEvent);
      paramMotionEvent.setLocation(x, y);
      zzvT.zzb(paramMotionEvent);
      paramMotionEvent.recycle();
      return false;
    }
  }
  
  public zzd zzU(String paramString)
  {
    synchronized (zzpc)
    {
      paramString = (WeakReference)zzwr.get(paramString);
      if (paramString == null)
      {
        paramString = null;
        paramString = zze.zzx(paramString);
        return paramString;
      }
      paramString = (View)paramString.get();
    }
  }
  
  public void zza(String paramString, zzd paramZzd)
  {
    View localView = (View)zze.zzp(paramZzd);
    paramZzd = zzpc;
    if (localView == null) {}
    for (;;)
    {
      try
      {
        zzwr.remove(paramString);
        return;
      }
      finally {}
      zzwr.put(paramString, new WeakReference(localView));
      localView.setOnTouchListener(this);
      localView.setOnClickListener(this);
    }
  }
  
  public void zzb(final zzd paramZzd)
  {
    synchronized (zzpc)
    {
      zzwt = true;
      paramZzd = (zzh)zze.zzp(paramZzd);
      if (((zzvT instanceof zzg)) && (((zzg)zzvT).zzdx())) {
        ((zzg)zzvT).zzb(paramZzd);
      }
      do
      {
        zznY.removeAllViews();
        zzws = zzf(paramZzd);
        if (zzws != null) {
          zznY.addView(zzws);
        }
        zzhu.zzHK.post(new Runnable()
        {
          public void run()
          {
            zzip localZzip = paramZzd.zzdy();
            if (localZzip != null) {
              zzj.zza(zzj.this).addView(localZzip.getWebView());
            }
          }
        });
        paramZzd.zzh(zzwq);
        return;
        zzvT = paramZzd;
      } while (!(zzvT instanceof zzg));
      ((zzg)zzvT).zzb(null);
    }
  }
  
  Point zzc(MotionEvent paramMotionEvent)
  {
    int[] arrayOfInt = new int[2];
    zzwq.getLocationOnScreen(arrayOfInt);
    float f1 = paramMotionEvent.getRawX();
    float f2 = arrayOfInt[0];
    float f3 = paramMotionEvent.getRawY();
    float f4 = arrayOfInt[1];
    return new Point((int)(f1 - f2), (int)(f3 - f4));
  }
  
  zzb zzf(zzh paramZzh)
  {
    return paramZzh.zza(this);
  }
}
