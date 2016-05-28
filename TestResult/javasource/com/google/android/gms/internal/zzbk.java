package com.google.android.gms.internal;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.KeyguardManager;
import android.content.Context;
import android.os.PowerManager;
import android.os.Process;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.webkit.ValueCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.EditText;
import android.widget.TextView;
import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

@zzgk
public class zzbk
  extends Thread
{
  private boolean mStarted = false;
  private boolean zzam = false;
  private final Object zzpc;
  private final int zzrC;
  private final int zzrE;
  private boolean zzrO = false;
  private final zzbj zzrP;
  private final zzbi zzrQ;
  private final zzgj zzrR;
  private final int zzrS;
  private final int zzrT;
  private final int zzrU;
  
  public zzbk(zzbj paramZzbj, zzbi paramZzbi, zzgj paramZzgj)
  {
    zzrP = paramZzbj;
    zzrQ = paramZzbi;
    zzrR = paramZzgj;
    zzpc = new Object();
    zzrC = ((Integer)zzby.zzuF.get()).intValue();
    zzrT = ((Integer)zzby.zzuG.get()).intValue();
    zzrE = ((Integer)zzby.zzuH.get()).intValue();
    zzrU = ((Integer)zzby.zzuI.get()).intValue();
    zzrS = ((Integer)zzby.zzuJ.get()).intValue();
    setName("ContentFetchTask");
  }
  
  public void run()
  {
    while (!zzam) {
      try
      {
        if (zzcu())
        {
          Activity localActivity = zzrP.getActivity();
          if (localActivity == null) {
            zzb.zzaC("ContentFetchThread: no activity");
          }
        }
      }
      catch (Throwable localThrowable)
      {
        zzb.zzb("Error in ContentFetchTask", localThrowable);
        zzrR.zza(localThrowable, true);
        synchronized (zzpc)
        {
          for (;;)
          {
            boolean bool = zzrO;
            if (!bool) {
              break;
            }
            try
            {
              zzb.zzaC("ContentFetchTask: waiting");
              zzpc.wait();
            }
            catch (InterruptedException localInterruptedException) {}
          }
          zza(???);
          for (;;)
          {
            Thread.sleep(zzrS * 1000);
            break;
            zzb.zzaC("ContentFetchTask: sleeping");
            zzcw();
          }
        }
      }
    }
  }
  
  public void wakeup()
  {
    synchronized (zzpc)
    {
      zzrO = false;
      zzpc.notifyAll();
      zzb.zzaC("ContentFetchThread: wakeup");
      return;
    }
  }
  
  zza zza(View paramView, zzbh paramZzbh)
  {
    int i = 0;
    if (paramView == null) {
      return new zza(0, 0);
    }
    if (((paramView instanceof TextView)) && (!(paramView instanceof EditText)))
    {
      paramView = ((TextView)paramView).getText();
      if (!TextUtils.isEmpty(paramView))
      {
        paramZzbh.zzw(paramView.toString());
        return new zza(1, 0);
      }
      return new zza(0, 0);
    }
    if (((paramView instanceof WebView)) && (!(paramView instanceof zzip)))
    {
      paramZzbh.zzcp();
      if (zza((WebView)paramView, paramZzbh)) {
        return new zza(0, 1);
      }
      return new zza(0, 0);
    }
    if ((paramView instanceof ViewGroup))
    {
      paramView = (ViewGroup)paramView;
      int j = 0;
      int k = 0;
      while (i < paramView.getChildCount())
      {
        zza localZza = zza(paramView.getChildAt(i), paramZzbh);
        k += zzsb;
        j += zzsc;
        i += 1;
      }
      return new zza(k, j);
    }
    return new zza(0, 0);
  }
  
  void zza(Activity paramActivity)
  {
    if (paramActivity == null) {}
    Object localObject1;
    do
    {
      return;
      Object localObject2 = null;
      localObject1 = localObject2;
      if (paramActivity.getWindow() != null)
      {
        localObject1 = localObject2;
        if (paramActivity.getWindow().getDecorView() != null) {
          localObject1 = paramActivity.getWindow().getDecorView().findViewById(16908290);
        }
      }
    } while (localObject1 == null);
    zzf((View)localObject1);
  }
  
  void zza(zzbh paramZzbh, WebView paramWebView, String paramString)
  {
    paramZzbh.zzco();
    try
    {
      if (!TextUtils.isEmpty(paramString))
      {
        paramString = new JSONObject(paramString).optString("text");
        if (TextUtils.isEmpty(paramWebView.getTitle())) {
          break label83;
        }
        paramZzbh.zzv(paramWebView.getTitle() + "\n" + paramString);
      }
      while (paramZzbh.zzcl())
      {
        zzrQ.zzb(paramZzbh);
        return;
        label83:
        paramZzbh.zzv(paramString);
      }
      return;
    }
    catch (JSONException paramZzbh)
    {
      zzb.zzaC("Json string may be malformed.");
      return;
    }
    catch (Throwable paramZzbh)
    {
      zzb.zza("Failed to get webview content.", paramZzbh);
      zzrR.zza(paramZzbh, true);
    }
  }
  
  boolean zza(ActivityManager.RunningAppProcessInfo paramRunningAppProcessInfo)
  {
    return importance == 100;
  }
  
  boolean zza(final WebView paramWebView, final zzbh paramZzbh)
  {
    if (!zzlv.zzpV()) {
      return false;
    }
    paramZzbh.zzcp();
    paramWebView.post(new Runnable()
    {
      ValueCallback<String> zzrX = new ValueCallback()
      {
        public void zzy(String paramAnonymous2String)
        {
          zza(zzrY, zzrZ, paramAnonymous2String);
        }
      };
      
      public void run()
      {
        if (paramWebView.getSettings().getJavaScriptEnabled()) {}
        try
        {
          paramWebView.evaluateJavascript("(function() { return  {text:document.body.innerText}})();", zzrX);
          return;
        }
        catch (Throwable localThrowable)
        {
          zzrX.onReceiveValue("");
        }
      }
    });
    return true;
  }
  
  public void zzct()
  {
    synchronized (zzpc)
    {
      if (mStarted)
      {
        zzb.zzaC("Content hash thread already started, quiting...");
        return;
      }
      mStarted = true;
      start();
      return;
    }
  }
  
  boolean zzcu()
  {
    try
    {
      Context localContext = zzrP.getContext();
      if (localContext == null) {
        return false;
      }
      Object localObject = (ActivityManager)localContext.getSystemService("activity");
      KeyguardManager localKeyguardManager = (KeyguardManager)localContext.getSystemService("keyguard");
      if ((localObject != null) && (localKeyguardManager != null))
      {
        localObject = ((ActivityManager)localObject).getRunningAppProcesses();
        if (localObject == null) {
          return false;
        }
        localObject = ((List)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject).next();
          if (Process.myPid() == pid) {
            if ((zza(localRunningAppProcessInfo)) && (!localKeyguardManager.inKeyguardRestrictedInputMode()))
            {
              boolean bool = zzr(localContext);
              if (bool) {
                return true;
              }
            }
          }
        }
        return false;
      }
    }
    catch (Throwable localThrowable)
    {
      return false;
    }
    return false;
  }
  
  public zzbh zzcv()
  {
    return zzrQ.zzcs();
  }
  
  public void zzcw()
  {
    synchronized (zzpc)
    {
      zzrO = true;
      zzb.zzaC("ContentFetchThread: paused, mPause = " + zzrO);
      return;
    }
  }
  
  public boolean zzcx()
  {
    return zzrO;
  }
  
  boolean zzf(final View paramView)
  {
    if (paramView == null) {
      return false;
    }
    paramView.post(new Runnable()
    {
      public void run()
      {
        zzg(paramView);
      }
    });
    return true;
  }
  
  void zzg(View paramView)
  {
    try
    {
      zzbh localZzbh = new zzbh(zzrC, zzrT, zzrE, zzrU);
      paramView = zza(paramView, localZzbh);
      localZzbh.zzcq();
      if ((zzsb == 0) && (zzsc == 0)) {
        return;
      }
      if (((zzsc != 0) || (localZzbh.zzcr() != 0)) && ((zzsc != 0) || (!zzrQ.zza(localZzbh))))
      {
        zzrQ.zzc(localZzbh);
        return;
      }
    }
    catch (Exception paramView)
    {
      zzb.zzb("Exception in fetchContentOnUIThread", paramView);
      zzrR.zza(paramView, true);
    }
  }
  
  boolean zzr(Context paramContext)
  {
    paramContext = (PowerManager)paramContext.getSystemService("power");
    if (paramContext == null) {
      return false;
    }
    return paramContext.isScreenOn();
  }
  
  @zzgk
  class zza
  {
    final int zzsb;
    final int zzsc;
    
    zza(int paramInt1, int paramInt2)
    {
      zzsb = paramInt1;
      zzsc = paramInt2;
    }
  }
}
