package com.google.android.gms.internal;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.overlay.AdLauncherIntentInfoParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zze;
import com.google.android.gms.ads.internal.zzp;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@zzgk
public final class zzdn
  implements zzdg
{
  private final zze zzxj;
  private final zzew zzxk;
  private final zzdi zzxm;
  
  public zzdn(zzdi paramZzdi, zze paramZze, zzew paramZzew)
  {
    zzxm = paramZzdi;
    zzxj = paramZze;
    zzxk = paramZzew;
  }
  
  private static void zza(Context paramContext, Map<String, String> paramMap)
  {
    if (TextUtils.isEmpty((String)paramMap.get("u")))
    {
      zzb.zzaE("Destination url cannot be empty.");
      return;
    }
    paramMap = new zzb().zzb(paramContext, paramMap);
    try
    {
      paramContext.startActivity(paramMap);
      return;
    }
    catch (ActivityNotFoundException paramContext)
    {
      zzb.zzaE(paramContext.getMessage());
    }
  }
  
  private static void zzb(zzip paramZzip, Map<String, String> paramMap)
  {
    paramMap = (String)paramMap.get("u");
    if (TextUtils.isEmpty(paramMap))
    {
      zzb.zzaE("Destination url cannot be empty.");
      return;
    }
    new zza(paramZzip, paramMap).zzgn();
  }
  
  private static boolean zzc(Map<String, String> paramMap)
  {
    return "1".equals(paramMap.get("custom_close"));
  }
  
  private static int zzd(Map<String, String> paramMap)
  {
    paramMap = (String)paramMap.get("o");
    if (paramMap != null)
    {
      if ("p".equalsIgnoreCase(paramMap)) {
        return zzp.zzbz().zzgw();
      }
      if ("l".equalsIgnoreCase(paramMap)) {
        return zzp.zzbz().zzgv();
      }
      if ("c".equalsIgnoreCase(paramMap)) {
        return zzp.zzbz().zzgx();
      }
    }
    return -1;
  }
  
  private void zzm(boolean paramBoolean)
  {
    if (zzxk != null) {
      zzxk.zzn(paramBoolean);
    }
  }
  
  public void zza(zzip paramZzip, Map<String, String> paramMap)
  {
    String str1 = (String)paramMap.get("a");
    if (str1 == null) {
      zzb.zzaE("Action missing from an open GMSG.");
    }
    zziq localZziq;
    do
    {
      return;
      if ((zzxj != null) && (!zzxj.zzbe()))
      {
        zzxj.zzp((String)paramMap.get("u"));
        return;
      }
      localZziq = paramZzip.zzgS();
      if ("expand".equalsIgnoreCase(str1))
      {
        if (paramZzip.zzgW())
        {
          zzb.zzaE("Cannot expand WebView that is already expanded.");
          return;
        }
        zzm(false);
        localZziq.zza(zzc(paramMap), zzd(paramMap));
        return;
      }
      if ("webapp".equalsIgnoreCase(str1))
      {
        paramZzip = (String)paramMap.get("u");
        zzm(false);
        if (paramZzip != null)
        {
          localZziq.zza(zzc(paramMap), zzd(paramMap), paramZzip);
          return;
        }
        localZziq.zza(zzc(paramMap), zzd(paramMap), (String)paramMap.get("html"), (String)paramMap.get("baseurl"));
        return;
      }
      if (!"in_app_purchase".equalsIgnoreCase(str1)) {
        break;
      }
      paramZzip = (String)paramMap.get("product_id");
      paramMap = (String)paramMap.get("report_urls");
    } while (zzxm == null);
    if ((paramMap != null) && (!paramMap.isEmpty()))
    {
      paramMap = paramMap.split(" ");
      zzxm.zza(paramZzip, new ArrayList(Arrays.asList(paramMap)));
      return;
    }
    zzxm.zza(paramZzip, new ArrayList());
    return;
    if (("app".equalsIgnoreCase(str1)) && ("true".equalsIgnoreCase((String)paramMap.get("play_store"))))
    {
      zzb(paramZzip, paramMap);
      return;
    }
    if (("app".equalsIgnoreCase(str1)) && ("true".equalsIgnoreCase((String)paramMap.get("system_browser"))))
    {
      zza(paramZzip.getContext(), paramMap);
      return;
    }
    zzm(true);
    zzan localZzan = paramZzip.zzgU();
    str1 = (String)paramMap.get("u");
    String str2;
    if (!TextUtils.isEmpty(str1))
    {
      str2 = str1;
      if (localZzan != null)
      {
        str2 = str1;
        if (localZzan.zzb(Uri.parse(str1))) {
          str2 = zzp.zzbx().zzd(paramZzip.getContext(), str1, paramZzip.zzha());
        }
      }
    }
    for (paramZzip = zzp.zzbx().zza(paramZzip, str2);; paramZzip = str1)
    {
      localZziq.zza(new AdLauncherIntentInfoParcel((String)paramMap.get("i"), paramZzip, (String)paramMap.get("m"), (String)paramMap.get("p"), (String)paramMap.get("c"), (String)paramMap.get("f"), (String)paramMap.get("e")));
      return;
    }
  }
  
  public static class zza
    extends zzhq
  {
    private final String zzF;
    private final zzip zzoL;
    private final String zzxn = "play.google.com";
    private final String zzxo = "market";
    private final int zzxp = 10;
    
    public zza(zzip paramZzip, String paramString)
    {
      zzoL = paramZzip;
      zzF = paramString;
    }
    
    public void onStop() {}
    
    public Intent zzY(String paramString)
    {
      paramString = Uri.parse(paramString);
      Intent localIntent = new Intent("android.intent.action.VIEW");
      localIntent.addFlags(268435456);
      localIntent.setData(paramString);
      return localIntent;
    }
    
    public void zzdG()
    {
      int i = 0;
      Object localObject1 = zzF;
      if (i < 10) {}
      for (;;)
      {
        try
        {
          localObject2 = new URL((String)localObject1);
          boolean bool = "play.google.com".equalsIgnoreCase(((URL)localObject2).getHost());
          if (!bool) {
            continue;
          }
        }
        catch (IndexOutOfBoundsException localIndexOutOfBoundsException1)
        {
          Object localObject2;
          HttpURLConnection localHttpURLConnection;
          zzb.zzd("Error while parsing ping URL: " + (String)localObject1, localIndexOutOfBoundsException1);
          continue;
        }
        catch (IOException localIOException1)
        {
          zzb.zzd("Error while pinging URL: " + (String)localObject1, localIOException1);
          continue;
        }
        catch (RuntimeException localRuntimeException1)
        {
          zzb.zzd("Error while pinging URL: " + (String)localObject1, localRuntimeException1);
          continue;
          Object localObject4 = "";
          continue;
        }
        localObject1 = zzY((String)localObject1);
        zzoL.getContext().startActivity((Intent)localObject1);
        return;
        if (!"market".equalsIgnoreCase(((URL)localObject2).getProtocol()))
        {
          localHttpURLConnection = (HttpURLConnection)((URL)localObject2).openConnection();
          try
          {
            zzp.zzbx().zza(zzoL.getContext(), zzoL.zzgV().zzIz, false, localHttpURLConnection);
            int j = localHttpURLConnection.getResponseCode();
            Map localMap = localHttpURLConnection.getHeaderFields();
            if ((j >= 300) && (j <= 399))
            {
              localObject2 = null;
              if (localMap.containsKey("Location"))
              {
                localObject2 = (List)localMap.get("Location");
                if ((localObject2 == null) || (((List)localObject2).size() <= 0)) {
                  continue;
                }
                localObject2 = (String)((List)localObject2).get(0);
                if (TextUtils.isEmpty((CharSequence)localObject2))
                {
                  zzb.zzaE("Arrived at landing page, this ideally should not happen. Will open it in browser.");
                  localHttpURLConnection.disconnect();
                }
              }
              else
              {
                if (!localMap.containsKey("location")) {
                  continue;
                }
                localObject2 = (List)localMap.get("location");
                continue;
              }
            }
          }
          finally
          {
            try
            {
              localHttpURLConnection.disconnect();
              i += 1;
              localObject1 = localObject2;
            }
            catch (RuntimeException localRuntimeException2)
            {
              localObject1 = localRuntimeException1;
              localObject4 = localRuntimeException2;
              continue;
            }
            catch (IOException localIOException2)
            {
              localObject1 = localObject4;
              localObject4 = localIOException2;
              continue;
            }
            catch (IndexOutOfBoundsException localIndexOutOfBoundsException2)
            {
              localObject1 = localObject4;
              localObject4 = localIndexOutOfBoundsException2;
              continue;
            }
            localObject3 = finally;
            localHttpURLConnection.disconnect();
          }
        }
      }
    }
  }
  
  public static class zzb
  {
    public zzb() {}
    
    public Intent zza(Intent paramIntent, ResolveInfo paramResolveInfo)
    {
      paramIntent = new Intent(paramIntent);
      paramIntent.setClassName(activityInfo.packageName, activityInfo.name);
      return paramIntent;
    }
    
    public ResolveInfo zza(Context paramContext, Intent paramIntent)
    {
      return zza(paramContext, paramIntent, new ArrayList());
    }
    
    public ResolveInfo zza(Context paramContext, Intent paramIntent, ArrayList<ResolveInfo> paramArrayList)
    {
      paramContext = paramContext.getPackageManager();
      if (paramContext == null) {
        return null;
      }
      List localList = paramContext.queryIntentActivities(paramIntent, 65536);
      paramContext = paramContext.resolveActivity(paramIntent, 65536);
      int i;
      if ((localList != null) && (paramContext != null))
      {
        i = 0;
        if (i < localList.size())
        {
          paramIntent = (ResolveInfo)localList.get(i);
          if ((paramContext == null) || (!activityInfo.name.equals(activityInfo.name))) {}
        }
      }
      for (;;)
      {
        paramArrayList.addAll(localList);
        return paramContext;
        i += 1;
        break;
        paramContext = null;
      }
    }
    
    public Intent zzb(Context paramContext, Map<String, String> paramMap)
    {
      Object localObject1 = null;
      Object localObject2 = (ActivityManager)paramContext.getSystemService("activity");
      Object localObject3 = (String)paramMap.get("u");
      if (TextUtils.isEmpty((CharSequence)localObject3))
      {
        paramMap = (Map<String, String>)localObject1;
        return paramMap;
      }
      localObject1 = Uri.parse((String)localObject3);
      boolean bool1 = Boolean.parseBoolean((String)paramMap.get("use_first_package"));
      boolean bool2 = Boolean.parseBoolean((String)paramMap.get("use_running_process"));
      if ("http".equalsIgnoreCase(((Uri)localObject1).getScheme())) {
        paramMap = ((Uri)localObject1).buildUpon().scheme("https").build();
      }
      for (;;)
      {
        localObject3 = new ArrayList();
        Intent localIntent = zzd((Uri)localObject1);
        paramMap = zzd(paramMap);
        localObject1 = zza(paramContext, localIntent, (ArrayList)localObject3);
        if (localObject1 != null)
        {
          return zza(localIntent, (ResolveInfo)localObject1);
          if ("https".equalsIgnoreCase(((Uri)localObject1).getScheme())) {
            paramMap = ((Uri)localObject1).buildUpon().scheme("http").build();
          }
        }
        else
        {
          if (paramMap != null)
          {
            paramMap = zza(paramContext, paramMap);
            if (paramMap != null)
            {
              localObject1 = zza(localIntent, paramMap);
              paramMap = (Map<String, String>)localObject1;
              if (zza(paramContext, (Intent)localObject1) != null) {
                break;
              }
            }
          }
          if (((ArrayList)localObject3).size() == 0) {
            return localIntent;
          }
          if ((bool2) && (localObject2 != null))
          {
            paramContext = ((ActivityManager)localObject2).getRunningAppProcesses();
            if (paramContext != null)
            {
              do
              {
                paramMap = ((ArrayList)localObject3).iterator();
                while (!((Iterator)localObject2).hasNext())
                {
                  if (!paramMap.hasNext()) {
                    break;
                  }
                  localObject1 = (ResolveInfo)paramMap.next();
                  localObject2 = paramContext.iterator();
                }
              } while (!nextprocessName.equals(activityInfo.packageName));
              return zza(localIntent, (ResolveInfo)localObject1);
            }
          }
          if (bool1) {
            return zza(localIntent, (ResolveInfo)((ArrayList)localObject3).get(0));
          }
          return localIntent;
        }
        paramMap = null;
      }
    }
    
    public Intent zzd(Uri paramUri)
    {
      if (paramUri == null) {
        return null;
      }
      Intent localIntent = new Intent("android.intent.action.VIEW");
      localIntent.addFlags(268435456);
      localIntent.setData(paramUri);
      localIntent.setAction("android.intent.action.VIEW");
      return localIntent;
    }
  }
}
