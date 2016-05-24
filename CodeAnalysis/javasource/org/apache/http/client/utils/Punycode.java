package org.apache.http.client.utils;

import org.apache.http.annotation.Immutable;

@Immutable
public class Punycode
{
  private static final Idn impl;
  
  static
  {
    try
    {
      JdkIdn localJdkIdn = new JdkIdn();
      impl = localJdkIdn;
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Rfc3492Idn localRfc3492Idn = new Rfc3492Idn();
      }
    }
  }
  
  public Punycode() {}
  
  public static String toUnicode(String paramString)
  {
    return impl.toUnicode(paramString);
  }
}
