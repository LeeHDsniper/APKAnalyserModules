package org.apache.http.util;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import org.apache.http.Consts;

public final class EncodingUtils
{
  private EncodingUtils() {}
  
  public static byte[] getAsciiBytes(String paramString)
  {
    Args.notNull(paramString, "Input");
    try
    {
      paramString = paramString.getBytes(Consts.ASCII.name());
      return paramString;
    }
    catch (UnsupportedEncodingException paramString)
    {
      throw new Error("ASCII not supported");
    }
  }
  
  public static String getAsciiString(byte[] paramArrayOfByte)
  {
    Args.notNull(paramArrayOfByte, "Input");
    return getAsciiString(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public static String getAsciiString(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    Args.notNull(paramArrayOfByte, "Input");
    try
    {
      paramArrayOfByte = new String(paramArrayOfByte, paramInt1, paramInt2, Consts.ASCII.name());
      return paramArrayOfByte;
    }
    catch (UnsupportedEncodingException paramArrayOfByte)
    {
      throw new Error("ASCII not supported");
    }
  }
  
  public static byte[] getBytes(String paramString1, String paramString2)
  {
    Args.notNull(paramString1, "Input");
    Args.notEmpty(paramString2, "Charset");
    try
    {
      paramString2 = paramString1.getBytes(paramString2);
      return paramString2;
    }
    catch (UnsupportedEncodingException paramString2) {}
    return paramString1.getBytes();
  }
  
  public static String getString(byte[] paramArrayOfByte, int paramInt1, int paramInt2, String paramString)
  {
    Args.notNull(paramArrayOfByte, "Input");
    Args.notEmpty(paramString, "Charset");
    try
    {
      paramString = new String(paramArrayOfByte, paramInt1, paramInt2, paramString);
      return paramString;
    }
    catch (UnsupportedEncodingException paramString) {}
    return new String(paramArrayOfByte, paramInt1, paramInt2);
  }
  
  public static String getString(byte[] paramArrayOfByte, String paramString)
  {
    Args.notNull(paramArrayOfByte, "Input");
    return getString(paramArrayOfByte, 0, paramArrayOfByte.length, paramString);
  }
}
