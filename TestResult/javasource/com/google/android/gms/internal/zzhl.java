package com.google.android.gms.internal;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import com.google.android.gms.ads.internal.purchase.zzi;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.common.GooglePlayServicesUtil;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Set;
import java.util.concurrent.Future;

@zzgk
public class zzhl
  implements zzhs.zzb
{
  private Context mContext;
  private boolean zzFr = true;
  private boolean zzFs = true;
  private final String zzGY;
  private final zzhm zzGZ;
  private BigInteger zzHa = BigInteger.ONE;
  private final HashSet<zzhk> zzHb = new HashSet();
  private final HashMap<String, zzho> zzHc = new HashMap();
  private boolean zzHd = false;
  private int zzHe = 0;
  private zzca zzHf = null;
  private zzbk zzHg = null;
  private final LinkedList<Thread> zzHh = new LinkedList();
  private Boolean zzHi = null;
  private String zzHj;
  private boolean zzHk = false;
  private zzay zzou;
  private VersionInfoParcel zzpa;
  private final Object zzpc = new Object();
  private boolean zzpr = false;
  private zzbj zzrP = null;
  private zzbi zzrQ = null;
  private final zzgj zzrR = null;
  
  public zzhl(zzhu paramZzhu)
  {
    zzGY = paramZzhu.zzgs();
    zzGZ = new zzhm(zzGY);
  }
  
  public String getSessionId()
  {
    return zzGY;
  }
  
  public void zzA(boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      zzFs = paramBoolean;
      return;
    }
  }
  
  public void zzB(boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      zzHk = paramBoolean;
      return;
    }
  }
  
  public zzbk zzF(Context paramContext)
  {
    if ((!((Boolean)zzby.zzuE.get()).booleanValue()) || (!zzlv.zzpR()) || (zzfZ())) {
      return null;
    }
    synchronized (zzpc)
    {
      if (zzrP == null)
      {
        if (!(paramContext instanceof Activity)) {
          return null;
        }
        zzrP = new zzbj((Application)paramContext.getApplicationContext(), (Activity)paramContext);
      }
      if (zzrQ == null) {
        zzrQ = new zzbi();
      }
      if (zzHg == null) {
        zzHg = new zzbk(zzrP, zzrQ, new zzgj(mContext, zzpa, null, null));
      }
      zzHg.zzct();
      paramContext = zzHg;
      return paramContext;
    }
  }
  
  public Bundle zza(Context paramContext, zzhn paramZzhn, String paramString)
  {
    Bundle localBundle;
    synchronized (zzpc)
    {
      localBundle = new Bundle();
      localBundle.putBundle("app", zzGZ.zze(paramContext, paramString));
      paramContext = new Bundle();
      paramString = zzHc.keySet().iterator();
      if (paramString.hasNext())
      {
        String str = (String)paramString.next();
        paramContext.putBundle(str, ((zzho)zzHc.get(str)).toBundle());
      }
    }
    localBundle.putBundle("slots", paramContext);
    paramContext = new ArrayList();
    paramString = zzHb.iterator();
    while (paramString.hasNext()) {
      paramContext.add(((zzhk)paramString.next()).toBundle());
    }
    localBundle.putParcelableArrayList("ads", paramContext);
    paramZzhn.zza(zzHb);
    zzHb.clear();
    return localBundle;
  }
  
  public Future zza(Context paramContext, boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      if (paramBoolean != zzFr)
      {
        zzFr = paramBoolean;
        paramContext = zzhs.zza(paramContext, paramBoolean);
        return paramContext;
      }
      return null;
    }
  }
  
  public void zza(zzhk paramZzhk)
  {
    synchronized (zzpc)
    {
      zzHb.add(paramZzhk);
      return;
    }
  }
  
  public void zza(String paramString, zzho paramZzho)
  {
    synchronized (zzpc)
    {
      zzHc.put(paramString, paramZzho);
      return;
    }
  }
  
  public void zza(Thread paramThread)
  {
    zzgj.zza(mContext, paramThread, zzpa);
  }
  
  public void zzb(Context paramContext, VersionInfoParcel paramVersionInfoParcel)
  {
    synchronized (zzpc)
    {
      if (!zzpr)
      {
        mContext = paramContext.getApplicationContext();
        zzpa = paramVersionInfoParcel;
        zzhs.zza(paramContext, this);
        zzhs.zzb(paramContext, this);
        zza(Thread.currentThread());
        zzHj = zzp.zzbx().zzf(paramContext, zzIz);
        zzou = new zzay(paramContext.getApplicationContext(), zzpa, new zzdv(paramContext.getApplicationContext(), zzpa, (String)zzby.zztW.get()));
        zzgk();
        zzp.zzbH().zzy(mContext);
        zzpr = true;
      }
      return;
    }
  }
  
  public void zzb(Boolean paramBoolean)
  {
    synchronized (zzpc)
    {
      zzHi = paramBoolean;
      return;
    }
  }
  
  public void zzb(HashSet<zzhk> paramHashSet)
  {
    synchronized (zzpc)
    {
      zzHb.addAll(paramHashSet);
      return;
    }
  }
  
  public String zzc(int paramInt, String paramString)
  {
    if (zzpa.zzIC) {}
    for (Resources localResources = mContext.getResources(); localResources == null; localResources = GooglePlayServicesUtil.getRemoteResource(mContext)) {
      return paramString;
    }
    return localResources.getString(paramInt);
  }
  
  public void zzc(Throwable paramThrowable, boolean paramBoolean)
  {
    new zzgj(mContext, zzpa, null, null).zza(paramThrowable, paramBoolean);
  }
  
  public void zzd(Bundle paramBundle)
  {
    synchronized (zzpc)
    {
      if (paramBundle.containsKey("use_https")) {}
      for (boolean bool = paramBundle.getBoolean("use_https");; bool = zzFr)
      {
        zzFr = bool;
        if (!paramBundle.containsKey("webview_cache_version")) {
          break;
        }
        i = paramBundle.getInt("webview_cache_version");
        zzHe = i;
        return;
      }
      int i = zzHe;
    }
  }
  
  public boolean zzfZ()
  {
    synchronized (zzpc)
    {
      boolean bool = zzFs;
      return bool;
    }
  }
  
  public String zzga()
  {
    synchronized (zzpc)
    {
      String str = zzHa.toString();
      zzHa = zzHa.add(BigInteger.ONE);
      return str;
    }
  }
  
  public zzhm zzgb()
  {
    synchronized (zzpc)
    {
      zzhm localZzhm = zzGZ;
      return localZzhm;
    }
  }
  
  public zzca zzgc()
  {
    synchronized (zzpc)
    {
      zzca localZzca = zzHf;
      return localZzca;
    }
  }
  
  public boolean zzgd()
  {
    synchronized (zzpc)
    {
      boolean bool = zzHd;
      zzHd = true;
      return bool;
    }
  }
  
  public boolean zzge()
  {
    synchronized (zzpc)
    {
      boolean bool = zzFr;
      return bool;
    }
  }
  
  public String zzgf()
  {
    synchronized (zzpc)
    {
      String str = zzHj;
      return str;
    }
  }
  
  public Boolean zzgg()
  {
    synchronized (zzpc)
    {
      Boolean localBoolean = zzHi;
      return localBoolean;
    }
  }
  
  public zzay zzgh()
  {
    return zzou;
  }
  
  public boolean zzgi()
  {
    synchronized (zzpc)
    {
      if (zzHe < ((Integer)zzby.zzuS.get()).intValue())
      {
        zzHe = ((Integer)zzby.zzuS.get()).intValue();
        zzhs.zza(mContext, zzHe);
        return true;
      }
      return false;
    }
  }
  
  public boolean zzgj()
  {
    synchronized (zzpc)
    {
      boolean bool = zzHk;
      return bool;
    }
  }
  
  void zzgk()
  {
    zzbz localZzbz = new zzbz(mContext, zzpa.zzIz);
    try
    {
      zzHf = zzp.zzbC().zza(localZzbz);
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      zzb.zzd("Cannot initialize CSI reporter.", localIllegalArgumentException);
    }
  }
}
