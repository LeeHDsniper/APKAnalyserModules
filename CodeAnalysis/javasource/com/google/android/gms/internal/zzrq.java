package com.google.android.gms.internal;

import java.io.IOException;
import java.nio.BufferOverflowException;
import java.nio.ByteBuffer;
import java.nio.ReadOnlyBufferException;

public final class zzrq
{
  private final ByteBuffer zzbbZ;
  
  private zzrq(ByteBuffer paramByteBuffer)
  {
    zzbbZ = paramByteBuffer;
  }
  
  private zzrq(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    this(ByteBuffer.wrap(paramArrayOfByte, paramInt1, paramInt2));
  }
  
  public static zzrq zzA(byte[] paramArrayOfByte)
  {
    return zzb(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public static int zzB(int paramInt1, int paramInt2)
  {
    return zzlv(paramInt1) + zzls(paramInt2);
  }
  
  public static int zzY(long paramLong)
  {
    return zzab(paramLong);
  }
  
  private static int zza(CharSequence paramCharSequence, int paramInt)
  {
    int m = paramCharSequence.length();
    int i = 0;
    if (paramInt < m)
    {
      int n = paramCharSequence.charAt(paramInt);
      int j;
      if (n < 2048)
      {
        i += (127 - n >>> 31);
        j = paramInt;
      }
      for (;;)
      {
        paramInt = j + 1;
        break;
        int k = i + 2;
        j = paramInt;
        i = k;
        if (55296 <= n)
        {
          j = paramInt;
          i = k;
          if (n <= 57343)
          {
            if (Character.codePointAt(paramCharSequence, paramInt) < 65536) {
              throw new IllegalArgumentException("Unpaired surrogate at index " + paramInt);
            }
            j = paramInt + 1;
            i = k;
          }
        }
      }
    }
    return i;
  }
  
  private static int zza(CharSequence paramCharSequence, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int k = paramCharSequence.length();
    int j = 0;
    int m = paramInt1 + paramInt2;
    paramInt2 = j;
    while ((paramInt2 < k) && (paramInt2 + paramInt1 < m))
    {
      j = paramCharSequence.charAt(paramInt2);
      if (j >= 128) {
        break;
      }
      paramArrayOfByte[(paramInt1 + paramInt2)] = ((byte)j);
      paramInt2 += 1;
    }
    if (paramInt2 == k) {
      return paramInt1 + k;
    }
    paramInt1 += paramInt2;
    if (paramInt2 < k)
    {
      int i = paramCharSequence.charAt(paramInt2);
      if ((i < 128) && (paramInt1 < m))
      {
        j = paramInt1 + 1;
        paramArrayOfByte[paramInt1] = ((byte)i);
        paramInt1 = j;
      }
      for (;;)
      {
        paramInt2 += 1;
        break;
        if ((i < 2048) && (paramInt1 <= m - 2))
        {
          j = paramInt1 + 1;
          paramArrayOfByte[paramInt1] = ((byte)(i >>> 6 | 0x3C0));
          paramInt1 = j + 1;
          paramArrayOfByte[j] = ((byte)(i & 0x3F | 0x80));
        }
        else
        {
          int n;
          if (((i < 55296) || (57343 < i)) && (paramInt1 <= m - 3))
          {
            j = paramInt1 + 1;
            paramArrayOfByte[paramInt1] = ((byte)(i >>> 12 | 0x1E0));
            n = j + 1;
            paramArrayOfByte[j] = ((byte)(i >>> 6 & 0x3F | 0x80));
            paramInt1 = n + 1;
            paramArrayOfByte[n] = ((byte)(i & 0x3F | 0x80));
          }
          else
          {
            if (paramInt1 > m - 4) {
              break label442;
            }
            j = paramInt2;
            char c;
            if (paramInt2 + 1 != paramCharSequence.length())
            {
              paramInt2 += 1;
              c = paramCharSequence.charAt(paramInt2);
              if (!Character.isSurrogatePair(i, c)) {
                j = paramInt2;
              }
            }
            else
            {
              throw new IllegalArgumentException("Unpaired surrogate at index " + (j - 1));
            }
            j = Character.toCodePoint(i, c);
            n = paramInt1 + 1;
            paramArrayOfByte[paramInt1] = ((byte)(j >>> 18 | 0xF0));
            paramInt1 = n + 1;
            paramArrayOfByte[n] = ((byte)(j >>> 12 & 0x3F | 0x80));
            n = paramInt1 + 1;
            paramArrayOfByte[paramInt1] = ((byte)(j >>> 6 & 0x3F | 0x80));
            paramInt1 = n + 1;
            paramArrayOfByte[n] = ((byte)(j & 0x3F | 0x80));
          }
        }
      }
      label442:
      throw new ArrayIndexOutOfBoundsException("Failed writing " + i + " at index " + paramInt1);
    }
    return paramInt1;
  }
  
  private static void zza(CharSequence paramCharSequence, ByteBuffer paramByteBuffer)
  {
    if (paramByteBuffer.isReadOnly()) {
      throw new ReadOnlyBufferException();
    }
    if (paramByteBuffer.hasArray()) {
      try
      {
        paramByteBuffer.position(zza(paramCharSequence, paramByteBuffer.array(), paramByteBuffer.arrayOffset() + paramByteBuffer.position(), paramByteBuffer.remaining()) - paramByteBuffer.arrayOffset());
        return;
      }
      catch (ArrayIndexOutOfBoundsException paramCharSequence)
      {
        paramByteBuffer = new BufferOverflowException();
        paramByteBuffer.initCause(paramCharSequence);
        throw paramByteBuffer;
      }
    }
    zzb(paramCharSequence, paramByteBuffer);
  }
  
  public static int zzab(long paramLong)
  {
    if ((0xFFFFFFFFFFFFFF80 & paramLong) == 0L) {
      return 1;
    }
    if ((0xFFFFFFFFFFFFC000 & paramLong) == 0L) {
      return 2;
    }
    if ((0xFFFFFFFFFFE00000 & paramLong) == 0L) {
      return 3;
    }
    if ((0xFFFFFFFFF0000000 & paramLong) == 0L) {
      return 4;
    }
    if ((0xFFFFFFF800000000 & paramLong) == 0L) {
      return 5;
    }
    if ((0xFFFFFC0000000000 & paramLong) == 0L) {
      return 6;
    }
    if ((0xFFFE000000000000 & paramLong) == 0L) {
      return 7;
    }
    if ((0xFF00000000000000 & paramLong) == 0L) {
      return 8;
    }
    if ((0x8000000000000000 & paramLong) == 0L) {
      return 9;
    }
    return 10;
  }
  
  public static int zzax(boolean paramBoolean)
  {
    return 1;
  }
  
  public static int zzb(int paramInt, zzrx paramZzrx)
  {
    return zzlv(paramInt) * 2 + zzd(paramZzrx);
  }
  
  public static zzrq zzb(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    return new zzrq(paramArrayOfByte, paramInt1, paramInt2);
  }
  
  private static void zzb(CharSequence paramCharSequence, ByteBuffer paramByteBuffer)
  {
    int m = paramCharSequence.length();
    int j = 0;
    if (j < m)
    {
      int i = paramCharSequence.charAt(j);
      if (i < 128) {
        paramByteBuffer.put((byte)i);
      }
      for (;;)
      {
        j += 1;
        break;
        if (i < 2048)
        {
          paramByteBuffer.put((byte)(i >>> 6 | 0x3C0));
          paramByteBuffer.put((byte)(i & 0x3F | 0x80));
        }
        else if ((i < 55296) || (57343 < i))
        {
          paramByteBuffer.put((byte)(i >>> 12 | 0x1E0));
          paramByteBuffer.put((byte)(i >>> 6 & 0x3F | 0x80));
          paramByteBuffer.put((byte)(i & 0x3F | 0x80));
        }
        else
        {
          int k = j;
          char c;
          if (j + 1 != paramCharSequence.length())
          {
            j += 1;
            c = paramCharSequence.charAt(j);
            if (!Character.isSurrogatePair(i, c)) {
              k = j;
            }
          }
          else
          {
            throw new IllegalArgumentException("Unpaired surrogate at index " + (k - 1));
          }
          k = Character.toCodePoint(i, c);
          paramByteBuffer.put((byte)(k >>> 18 | 0xF0));
          paramByteBuffer.put((byte)(k >>> 12 & 0x3F | 0x80));
          paramByteBuffer.put((byte)(k >>> 6 & 0x3F | 0x80));
          paramByteBuffer.put((byte)(k & 0x3F | 0x80));
        }
      }
    }
  }
  
  public static int zzc(int paramInt, float paramFloat)
  {
    return zzlv(paramInt) + zzj(paramFloat);
  }
  
  public static int zzc(int paramInt, zzrx paramZzrx)
  {
    return zzlv(paramInt) + zze(paramZzrx);
  }
  
  public static int zzc(int paramInt, boolean paramBoolean)
  {
    return zzlv(paramInt) + zzax(paramBoolean);
  }
  
  private static int zzc(CharSequence paramCharSequence)
  {
    int m = paramCharSequence.length();
    int i = 0;
    while ((i < m) && (paramCharSequence.charAt(i) < '')) {
      i += 1;
    }
    for (;;)
    {
      int k = i;
      int j;
      if (j < m)
      {
        k = paramCharSequence.charAt(j);
        if (k < 2048)
        {
          j += 1;
          i = (127 - k >>> 31) + i;
        }
        else
        {
          k = i + zza(paramCharSequence, j);
        }
      }
      else
      {
        if (k < m) {
          throw new IllegalArgumentException("UTF-8 length does not fit in int: " + (k + 4294967296L));
        }
        return k;
        j = i;
        i = m;
      }
    }
  }
  
  public static int zzd(int paramInt, long paramLong)
  {
    return zzlv(paramInt) + zzY(paramLong);
  }
  
  public static int zzd(zzrx paramZzrx)
  {
    return paramZzrx.zzDx();
  }
  
  public static int zze(zzrx paramZzrx)
  {
    int i = paramZzrx.zzDx();
    return i + zzlx(i);
  }
  
  public static int zzfy(String paramString)
  {
    int i = zzc(paramString);
    return i + zzlx(i);
  }
  
  public static int zzj(float paramFloat)
  {
    return 4;
  }
  
  public static int zzl(int paramInt, String paramString)
  {
    return zzlv(paramInt) + zzfy(paramString);
  }
  
  public static int zzls(int paramInt)
  {
    if (paramInt >= 0) {
      return zzlx(paramInt);
    }
    return 10;
  }
  
  public static int zzlv(int paramInt)
  {
    return zzlx(zzsa.zzE(paramInt, 0));
  }
  
  public static int zzlx(int paramInt)
  {
    if ((paramInt & 0xFFFFFF80) == 0) {
      return 1;
    }
    if ((paramInt & 0xC000) == 0) {
      return 2;
    }
    if ((0xFFE00000 & paramInt) == 0) {
      return 3;
    }
    if ((0xF0000000 & paramInt) == 0) {
      return 4;
    }
    return 5;
  }
  
  public void zzD(int paramInt1, int paramInt2)
    throws IOException
  {
    zzlw(zzsa.zzE(paramInt1, paramInt2));
  }
  
  public void zzD(byte[] paramArrayOfByte)
    throws IOException
  {
    zzc(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int zzDi()
  {
    return zzbbZ.remaining();
  }
  
  public void zzW(long paramLong)
    throws IOException
  {
    zzaa(paramLong);
  }
  
  public void zza(int paramInt, zzrx paramZzrx)
    throws IOException
  {
    zzD(paramInt, 2);
    zzc(paramZzrx);
  }
  
  public void zzaa(long paramLong)
    throws IOException
  {
    for (;;)
    {
      if ((0xFFFFFFFFFFFFFF80 & paramLong) == 0L)
      {
        zzlu((int)paramLong);
        return;
      }
      zzlu((int)paramLong & 0x7F | 0x80);
      paramLong >>>= 7;
    }
  }
  
  public void zzaw(boolean paramBoolean)
    throws IOException
  {
    if (paramBoolean) {}
    for (int i = 1;; i = 0)
    {
      zzlu(i);
      return;
    }
  }
  
  public void zzb(byte paramByte)
    throws IOException
  {
    if (!zzbbZ.hasRemaining()) {
      throw new zza(zzbbZ.position(), zzbbZ.limit());
    }
    zzbbZ.put(paramByte);
  }
  
  public void zzb(int paramInt, float paramFloat)
    throws IOException
  {
    zzD(paramInt, 5);
    zzi(paramFloat);
  }
  
  public void zzb(int paramInt, long paramLong)
    throws IOException
  {
    zzD(paramInt, 0);
    zzW(paramLong);
  }
  
  public void zzb(int paramInt, String paramString)
    throws IOException
  {
    zzD(paramInt, 2);
    zzfx(paramString);
  }
  
  public void zzb(int paramInt, boolean paramBoolean)
    throws IOException
  {
    zzD(paramInt, 0);
    zzaw(paramBoolean);
  }
  
  public void zzb(zzrx paramZzrx)
    throws IOException
  {
    paramZzrx.zza(this);
  }
  
  public void zzc(zzrx paramZzrx)
    throws IOException
  {
    zzlw(paramZzrx.zzDw());
    paramZzrx.zza(this);
  }
  
  public void zzc(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (zzbbZ.remaining() >= paramInt2)
    {
      zzbbZ.put(paramArrayOfByte, paramInt1, paramInt2);
      return;
    }
    throw new zza(zzbbZ.position(), zzbbZ.limit());
  }
  
  public void zzfx(String paramString)
    throws IOException
  {
    try
    {
      int i = zzlx(paramString.length());
      if (i == zzlx(paramString.length() * 3))
      {
        int j = zzbbZ.position();
        zzbbZ.position(j + i);
        zza(paramString, zzbbZ);
        int k = zzbbZ.position();
        zzbbZ.position(j);
        zzlw(k - j - i);
        zzbbZ.position(k);
        return;
      }
      zzlw(zzc(paramString));
      zza(paramString, zzbbZ);
      return;
    }
    catch (BufferOverflowException paramString)
    {
      throw new zza(zzbbZ.position(), zzbbZ.limit());
    }
  }
  
  public void zzi(float paramFloat)
    throws IOException
  {
    zzly(Float.floatToIntBits(paramFloat));
  }
  
  public void zzlq(int paramInt)
    throws IOException
  {
    if (paramInt >= 0)
    {
      zzlw(paramInt);
      return;
    }
    zzaa(paramInt);
  }
  
  public void zzlu(int paramInt)
    throws IOException
  {
    zzb((byte)paramInt);
  }
  
  public void zzlw(int paramInt)
    throws IOException
  {
    for (;;)
    {
      if ((paramInt & 0xFFFFFF80) == 0)
      {
        zzlu(paramInt);
        return;
      }
      zzlu(paramInt & 0x7F | 0x80);
      paramInt >>>= 7;
    }
  }
  
  public void zzly(int paramInt)
    throws IOException
  {
    zzlu(paramInt & 0xFF);
    zzlu(paramInt >> 8 & 0xFF);
    zzlu(paramInt >> 16 & 0xFF);
    zzlu(paramInt >> 24 & 0xFF);
  }
  
  public void zzz(int paramInt1, int paramInt2)
    throws IOException
  {
    zzD(paramInt1, 0);
    zzlq(paramInt2);
  }
  
  public static class zza
    extends IOException
  {
    zza(int paramInt1, int paramInt2)
    {
      super();
    }
  }
}
