package com.google.android.gms.dynamic;

import java.lang.reflect.Field;

public final class zze<T>
  extends zzd.zza
{
  private final T mWrappedObject;
  
  private zze(T paramT)
  {
    mWrappedObject = paramT;
  }
  
  public static <T> T zzp(zzd paramZzd)
  {
    if ((paramZzd instanceof zze)) {
      return mWrappedObject;
    }
    paramZzd = paramZzd.asBinder();
    Object localObject = paramZzd.getClass().getDeclaredFields();
    if (localObject.length == 1)
    {
      localObject = localObject[0];
      if (!((Field)localObject).isAccessible())
      {
        ((Field)localObject).setAccessible(true);
        try
        {
          paramZzd = ((Field)localObject).get(paramZzd);
          return paramZzd;
        }
        catch (NullPointerException paramZzd)
        {
          throw new IllegalArgumentException("Binder object is null.", paramZzd);
        }
        catch (IllegalArgumentException paramZzd)
        {
          throw new IllegalArgumentException("remoteBinder is the wrong class.", paramZzd);
        }
        catch (IllegalAccessException paramZzd)
        {
          throw new IllegalArgumentException("Could not access the field in remoteBinder.", paramZzd);
        }
      }
      throw new IllegalArgumentException("The concrete class implementing IObjectWrapper must have exactly one declared *private* field for the wrapped object. Preferably, this is an instance of the ObjectWrapper<T> class.");
    }
    throw new IllegalArgumentException("The concrete class implementing IObjectWrapper must have exactly *one* declared private field for the wrapped object.  Preferably, this is an instance of the ObjectWrapper<T> class.");
  }
  
  public static <T> zzd zzx(T paramT)
  {
    return new zze(paramT);
  }
}
