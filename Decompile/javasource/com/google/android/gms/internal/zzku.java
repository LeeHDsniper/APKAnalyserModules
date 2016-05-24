package com.google.android.gms.internal;

import android.graphics.drawable.Drawable;
import com.google.android.gms.common.internal.zzw;

public final class zzku
  extends zzlf<zza, Drawable>
{
  public static final class zza
  {
    public final int zzacA;
    public final int zzacz;
    
    public zza(int paramInt1, int paramInt2)
    {
      zzacz = paramInt1;
      zzacA = paramInt2;
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = true;
      boolean bool1;
      if (!(paramObject instanceof zza)) {
        bool1 = false;
      }
      do
      {
        do
        {
          return bool1;
          bool1 = bool2;
        } while (this == paramObject);
        paramObject = (zza)paramObject;
        if (zzacz != zzacz) {
          break;
        }
        bool1 = bool2;
      } while (zzacA == zzacA);
      return false;
    }
    
    public int hashCode()
    {
      return zzw.hashCode(new Object[] { Integer.valueOf(zzacz), Integer.valueOf(zzacA) });
    }
  }
}
