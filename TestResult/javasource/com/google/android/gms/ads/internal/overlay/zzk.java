package com.google.android.gms.ads.internal.overlay;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.TextView;
import com.google.android.gms.ads.internal.zzd;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.internal.zzcc;
import com.google.android.gms.internal.zzcd;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzip;
import java.util.HashMap;

@zzgk
public class zzk
  extends FrameLayout
  implements zzh
{
  private final FrameLayout zzBb;
  private final zzq zzBc;
  private zzi zzBd;
  private boolean zzBe;
  private boolean zzBf;
  private TextView zzBg;
  private long zzBh;
  private long zzBi;
  private String zzBj;
  private final zzip zzoL;
  private String zzxs;
  
  public zzk(Context paramContext, zzip paramZzip, int paramInt, zzcd paramZzcd, zzcc paramZzcc)
  {
    super(paramContext);
    zzoL = paramZzip;
    zzBb = new FrameLayout(paramContext);
    addView(zzBb);
    zzb.zzr(paramZzip.zzgP());
    zzBd = zzgPzzoG.zza(paramContext, paramZzip, paramInt, paramZzcd, paramZzcc);
    zzBb.addView(zzBd, new FrameLayout.LayoutParams(-1, -1, 17));
    zzBg = new TextView(paramContext);
    zzBg.setBackgroundColor(-16777216);
    zzeS();
    zzBc = new zzq(this);
    zzBc.zzfa();
    zzBd.zza(this);
  }
  
  private void zza(String paramString, String... paramVarArgs)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("event", paramString);
    int j = paramVarArgs.length;
    int i = 0;
    paramString = null;
    if (i < j)
    {
      String str = paramVarArgs[i];
      if (paramString == null) {}
      for (paramString = str;; paramString = null)
      {
        i += 1;
        break;
        localHashMap.put(paramString, str);
      }
    }
    zzoL.zzc("onVideoEvent", localHashMap);
  }
  
  public static void zzd(zzip paramZzip)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("event", "no_video_view");
    paramZzip.zzc("onVideoEvent", localHashMap);
  }
  
  private void zzeS()
  {
    if (!zzeU())
    {
      zzBb.addView(zzBg, new FrameLayout.LayoutParams(-1, -1));
      zzBb.bringChildToFront(zzBg);
    }
  }
  
  private void zzeT()
  {
    if (zzeU()) {
      zzBb.removeView(zzBg);
    }
  }
  
  private boolean zzeU()
  {
    return zzBg.getParent() != null;
  }
  
  private void zzeV()
  {
    if (zzoL.zzgN() == null) {
      break label12;
    }
    label12:
    while (zzBe) {
      return;
    }
    if ((zzoL.zzgN().getWindow().getAttributes().flags & 0x80) != 0) {}
    for (boolean bool = true;; bool = false)
    {
      zzBf = bool;
      if (zzBf) {
        break;
      }
      zzoL.zzgN().getWindow().addFlags(128);
      zzBe = true;
      return;
    }
  }
  
  private void zzeW()
  {
    if (zzoL.zzgN() == null) {}
    while ((!zzBe) || (zzBf)) {
      return;
    }
    zzoL.zzgN().getWindow().clearFlags(128);
    zzBe = false;
  }
  
  public void destroy()
  {
    zzBc.cancel();
    zzBd.stop();
    zzeW();
  }
  
  public void onPaused()
  {
    zza("pause", new String[0]);
    zzeW();
  }
  
  public void pause()
  {
    zzBd.pause();
  }
  
  public void play()
  {
    zzBd.play();
  }
  
  public void seekTo(int paramInt)
  {
    zzBd.seekTo(paramInt);
  }
  
  public void setMimeType(String paramString)
  {
    zzBj = paramString;
  }
  
  public void zza(float paramFloat)
  {
    zzBd.zza(paramFloat);
  }
  
  public void zzak(String paramString)
  {
    zzxs = paramString;
  }
  
  public void zzd(MotionEvent paramMotionEvent)
  {
    zzBd.dispatchTouchEvent(paramMotionEvent);
  }
  
  public void zze(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if ((paramInt3 == 0) || (paramInt4 == 0)) {
      return;
    }
    FrameLayout.LayoutParams localLayoutParams = new FrameLayout.LayoutParams(paramInt3 + 2, paramInt4 + 2);
    localLayoutParams.setMargins(paramInt1 - 1, paramInt2 - 1, 0, 0);
    zzBb.setLayoutParams(localLayoutParams);
    requestLayout();
  }
  
  public void zzeK() {}
  
  public void zzeL()
  {
    if (zzBi == 0L) {
      zza("canplaythrough", new String[] { "duration", String.valueOf(zzBd.getDuration() / 1000.0F), "videoWidth", String.valueOf(zzBd.getVideoWidth()), "videoHeight", String.valueOf(zzBd.getVideoHeight()) });
    }
  }
  
  public void zzeM()
  {
    zzeV();
  }
  
  public void zzeN()
  {
    zza("ended", new String[0]);
    zzeW();
  }
  
  public void zzeO()
  {
    zzeS();
    zzBi = zzBh;
  }
  
  public void zzeP()
  {
    if (!TextUtils.isEmpty(zzxs))
    {
      zzBd.setMimeType(zzBj);
      zzBd.setVideoPath(zzxs);
      return;
    }
    zza("no_src", new String[0]);
  }
  
  public void zzeQ()
  {
    TextView localTextView = new TextView(zzBd.getContext());
    localTextView.setText("AdMob - " + zzBd.zzek());
    localTextView.setTextColor(-65536);
    localTextView.setBackgroundColor(65280);
    zzBb.addView(localTextView, new FrameLayout.LayoutParams(-2, -2, 17));
    zzBb.bringChildToFront(localTextView);
  }
  
  void zzeR()
  {
    long l = zzBd.getCurrentPosition();
    if ((zzBh != l) && (l > 0L))
    {
      zzeT();
      zza("timeupdate", new String[] { "time", String.valueOf((float)l / 1000.0F) });
      zzBh = l;
    }
  }
  
  public void zzeq()
  {
    zzBd.zzeq();
  }
  
  public void zzer()
  {
    zzBd.zzer();
  }
  
  public void zzh(String paramString1, String paramString2)
  {
    zza("error", new String[] { "what", paramString1, "extra", paramString2 });
  }
}
