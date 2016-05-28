package com.google.android.gms.tagmanager;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.locks.ReentrantLock;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DataLayer
{
  public static final Object OBJECT_NOT_PRESENT = new Object();
  private static final Pattern zzaPA = Pattern.compile("(\\d+)\\s*([smhd]?)");
  static final String[] zzaPz = "gtm.lifetime".toString().split("\\.");
  private final ConcurrentHashMap<zzb, Integer> zzaPB;
  private final Map<String, Object> zzaPC;
  private final ReentrantLock zzaPD;
  private final LinkedList<Map<String, Object>> zzaPE;
  private final zzc zzaPF;
  private final CountDownLatch zzaPG;
  
  DataLayer()
  {
    this(new zzc()
    {
      public void zza(DataLayer.zzc.zza paramAnonymousZza)
      {
        paramAnonymousZza.zzo(new ArrayList());
      }
      
      public void zza(List<DataLayer.zza> paramAnonymousList, long paramAnonymousLong) {}
      
      public void zzeE(String paramAnonymousString) {}
    });
  }
  
  DataLayer(zzc paramZzc)
  {
    zzaPF = paramZzc;
    zzaPB = new ConcurrentHashMap();
    zzaPC = new HashMap();
    zzaPD = new ReentrantLock();
    zzaPE = new LinkedList();
    zzaPG = new CountDownLatch(1);
    zzzO();
  }
  
  public static Map<String, Object> mapOf(Object... paramVarArgs)
  {
    if (paramVarArgs.length % 2 != 0) {
      throw new IllegalArgumentException("expected even number of key-value pairs");
    }
    HashMap localHashMap = new HashMap();
    int i = 0;
    while (i < paramVarArgs.length)
    {
      if (!(paramVarArgs[i] instanceof String)) {
        throw new IllegalArgumentException("key is not a string: " + paramVarArgs[i]);
      }
      localHashMap.put((String)paramVarArgs[i], paramVarArgs[(i + 1)]);
      i += 2;
    }
    return localHashMap;
  }
  
  private void zzJ(Map<String, Object> paramMap)
  {
    zzaPD.lock();
    try
    {
      zzaPE.offer(paramMap);
      if (zzaPD.getHoldCount() == 1) {
        zzzP();
      }
      zzK(paramMap);
      return;
    }
    finally
    {
      zzaPD.unlock();
    }
  }
  
  private void zzK(Map<String, Object> paramMap)
  {
    Long localLong = zzL(paramMap);
    if (localLong == null) {
      return;
    }
    paramMap = zzN(paramMap);
    paramMap.remove("gtm.lifetime");
    zzaPF.zza(paramMap, localLong.longValue());
  }
  
  private Long zzL(Map<String, Object> paramMap)
  {
    paramMap = zzM(paramMap);
    if (paramMap == null) {
      return null;
    }
    return zzeD(paramMap.toString());
  }
  
  private Object zzM(Map<String, Object> paramMap)
  {
    String[] arrayOfString = zzaPz;
    int j = arrayOfString.length;
    int i = 0;
    for (;;)
    {
      Object localObject = paramMap;
      if (i < j)
      {
        localObject = arrayOfString[i];
        if (!(paramMap instanceof Map)) {
          localObject = null;
        }
      }
      else
      {
        return localObject;
      }
      paramMap = ((Map)paramMap).get(localObject);
      i += 1;
    }
  }
  
  private List<zza> zzN(Map<String, Object> paramMap)
  {
    ArrayList localArrayList = new ArrayList();
    zza(paramMap, "", localArrayList);
    return localArrayList;
  }
  
  private void zzO(Map<String, Object> paramMap)
  {
    synchronized (zzaPC)
    {
      Iterator localIterator = paramMap.keySet().iterator();
      if (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        zzc(zzj(str, paramMap.get(str)), zzaPC);
      }
    }
    zzP(paramMap);
  }
  
  private void zzP(Map<String, Object> paramMap)
  {
    Iterator localIterator = zzaPB.keySet().iterator();
    while (localIterator.hasNext()) {
      ((zzb)localIterator.next()).zzH(paramMap);
    }
  }
  
  private void zza(Map<String, Object> paramMap, String paramString, Collection<zza> paramCollection)
  {
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      StringBuilder localStringBuilder = new StringBuilder().append(paramString);
      if (paramString.length() == 0) {}
      for (paramMap = "";; paramMap = ".")
      {
        paramMap = paramMap + (String)localEntry.getKey();
        if (!(localEntry.getValue() instanceof Map)) {
          break label120;
        }
        zza((Map)localEntry.getValue(), paramMap, paramCollection);
        break;
      }
      label120:
      if (!paramMap.equals("gtm.lifetime")) {
        paramCollection.add(new zza(paramMap, localEntry.getValue()));
      }
    }
  }
  
  static Long zzeD(String paramString)
  {
    Object localObject = zzaPA.matcher(paramString);
    if (!((Matcher)localObject).matches())
    {
      zzbg.zzaD("unknown _lifetime: " + paramString);
      return null;
    }
    long l;
    try
    {
      l = Long.parseLong(((Matcher)localObject).group(1));
      if (l <= 0L)
      {
        zzbg.zzaD("non-positive _lifetime: " + paramString);
        return null;
      }
    }
    catch (NumberFormatException localNumberFormatException)
    {
      for (;;)
      {
        zzbg.zzaE("illegal number in _lifetime value: " + paramString);
        l = 0L;
      }
      localObject = ((Matcher)localObject).group(2);
      if (((String)localObject).length() == 0) {
        return Long.valueOf(l);
      }
      switch (((String)localObject).charAt(0))
      {
      default: 
        zzbg.zzaE("unknown units in _lifetime: " + paramString);
        return null;
      }
    }
    return Long.valueOf(l * 1000L);
    return Long.valueOf(l * 1000L * 60L);
    return Long.valueOf(l * 1000L * 60L * 60L);
    return Long.valueOf(l * 1000L * 60L * 60L * 24L);
  }
  
  private void zzzO()
  {
    zzaPF.zza(new DataLayer.zzc.zza()
    {
      public void zzo(List<DataLayer.zza> paramAnonymousList)
      {
        paramAnonymousList = paramAnonymousList.iterator();
        while (paramAnonymousList.hasNext())
        {
          DataLayer.zza localZza = (DataLayer.zza)paramAnonymousList.next();
          DataLayer.zza(DataLayer.this, zzj(zztP, zzID));
        }
        DataLayer.zza(DataLayer.this).countDown();
      }
    });
  }
  
  private void zzzP()
  {
    int i = 0;
    for (;;)
    {
      Map localMap = (Map)zzaPE.poll();
      if (localMap != null)
      {
        zzO(localMap);
        i += 1;
        if (i > 500)
        {
          zzaPE.clear();
          throw new RuntimeException("Seems like an infinite loop of pushing to the data layer");
        }
      }
      else
      {
        return;
      }
    }
  }
  
  public Object get(String paramString)
  {
    for (;;)
    {
      int i;
      synchronized (zzaPC)
      {
        Map localMap1 = zzaPC;
        String[] arrayOfString = paramString.split("\\.");
        int j = arrayOfString.length;
        paramString = localMap1;
        i = 0;
        if (i < j)
        {
          localMap1 = arrayOfString[i];
          if (!(paramString instanceof Map)) {
            return null;
          }
          paramString = ((Map)paramString).get(localMap1);
          if (paramString == null) {
            return null;
          }
        }
        else
        {
          return paramString;
        }
      }
      i += 1;
    }
  }
  
  public void push(String paramString, Object paramObject)
  {
    push(zzj(paramString, paramObject));
  }
  
  public void push(Map<String, Object> paramMap)
  {
    try
    {
      zzaPG.await();
      zzJ(paramMap);
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        zzbg.zzaE("DataLayer.push: unexpected InterruptedException");
      }
    }
  }
  
  public void pushEvent(String paramString, Map<String, Object> paramMap)
  {
    paramMap = new HashMap(paramMap);
    paramMap.put("event", paramString);
    push(paramMap);
  }
  
  public String toString()
  {
    synchronized (zzaPC)
    {
      StringBuilder localStringBuilder = new StringBuilder();
      Iterator localIterator = zzaPC.entrySet().iterator();
      if (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        localStringBuilder.append(String.format("{\n\tKey: %s\n\tValue: %s\n}\n", new Object[] { localEntry.getKey(), localEntry.getValue() }));
      }
    }
    String str = localObject.toString();
    return str;
  }
  
  void zza(zzb paramZzb)
  {
    zzaPB.put(paramZzb, Integer.valueOf(0));
  }
  
  void zzb(List<Object> paramList1, List<Object> paramList2)
  {
    while (paramList2.size() < paramList1.size()) {
      paramList2.add(null);
    }
    int i = 0;
    if (i < paramList1.size())
    {
      Object localObject = paramList1.get(i);
      if ((localObject instanceof List))
      {
        if (!(paramList2.get(i) instanceof List)) {
          paramList2.set(i, new ArrayList());
        }
        zzb((List)localObject, (List)paramList2.get(i));
      }
      for (;;)
      {
        i += 1;
        break;
        if ((localObject instanceof Map))
        {
          if (!(paramList2.get(i) instanceof Map)) {
            paramList2.set(i, new HashMap());
          }
          zzc((Map)localObject, (Map)paramList2.get(i));
        }
        else if (localObject != OBJECT_NOT_PRESENT)
        {
          paramList2.set(i, localObject);
        }
      }
    }
  }
  
  void zzc(Map<String, Object> paramMap1, Map<String, Object> paramMap2)
  {
    Iterator localIterator = paramMap1.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      Object localObject = paramMap1.get(str);
      if ((localObject instanceof List))
      {
        if (!(paramMap2.get(str) instanceof List)) {
          paramMap2.put(str, new ArrayList());
        }
        zzb((List)localObject, (List)paramMap2.get(str));
      }
      else if ((localObject instanceof Map))
      {
        if (!(paramMap2.get(str) instanceof Map)) {
          paramMap2.put(str, new HashMap());
        }
        zzc((Map)localObject, (Map)paramMap2.get(str));
      }
      else
      {
        paramMap2.put(str, localObject);
      }
    }
  }
  
  void zzeC(String paramString)
  {
    push(paramString, null);
    zzaPF.zzeE(paramString);
  }
  
  Map<String, Object> zzj(String paramString, Object paramObject)
  {
    HashMap localHashMap1 = new HashMap();
    String[] arrayOfString = paramString.toString().split("\\.");
    int i = 0;
    HashMap localHashMap2;
    for (paramString = localHashMap1; i < arrayOfString.length - 1; paramString = localHashMap2)
    {
      localHashMap2 = new HashMap();
      paramString.put(arrayOfString[i], localHashMap2);
      i += 1;
    }
    paramString.put(arrayOfString[(arrayOfString.length - 1)], paramObject);
    return localHashMap1;
  }
  
  static final class zza
  {
    public final Object zzID;
    public final String zztP;
    
    zza(String paramString, Object paramObject)
    {
      zztP = paramString;
      zzID = paramObject;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zza)) {}
      do
      {
        return false;
        paramObject = (zza)paramObject;
      } while ((!zztP.equals(zztP)) || (!zzID.equals(zzID)));
      return true;
    }
    
    public int hashCode()
    {
      return Arrays.hashCode(new Integer[] { Integer.valueOf(zztP.hashCode()), Integer.valueOf(zzID.hashCode()) });
    }
    
    public String toString()
    {
      return "Key: " + zztP + " value: " + zzID.toString();
    }
  }
  
  static abstract interface zzb
  {
    public abstract void zzH(Map<String, Object> paramMap);
  }
  
  static abstract interface zzc
  {
    public abstract void zza(zza paramZza);
    
    public abstract void zza(List<DataLayer.zza> paramList, long paramLong);
    
    public abstract void zzeE(String paramString);
    
    public static abstract interface zza
    {
      public abstract void zzo(List<DataLayer.zza> paramList);
    }
  }
}
