package com.google.android.gms.tagmanager;

import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Looper;
import com.google.android.gms.common.api.PendingResult;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

public class TagManager
{
  private static TagManager zzaSv;
  private final Context mContext;
  private final DataLayer zzaOT;
  private final zzs zzaRp;
  private final zza zzaSs;
  private final zzct zzaSt;
  private final ConcurrentMap<zzo, Boolean> zzaSu;
  
  TagManager(Context paramContext, zza paramZza, DataLayer paramDataLayer, zzct paramZzct)
  {
    if (paramContext == null) {
      throw new NullPointerException("context cannot be null");
    }
    mContext = paramContext.getApplicationContext();
    zzaSt = paramZzct;
    zzaSs = paramZza;
    zzaSu = new ConcurrentHashMap();
    zzaOT = paramDataLayer;
    zzaOT.zza(new DataLayer.zzb()
    {
      public void zzH(Map<String, Object> paramAnonymousMap)
      {
        paramAnonymousMap = paramAnonymousMap.get("event");
        if (paramAnonymousMap != null) {
          TagManager.zza(TagManager.this, paramAnonymousMap.toString());
        }
      }
    });
    zzaOT.zza(new zzd(mContext));
    zzaRp = new zzs();
    zzAU();
  }
  
  public static TagManager getInstance(Context paramContext)
  {
    try
    {
      if (zzaSv != null) {
        break label68;
      }
      if (paramContext == null)
      {
        zzbg.e("TagManager.getInstance requires non-null context.");
        throw new NullPointerException();
      }
    }
    finally {}
    zzaSv = new TagManager(paramContext, new zza()new DataLayernew zzw
    {
      public zzp zza(Context paramAnonymousContext, TagManager paramAnonymousTagManager, Looper paramAnonymousLooper, String paramAnonymousString, int paramAnonymousInt, zzs paramAnonymousZzs)
      {
        return new zzp(paramAnonymousContext, paramAnonymousTagManager, paramAnonymousLooper, paramAnonymousString, paramAnonymousInt, paramAnonymousZzs);
      }
    }, new DataLayer(new zzw(paramContext)), zzcu.zzAP());
    label68:
    paramContext = zzaSv;
    return paramContext;
  }
  
  private void zzAU()
  {
    if (Build.VERSION.SDK_INT >= 14) {
      mContext.registerComponentCallbacks(new ComponentCallbacks2()
      {
        public void onConfigurationChanged(Configuration paramAnonymousConfiguration) {}
        
        public void onLowMemory() {}
        
        public void onTrimMemory(int paramAnonymousInt)
        {
          if (paramAnonymousInt == 20) {
            dispatch();
          }
        }
      });
    }
  }
  
  private void zzeU(String paramString)
  {
    Iterator localIterator = zzaSu.keySet().iterator();
    while (localIterator.hasNext()) {
      ((zzo)localIterator.next()).zzew(paramString);
    }
  }
  
  public void dispatch()
  {
    zzaSt.dispatch();
  }
  
  public DataLayer getDataLayer()
  {
    return zzaOT;
  }
  
  void zza(zzo paramZzo)
  {
    zzaSu.put(paramZzo, Boolean.valueOf(true));
  }
  
  boolean zzb(zzo paramZzo)
  {
    return zzaSu.remove(paramZzo) != null;
  }
  
  public PendingResult<ContainerHolder> zzc(String paramString1, int paramInt, String paramString2)
  {
    paramString1 = zzaSs.zza(mContext, this, null, paramString1, paramInt, zzaRp);
    paramString1.load(paramString2);
    return paramString1;
  }
  
  boolean zzm(Uri paramUri)
  {
    for (;;)
    {
      boolean bool;
      Object localObject2;
      try
      {
        localObject1 = zzcb.zzAv();
        if (!((zzcb)localObject1).zzm(paramUri)) {
          break label229;
        }
        paramUri = ((zzcb)localObject1).getContainerId();
        int i = 4.zzaSx[localObject1.zzAw().ordinal()];
        switch (i)
        {
        default: 
          bool = true;
          return bool;
        }
      }
      finally {}
      Object localObject1 = zzaSu.keySet().iterator();
      if (((Iterator)localObject1).hasNext())
      {
        localObject2 = (zzo)((Iterator)localObject1).next();
        if (((zzo)localObject2).getContainerId().equals(paramUri))
        {
          ((zzo)localObject2).zzey(null);
          ((zzo)localObject2).refresh();
        }
      }
      else
      {
        continue;
        localObject2 = zzaSu.keySet().iterator();
        while (((Iterator)localObject2).hasNext())
        {
          zzo localZzo = (zzo)((Iterator)localObject2).next();
          if (localZzo.getContainerId().equals(paramUri))
          {
            localZzo.zzey(((zzcb)localObject1).zzAx());
            localZzo.refresh();
          }
          else if (localZzo.zzzE() != null)
          {
            localZzo.zzey(null);
            localZzo.refresh();
          }
        }
        continue;
        label229:
        bool = false;
      }
    }
  }
  
  public static abstract interface zza
  {
    public abstract zzp zza(Context paramContext, TagManager paramTagManager, Looper paramLooper, String paramString, int paramInt, zzs paramZzs);
  }
}
