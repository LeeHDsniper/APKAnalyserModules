package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzag.zza;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class zzdf
{
  private static final Object zzaSN = null;
  private static Long zzaSO = new Long(0L);
  private static Double zzaSP = new Double(0.0D);
  private static zzde zzaSQ = zzde.zzT(0L);
  private static String zzaSR = new String("");
  private static Boolean zzaSS = new Boolean(false);
  private static List<Object> zzaST = new ArrayList(0);
  private static Map<Object, Object> zzaSU = new HashMap();
  private static zzag.zza zzaSV = zzK(zzaSR);
  
  private static double getDouble(Object paramObject)
  {
    if ((paramObject instanceof Number)) {
      return ((Number)paramObject).doubleValue();
    }
    zzbg.e("getDouble received non-Number");
    return 0.0D;
  }
  
  public static Object zzBa()
  {
    return zzaSN;
  }
  
  public static Long zzBb()
  {
    return zzaSO;
  }
  
  public static Boolean zzBd()
  {
    return zzaSS;
  }
  
  public static zzde zzBe()
  {
    return zzaSQ;
  }
  
  public static String zzBf()
  {
    return zzaSR;
  }
  
  public static zzag.zza zzBg()
  {
    return zzaSV;
  }
  
  public static String zzF(Object paramObject)
  {
    if (paramObject == null) {
      return zzaSR;
    }
    return paramObject.toString();
  }
  
  public static zzde zzG(Object paramObject)
  {
    if ((paramObject instanceof zzde)) {
      return (zzde)paramObject;
    }
    if (zzM(paramObject)) {
      return zzde.zzT(zzN(paramObject));
    }
    if (zzL(paramObject)) {
      return zzde.zza(Double.valueOf(getDouble(paramObject)));
    }
    return zzeZ(zzF(paramObject));
  }
  
  public static Long zzH(Object paramObject)
  {
    if (zzM(paramObject)) {
      return Long.valueOf(zzN(paramObject));
    }
    return zzfa(zzF(paramObject));
  }
  
  public static Boolean zzJ(Object paramObject)
  {
    if ((paramObject instanceof Boolean)) {
      return (Boolean)paramObject;
    }
    return zzfc(zzF(paramObject));
  }
  
  public static zzag.zza zzK(Object paramObject)
  {
    boolean bool = false;
    Object localObject1 = new zzag.zza();
    if ((paramObject instanceof zzag.zza)) {
      return (zzag.zza)paramObject;
    }
    if ((paramObject instanceof String))
    {
      type = 1;
      zziU = ((String)paramObject);
    }
    for (;;)
    {
      zzje = bool;
      return localObject1;
      Object localObject2;
      Object localObject3;
      if ((paramObject instanceof List))
      {
        type = 2;
        localObject2 = (List)paramObject;
        paramObject = new ArrayList(((List)localObject2).size());
        localObject2 = ((List)localObject2).iterator();
        bool = false;
        if (((Iterator)localObject2).hasNext())
        {
          localObject3 = zzK(((Iterator)localObject2).next());
          if (localObject3 == zzaSV) {
            return zzaSV;
          }
          if ((bool) || (zzje)) {}
          for (bool = true;; bool = false)
          {
            paramObject.add(localObject3);
            break;
          }
        }
        zziV = ((zzag.zza[])paramObject.toArray(new zzag.zza[0]));
      }
      else if ((paramObject instanceof Map))
      {
        type = 3;
        localObject3 = ((Map)paramObject).entrySet();
        paramObject = new ArrayList(((Set)localObject3).size());
        localObject2 = new ArrayList(((Set)localObject3).size());
        localObject3 = ((Set)localObject3).iterator();
        bool = false;
        if (((Iterator)localObject3).hasNext())
        {
          Object localObject4 = (Map.Entry)((Iterator)localObject3).next();
          zzag.zza localZza = zzK(((Map.Entry)localObject4).getKey());
          localObject4 = zzK(((Map.Entry)localObject4).getValue());
          if ((localZza == zzaSV) || (localObject4 == zzaSV)) {
            return zzaSV;
          }
          if ((bool) || (zzje) || (zzje)) {}
          for (bool = true;; bool = false)
          {
            paramObject.add(localZza);
            ((List)localObject2).add(localObject4);
            break;
          }
        }
        zziW = ((zzag.zza[])paramObject.toArray(new zzag.zza[0]));
        zziX = ((zzag.zza[])((List)localObject2).toArray(new zzag.zza[0]));
      }
      else if (zzL(paramObject))
      {
        type = 1;
        zziU = paramObject.toString();
      }
      else if (zzM(paramObject))
      {
        type = 6;
        zzja = zzN(paramObject);
      }
      else
      {
        if (!(paramObject instanceof Boolean)) {
          break;
        }
        type = 8;
        zzjb = ((Boolean)paramObject).booleanValue();
      }
    }
    localObject1 = new StringBuilder().append("Converting to Value from unknown object type: ");
    if (paramObject == null) {}
    for (paramObject = "null";; paramObject = paramObject.getClass().toString())
    {
      zzbg.e(paramObject);
      return zzaSV;
    }
  }
  
  private static boolean zzL(Object paramObject)
  {
    return ((paramObject instanceof Double)) || ((paramObject instanceof Float)) || (((paramObject instanceof zzde)) && (((zzde)paramObject).zzAV()));
  }
  
  private static boolean zzM(Object paramObject)
  {
    return ((paramObject instanceof Byte)) || ((paramObject instanceof Short)) || ((paramObject instanceof Integer)) || ((paramObject instanceof Long)) || (((paramObject instanceof zzde)) && (((zzde)paramObject).zzAW()));
  }
  
  private static long zzN(Object paramObject)
  {
    if ((paramObject instanceof Number)) {
      return ((Number)paramObject).longValue();
    }
    zzbg.e("getInt64 received non-Number");
    return 0L;
  }
  
  private static zzde zzeZ(String paramString)
  {
    try
    {
      zzde localZzde = zzde.zzeX(paramString);
      return localZzde;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      zzbg.e("Failed to convert '" + paramString + "' to a number.");
    }
    return zzaSQ;
  }
  
  private static Long zzfa(String paramString)
  {
    paramString = zzeZ(paramString);
    if (paramString == zzaSQ) {
      return zzaSO;
    }
    return Long.valueOf(paramString.longValue());
  }
  
  private static Boolean zzfc(String paramString)
  {
    if ("true".equalsIgnoreCase(paramString)) {
      return Boolean.TRUE;
    }
    if ("false".equalsIgnoreCase(paramString)) {
      return Boolean.FALSE;
    }
    return zzaSS;
  }
  
  public static String zzg(zzag.zza paramZza)
  {
    return zzF(zzl(paramZza));
  }
  
  public static zzde zzh(zzag.zza paramZza)
  {
    return zzG(zzl(paramZza));
  }
  
  public static Long zzi(zzag.zza paramZza)
  {
    return zzH(zzl(paramZza));
  }
  
  public static Boolean zzk(zzag.zza paramZza)
  {
    return zzJ(zzl(paramZza));
  }
  
  public static Object zzl(zzag.zza paramZza)
  {
    int k = 0;
    int j = 0;
    int i = 0;
    if (paramZza == null) {
      return zzaSN;
    }
    Object localObject1;
    Object localObject2;
    switch (type)
    {
    default: 
      zzbg.e("Failed to convert a value of type: " + type);
      return zzaSN;
    case 1: 
      return zziU;
    case 2: 
      localObject1 = new ArrayList(zziV.length);
      paramZza = zziV;
      j = paramZza.length;
      while (i < j)
      {
        localObject2 = zzl(paramZza[i]);
        if (localObject2 == zzaSN) {
          return zzaSN;
        }
        ((ArrayList)localObject1).add(localObject2);
        i += 1;
      }
      return localObject1;
    case 3: 
      if (zziW.length != zziX.length)
      {
        zzbg.e("Converting an invalid value to object: " + paramZza.toString());
        return zzaSN;
      }
      localObject1 = new HashMap(zziX.length);
      i = k;
      while (i < zziW.length)
      {
        localObject2 = zzl(zziW[i]);
        Object localObject3 = zzl(zziX[i]);
        if ((localObject2 == zzaSN) || (localObject3 == zzaSN)) {
          return zzaSN;
        }
        ((Map)localObject1).put(localObject2, localObject3);
        i += 1;
      }
      return localObject1;
    case 4: 
      zzbg.e("Trying to convert a macro reference to object");
      return zzaSN;
    case 5: 
      zzbg.e("Trying to convert a function id to object");
      return zzaSN;
    case 6: 
      return Long.valueOf(zzja);
    case 7: 
      localObject1 = new StringBuffer();
      paramZza = zzjc;
      k = paramZza.length;
      i = j;
      while (i < k)
      {
        localObject2 = zzg(paramZza[i]);
        if (localObject2 == zzaSR) {
          return zzaSN;
        }
        ((StringBuffer)localObject1).append((String)localObject2);
        i += 1;
      }
      return ((StringBuffer)localObject1).toString();
    }
    return Boolean.valueOf(zzjb);
  }
}
