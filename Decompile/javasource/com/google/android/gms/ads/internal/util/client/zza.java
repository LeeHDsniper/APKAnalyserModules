package com.google.android.gms.ads.internal.util.client;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings.Secure;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Display;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.TextView;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzlv;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;

@zzgk
public class zza
{
  public static final Handler zzIy = new Handler(Looper.getMainLooper());
  
  public zza() {}
  
  private void zza(ViewGroup paramViewGroup, AdSizeParcel paramAdSizeParcel, String paramString, int paramInt1, int paramInt2)
  {
    if (paramViewGroup.getChildCount() != 0) {
      return;
    }
    Context localContext = paramViewGroup.getContext();
    TextView localTextView = new TextView(localContext);
    localTextView.setGravity(17);
    localTextView.setText(paramString);
    localTextView.setTextColor(paramInt1);
    localTextView.setBackgroundColor(paramInt2);
    paramString = new FrameLayout(localContext);
    paramString.setBackgroundColor(paramInt1);
    paramInt1 = zzb(localContext, 3);
    paramString.addView(localTextView, new FrameLayout.LayoutParams(widthPixels - paramInt1, heightPixels - paramInt1, 17));
    paramViewGroup.addView(paramString, widthPixels, heightPixels);
  }
  
  public String zzQ(Context paramContext)
  {
    paramContext = paramContext.getContentResolver();
    if (paramContext == null) {}
    for (paramContext = null;; paramContext = Settings.Secure.getString(paramContext, "android_id"))
    {
      if ((paramContext == null) || (zzgH())) {
        paramContext = "emulator";
      }
      return zzaB(paramContext);
    }
  }
  
  public boolean zzR(Context paramContext)
  {
    return GooglePlayServicesUtil.isGooglePlayServicesAvailable(paramContext) == 0;
  }
  
  public boolean zzS(Context paramContext)
  {
    if (getResourcesgetConfigurationorientation != 2) {}
    do
    {
      return false;
      paramContext = paramContext.getResources().getDisplayMetrics();
    } while ((int)(heightPixels / density) >= 600);
    return true;
  }
  
  public boolean zzT(Context paramContext)
  {
    DisplayMetrics localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
    paramContext = ((WindowManager)paramContext.getSystemService("window")).getDefaultDisplay();
    int j;
    int i;
    if (zzlv.zzpT())
    {
      paramContext.getRealMetrics(localDisplayMetrics);
      j = heightPixels;
      i = widthPixels;
      paramContext.getMetrics(localDisplayMetrics);
      int k = heightPixels;
      int m = widthPixels;
      if ((k != j) || (m != i)) {
        break label141;
      }
    }
    for (boolean bool = true;; bool = false)
    {
      return bool;
      label141:
      try
      {
        j = ((Integer)Display.class.getMethod("getRawHeight", new Class[0]).invoke(paramContext, new Object[0])).intValue();
        i = ((Integer)Display.class.getMethod("getRawWidth", new Class[0]).invoke(paramContext, new Object[0])).intValue();
      }
      catch (Exception paramContext) {}
    }
    return false;
  }
  
  public int zzU(Context paramContext)
  {
    int i = paramContext.getResources().getIdentifier("navigation_bar_width", "dimen", "android");
    if (i > 0) {
      return paramContext.getResources().getDimensionPixelSize(i);
    }
    return 0;
  }
  
  public int zza(DisplayMetrics paramDisplayMetrics, int paramInt)
  {
    return (int)TypedValue.applyDimension(1, paramInt, paramDisplayMetrics);
  }
  
  public void zza(ViewGroup paramViewGroup, AdSizeParcel paramAdSizeParcel, String paramString)
  {
    zza(paramViewGroup, paramAdSizeParcel, paramString, -16777216, -1);
  }
  
  public void zza(ViewGroup paramViewGroup, AdSizeParcel paramAdSizeParcel, String paramString1, String paramString2)
  {
    zzb.zzaE(paramString2);
    zza(paramViewGroup, paramAdSizeParcel, paramString1, -65536, -16777216);
  }
  
  public String zzaB(String paramString)
  {
    int i = 0;
    while (i < 2) {
      try
      {
        Object localObject = MessageDigest.getInstance("MD5");
        ((MessageDigest)localObject).update(paramString.getBytes());
        localObject = String.format(Locale.US, "%032X", new Object[] { new BigInteger(1, ((MessageDigest)localObject).digest()) });
        return localObject;
      }
      catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
      {
        i += 1;
      }
    }
    return null;
  }
  
  public int zzb(Context paramContext, int paramInt)
  {
    return zza(paramContext.getResources().getDisplayMetrics(), paramInt);
  }
  
  public int zzb(DisplayMetrics paramDisplayMetrics, int paramInt)
  {
    return Math.round(paramInt / density);
  }
  
  public int zzc(Context paramContext, int paramInt)
  {
    paramContext = ((WindowManager)paramContext.getSystemService("window")).getDefaultDisplay();
    DisplayMetrics localDisplayMetrics = new DisplayMetrics();
    paramContext.getMetrics(localDisplayMetrics);
    return zzb(localDisplayMetrics, paramInt);
  }
  
  public boolean zzgH()
  {
    return Build.DEVICE.startsWith("generic");
  }
  
  public boolean zzgI()
  {
    return Looper.myLooper() == Looper.getMainLooper();
  }
}
