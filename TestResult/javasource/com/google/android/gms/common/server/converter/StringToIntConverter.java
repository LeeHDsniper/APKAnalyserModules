package com.google.android.gms.common.server.converter;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.server.response.FastJsonResponse.zza;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public final class StringToIntConverter
  implements SafeParcelable, FastJsonResponse.zza<String, Integer>
{
  public static final zzb CREATOR = new zzb();
  private final int mVersionCode;
  private final HashMap<String, Integer> zzaeL;
  private final HashMap<Integer, String> zzaeM;
  private final ArrayList<Entry> zzaeN;
  
  public StringToIntConverter()
  {
    mVersionCode = 1;
    zzaeL = new HashMap();
    zzaeM = new HashMap();
    zzaeN = null;
  }
  
  StringToIntConverter(int paramInt, ArrayList<Entry> paramArrayList)
  {
    mVersionCode = paramInt;
    zzaeL = new HashMap();
    zzaeM = new HashMap();
    zzaeN = null;
    zzb(paramArrayList);
  }
  
  private void zzb(ArrayList<Entry> paramArrayList)
  {
    paramArrayList = paramArrayList.iterator();
    while (paramArrayList.hasNext())
    {
      Entry localEntry = (Entry)paramArrayList.next();
      zzi(zzaeO, zzaeP);
    }
  }
  
  public int describeContents()
  {
    zzb localZzb = CREATOR;
    return 0;
  }
  
  int getVersionCode()
  {
    return mVersionCode;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb localZzb = CREATOR;
    zzb.zza(this, paramParcel, paramInt);
  }
  
  public String zzb(Integer paramInteger)
  {
    String str = (String)zzaeM.get(paramInteger);
    paramInteger = str;
    if (str == null)
    {
      paramInteger = str;
      if (zzaeL.containsKey("gms_unknown")) {
        paramInteger = "gms_unknown";
      }
    }
    return paramInteger;
  }
  
  public StringToIntConverter zzi(String paramString, int paramInt)
  {
    zzaeL.put(paramString, Integer.valueOf(paramInt));
    zzaeM.put(Integer.valueOf(paramInt), paramString);
    return this;
  }
  
  ArrayList<Entry> zzoY()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = zzaeL.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localArrayList.add(new Entry(str, ((Integer)zzaeL.get(str)).intValue()));
    }
    return localArrayList;
  }
  
  public static final class Entry
    implements SafeParcelable
  {
    public static final zzc CREATOR = new zzc();
    final int versionCode;
    final String zzaeO;
    final int zzaeP;
    
    Entry(int paramInt1, String paramString, int paramInt2)
    {
      versionCode = paramInt1;
      zzaeO = paramString;
      zzaeP = paramInt2;
    }
    
    Entry(String paramString, int paramInt)
    {
      versionCode = 1;
      zzaeO = paramString;
      zzaeP = paramInt;
    }
    
    public int describeContents()
    {
      zzc localZzc = CREATOR;
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzc localZzc = CREATOR;
      zzc.zza(this, paramParcel, paramInt);
    }
  }
}
