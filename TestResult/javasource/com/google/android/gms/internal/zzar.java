package com.google.android.gms.internal;

import java.nio.ByteBuffer;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class zzar
{
  private final zzap zzmW;
  private final SecureRandom zznD;
  
  public zzar(zzap paramZzap, SecureRandom paramSecureRandom)
  {
    zzmW = paramZzap;
    zznD = paramSecureRandom;
  }
  
  static void zze(byte[] paramArrayOfByte)
  {
    int i = 0;
    while (i < paramArrayOfByte.length)
    {
      paramArrayOfByte[i] = ((byte)(paramArrayOfByte[i] ^ 0x44));
      i += 1;
    }
  }
  
  public byte[] zzc(byte[] paramArrayOfByte, String paramString)
    throws zzar.zza
  {
    if (paramArrayOfByte.length != 16) {
      throw new zza();
    }
    try
    {
      arrayOfByte = zzmW.zza(paramString, false);
      if (arrayOfByte.length <= 16) {
        throw new zza();
      }
    }
    catch (NoSuchAlgorithmException paramArrayOfByte)
    {
      throw new zza(paramArrayOfByte);
      Object localObject = ByteBuffer.allocate(arrayOfByte.length);
      ((ByteBuffer)localObject).put(arrayOfByte);
      ((ByteBuffer)localObject).flip();
      paramString = new byte[16];
      byte[] arrayOfByte = new byte[arrayOfByte.length - 16];
      ((ByteBuffer)localObject).get(paramString);
      ((ByteBuffer)localObject).get(arrayOfByte);
      paramArrayOfByte = new SecretKeySpec(paramArrayOfByte, "AES");
      localObject = Cipher.getInstance("AES/CBC/PKCS5Padding");
      ((Cipher)localObject).init(2, paramArrayOfByte, new IvParameterSpec(paramString));
      paramArrayOfByte = ((Cipher)localObject).doFinal(arrayOfByte);
      return paramArrayOfByte;
    }
    catch (InvalidKeyException paramArrayOfByte)
    {
      throw new zza(paramArrayOfByte);
    }
    catch (IllegalBlockSizeException paramArrayOfByte)
    {
      throw new zza(paramArrayOfByte);
    }
    catch (NoSuchPaddingException paramArrayOfByte)
    {
      throw new zza(paramArrayOfByte);
    }
    catch (BadPaddingException paramArrayOfByte)
    {
      throw new zza(paramArrayOfByte);
    }
    catch (InvalidAlgorithmParameterException paramArrayOfByte)
    {
      throw new zza(paramArrayOfByte);
    }
    catch (IllegalArgumentException paramArrayOfByte)
    {
      throw new zza(paramArrayOfByte);
    }
  }
  
  public byte[] zzl(String paramString)
    throws zzar.zza
  {
    try
    {
      paramString = zzmW.zza(paramString, false);
      if (paramString.length != 32) {
        throw new zza();
      }
    }
    catch (IllegalArgumentException paramString)
    {
      throw new zza(paramString);
    }
    paramString = ByteBuffer.wrap(paramString, 4, 16);
    byte[] arrayOfByte = new byte[16];
    paramString.get(arrayOfByte);
    zze(arrayOfByte);
    return arrayOfByte;
  }
  
  public class zza
    extends Exception
  {
    public zza() {}
    
    public zza(Throwable paramThrowable)
    {
      super();
    }
  }
}
