package com.google.android.gms.analytics.internal;

import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ServiceInfo;
import android.text.TextUtils;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzol;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;

public class zzam
{
  private static final char[] zzOK = { 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70 };
  
  public static double zza(String paramString, double paramDouble)
  {
    if (paramString == null) {
      return paramDouble;
    }
    try
    {
      double d = Double.parseDouble(paramString);
      return d;
    }
    catch (NumberFormatException paramString) {}
    return paramDouble;
  }
  
  public static zzol zza(zzaf paramZzaf, String paramString)
  {
    zzx.zzv(paramZzaf);
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    try
    {
      paramString = URLEncodedUtils.parse(new URI("?" + paramString), "UTF-8");
      paramZzaf = new HashMap(paramString.size());
      paramString = paramString.iterator();
      while (paramString.hasNext())
      {
        NameValuePair localNameValuePair = (NameValuePair)paramString.next();
        paramZzaf.put(localNameValuePair.getName(), localNameValuePair.getValue());
      }
      paramString = new zzol();
    }
    catch (URISyntaxException paramString)
    {
      paramZzaf.zzd("No valid campaign data found", paramString);
      return null;
    }
    paramString.zzdL((String)paramZzaf.get("utm_content"));
    paramString.zzdJ((String)paramZzaf.get("utm_medium"));
    paramString.setName((String)paramZzaf.get("utm_campaign"));
    paramString.zzdI((String)paramZzaf.get("utm_source"));
    paramString.zzdK((String)paramZzaf.get("utm_term"));
    paramString.zzdM((String)paramZzaf.get("utm_id"));
    paramString.zzdN((String)paramZzaf.get("anid"));
    paramString.zzdO((String)paramZzaf.get("gclid"));
    paramString.zzdP((String)paramZzaf.get("dclid"));
    paramString.zzdQ((String)paramZzaf.get("aclid"));
    return paramString;
  }
  
  public static String zza(Locale paramLocale)
  {
    if (paramLocale == null) {}
    String str;
    do
    {
      return null;
      str = paramLocale.getLanguage();
    } while (TextUtils.isEmpty(str));
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(str.toLowerCase());
    if (!TextUtils.isEmpty(paramLocale.getCountry())) {
      localStringBuilder.append("-").append(paramLocale.getCountry().toLowerCase());
    }
    return localStringBuilder.toString();
  }
  
  public static void zza(Map<String, String> paramMap1, String paramString, Map<String, String> paramMap2)
  {
    zzb(paramMap1, paramString, (String)paramMap2.get(paramString));
  }
  
  public static boolean zza(double paramDouble, String paramString)
  {
    if ((paramDouble <= 0.0D) || (paramDouble >= 100.0D)) {}
    while (zzbr(paramString) % 10000 < 100.0D * paramDouble) {
      return false;
    }
    return true;
  }
  
  public static boolean zza(Context paramContext, Class<? extends Service> paramClass)
  {
    try
    {
      paramContext = paramContext.getPackageManager().getServiceInfo(new ComponentName(paramContext, paramClass), 4);
      if (paramContext != null)
      {
        boolean bool = enabled;
        if (bool) {
          return true;
        }
      }
    }
    catch (PackageManager.NameNotFoundException paramContext) {}
    return false;
  }
  
  public static boolean zza(Context paramContext, Class<? extends BroadcastReceiver> paramClass, boolean paramBoolean)
  {
    try
    {
      paramContext = paramContext.getPackageManager().getReceiverInfo(new ComponentName(paramContext, paramClass), 2);
      if ((paramContext != null) && (enabled)) {
        if (paramBoolean)
        {
          paramBoolean = exported;
          if (!paramBoolean) {}
        }
        else
        {
          return true;
        }
      }
    }
    catch (PackageManager.NameNotFoundException paramContext) {}
    return false;
  }
  
  public static void zzb(Map<String, String> paramMap, String paramString1, String paramString2)
  {
    if ((paramString2 != null) && (!paramMap.containsKey(paramString1))) {
      paramMap.put(paramString1, paramString2);
    }
  }
  
  public static void zzb(Map<String, String> paramMap, String paramString, boolean paramBoolean)
  {
    if (!paramMap.containsKey(paramString)) {
      if (!paramBoolean) {
        break label28;
      }
    }
    label28:
    for (String str = "1";; str = "0")
    {
      paramMap.put(paramString, str);
      return;
    }
  }
  
  public static long zzbo(String paramString)
  {
    if (paramString == null) {
      return 0L;
    }
    try
    {
      long l = Long.parseLong(paramString);
      return l;
    }
    catch (NumberFormatException paramString) {}
    return 0L;
  }
  
  public static MessageDigest zzbq(String paramString)
  {
    int i = 0;
    while (i < 2) {
      try
      {
        MessageDigest localMessageDigest = MessageDigest.getInstance(paramString);
        if (localMessageDigest != null) {
          return localMessageDigest;
        }
      }
      catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
      {
        i += 1;
      }
    }
    return null;
  }
  
  public static int zzbr(String paramString)
  {
    int k = 1;
    if (!TextUtils.isEmpty(paramString))
    {
      int j = paramString.length();
      int i = 0;
      j -= 1;
      for (;;)
      {
        k = i;
        if (j < 0) {
          break;
        }
        k = paramString.charAt(j);
        k = (i << 6 & 0xFFFFFFF) + k + (k << 14);
        int m = 0xFE00000 & k;
        i = k;
        if (m != 0) {
          i = k ^ m >> 21;
        }
        j -= 1;
      }
    }
    return k;
  }
  
  public static boolean zzbs(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    while (!paramString.startsWith("http:")) {
      return true;
    }
    return false;
  }
  
  public static void zzc(Map<String, String> paramMap, String paramString1, String paramString2)
  {
    if ((paramString2 != null) && (TextUtils.isEmpty((CharSequence)paramMap.get(paramString1)))) {
      paramMap.put(paramString1, paramString2);
    }
  }
  
  public static boolean zze(String paramString, boolean paramBoolean)
  {
    boolean bool = paramBoolean;
    if (paramString != null)
    {
      if ((!paramString.equalsIgnoreCase("true")) && (!paramString.equalsIgnoreCase("yes")) && (!paramString.equalsIgnoreCase("1"))) {
        break label40;
      }
      bool = true;
    }
    label40:
    do
    {
      return bool;
      if ((paramString.equalsIgnoreCase("false")) || (paramString.equalsIgnoreCase("no"))) {
        break;
      }
      bool = paramBoolean;
    } while (!paramString.equalsIgnoreCase("0"));
    return false;
  }
}
