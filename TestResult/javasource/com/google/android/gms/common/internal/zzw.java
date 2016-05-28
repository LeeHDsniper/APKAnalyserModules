package com.google.android.gms.common.internal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class zzw
{
  public static boolean equal(Object paramObject1, Object paramObject2)
  {
    return (paramObject1 == paramObject2) || ((paramObject1 != null) && (paramObject1.equals(paramObject2)));
  }
  
  public static int hashCode(Object... paramVarArgs)
  {
    return Arrays.hashCode(paramVarArgs);
  }
  
  public static zza zzu(Object paramObject)
  {
    return new zza(paramObject, null);
  }
  
  public static final class zza
  {
    private final Object zzIr;
    private final List<String> zzael;
    
    private zza(Object paramObject)
    {
      zzIr = zzx.zzv(paramObject);
      zzael = new ArrayList();
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder(100).append(zzIr.getClass().getSimpleName()).append('{');
      int j = zzael.size();
      int i = 0;
      while (i < j)
      {
        localStringBuilder.append((String)zzael.get(i));
        if (i < j - 1) {
          localStringBuilder.append(", ");
        }
        i += 1;
      }
      return '}';
    }
    
    public zza zzg(String paramString, Object paramObject)
    {
      zzael.add((String)zzx.zzv(paramString) + "=" + String.valueOf(paramObject));
      return this;
    }
  }
}
