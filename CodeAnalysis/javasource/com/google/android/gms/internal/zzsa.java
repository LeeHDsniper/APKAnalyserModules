package com.google.android.gms.internal;

import java.io.IOException;

public final class zzsa
{
  public static final int[] zzbcn = new int[0];
  public static final long[] zzbco = new long[0];
  public static final float[] zzbcp = new float[0];
  public static final double[] zzbcq = new double[0];
  public static final boolean[] zzbcr = new boolean[0];
  public static final String[] zzbcs = new String[0];
  public static final byte[][] zzbct = new byte[0][];
  public static final byte[] zzbcu = new byte[0];
  
  static int zzE(int paramInt1, int paramInt2)
  {
    return paramInt1 << 3 | paramInt2;
  }
  
  public static final int zzb(zzrp paramZzrp, int paramInt)
    throws IOException
  {
    int i = 1;
    int j = paramZzrp.getPosition();
    paramZzrp.zzlj(paramInt);
    while (paramZzrp.zzCT() == paramInt)
    {
      paramZzrp.zzlj(paramInt);
      i += 1;
    }
    paramZzrp.zzln(j);
    return i;
  }
  
  static int zzlD(int paramInt)
  {
    return paramInt & 0x7;
  }
  
  public static int zzlE(int paramInt)
  {
    return paramInt >>> 3;
  }
}
