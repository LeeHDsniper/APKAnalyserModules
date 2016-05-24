package com.google.android.gms.ads.internal.purchase;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.SystemClock;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.internal.zzfl.zza;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhl;
import com.google.android.gms.internal.zzhm;
import com.google.android.gms.internal.zzhu;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Set;

@zzgk
public class zzd
  extends zzfl.zza
{
  private Context mContext;
  private String zzBW;
  private ArrayList<String> zzBX;
  private String zzqK;
  
  public zzd(String paramString1, ArrayList<String> paramArrayList, Context paramContext, String paramString2)
  {
    zzBW = paramString1;
    zzBX = paramArrayList;
    zzqK = paramString2;
    mContext = paramContext;
  }
  
  public String getProductId()
  {
    return zzBW;
  }
  
  public void recordPlayBillingResolution(int paramInt)
  {
    if (paramInt == 0) {
      zzfh();
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("google_play_status", String.valueOf(paramInt));
    localHashMap.put("sku", zzBW);
    localHashMap.put("status", String.valueOf(zzy(paramInt)));
    LinkedList localLinkedList = new LinkedList();
    Iterator localIterator = zzBX.iterator();
    while (localIterator.hasNext()) {
      localLinkedList.add(zza((String)localIterator.next(), localHashMap));
    }
    zzp.zzbx().zza(mContext, zzqK, localLinkedList);
  }
  
  public void recordResolution(int paramInt)
  {
    if (paramInt == 1) {
      zzfh();
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("status", String.valueOf(paramInt));
    localHashMap.put("sku", zzBW);
    LinkedList localLinkedList = new LinkedList();
    Iterator localIterator = zzBX.iterator();
    while (localIterator.hasNext()) {
      localLinkedList.add(zza((String)localIterator.next(), localHashMap));
    }
    zzp.zzbx().zza(mContext, zzqK, localLinkedList);
  }
  
  protected String zza(String paramString, HashMap<String, String> paramHashMap)
  {
    String str3 = mContext.getPackageName();
    long l1;
    long l2;
    String str2;
    try
    {
      String str1 = mContext.getPackageManager().getPackageInfo(str3, 0).versionName;
      l1 = zzp.zzbA().zzgb().zzgl();
      l2 = SystemClock.elapsedRealtime();
      Iterator localIterator = paramHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str4 = (String)localIterator.next();
        paramString = paramString.replaceAll(String.format("(?<!@)((?:@@)*)@%s(?<!@)((?:@@)*)@", new Object[] { str4 }), String.format("$1%s$2", new Object[] { paramHashMap.get(str4) }));
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      for (;;)
      {
        zzb.zzd("Error to retrieve app version", localNameNotFoundException);
        str2 = "";
      }
    }
    return paramString.replaceAll(String.format("(?<!@)((?:@@)*)@%s(?<!@)((?:@@)*)@", tmp138_135), String.format("$1%s$2", tmp152_149)).replaceAll(String.format("(?<!@)((?:@@)*)@%s(?<!@)((?:@@)*)@", tmp173_170), String.format("$1%s$2", tmp187_184)).replaceAll(String.format("(?<!@)((?:@@)*)@%s(?<!@)((?:@@)*)@", tmp204_201), String.format("$1%s$2", tmp218_215)).replaceAll(String.format("(?<!@)((?:@@)*)@%s(?<!@)((?:@@)*)@", tmp239_236), String.format("$1%s$2", tmp253_250)).replaceAll(String.format("(?<!@)((?:@@)*)@%s(?<!@)((?:@@)*)@", tmp272_269), String.format("$1%s$2", tmp286_283)).replaceAll(String.format("(?<!@)((?:@@)*)@%s(?<!@)((?:@@)*)@", tmp303_300), String.format("$1%s$2", tmp317_314)).replaceAll(String.format("(?<!@)((?:@@)*)@%s(?<!@)((?:@@)*)@", tmp339_336), String.format("$1%s$2", tmp353_350)).replaceAll("@@", "@");
  }
  
  void zzfh()
  {
    try
    {
      mContext.getClassLoader().loadClass("com.google.ads.conversiontracking.IAPConversionReporter").getDeclaredMethod("reportWithProductId", new Class[] { Context.class, String.class, String.class, Boolean.TYPE }).invoke(null, new Object[] { mContext, zzBW, "", Boolean.valueOf(true) });
      return;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      zzb.zzaE("Google Conversion Tracking SDK 1.2.0 or above is required to report a conversion.");
      return;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      zzb.zzaE("Google Conversion Tracking SDK 1.2.0 or above is required to report a conversion.");
      return;
    }
    catch (Exception localException)
    {
      zzb.zzd("Fail to report a conversion.", localException);
    }
  }
  
  protected int zzy(int paramInt)
  {
    if (paramInt == 0) {
      return 1;
    }
    if (paramInt == 1) {
      return 2;
    }
    if (paramInt == 4) {
      return 3;
    }
    return 0;
  }
}
