package com.google.android.gms.internal;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class zzaa
  extends ByteArrayOutputStream
{
  private final zzu zzar;
  
  public zzaa(zzu paramZzu, int paramInt)
  {
    zzar = paramZzu;
    buf = zzar.zzb(Math.max(paramInt, 256));
  }
  
  private void zzd(int paramInt)
  {
    if (count + paramInt <= buf.length) {
      return;
    }
    byte[] arrayOfByte = zzar.zzb((count + paramInt) * 2);
    System.arraycopy(buf, 0, arrayOfByte, 0, count);
    zzar.zza(buf);
    buf = arrayOfByte;
  }
  
  public void close()
    throws IOException
  {
    zzar.zza(buf);
    buf = null;
    super.close();
  }
  
  public void finalize()
  {
    zzar.zza(buf);
  }
  
  public void write(int paramInt)
  {
    try
    {
      zzd(1);
      super.write(paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    try
    {
      zzd(paramInt2);
      super.write(paramArrayOfByte, paramInt1, paramInt2);
      return;
    }
    finally
    {
      paramArrayOfByte = finally;
      throw paramArrayOfByte;
    }
  }
}
