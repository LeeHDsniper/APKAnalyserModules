package org.apache.http.util;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;

public class CharsetUtils
{
  public CharsetUtils() {}
  
  public static Charset get(String paramString)
    throws UnsupportedEncodingException
  {
    if (paramString == null) {
      return null;
    }
    try
    {
      Charset localCharset = Charset.forName(paramString);
      return localCharset;
    }
    catch (UnsupportedCharsetException localUnsupportedCharsetException)
    {
      throw new UnsupportedEncodingException(paramString);
    }
  }
  
  public static Charset lookup(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    try
    {
      paramString = Charset.forName(paramString);
      return paramString;
    }
    catch (UnsupportedCharsetException paramString) {}
    return null;
  }
}
