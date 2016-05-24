package com.google.android.gms.common.server.response;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzli;
import com.google.android.gms.internal.zzlj;
import com.google.android.gms.internal.zzls;
import com.google.android.gms.internal.zzlt;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class SafeParcelResponse
  extends FastJsonResponse
  implements SafeParcelable
{
  public static final zze CREATOR = new zze();
  private final String mClassName;
  private final int mVersionCode;
  private final FieldMappingDictionary zzaeY;
  private final Parcel zzaff;
  private final int zzafg;
  private int zzafh;
  private int zzafi;
  
  SafeParcelResponse(int paramInt, Parcel paramParcel, FieldMappingDictionary paramFieldMappingDictionary)
  {
    mVersionCode = paramInt;
    zzaff = ((Parcel)zzx.zzv(paramParcel));
    zzafg = 2;
    zzaeY = paramFieldMappingDictionary;
    if (zzaeY == null) {}
    for (mClassName = null;; mClassName = zzaeY.zzpr())
    {
      zzafh = 2;
      return;
    }
  }
  
  private static HashMap<Integer, Map.Entry<String, FastJsonResponse.Field<?, ?>>> zzE(Map<String, FastJsonResponse.Field<?, ?>> paramMap)
  {
    HashMap localHashMap = new HashMap();
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      localHashMap.put(Integer.valueOf(((FastJsonResponse.Field)localEntry.getValue()).zzpi()), localEntry);
    }
    return localHashMap;
  }
  
  private void zza(StringBuilder paramStringBuilder, int paramInt, Object paramObject)
  {
    switch (paramInt)
    {
    default: 
      throw new IllegalArgumentException("Unknown type = " + paramInt);
    case 0: 
    case 1: 
    case 2: 
    case 3: 
    case 4: 
    case 5: 
    case 6: 
      paramStringBuilder.append(paramObject);
      return;
    case 7: 
      paramStringBuilder.append("\"").append(zzls.zzcA(paramObject.toString())).append("\"");
      return;
    case 8: 
      paramStringBuilder.append("\"").append(zzlj.zzi((byte[])paramObject)).append("\"");
      return;
    case 9: 
      paramStringBuilder.append("\"").append(zzlj.zzj((byte[])paramObject));
      paramStringBuilder.append("\"");
      return;
    case 10: 
      zzlt.zza(paramStringBuilder, (HashMap)paramObject);
      return;
    }
    throw new IllegalArgumentException("Method does not accept concrete type.");
  }
  
  private void zza(StringBuilder paramStringBuilder, FastJsonResponse.Field<?, ?> paramField, Parcel paramParcel, int paramInt)
  {
    switch (paramField.zzpa())
    {
    default: 
      throw new IllegalArgumentException("Unknown field out type = " + paramField.zzpa());
    case 0: 
      zzb(paramStringBuilder, paramField, zza(paramField, Integer.valueOf(zza.zzg(paramParcel, paramInt))));
      return;
    case 1: 
      zzb(paramStringBuilder, paramField, zza(paramField, zza.zzk(paramParcel, paramInt)));
      return;
    case 2: 
      zzb(paramStringBuilder, paramField, zza(paramField, Long.valueOf(zza.zzi(paramParcel, paramInt))));
      return;
    case 3: 
      zzb(paramStringBuilder, paramField, zza(paramField, Float.valueOf(zza.zzl(paramParcel, paramInt))));
      return;
    case 4: 
      zzb(paramStringBuilder, paramField, zza(paramField, Double.valueOf(zza.zzm(paramParcel, paramInt))));
      return;
    case 5: 
      zzb(paramStringBuilder, paramField, zza(paramField, zza.zzn(paramParcel, paramInt)));
      return;
    case 6: 
      zzb(paramStringBuilder, paramField, zza(paramField, Boolean.valueOf(zza.zzc(paramParcel, paramInt))));
      return;
    case 7: 
      zzb(paramStringBuilder, paramField, zza(paramField, zza.zzo(paramParcel, paramInt)));
      return;
    case 8: 
    case 9: 
      zzb(paramStringBuilder, paramField, zza(paramField, zza.zzr(paramParcel, paramInt)));
      return;
    case 10: 
      zzb(paramStringBuilder, paramField, zza(paramField, zzi(zza.zzq(paramParcel, paramInt))));
      return;
    }
    throw new IllegalArgumentException("Method does not accept concrete type.");
  }
  
  private void zza(StringBuilder paramStringBuilder, String paramString, FastJsonResponse.Field<?, ?> paramField, Parcel paramParcel, int paramInt)
  {
    paramStringBuilder.append("\"").append(paramString).append("\":");
    if (paramField.zzpl())
    {
      zza(paramStringBuilder, paramField, paramParcel, paramInt);
      return;
    }
    zzb(paramStringBuilder, paramField, paramParcel, paramInt);
  }
  
  private void zza(StringBuilder paramStringBuilder, Map<String, FastJsonResponse.Field<?, ?>> paramMap, Parcel paramParcel)
  {
    paramMap = zzE(paramMap);
    paramStringBuilder.append('{');
    int j = zza.zzaj(paramParcel);
    int i = 0;
    while (paramParcel.dataPosition() < j)
    {
      int k = zza.zzai(paramParcel);
      Map.Entry localEntry = (Map.Entry)paramMap.get(Integer.valueOf(zza.zzbH(k)));
      if (localEntry != null)
      {
        if (i != 0) {
          paramStringBuilder.append(",");
        }
        zza(paramStringBuilder, (String)localEntry.getKey(), (FastJsonResponse.Field)localEntry.getValue(), paramParcel, k);
        i = 1;
      }
    }
    if (paramParcel.dataPosition() != j) {
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    }
    paramStringBuilder.append('}');
  }
  
  private void zzb(StringBuilder paramStringBuilder, FastJsonResponse.Field<?, ?> paramField, Parcel paramParcel, int paramInt)
  {
    if (paramField.zzpg())
    {
      paramStringBuilder.append("[");
      switch (paramField.zzpa())
      {
      default: 
        throw new IllegalStateException("Unknown field type out.");
      case 0: 
        zzli.zza(paramStringBuilder, zza.zzu(paramParcel, paramInt));
      }
      for (;;)
      {
        paramStringBuilder.append("]");
        return;
        zzli.zza(paramStringBuilder, zza.zzw(paramParcel, paramInt));
        continue;
        zzli.zza(paramStringBuilder, zza.zzv(paramParcel, paramInt));
        continue;
        zzli.zza(paramStringBuilder, zza.zzx(paramParcel, paramInt));
        continue;
        zzli.zza(paramStringBuilder, zza.zzy(paramParcel, paramInt));
        continue;
        zzli.zza(paramStringBuilder, zza.zzz(paramParcel, paramInt));
        continue;
        zzli.zza(paramStringBuilder, zza.zzt(paramParcel, paramInt));
        continue;
        zzli.zza(paramStringBuilder, zza.zzA(paramParcel, paramInt));
        continue;
        throw new UnsupportedOperationException("List of type BASE64, BASE64_URL_SAFE, or STRING_MAP is not supported");
        paramParcel = zza.zzE(paramParcel, paramInt);
        int i = paramParcel.length;
        paramInt = 0;
        while (paramInt < i)
        {
          if (paramInt > 0) {
            paramStringBuilder.append(",");
          }
          paramParcel[paramInt].setDataPosition(0);
          zza(paramStringBuilder, paramField.zzpn(), paramParcel[paramInt]);
          paramInt += 1;
        }
      }
    }
    switch (paramField.zzpa())
    {
    default: 
      throw new IllegalStateException("Unknown field type out");
    case 0: 
      paramStringBuilder.append(zza.zzg(paramParcel, paramInt));
      return;
    case 1: 
      paramStringBuilder.append(zza.zzk(paramParcel, paramInt));
      return;
    case 2: 
      paramStringBuilder.append(zza.zzi(paramParcel, paramInt));
      return;
    case 3: 
      paramStringBuilder.append(zza.zzl(paramParcel, paramInt));
      return;
    case 4: 
      paramStringBuilder.append(zza.zzm(paramParcel, paramInt));
      return;
    case 5: 
      paramStringBuilder.append(zza.zzn(paramParcel, paramInt));
      return;
    case 6: 
      paramStringBuilder.append(zza.zzc(paramParcel, paramInt));
      return;
    case 7: 
      paramField = zza.zzo(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(zzls.zzcA(paramField)).append("\"");
      return;
    case 8: 
      paramField = zza.zzr(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(zzlj.zzi(paramField)).append("\"");
      return;
    case 9: 
      paramField = zza.zzr(paramParcel, paramInt);
      paramStringBuilder.append("\"").append(zzlj.zzj(paramField));
      paramStringBuilder.append("\"");
      return;
    case 10: 
      paramField = zza.zzq(paramParcel, paramInt);
      paramParcel = paramField.keySet();
      paramParcel.size();
      paramStringBuilder.append("{");
      paramParcel = paramParcel.iterator();
      for (paramInt = 1; paramParcel.hasNext(); paramInt = 0)
      {
        String str = (String)paramParcel.next();
        if (paramInt == 0) {
          paramStringBuilder.append(",");
        }
        paramStringBuilder.append("\"").append(str).append("\"");
        paramStringBuilder.append(":");
        paramStringBuilder.append("\"").append(zzls.zzcA(paramField.getString(str))).append("\"");
      }
      paramStringBuilder.append("}");
      return;
    }
    paramParcel = zza.zzD(paramParcel, paramInt);
    paramParcel.setDataPosition(0);
    zza(paramStringBuilder, paramField.zzpn(), paramParcel);
  }
  
  private void zzb(StringBuilder paramStringBuilder, FastJsonResponse.Field<?, ?> paramField, Object paramObject)
  {
    if (paramField.zzpf())
    {
      zzb(paramStringBuilder, paramField, (ArrayList)paramObject);
      return;
    }
    zza(paramStringBuilder, paramField.zzoZ(), paramObject);
  }
  
  private void zzb(StringBuilder paramStringBuilder, FastJsonResponse.Field<?, ?> paramField, ArrayList<?> paramArrayList)
  {
    paramStringBuilder.append("[");
    int j = paramArrayList.size();
    int i = 0;
    while (i < j)
    {
      if (i != 0) {
        paramStringBuilder.append(",");
      }
      zza(paramStringBuilder, paramField.zzoZ(), paramArrayList.get(i));
      i += 1;
    }
    paramStringBuilder.append("]");
  }
  
  public static HashMap<String, String> zzi(Bundle paramBundle)
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramBundle.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, paramBundle.getString(str));
    }
    return localHashMap;
  }
  
  public int describeContents()
  {
    zze localZze = CREATOR;
    return 0;
  }
  
  public int getVersionCode()
  {
    return mVersionCode;
  }
  
  public String toString()
  {
    zzx.zzb(zzaeY, "Cannot convert to JSON on client side.");
    Parcel localParcel = zzpt();
    localParcel.setDataPosition(0);
    StringBuilder localStringBuilder = new StringBuilder(100);
    zza(localStringBuilder, zzaeY.zzcx(mClassName), localParcel);
    return localStringBuilder.toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zze localZze = CREATOR;
    zze.zza(this, paramParcel, paramInt);
  }
  
  protected Object zzct(String paramString)
  {
    throw new UnsupportedOperationException("Converting to JSON does not require this method.");
  }
  
  protected boolean zzcu(String paramString)
  {
    throw new UnsupportedOperationException("Converting to JSON does not require this method.");
  }
  
  public Map<String, FastJsonResponse.Field<?, ?>> zzpb()
  {
    if (zzaeY == null) {
      return null;
    }
    return zzaeY.zzcx(mClassName);
  }
  
  public Parcel zzpt()
  {
    switch (zzafh)
    {
    }
    for (;;)
    {
      return zzaff;
      zzafi = zzb.zzak(zzaff);
      zzb.zzH(zzaff, zzafi);
      zzafh = 2;
      continue;
      zzb.zzH(zzaff, zzafi);
      zzafh = 2;
    }
  }
  
  FieldMappingDictionary zzpu()
  {
    switch (zzafg)
    {
    default: 
      throw new IllegalStateException("Invalid creation type: " + zzafg);
    case 0: 
      return null;
    case 1: 
      return zzaeY;
    }
    return zzaeY;
  }
}
