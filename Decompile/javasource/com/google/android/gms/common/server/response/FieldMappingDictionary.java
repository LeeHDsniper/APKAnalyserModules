package com.google.android.gms.common.server.response;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class FieldMappingDictionary
  implements SafeParcelable
{
  public static final zzc CREATOR = new zzc();
  private final int mVersionCode;
  private final HashMap<String, Map<String, FastJsonResponse.Field<?, ?>>> zzafa;
  private final ArrayList<Entry> zzafb;
  private final String zzafc;
  
  FieldMappingDictionary(int paramInt, ArrayList<Entry> paramArrayList, String paramString)
  {
    mVersionCode = paramInt;
    zzafb = null;
    zzafa = zzc(paramArrayList);
    zzafc = ((String)zzx.zzv(paramString));
    zzpo();
  }
  
  private static HashMap<String, Map<String, FastJsonResponse.Field<?, ?>>> zzc(ArrayList<Entry> paramArrayList)
  {
    HashMap localHashMap = new HashMap();
    int j = paramArrayList.size();
    int i = 0;
    while (i < j)
    {
      Entry localEntry = (Entry)paramArrayList.get(i);
      localHashMap.put(className, localEntry.zzps());
      i += 1;
    }
    return localHashMap;
  }
  
  public int describeContents()
  {
    zzc localZzc = CREATOR;
    return 0;
  }
  
  int getVersionCode()
  {
    return mVersionCode;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator1 = zzafa.keySet().iterator();
    while (localIterator1.hasNext())
    {
      Object localObject = (String)localIterator1.next();
      localStringBuilder.append((String)localObject).append(":\n");
      localObject = (Map)zzafa.get(localObject);
      Iterator localIterator2 = ((Map)localObject).keySet().iterator();
      while (localIterator2.hasNext())
      {
        String str = (String)localIterator2.next();
        localStringBuilder.append("  ").append(str).append(": ");
        localStringBuilder.append(((Map)localObject).get(str));
      }
    }
    return localStringBuilder.toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc localZzc = CREATOR;
    zzc.zza(this, paramParcel, paramInt);
  }
  
  public Map<String, FastJsonResponse.Field<?, ?>> zzcx(String paramString)
  {
    return (Map)zzafa.get(paramString);
  }
  
  public void zzpo()
  {
    Iterator localIterator1 = zzafa.keySet().iterator();
    while (localIterator1.hasNext())
    {
      Object localObject = (String)localIterator1.next();
      localObject = (Map)zzafa.get(localObject);
      Iterator localIterator2 = ((Map)localObject).keySet().iterator();
      while (localIterator2.hasNext()) {
        ((FastJsonResponse.Field)((Map)localObject).get((String)localIterator2.next())).zza(this);
      }
    }
  }
  
  ArrayList<Entry> zzpq()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = zzafa.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localArrayList.add(new Entry(str, (Map)zzafa.get(str)));
    }
    return localArrayList;
  }
  
  public String zzpr()
  {
    return zzafc;
  }
  
  public static class Entry
    implements SafeParcelable
  {
    public static final zzd CREATOR = new zzd();
    final String className;
    final int versionCode;
    final ArrayList<FieldMappingDictionary.FieldMapPair> zzafd;
    
    Entry(int paramInt, String paramString, ArrayList<FieldMappingDictionary.FieldMapPair> paramArrayList)
    {
      versionCode = paramInt;
      className = paramString;
      zzafd = paramArrayList;
    }
    
    Entry(String paramString, Map<String, FastJsonResponse.Field<?, ?>> paramMap)
    {
      versionCode = 1;
      className = paramString;
      zzafd = zzD(paramMap);
    }
    
    private static ArrayList<FieldMappingDictionary.FieldMapPair> zzD(Map<String, FastJsonResponse.Field<?, ?>> paramMap)
    {
      if (paramMap == null) {
        return null;
      }
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = paramMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localArrayList.add(new FieldMappingDictionary.FieldMapPair(str, (FastJsonResponse.Field)paramMap.get(str)));
      }
      return localArrayList;
    }
    
    public int describeContents()
    {
      zzd localZzd = CREATOR;
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzd localZzd = CREATOR;
      zzd.zza(this, paramParcel, paramInt);
    }
    
    HashMap<String, FastJsonResponse.Field<?, ?>> zzps()
    {
      HashMap localHashMap = new HashMap();
      int j = zzafd.size();
      int i = 0;
      while (i < j)
      {
        FieldMappingDictionary.FieldMapPair localFieldMapPair = (FieldMappingDictionary.FieldMapPair)zzafd.get(i);
        localHashMap.put(key, zzafe);
        i += 1;
      }
      return localHashMap;
    }
  }
  
  public static class FieldMapPair
    implements SafeParcelable
  {
    public static final zzb CREATOR = new zzb();
    final String key;
    final int versionCode;
    final FastJsonResponse.Field<?, ?> zzafe;
    
    FieldMapPair(int paramInt, String paramString, FastJsonResponse.Field<?, ?> paramField)
    {
      versionCode = paramInt;
      key = paramString;
      zzafe = paramField;
    }
    
    FieldMapPair(String paramString, FastJsonResponse.Field<?, ?> paramField)
    {
      versionCode = 1;
      key = paramString;
      zzafe = paramField;
    }
    
    public int describeContents()
    {
      zzb localZzb = CREATOR;
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzb localZzb = CREATOR;
      zzb.zza(this, paramParcel, paramInt);
    }
  }
}
