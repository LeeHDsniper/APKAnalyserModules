package com.google.android.gms.internal;

import android.os.Binder;

public abstract class zzkq<T>
{
  private static zza zzaaX = null;
  private static int zzaaY = 0;
  private static String zzaaZ = "com.google.android.providers.gsf.permission.READ_GSERVICES";
  private static final Object zzpm = new Object();
  private T zzNR = null;
  protected final String zztP;
  protected final T zztQ;
  
  protected zzkq(String paramString, T paramT)
  {
    zztP = paramString;
    zztQ = paramT;
  }
  
  public static boolean isInitialized()
  {
    return zzaaX != null;
  }
  
  public static zzkq<Float> zza(String paramString, Float paramFloat)
  {
    new zzkq(paramString, paramFloat)
    {
      protected Float zzcb(String paramAnonymousString)
      {
        return zzkq.zznO().zzb(zztP, (Float)zztQ);
      }
    };
  }
  
  public static zzkq<Integer> zza(String paramString, Integer paramInteger)
  {
    new zzkq(paramString, paramInteger)
    {
      protected Integer zzca(String paramAnonymousString)
      {
        return zzkq.zznO().zzb(zztP, (Integer)zztQ);
      }
    };
  }
  
  public static zzkq<Long> zza(String paramString, Long paramLong)
  {
    new zzkq(paramString, paramLong)
    {
      protected Long zzbZ(String paramAnonymousString)
      {
        return zzkq.zznO().getLong(zztP, (Long)zztQ);
      }
    };
  }
  
  public static zzkq<Boolean> zzg(String paramString, boolean paramBoolean)
  {
    new zzkq(paramString, Boolean.valueOf(paramBoolean))
    {
      protected Boolean zzbY(String paramAnonymousString)
      {
        return zzkq.zznO().zzb(zztP, (Boolean)zztQ);
      }
    };
  }
  
  public static int zznM()
  {
    return zzaaY;
  }
  
  public static zzkq<String> zzu(String paramString1, String paramString2)
  {
    new zzkq(paramString1, paramString2)
    {
      protected String zzcc(String paramAnonymousString)
      {
        return zzkq.zznO().getString(zztP, (String)zztQ);
      }
    };
  }
  
  public final T get()
  {
    if (zzNR != null) {
      return zzNR;
    }
    return zzbX(zztP);
  }
  
  protected abstract T zzbX(String paramString);
  
  public final T zznN()
  {
    long l = Binder.clearCallingIdentity();
    try
    {
      Object localObject1 = get();
      return localObject1;
    }
    finally
    {
      Binder.restoreCallingIdentity(l);
    }
  }
  
  private static abstract interface zza
  {
    public abstract Long getLong(String paramString, Long paramLong);
    
    public abstract String getString(String paramString1, String paramString2);
    
    public abstract Boolean zzb(String paramString, Boolean paramBoolean);
    
    public abstract Float zzb(String paramString, Float paramFloat);
    
    public abstract Integer zzb(String paramString, Integer paramInteger);
  }
}
