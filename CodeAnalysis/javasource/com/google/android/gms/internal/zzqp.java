package com.google.android.gms.internal;

import com.google.android.gms.tagmanager.zzdf;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class zzqp
{
  public static void zzc(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    byte[] arrayOfByte = new byte['Ѐ'];
    for (;;)
    {
      int i = paramInputStream.read(arrayOfByte);
      if (i == -1) {
        return;
      }
      paramOutputStream.write(arrayOfByte, 0, i);
    }
  }
  
  public static zzag.zza zzo(zzag.zza paramZza)
  {
    zzag.zza localZza = new zzag.zza();
    type = type;
    zzjd = ((int[])zzjd.clone());
    if (zzje) {
      zzje = zzje;
    }
    return localZza;
  }
  
  public static class zza
  {
    private final zzag.zza zzaRQ;
    private final Map<String, zzag.zza> zzaTS;
    
    private zza(Map<String, zzag.zza> paramMap, zzag.zza paramZza)
    {
      zzaTS = paramMap;
      zzaRQ = paramZza;
    }
    
    public static zzqp.zzb zzBC()
    {
      return new zzqp.zzb(null);
    }
    
    public String toString()
    {
      return "Properties: " + zzBD() + " pushAfterEvaluate: " + zzaRQ;
    }
    
    public zzag.zza zzAI()
    {
      return zzaRQ;
    }
    
    public Map<String, zzag.zza> zzBD()
    {
      return Collections.unmodifiableMap(zzaTS);
    }
    
    public void zza(String paramString, zzag.zza paramZza)
    {
      zzaTS.put(paramString, paramZza);
    }
  }
  
  public static class zzb
  {
    private zzag.zza zzaRQ;
    private final Map<String, zzag.zza> zzaTS = new HashMap();
    
    private zzb() {}
    
    public zzqp.zza zzBE()
    {
      return new zzqp.zza(zzaTS, zzaRQ, null);
    }
    
    public zzb zzb(String paramString, zzag.zza paramZza)
    {
      zzaTS.put(paramString, paramZza);
      return this;
    }
    
    public zzb zzq(zzag.zza paramZza)
    {
      zzaRQ = paramZza;
      return this;
    }
  }
  
  public static class zzc
  {
    private final String zzWs;
    private final List<zzqp.zze> zzaTT;
    private final Map<String, List<zzqp.zza>> zzaTU;
    private final int zzaTV;
    
    private zzc(List<zzqp.zze> paramList, Map<String, List<zzqp.zza>> paramMap, String paramString, int paramInt)
    {
      zzaTT = Collections.unmodifiableList(paramList);
      zzaTU = Collections.unmodifiableMap(paramMap);
      zzWs = paramString;
      zzaTV = paramInt;
    }
    
    public static zzqp.zzd zzBF()
    {
      return new zzqp.zzd(null);
    }
    
    public String getVersion()
    {
      return zzWs;
    }
    
    public String toString()
    {
      return "Rules: " + zzBG() + "  Macros: " + zzaTU;
    }
    
    public List<zzqp.zze> zzBG()
    {
      return zzaTT;
    }
    
    public Map<String, List<zzqp.zza>> zzBH()
    {
      return zzaTU;
    }
  }
  
  public static class zzd
  {
    private String zzWs = "";
    private final List<zzqp.zze> zzaTT = new ArrayList();
    private final Map<String, List<zzqp.zza>> zzaTU = new HashMap();
    private int zzaTV = 0;
    
    private zzd() {}
    
    public zzqp.zzc zzBI()
    {
      return new zzqp.zzc(zzaTT, zzaTU, zzWs, zzaTV, null);
    }
    
    public zzd zzb(zzqp.zze paramZze)
    {
      zzaTT.add(paramZze);
      return this;
    }
    
    public zzd zzc(zzqp.zza paramZza)
    {
      String str = zzdf.zzg((zzag.zza)paramZza.zzBD().get(zzae.zzfu.toString()));
      List localList = (List)zzaTU.get(str);
      Object localObject = localList;
      if (localList == null)
      {
        localObject = new ArrayList();
        zzaTU.put(str, localObject);
      }
      ((List)localObject).add(paramZza);
      return this;
    }
    
    public zzd zzfk(String paramString)
    {
      zzWs = paramString;
      return this;
    }
    
    public zzd zzjm(int paramInt)
    {
      zzaTV = paramInt;
      return this;
    }
  }
  
  public static class zze
  {
    private final List<zzqp.zza> zzaTW;
    private final List<zzqp.zza> zzaTX;
    private final List<zzqp.zza> zzaTY;
    private final List<zzqp.zza> zzaTZ;
    private final List<zzqp.zza> zzaUa;
    private final List<zzqp.zza> zzaUb;
    private final List<String> zzaUc;
    private final List<String> zzaUd;
    private final List<String> zzaUe;
    private final List<String> zzaUf;
    
    private zze(List<zzqp.zza> paramList1, List<zzqp.zza> paramList2, List<zzqp.zza> paramList3, List<zzqp.zza> paramList4, List<zzqp.zza> paramList5, List<zzqp.zza> paramList6, List<String> paramList7, List<String> paramList8, List<String> paramList9, List<String> paramList10)
    {
      zzaTW = Collections.unmodifiableList(paramList1);
      zzaTX = Collections.unmodifiableList(paramList2);
      zzaTY = Collections.unmodifiableList(paramList3);
      zzaTZ = Collections.unmodifiableList(paramList4);
      zzaUa = Collections.unmodifiableList(paramList5);
      zzaUb = Collections.unmodifiableList(paramList6);
      zzaUc = Collections.unmodifiableList(paramList7);
      zzaUd = Collections.unmodifiableList(paramList8);
      zzaUe = Collections.unmodifiableList(paramList9);
      zzaUf = Collections.unmodifiableList(paramList10);
    }
    
    public static zzqp.zzf zzBJ()
    {
      return new zzqp.zzf(null);
    }
    
    public String toString()
    {
      return "Positive predicates: " + zzBK() + "  Negative predicates: " + zzBL() + "  Add tags: " + zzBM() + "  Remove tags: " + zzBN() + "  Add macros: " + zzBO() + "  Remove macros: " + zzBT();
    }
    
    public List<zzqp.zza> zzBK()
    {
      return zzaTW;
    }
    
    public List<zzqp.zza> zzBL()
    {
      return zzaTX;
    }
    
    public List<zzqp.zza> zzBM()
    {
      return zzaTY;
    }
    
    public List<zzqp.zza> zzBN()
    {
      return zzaTZ;
    }
    
    public List<zzqp.zza> zzBO()
    {
      return zzaUa;
    }
    
    public List<String> zzBP()
    {
      return zzaUc;
    }
    
    public List<String> zzBQ()
    {
      return zzaUd;
    }
    
    public List<String> zzBR()
    {
      return zzaUe;
    }
    
    public List<String> zzBS()
    {
      return zzaUf;
    }
    
    public List<zzqp.zza> zzBT()
    {
      return zzaUb;
    }
  }
  
  public static class zzf
  {
    private final List<zzqp.zza> zzaTW = new ArrayList();
    private final List<zzqp.zza> zzaTX = new ArrayList();
    private final List<zzqp.zza> zzaTY = new ArrayList();
    private final List<zzqp.zza> zzaTZ = new ArrayList();
    private final List<zzqp.zza> zzaUa = new ArrayList();
    private final List<zzqp.zza> zzaUb = new ArrayList();
    private final List<String> zzaUc = new ArrayList();
    private final List<String> zzaUd = new ArrayList();
    private final List<String> zzaUe = new ArrayList();
    private final List<String> zzaUf = new ArrayList();
    
    private zzf() {}
    
    public zzqp.zze zzBU()
    {
      return new zzqp.zze(zzaTW, zzaTX, zzaTY, zzaTZ, zzaUa, zzaUb, zzaUc, zzaUd, zzaUe, zzaUf, null);
    }
    
    public zzf zzd(zzqp.zza paramZza)
    {
      zzaTW.add(paramZza);
      return this;
    }
    
    public zzf zze(zzqp.zza paramZza)
    {
      zzaTX.add(paramZza);
      return this;
    }
    
    public zzf zzf(zzqp.zza paramZza)
    {
      zzaTY.add(paramZza);
      return this;
    }
    
    public zzf zzfl(String paramString)
    {
      zzaUe.add(paramString);
      return this;
    }
    
    public zzf zzfm(String paramString)
    {
      zzaUf.add(paramString);
      return this;
    }
    
    public zzf zzfn(String paramString)
    {
      zzaUc.add(paramString);
      return this;
    }
    
    public zzf zzfo(String paramString)
    {
      zzaUd.add(paramString);
      return this;
    }
    
    public zzf zzg(zzqp.zza paramZza)
    {
      zzaTZ.add(paramZza);
      return this;
    }
    
    public zzf zzh(zzqp.zza paramZza)
    {
      zzaUa.add(paramZza);
      return this;
    }
    
    public zzf zzi(zzqp.zza paramZza)
    {
      zzaUb.add(paramZza);
      return this;
    }
  }
  
  public static class zzg
    extends Exception
  {
    public zzg(String paramString)
    {
      super();
    }
  }
}
