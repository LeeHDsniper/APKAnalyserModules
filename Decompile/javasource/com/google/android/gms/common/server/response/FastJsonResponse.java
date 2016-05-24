package com.google.android.gms.common.server.response;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.common.server.converter.ConverterWrapper;
import com.google.android.gms.internal.zzlj;
import com.google.android.gms.internal.zzls;
import com.google.android.gms.internal.zzlt;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public abstract class FastJsonResponse
{
  public FastJsonResponse() {}
  
  private void zza(StringBuilder paramStringBuilder, Field paramField, Object paramObject)
  {
    if (paramField.zzoZ() == 11)
    {
      paramStringBuilder.append(((FastJsonResponse)paramField.zzpj().cast(paramObject)).toString());
      return;
    }
    if (paramField.zzoZ() == 7)
    {
      paramStringBuilder.append("\"");
      paramStringBuilder.append(zzls.zzcA((String)paramObject));
      paramStringBuilder.append("\"");
      return;
    }
    paramStringBuilder.append(paramObject);
  }
  
  private void zza(StringBuilder paramStringBuilder, Field paramField, ArrayList<Object> paramArrayList)
  {
    paramStringBuilder.append("[");
    int i = 0;
    int j = paramArrayList.size();
    while (i < j)
    {
      if (i > 0) {
        paramStringBuilder.append(",");
      }
      Object localObject = paramArrayList.get(i);
      if (localObject != null) {
        zza(paramStringBuilder, paramField, localObject);
      }
      i += 1;
    }
    paramStringBuilder.append("]");
  }
  
  public String toString()
  {
    Map localMap = zzpb();
    StringBuilder localStringBuilder = new StringBuilder(100);
    Iterator localIterator = localMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      Field localField = (Field)localMap.get(str);
      if (zza(localField))
      {
        Object localObject = zza(localField, zzb(localField));
        if (localStringBuilder.length() == 0) {
          localStringBuilder.append("{");
        }
        for (;;)
        {
          localStringBuilder.append("\"").append(str).append("\":");
          if (localObject != null) {
            break label139;
          }
          localStringBuilder.append("null");
          break;
          localStringBuilder.append(",");
        }
        label139:
        switch (localField.zzpa())
        {
        default: 
          if (localField.zzpf()) {
            zza(localStringBuilder, localField, (ArrayList)localObject);
          }
          break;
        case 8: 
          localStringBuilder.append("\"").append(zzlj.zzi((byte[])localObject)).append("\"");
          break;
        case 9: 
          localStringBuilder.append("\"").append(zzlj.zzj((byte[])localObject)).append("\"");
          break;
        case 10: 
          zzlt.zza(localStringBuilder, (HashMap)localObject);
          continue;
          zza(localStringBuilder, localField, localObject);
        }
      }
    }
    if (localStringBuilder.length() > 0) {
      localStringBuilder.append("}");
    }
    for (;;)
    {
      return localStringBuilder.toString();
      localStringBuilder.append("{}");
    }
  }
  
  protected <O, I> I zza(Field<I, O> paramField, Object paramObject)
  {
    Object localObject = paramObject;
    if (Field.zzc(paramField) != null) {
      localObject = paramField.convertBack(paramObject);
    }
    return localObject;
  }
  
  protected boolean zza(Field paramField)
  {
    if (paramField.zzpa() == 11)
    {
      if (paramField.zzpg()) {
        return zzcw(paramField.zzph());
      }
      return zzcv(paramField.zzph());
    }
    return zzcu(paramField.zzph());
  }
  
  protected Object zzb(Field paramField)
  {
    String str = paramField.zzph();
    if (paramField.zzpj() != null)
    {
      boolean bool;
      if (zzct(paramField.zzph()) == null)
      {
        bool = true;
        zzx.zza(bool, "Concrete field shouldn't be value object: %s", new Object[] { paramField.zzph() });
        if (!paramField.zzpg()) {
          break label71;
        }
      }
      label71:
      for (paramField = zzpd();; paramField = zzpc())
      {
        if (paramField == null) {
          break label79;
        }
        return paramField.get(str);
        bool = false;
        break;
      }
      try
      {
        label79:
        paramField = "get" + Character.toUpperCase(str.charAt(0)) + str.substring(1);
        paramField = getClass().getMethod(paramField, new Class[0]).invoke(this, new Object[0]);
        return paramField;
      }
      catch (Exception paramField)
      {
        throw new RuntimeException(paramField);
      }
    }
    return zzct(paramField.zzph());
  }
  
  protected abstract Object zzct(String paramString);
  
  protected abstract boolean zzcu(String paramString);
  
  protected boolean zzcv(String paramString)
  {
    throw new UnsupportedOperationException("Concrete types not supported");
  }
  
  protected boolean zzcw(String paramString)
  {
    throw new UnsupportedOperationException("Concrete type arrays not supported");
  }
  
  public abstract Map<String, Field<?, ?>> zzpb();
  
  public HashMap<String, Object> zzpc()
  {
    return null;
  }
  
  public HashMap<String, Object> zzpd()
  {
    return null;
  }
  
  public static class Field<I, O>
    implements SafeParcelable
  {
    public static final zza CREATOR = new zza();
    private final int mVersionCode;
    protected final int zzaeQ;
    protected final boolean zzaeR;
    protected final int zzaeS;
    protected final boolean zzaeT;
    protected final String zzaeU;
    protected final int zzaeV;
    protected final Class<? extends FastJsonResponse> zzaeW;
    protected final String zzaeX;
    private FieldMappingDictionary zzaeY;
    private FastJsonResponse.zza<I, O> zzaeZ;
    
    Field(int paramInt1, int paramInt2, boolean paramBoolean1, int paramInt3, boolean paramBoolean2, String paramString1, int paramInt4, String paramString2, ConverterWrapper paramConverterWrapper)
    {
      mVersionCode = paramInt1;
      zzaeQ = paramInt2;
      zzaeR = paramBoolean1;
      zzaeS = paramInt3;
      zzaeT = paramBoolean2;
      zzaeU = paramString1;
      zzaeV = paramInt4;
      if (paramString2 == null) {
        zzaeW = null;
      }
      for (zzaeX = null; paramConverterWrapper == null; zzaeX = paramString2)
      {
        zzaeZ = null;
        return;
        zzaeW = SafeParcelResponse.class;
      }
      zzaeZ = paramConverterWrapper.zzoX();
    }
    
    public I convertBack(O paramO)
    {
      return zzaeZ.convertBack(paramO);
    }
    
    public int describeContents()
    {
      zza localZza = CREATOR;
      return 0;
    }
    
    public int getVersionCode()
    {
      return mVersionCode;
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder1 = new StringBuilder();
      localStringBuilder1.append("Field\n");
      localStringBuilder1.append("            versionCode=").append(mVersionCode).append('\n');
      localStringBuilder1.append("                 typeIn=").append(zzaeQ).append('\n');
      localStringBuilder1.append("            typeInArray=").append(zzaeR).append('\n');
      localStringBuilder1.append("                typeOut=").append(zzaeS).append('\n');
      localStringBuilder1.append("           typeOutArray=").append(zzaeT).append('\n');
      localStringBuilder1.append("        outputFieldName=").append(zzaeU).append('\n');
      localStringBuilder1.append("      safeParcelFieldId=").append(zzaeV).append('\n');
      localStringBuilder1.append("       concreteTypeName=").append(zzpk()).append('\n');
      if (zzpj() != null) {
        localStringBuilder1.append("     concreteType.class=").append(zzpj().getCanonicalName()).append('\n');
      }
      StringBuilder localStringBuilder2 = localStringBuilder1.append("          converterName=");
      if (zzaeZ == null) {}
      for (String str = "null";; str = zzaeZ.getClass().getCanonicalName())
      {
        localStringBuilder2.append(str).append('\n');
        return localStringBuilder1.toString();
      }
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zza localZza = CREATOR;
      zza.zza(this, paramParcel, paramInt);
    }
    
    public void zza(FieldMappingDictionary paramFieldMappingDictionary)
    {
      zzaeY = paramFieldMappingDictionary;
    }
    
    public int zzoZ()
    {
      return zzaeQ;
    }
    
    public int zzpa()
    {
      return zzaeS;
    }
    
    public boolean zzpf()
    {
      return zzaeR;
    }
    
    public boolean zzpg()
    {
      return zzaeT;
    }
    
    public String zzph()
    {
      return zzaeU;
    }
    
    public int zzpi()
    {
      return zzaeV;
    }
    
    public Class<? extends FastJsonResponse> zzpj()
    {
      return zzaeW;
    }
    
    String zzpk()
    {
      if (zzaeX == null) {
        return null;
      }
      return zzaeX;
    }
    
    public boolean zzpl()
    {
      return zzaeZ != null;
    }
    
    ConverterWrapper zzpm()
    {
      if (zzaeZ == null) {
        return null;
      }
      return ConverterWrapper.zza(zzaeZ);
    }
    
    public Map<String, Field<?, ?>> zzpn()
    {
      zzx.zzv(zzaeX);
      zzx.zzv(zzaeY);
      return zzaeY.zzcx(zzaeX);
    }
  }
  
  public static abstract interface zza<I, O>
  {
    public abstract I convertBack(O paramO);
  }
}
