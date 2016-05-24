package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzag.zza;
import com.google.android.gms.internal.zzqp;
import com.google.android.gms.internal.zzqp.zza;
import com.google.android.gms.internal.zzqp.zzc;
import com.google.android.gms.internal.zzqp.zze;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class zzcp
{
  private static final zzbw<zzag.zza> zzaRy = new zzbw(zzdf.zzBg(), true);
  private final DataLayer zzaOT;
  private final zzah zzaRA;
  private final Map<String, zzak> zzaRB;
  private final Map<String, zzak> zzaRC;
  private final Map<String, zzak> zzaRD;
  private final zzl<zzqp.zza, zzbw<zzag.zza>> zzaRE;
  private final zzl<String, zzb> zzaRF;
  private final Set<zzqp.zze> zzaRG;
  private final Map<String, zzc> zzaRH;
  private volatile String zzaRI;
  private int zzaRJ;
  private final zzqp.zzc zzaRz;
  
  public zzcp(Context paramContext, zzqp.zzc paramZzc, DataLayer paramDataLayer, zzt.zza paramZza1, zzt.zza paramZza2, zzah paramZzah)
  {
    if (paramZzc == null) {
      throw new NullPointerException("resource cannot be null");
    }
    zzaRz = paramZzc;
    zzaRG = new HashSet(paramZzc.zzBG());
    zzaOT = paramDataLayer;
    zzaRA = paramZzah;
    paramZzc = new zzm.zza()
    {
      public int zza(zzqp.zza paramAnonymousZza, zzbw<zzag.zza> paramAnonymousZzbw)
      {
        return ((zzag.zza)paramAnonymousZzbw.getObject()).zzDw();
      }
    };
    zzaRE = new zzm().zza(1048576, paramZzc);
    paramZzc = new zzm.zza()
    {
      public int zza(String paramAnonymousString, zzcp.zzb paramAnonymousZzb)
      {
        return paramAnonymousString.length() + paramAnonymousZzb.getSize();
      }
    };
    zzaRF = new zzm().zza(1048576, paramZzc);
    zzaRB = new HashMap();
    zzb(new zzj(paramContext));
    zzb(new zzt(paramZza2));
    zzb(new zzx(paramDataLayer));
    zzb(new zzdg(paramContext, paramDataLayer));
    zzb(new zzdb(paramContext, paramDataLayer));
    zzaRC = new HashMap();
    zzc(new zzr());
    zzc(new zzae());
    zzc(new zzaf());
    zzc(new zzam());
    zzc(new zzan());
    zzc(new zzbc());
    zzc(new zzbd());
    zzc(new zzcf());
    zzc(new zzcy());
    zzaRD = new HashMap();
    zza(new zzb(paramContext));
    zza(new zzc(paramContext));
    zza(new zze(paramContext));
    zza(new zzf(paramContext));
    zza(new zzg(paramContext));
    zza(new zzh(paramContext));
    zza(new zzi(paramContext));
    zza(new zzn());
    zza(new zzq(zzaRz.getVersion()));
    zza(new zzt(paramZza1));
    zza(new zzv(paramDataLayer));
    zza(new zzaa(paramContext));
    zza(new zzab());
    zza(new zzad());
    zza(new zzai(this));
    zza(new zzao());
    zza(new zzap());
    zza(new zzaw(paramContext));
    zza(new zzay());
    zza(new zzbb());
    zza(new zzbi());
    zza(new zzbk(paramContext));
    zza(new zzbx());
    zza(new zzbz());
    zza(new zzcc());
    zza(new zzce());
    zza(new zzcg(paramContext));
    zza(new zzcq());
    zza(new zzcr());
    zza(new zzda());
    zza(new zzdh());
    zzaRH = new HashMap();
    paramDataLayer = zzaRG.iterator();
    while (paramDataLayer.hasNext())
    {
      paramZza1 = (zzqp.zze)paramDataLayer.next();
      if (paramZzah.zzAb())
      {
        zza(paramZza1.zzBO(), paramZza1.zzBP(), "add macro");
        zza(paramZza1.zzBT(), paramZza1.zzBQ(), "remove macro");
        zza(paramZza1.zzBM(), paramZza1.zzBR(), "add tag");
        zza(paramZza1.zzBN(), paramZza1.zzBS(), "remove tag");
      }
      int i = 0;
      while (i < paramZza1.zzBO().size())
      {
        paramZza2 = (zzqp.zza)paramZza1.zzBO().get(i);
        paramZzc = "Unknown";
        paramContext = paramZzc;
        if (paramZzah.zzAb())
        {
          paramContext = paramZzc;
          if (i < paramZza1.zzBP().size()) {
            paramContext = (String)paramZza1.zzBP().get(i);
          }
        }
        paramZzc = zzi(zzaRH, zza(paramZza2));
        paramZzc.zza(paramZza1);
        paramZzc.zza(paramZza1, paramZza2);
        paramZzc.zza(paramZza1, paramContext);
        i += 1;
      }
      i = 0;
      while (i < paramZza1.zzBT().size())
      {
        paramZza2 = (zzqp.zza)paramZza1.zzBT().get(i);
        paramZzc = "Unknown";
        paramContext = paramZzc;
        if (paramZzah.zzAb())
        {
          paramContext = paramZzc;
          if (i < paramZza1.zzBQ().size()) {
            paramContext = (String)paramZza1.zzBQ().get(i);
          }
        }
        paramZzc = zzi(zzaRH, zza(paramZza2));
        paramZzc.zza(paramZza1);
        paramZzc.zzb(paramZza1, paramZza2);
        paramZzc.zzb(paramZza1, paramContext);
        i += 1;
      }
    }
    paramContext = zzaRz.zzBH().entrySet().iterator();
    while (paramContext.hasNext())
    {
      paramZzc = (Map.Entry)paramContext.next();
      paramDataLayer = ((List)paramZzc.getValue()).iterator();
      while (paramDataLayer.hasNext())
      {
        paramZza1 = (zzqp.zza)paramDataLayer.next();
        if (!zzdf.zzk((zzag.zza)paramZza1.zzBD().get(com.google.android.gms.internal.zzae.zzfW.toString())).booleanValue()) {
          zzi(zzaRH, (String)paramZzc.getKey()).zzb(paramZza1);
        }
      }
    }
  }
  
  private String zzAG()
  {
    if (zzaRJ <= 1) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(Integer.toString(zzaRJ));
    int i = 2;
    while (i < zzaRJ)
    {
      localStringBuilder.append(' ');
      i += 1;
    }
    localStringBuilder.append(": ");
    return localStringBuilder.toString();
  }
  
  private zzbw<zzag.zza> zza(zzag.zza paramZza, Set<String> paramSet, zzdi paramZzdi)
  {
    if (!zzje) {
      return new zzbw(paramZza, true);
    }
    zzbw localZzbw1;
    switch (type)
    {
    case 5: 
    case 6: 
    default: 
      zzbg.e("Unknown type: " + type);
      return zzaRy;
    case 2: 
      localZza = zzqp.zzo(paramZza);
      zziV = new zzag.zza[zziV.length];
      i = 0;
      while (i < zziV.length)
      {
        localZzbw1 = zza(zziV[i], paramSet, paramZzdi.zzjf(i));
        if (localZzbw1 == zzaRy) {
          return zzaRy;
        }
        zziV[i] = ((zzag.zza)localZzbw1.getObject());
        i += 1;
      }
      return new zzbw(localZza, false);
    case 3: 
      localZza = zzqp.zzo(paramZza);
      if (zziW.length != zziX.length)
      {
        zzbg.e("Invalid serving value: " + paramZza.toString());
        return zzaRy;
      }
      zziW = new zzag.zza[zziW.length];
      zziX = new zzag.zza[zziW.length];
      i = 0;
      while (i < zziW.length)
      {
        localZzbw1 = zza(zziW[i], paramSet, paramZzdi.zzjg(i));
        zzbw localZzbw2 = zza(zziX[i], paramSet, paramZzdi.zzjh(i));
        if ((localZzbw1 == zzaRy) || (localZzbw2 == zzaRy)) {
          return zzaRy;
        }
        zziW[i] = ((zzag.zza)localZzbw1.getObject());
        zziX[i] = ((zzag.zza)localZzbw2.getObject());
        i += 1;
      }
      return new zzbw(localZza, false);
    case 4: 
      if (paramSet.contains(zziY))
      {
        zzbg.e("Macro cycle detected.  Current macro reference: " + zziY + "." + "  Previous macro references: " + paramSet.toString() + ".");
        return zzaRy;
      }
      paramSet.add(zziY);
      paramZzdi = zzdj.zza(zza(zziY, paramSet, paramZzdi.zzAp()), zzjd);
      paramSet.remove(zziY);
      return paramZzdi;
    }
    zzag.zza localZza = zzqp.zzo(paramZza);
    zzjc = new zzag.zza[zzjc.length];
    int i = 0;
    while (i < zzjc.length)
    {
      localZzbw1 = zza(zzjc[i], paramSet, paramZzdi.zzji(i));
      if (localZzbw1 == zzaRy) {
        return zzaRy;
      }
      zzjc[i] = ((zzag.zza)localZzbw1.getObject());
      i += 1;
    }
    return new zzbw(localZza, false);
  }
  
  private zzbw<zzag.zza> zza(String paramString, Set<String> paramSet, zzbj paramZzbj)
  {
    zzaRJ += 1;
    Object localObject = (zzb)zzaRF.get(paramString);
    if ((localObject != null) && (!zzaRA.zzAb()))
    {
      zza(((zzb)localObject).zzAI(), paramSet);
      zzaRJ -= 1;
      return ((zzb)localObject).zzAH();
    }
    localObject = (zzc)zzaRH.get(paramString);
    if (localObject == null)
    {
      zzbg.e(zzAG() + "Invalid macro: " + paramString);
      zzaRJ -= 1;
      return zzaRy;
    }
    zzbw localZzbw = zza(paramString, ((zzc)localObject).zzAJ(), ((zzc)localObject).zzAK(), ((zzc)localObject).zzAL(), ((zzc)localObject).zzAN(), ((zzc)localObject).zzAM(), paramSet, paramZzbj.zzzR());
    if (((Set)localZzbw.getObject()).isEmpty()) {}
    for (localObject = ((zzc)localObject).zzAO(); localObject == null; localObject = (zzqp.zza)((Set)localZzbw.getObject()).iterator().next())
    {
      zzaRJ -= 1;
      return zzaRy;
      if (((Set)localZzbw.getObject()).size() > 1) {
        zzbg.zzaE(zzAG() + "Multiple macros active for macroName " + paramString);
      }
    }
    paramZzbj = zza(zzaRD, (zzqp.zza)localObject, paramSet, paramZzbj.zzAh());
    boolean bool;
    if ((localZzbw.zzAq()) && (paramZzbj.zzAq()))
    {
      bool = true;
      if (paramZzbj != zzaRy) {
        break label392;
      }
    }
    label392:
    for (paramZzbj = zzaRy;; paramZzbj = new zzbw(paramZzbj.getObject(), bool))
    {
      localObject = ((zzqp.zza)localObject).zzAI();
      if (paramZzbj.zzAq()) {
        zzaRF.zzf(paramString, new zzb(paramZzbj, (zzag.zza)localObject));
      }
      zza((zzag.zza)localObject, paramSet);
      zzaRJ -= 1;
      return paramZzbj;
      bool = false;
      break;
    }
  }
  
  private zzbw<zzag.zza> zza(Map<String, zzak> paramMap, zzqp.zza paramZza, Set<String> paramSet, zzch paramZzch)
  {
    boolean bool = true;
    Object localObject1 = (zzag.zza)paramZza.zzBD().get(com.google.android.gms.internal.zzae.zzfj.toString());
    if (localObject1 == null)
    {
      zzbg.e("No function id in properties");
      paramMap = zzaRy;
    }
    zzak localZzak;
    do
    {
      return paramMap;
      localObject1 = zziZ;
      localZzak = (zzak)paramMap.get(localObject1);
      if (localZzak == null)
      {
        zzbg.e((String)localObject1 + " has no backing implementation.");
        return zzaRy;
      }
      paramMap = (zzbw)zzaRE.get(paramZza);
    } while ((paramMap != null) && (!zzaRA.zzAb()));
    paramMap = new HashMap();
    Iterator localIterator = paramZza.zzBD().entrySet().iterator();
    int i = 1;
    if (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Object localObject2 = paramZzch.zzeO((String)localEntry.getKey());
      localObject2 = zza((zzag.zza)localEntry.getValue(), paramSet, ((zzcj)localObject2).zze((zzag.zza)localEntry.getValue()));
      if (localObject2 == zzaRy) {
        return zzaRy;
      }
      if (((zzbw)localObject2).zzAq()) {
        paramZza.zza((String)localEntry.getKey(), (zzag.zza)((zzbw)localObject2).getObject());
      }
      for (;;)
      {
        paramMap.put(localEntry.getKey(), ((zzbw)localObject2).getObject());
        break;
        i = 0;
      }
    }
    if (!localZzak.zzf(paramMap.keySet()))
    {
      zzbg.e("Incorrect keys for function " + (String)localObject1 + " required " + localZzak.zzAd() + " had " + paramMap.keySet());
      return zzaRy;
    }
    if ((i != 0) && (localZzak.zzzx())) {}
    for (;;)
    {
      paramMap = new zzbw(localZzak.zzG(paramMap), bool);
      if (bool) {
        zzaRE.zzf(paramZza, paramMap);
      }
      paramZzch.zzd((zzag.zza)paramMap.getObject());
      return paramMap;
      bool = false;
    }
  }
  
  private zzbw<Set<zzqp.zza>> zza(Set<zzqp.zze> paramSet, Set<String> paramSet1, zza paramZza, zzco paramZzco)
  {
    HashSet localHashSet1 = new HashSet();
    HashSet localHashSet2 = new HashSet();
    paramSet = paramSet.iterator();
    boolean bool = true;
    if (paramSet.hasNext())
    {
      zzqp.zze localZze = (zzqp.zze)paramSet.next();
      zzck localZzck = paramZzco.zzAo();
      zzbw localZzbw = zza(localZze, paramSet1, localZzck);
      if (((Boolean)localZzbw.getObject()).booleanValue()) {
        paramZza.zza(localZze, localHashSet1, localHashSet2, localZzck);
      }
      if ((bool) && (localZzbw.zzAq())) {}
      for (bool = true;; bool = false) {
        break;
      }
    }
    localHashSet1.removeAll(localHashSet2);
    paramZzco.zzg(localHashSet1);
    return new zzbw(localHashSet1, bool);
  }
  
  private static String zza(zzqp.zza paramZza)
  {
    return zzdf.zzg((zzag.zza)paramZza.zzBD().get(com.google.android.gms.internal.zzae.zzfu.toString()));
  }
  
  private void zza(zzag.zza paramZza, Set<String> paramSet)
  {
    if (paramZza == null) {}
    for (;;)
    {
      return;
      paramZza = zza(paramZza, paramSet, new zzbu());
      if (paramZza != zzaRy)
      {
        paramZza = zzdf.zzl((zzag.zza)paramZza.getObject());
        if ((paramZza instanceof Map))
        {
          paramZza = (Map)paramZza;
          zzaOT.push(paramZza);
          return;
        }
        if (!(paramZza instanceof List)) {
          break;
        }
        paramZza = ((List)paramZza).iterator();
        while (paramZza.hasNext())
        {
          paramSet = paramZza.next();
          if ((paramSet instanceof Map))
          {
            paramSet = (Map)paramSet;
            zzaOT.push(paramSet);
          }
          else
          {
            zzbg.zzaE("pushAfterEvaluate: value not a Map");
          }
        }
      }
    }
    zzbg.zzaE("pushAfterEvaluate: value not a Map or List");
  }
  
  private static void zza(List<zzqp.zza> paramList, List<String> paramList1, String paramString)
  {
    if (paramList.size() != paramList1.size()) {
      zzbg.zzaD("Invalid resource: imbalance of rule names of functions for " + paramString + " operation. Using default rule name instead");
    }
  }
  
  private static void zza(Map<String, zzak> paramMap, zzak paramZzak)
  {
    if (paramMap.containsKey(paramZzak.zzAc())) {
      throw new IllegalArgumentException("Duplicate function type name: " + paramZzak.zzAc());
    }
    paramMap.put(paramZzak.zzAc(), paramZzak);
  }
  
  private static zzc zzi(Map<String, zzc> paramMap, String paramString)
  {
    zzc localZzc2 = (zzc)paramMap.get(paramString);
    zzc localZzc1 = localZzc2;
    if (localZzc2 == null)
    {
      localZzc1 = new zzc();
      paramMap.put(paramString, localZzc1);
    }
    return localZzc1;
  }
  
  String zzAF()
  {
    try
    {
      String str = zzaRI;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  zzbw<Boolean> zza(zzqp.zza paramZza, Set<String> paramSet, zzch paramZzch)
  {
    paramZza = zza(zzaRC, paramZza, paramSet, paramZzch);
    paramSet = zzdf.zzk((zzag.zza)paramZza.getObject());
    paramZzch.zzd(zzdf.zzK(paramSet));
    return new zzbw(paramSet, paramZza.zzAq());
  }
  
  zzbw<Boolean> zza(zzqp.zze paramZze, Set<String> paramSet, zzck paramZzck)
  {
    Object localObject = paramZze.zzBL().iterator();
    boolean bool = true;
    if (((Iterator)localObject).hasNext())
    {
      zzbw localZzbw = zza((zzqp.zza)((Iterator)localObject).next(), paramSet, paramZzck.zzAi());
      if (((Boolean)localZzbw.getObject()).booleanValue())
      {
        paramZzck.zzf(zzdf.zzK(Boolean.valueOf(false)));
        return new zzbw(Boolean.valueOf(false), localZzbw.zzAq());
      }
      if ((bool) && (localZzbw.zzAq())) {}
      for (bool = true;; bool = false) {
        break;
      }
    }
    paramZze = paramZze.zzBK().iterator();
    while (paramZze.hasNext())
    {
      localObject = zza((zzqp.zza)paramZze.next(), paramSet, paramZzck.zzAj());
      if (!((Boolean)((zzbw)localObject).getObject()).booleanValue())
      {
        paramZzck.zzf(zzdf.zzK(Boolean.valueOf(false)));
        return new zzbw(Boolean.valueOf(false), ((zzbw)localObject).zzAq());
      }
      if ((bool) && (((zzbw)localObject).zzAq())) {
        bool = true;
      } else {
        bool = false;
      }
    }
    paramZzck.zzf(zzdf.zzK(Boolean.valueOf(true)));
    return new zzbw(Boolean.valueOf(true), bool);
  }
  
  zzbw<Set<zzqp.zza>> zza(String paramString, Set<zzqp.zze> paramSet, final Map<zzqp.zze, List<zzqp.zza>> paramMap1, final Map<zzqp.zze, List<String>> paramMap2, final Map<zzqp.zze, List<zzqp.zza>> paramMap3, final Map<zzqp.zze, List<String>> paramMap4, Set<String> paramSet1, zzco paramZzco)
  {
    zza(paramSet, paramSet1, new zza()
    {
      public void zza(zzqp.zze paramAnonymousZze, Set<zzqp.zza> paramAnonymousSet1, Set<zzqp.zza> paramAnonymousSet2, zzck paramAnonymousZzck)
      {
        List localList1 = (List)paramMap1.get(paramAnonymousZze);
        List localList2 = (List)paramMap2.get(paramAnonymousZze);
        if (localList1 != null)
        {
          paramAnonymousSet1.addAll(localList1);
          paramAnonymousZzck.zzAk().zzc(localList1, localList2);
        }
        paramAnonymousSet1 = (List)paramMap3.get(paramAnonymousZze);
        paramAnonymousZze = (List)paramMap4.get(paramAnonymousZze);
        if (paramAnonymousSet1 != null)
        {
          paramAnonymousSet2.addAll(paramAnonymousSet1);
          paramAnonymousZzck.zzAl().zzc(paramAnonymousSet1, paramAnonymousZze);
        }
      }
    }, paramZzco);
  }
  
  zzbw<Set<zzqp.zza>> zza(Set<zzqp.zze> paramSet, zzco paramZzco)
  {
    zza(paramSet, new HashSet(), new zza()
    {
      public void zza(zzqp.zze paramAnonymousZze, Set<zzqp.zza> paramAnonymousSet1, Set<zzqp.zza> paramAnonymousSet2, zzck paramAnonymousZzck)
      {
        paramAnonymousSet1.addAll(paramAnonymousZze.zzBM());
        paramAnonymousSet2.addAll(paramAnonymousZze.zzBN());
        paramAnonymousZzck.zzAm().zzc(paramAnonymousZze.zzBM(), paramAnonymousZze.zzBR());
        paramAnonymousZzck.zzAn().zzc(paramAnonymousZze.zzBN(), paramAnonymousZze.zzBS());
      }
    }, paramZzco);
  }
  
  void zza(zzak paramZzak)
  {
    zza(zzaRD, paramZzak);
  }
  
  void zzb(zzak paramZzak)
  {
    zza(zzaRB, paramZzak);
  }
  
  void zzc(zzak paramZzak)
  {
    zza(zzaRC, paramZzak);
  }
  
  public zzbw<zzag.zza> zzeS(String paramString)
  {
    zzaRJ = 0;
    zzag localZzag = zzaRA.zzeI(paramString);
    paramString = zza(paramString, new HashSet(), localZzag.zzzY());
    localZzag.zzAa();
    return paramString;
  }
  
  void zzeT(String paramString)
  {
    try
    {
      zzaRI = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public void zzew(String paramString)
  {
    try
    {
      zzeT(paramString);
      paramString = zzaRA.zzeJ(paramString);
      zzu localZzu = paramString.zzzZ();
      Iterator localIterator = ((Set)zza(zzaRG, localZzu.zzzR()).getObject()).iterator();
      while (localIterator.hasNext())
      {
        zzqp.zza localZza = (zzqp.zza)localIterator.next();
        zza(zzaRB, localZza, new HashSet(), localZzu.zzzQ());
      }
      paramString.zzAa();
    }
    finally {}
    zzeT(null);
  }
  
  static abstract interface zza
  {
    public abstract void zza(zzqp.zze paramZze, Set<zzqp.zza> paramSet1, Set<zzqp.zza> paramSet2, zzck paramZzck);
  }
  
  private static class zzb
  {
    private zzbw<zzag.zza> zzaRP;
    private zzag.zza zzaRQ;
    
    public zzb(zzbw<zzag.zza> paramZzbw, zzag.zza paramZza)
    {
      zzaRP = paramZzbw;
      zzaRQ = paramZza;
    }
    
    public int getSize()
    {
      int j = ((zzag.zza)zzaRP.getObject()).zzDw();
      if (zzaRQ == null) {}
      for (int i = 0;; i = zzaRQ.zzDw()) {
        return i + j;
      }
    }
    
    public zzbw<zzag.zza> zzAH()
    {
      return zzaRP;
    }
    
    public zzag.zza zzAI()
    {
      return zzaRQ;
    }
  }
  
  private static class zzc
  {
    private final Set<zzqp.zze> zzaRG = new HashSet();
    private final Map<zzqp.zze, List<zzqp.zza>> zzaRR = new HashMap();
    private final Map<zzqp.zze, List<zzqp.zza>> zzaRS = new HashMap();
    private final Map<zzqp.zze, List<String>> zzaRT = new HashMap();
    private final Map<zzqp.zze, List<String>> zzaRU = new HashMap();
    private zzqp.zza zzaRV;
    
    public zzc() {}
    
    public Set<zzqp.zze> zzAJ()
    {
      return zzaRG;
    }
    
    public Map<zzqp.zze, List<zzqp.zza>> zzAK()
    {
      return zzaRR;
    }
    
    public Map<zzqp.zze, List<String>> zzAL()
    {
      return zzaRT;
    }
    
    public Map<zzqp.zze, List<String>> zzAM()
    {
      return zzaRU;
    }
    
    public Map<zzqp.zze, List<zzqp.zza>> zzAN()
    {
      return zzaRS;
    }
    
    public zzqp.zza zzAO()
    {
      return zzaRV;
    }
    
    public void zza(zzqp.zze paramZze)
    {
      zzaRG.add(paramZze);
    }
    
    public void zza(zzqp.zze paramZze, zzqp.zza paramZza)
    {
      List localList = (List)zzaRR.get(paramZze);
      Object localObject = localList;
      if (localList == null)
      {
        localObject = new ArrayList();
        zzaRR.put(paramZze, localObject);
      }
      ((List)localObject).add(paramZza);
    }
    
    public void zza(zzqp.zze paramZze, String paramString)
    {
      List localList = (List)zzaRT.get(paramZze);
      Object localObject = localList;
      if (localList == null)
      {
        localObject = new ArrayList();
        zzaRT.put(paramZze, localObject);
      }
      ((List)localObject).add(paramString);
    }
    
    public void zzb(zzqp.zza paramZza)
    {
      zzaRV = paramZza;
    }
    
    public void zzb(zzqp.zze paramZze, zzqp.zza paramZza)
    {
      List localList = (List)zzaRS.get(paramZze);
      Object localObject = localList;
      if (localList == null)
      {
        localObject = new ArrayList();
        zzaRS.put(paramZze, localObject);
      }
      ((List)localObject).add(paramZza);
    }
    
    public void zzb(zzqp.zze paramZze, String paramString)
    {
      List localList = (List)zzaRU.get(paramZze);
      Object localObject = localList;
      if (localList == null)
      {
        localObject = new ArrayList();
        zzaRU.put(paramZze, localObject);
      }
      ((List)localObject).add(paramString);
    }
  }
}
