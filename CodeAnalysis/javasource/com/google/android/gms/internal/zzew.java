package com.google.android.gms.internal;

import android.app.Activity;
import android.graphics.Bitmap;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@zzgk
public class zzew
  extends zzfb
{
  static final Set<String> zzzo = new HashSet(Arrays.asList(new String[] { "top-left", "top-right", "top-center", "center", "bottom-left", "bottom-right", "bottom-center" }));
  private int zznP = -1;
  private int zznQ = -1;
  private final zzip zzoL;
  private final Object zzpc = new Object();
  private AdSizeParcel zzyK;
  private RelativeLayout zzzA;
  private ViewGroup zzzB;
  private String zzzp = "top-right";
  private boolean zzzq = true;
  private int zzzr = 0;
  private int zzzs = 0;
  private int zzzt = 0;
  private int zzzu = 0;
  private final Activity zzzv;
  private ImageView zzzw;
  private LinearLayout zzzx;
  private zzfc zzzy;
  private PopupWindow zzzz;
  
  public zzew(zzip paramZzip, zzfc paramZzfc)
  {
    super(paramZzip, "resize");
    zzoL = paramZzip;
    zzzv = paramZzip.zzgN();
    zzzy = paramZzfc;
  }
  
  private int[] zzdX()
  {
    if (!zzdZ()) {
      return null;
    }
    if (zzzq) {
      return new int[] { zzzr + zzzt, zzzs + zzzu };
    }
    int[] arrayOfInt1 = zzp.zzbx().zzh(zzzv);
    int[] arrayOfInt2 = zzp.zzbx().zzj(zzzv);
    int m = arrayOfInt1[0];
    int j = zzzr + zzzt;
    int k = zzzs + zzzu;
    int i;
    if (j < 0)
    {
      i = 0;
      if (k >= arrayOfInt2[0]) {
        break label149;
      }
      j = arrayOfInt2[0];
    }
    for (;;)
    {
      return new int[] { i, j };
      i = j;
      if (zznP + j <= m) {
        break;
      }
      i = m - zznP;
      break;
      label149:
      j = k;
      if (zznQ + k > arrayOfInt2[1]) {
        j = arrayOfInt2[1] - zznQ;
      }
    }
  }
  
  private void zzf(Map<String, String> paramMap)
  {
    if (!TextUtils.isEmpty((CharSequence)paramMap.get("width"))) {
      zznP = zzp.zzbx().zzax((String)paramMap.get("width"));
    }
    if (!TextUtils.isEmpty((CharSequence)paramMap.get("height"))) {
      zznQ = zzp.zzbx().zzax((String)paramMap.get("height"));
    }
    if (!TextUtils.isEmpty((CharSequence)paramMap.get("offsetX"))) {
      zzzt = zzp.zzbx().zzax((String)paramMap.get("offsetX"));
    }
    if (!TextUtils.isEmpty((CharSequence)paramMap.get("offsetY"))) {
      zzzu = zzp.zzbx().zzax((String)paramMap.get("offsetY"));
    }
    if (!TextUtils.isEmpty((CharSequence)paramMap.get("allowOffscreen"))) {
      zzzq = Boolean.parseBoolean((String)paramMap.get("allowOffscreen"));
    }
    paramMap = (String)paramMap.get("customClosePosition");
    if (!TextUtils.isEmpty(paramMap)) {
      zzzp = paramMap;
    }
  }
  
  public void zza(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      zzzr = paramInt1;
      zzzs = paramInt2;
      if ((zzzz != null) && (paramBoolean))
      {
        int[] arrayOfInt = zzdX();
        if (arrayOfInt != null)
        {
          zzzz.update(zzk.zzcE().zzb(zzzv, arrayOfInt[0]), zzk.zzcE().zzb(zzzv, arrayOfInt[1]), zzzz.getWidth(), zzzz.getHeight());
          zzc(arrayOfInt[0], arrayOfInt[1]);
        }
      }
      else
      {
        return;
      }
      zzn(true);
    }
  }
  
  void zzb(int paramInt1, int paramInt2)
  {
    if (zzzy != null) {
      zzzy.zza(paramInt1, paramInt2, zznP, zznQ);
    }
  }
  
  void zzc(int paramInt1, int paramInt2)
  {
    zzb(paramInt1, paramInt2 - zzp.zzbx().zzj(zzzv)[0], zznP, zznQ);
  }
  
  public void zzd(int paramInt1, int paramInt2)
  {
    zzzr = paramInt1;
    zzzs = paramInt2;
  }
  
  boolean zzdW()
  {
    return (zznP > -1) && (zznQ > -1);
  }
  
  public boolean zzdY()
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzzz != null)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  boolean zzdZ()
  {
    Object localObject = zzp.zzbx().zzh(zzzv);
    int[] arrayOfInt = zzp.zzbx().zzj(zzzv);
    int k = localObject[0];
    int i = localObject[1];
    if ((zznP < 50) || (zznP > k))
    {
      zzb.zzaE("Width is too small or too large.");
      return false;
    }
    if ((zznQ < 50) || (zznQ > i))
    {
      zzb.zzaE("Height is too small or too large.");
      return false;
    }
    if ((zznQ == i) && (zznP == k))
    {
      zzb.zzaE("Cannot resize to a full-screen ad.");
      return false;
    }
    label184:
    int j;
    if (zzzq)
    {
      localObject = zzzp;
      i = -1;
      switch (((String)localObject).hashCode())
      {
      default: 
        switch (i)
        {
        default: 
          j = zzzr + zzzt + zznP - 50;
          i = zzzs + zzzu;
        }
        break;
      }
    }
    while ((j >= 0) && (j + 50 <= k) && (i >= arrayOfInt[0]) && (i + 50 <= arrayOfInt[1]))
    {
      return true;
      if (!((String)localObject).equals("top-left")) {
        break label184;
      }
      i = 0;
      break label184;
      if (!((String)localObject).equals("top-center")) {
        break label184;
      }
      i = 1;
      break label184;
      if (!((String)localObject).equals("center")) {
        break label184;
      }
      i = 2;
      break label184;
      if (!((String)localObject).equals("bottom-left")) {
        break label184;
      }
      i = 3;
      break label184;
      if (!((String)localObject).equals("bottom-center")) {
        break label184;
      }
      i = 4;
      break label184;
      if (!((String)localObject).equals("bottom-right")) {
        break label184;
      }
      i = 5;
      break label184;
      i = zzzr;
      j = zzzt + i;
      i = zzzs + zzzu;
      continue;
      j = zzzr + zzzt + zznP / 2 - 25;
      i = zzzs + zzzu;
      continue;
      j = zzzr + zzzt + zznP / 2 - 25;
      i = zzzs + zzzu + zznQ / 2 - 25;
      continue;
      i = zzzr;
      j = zzzt + i;
      i = zzzs + zzzu + zznQ - 50;
      continue;
      j = zzzr + zzzt + zznP / 2 - 25;
      i = zzzs + zzzu + zznQ - 50;
      continue;
      j = zzzr + zzzt + zznP - 50;
      i = zzzs + zzzu + zznQ - 50;
    }
  }
  
  public void zzg(Map<String, String> paramMap)
  {
    synchronized (zzpc)
    {
      if (zzzv == null)
      {
        zzah("Not an activity context. Cannot resize.");
        return;
      }
      if (zzoL.zzaN() == null)
      {
        zzah("Webview is not yet available, size is not set.");
        return;
      }
    }
    if (zzoL.zzaN().zzsH)
    {
      zzah("Is interstitial. Cannot resize an interstitial.");
      return;
    }
    if (zzoL.zzgW())
    {
      zzah("Cannot resize an expanded banner.");
      return;
    }
    zzf(paramMap);
    if (!zzdW())
    {
      zzah("Invalid width and height options. Cannot resize.");
      return;
    }
    paramMap = zzzv.getWindow();
    if ((paramMap == null) || (paramMap.getDecorView() == null))
    {
      zzah("Activity context is not ready, cannot get window or decor view.");
      return;
    }
    int[] arrayOfInt = zzdX();
    if (arrayOfInt == null)
    {
      zzah("Resize location out of screen or close button is not visible.");
      return;
    }
    int i = zzk.zzcE().zzb(zzzv, zznP);
    int j = zzk.zzcE().zzb(zzzv, zznQ);
    Object localObject2 = zzoL.getWebView().getParent();
    if ((localObject2 != null) && ((localObject2 instanceof ViewGroup)))
    {
      ((ViewGroup)localObject2).removeView(zzoL.getWebView());
      if (zzzz == null)
      {
        zzzB = ((ViewGroup)localObject2);
        localObject2 = zzp.zzbx().zzj(zzoL.getWebView());
        zzzw = new ImageView(zzzv);
        zzzw.setImageBitmap((Bitmap)localObject2);
        zzyK = zzoL.zzaN();
        zzzB.addView(zzzw);
        zzzA = new RelativeLayout(zzzv);
        zzzA.setBackgroundColor(0);
        zzzA.setLayoutParams(new ViewGroup.LayoutParams(i, j));
        zzzz = zzp.zzbx().zza(zzzA, i, j, false);
        zzzz.setOutsideTouchable(true);
        zzzz.setTouchable(true);
        localObject2 = zzzz;
        if (zzzq) {
          break label1071;
        }
      }
    }
    label1023:
    label1027:
    label1029:
    label1071:
    for (boolean bool = true;; bool = false)
    {
      ((PopupWindow)localObject2).setClippingEnabled(bool);
      zzzA.addView(zzoL.getWebView(), -1, -1);
      zzzx = new LinearLayout(zzzv);
      localObject2 = new RelativeLayout.LayoutParams(zzk.zzcE().zzb(zzzv, 50), zzk.zzcE().zzb(zzzv, 50));
      String str = zzzp;
      switch (str.hashCode())
      {
      }
      for (;;)
      {
        ((RelativeLayout.LayoutParams)localObject2).addRule(10);
        ((RelativeLayout.LayoutParams)localObject2).addRule(11);
        for (;;)
        {
          zzzx.setOnClickListener(new View.OnClickListener()
          {
            public void onClick(View paramAnonymousView)
            {
              zzn(true);
            }
          });
          zzzx.setContentDescription("Close button");
          zzzA.addView(zzzx, (ViewGroup.LayoutParams)localObject2);
          try
          {
            zzzz.showAtLocation(paramMap.getDecorView(), 0, zzk.zzcE().zzb(zzzv, arrayOfInt[0]), zzk.zzcE().zzb(zzzv, arrayOfInt[1]));
            zzb(arrayOfInt[0], arrayOfInt[1]);
            zzoL.zza(new AdSizeParcel(zzzv, new AdSize(zznP, zznQ)));
            zzc(arrayOfInt[0], arrayOfInt[1]);
            zzaj("resized");
            return;
          }
          catch (RuntimeException paramMap)
          {
            zzah("Cannot show popup window: " + paramMap.getMessage());
            zzzA.removeView(zzoL.getWebView());
            if (zzzB == null) {
              break label1023;
            }
            zzzB.removeView(zzzw);
            zzzB.addView(zzoL.getWebView());
            zzoL.zza(zzyK);
            return;
          }
          zzzz.dismiss();
          break;
          zzah("Webview is detached, probably in the middle of a resize or expand.");
          return;
          if (!str.equals("top-left")) {
            break label1027;
          }
          i = 0;
          break label1029;
          if (!str.equals("top-center")) {
            break label1027;
          }
          i = 1;
          break label1029;
          if (!str.equals("center")) {
            break label1027;
          }
          i = 2;
          break label1029;
          if (!str.equals("bottom-left")) {
            break label1027;
          }
          i = 3;
          break label1029;
          if (!str.equals("bottom-center")) {
            break label1027;
          }
          i = 4;
          break label1029;
          if (!str.equals("bottom-right")) {
            break label1027;
          }
          i = 5;
          break label1029;
          ((RelativeLayout.LayoutParams)localObject2).addRule(10);
          ((RelativeLayout.LayoutParams)localObject2).addRule(9);
          continue;
          ((RelativeLayout.LayoutParams)localObject2).addRule(10);
          ((RelativeLayout.LayoutParams)localObject2).addRule(14);
          continue;
          ((RelativeLayout.LayoutParams)localObject2).addRule(13);
          continue;
          ((RelativeLayout.LayoutParams)localObject2).addRule(12);
          ((RelativeLayout.LayoutParams)localObject2).addRule(9);
          continue;
          ((RelativeLayout.LayoutParams)localObject2).addRule(12);
          ((RelativeLayout.LayoutParams)localObject2).addRule(14);
          continue;
          ((RelativeLayout.LayoutParams)localObject2).addRule(12);
          ((RelativeLayout.LayoutParams)localObject2).addRule(11);
        }
        i = -1;
        switch (i)
        {
        }
      }
    }
  }
  
  public void zzn(boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      if (zzzz != null)
      {
        zzzz.dismiss();
        zzzA.removeView(zzoL.getWebView());
        if (zzzB != null)
        {
          zzzB.removeView(zzzw);
          zzzB.addView(zzoL.getWebView());
          zzoL.zza(zzyK);
        }
        if (paramBoolean)
        {
          zzaj("default");
          if (zzzy != null) {
            zzzy.zzbc();
          }
        }
        zzzz = null;
        zzzA = null;
        zzzB = null;
        zzzx = null;
      }
      return;
    }
  }
}
