package com.google.android.gms.internal;

import java.io.IOException;

public abstract class zzrr<M extends zzrr<M>>
  extends zzrx
{
  protected zzrt zzbca;
  
  public zzrr() {}
  
  protected int zzB()
  {
    int j = 0;
    if (zzbca != null)
    {
      int i = 0;
      for (;;)
      {
        k = i;
        if (j >= zzbca.size()) {
          break;
        }
        i += zzbca.zzlB(j).zzB();
        j += 1;
      }
    }
    int k = 0;
    return k;
  }
  
  protected final int zzDk()
  {
    if ((zzbca == null) || (zzbca.isEmpty())) {
      return 0;
    }
    return zzbca.hashCode();
  }
  
  public M zzDl()
    throws CloneNotSupportedException
  {
    zzrr localZzrr = (zzrr)super.zzDm();
    zzrv.zza(this, localZzrr);
    return localZzrr;
  }
  
  public void zza(zzrq paramZzrq)
    throws IOException
  {
    if (zzbca == null) {}
    for (;;)
    {
      return;
      int i = 0;
      while (i < zzbca.size())
      {
        zzbca.zzlB(i).zza(paramZzrq);
        i += 1;
      }
    }
  }
  
  protected final boolean zza(zzrp paramZzrp, int paramInt)
    throws IOException
  {
    int i = paramZzrp.getPosition();
    if (!paramZzrp.zzlj(paramInt)) {
      return false;
    }
    int j = zzsa.zzlE(paramInt);
    zzrz localZzrz = new zzrz(paramInt, paramZzrp.zzy(i, paramZzrp.getPosition() - i));
    paramZzrp = null;
    if (zzbca == null) {
      zzbca = new zzrt();
    }
    for (;;)
    {
      Object localObject = paramZzrp;
      if (paramZzrp == null)
      {
        localObject = new zzru();
        zzbca.zza(j, (zzru)localObject);
      }
      ((zzru)localObject).zza(localZzrz);
      return true;
      paramZzrp = zzbca.zzlA(j);
    }
  }
  
  protected final boolean zza(M paramM)
  {
    if ((zzbca == null) || (zzbca.isEmpty())) {
      return (zzbca == null) || (zzbca.isEmpty());
    }
    return zzbca.equals(zzbca);
  }
}
