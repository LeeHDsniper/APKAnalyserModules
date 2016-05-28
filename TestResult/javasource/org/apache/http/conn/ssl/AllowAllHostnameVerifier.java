package org.apache.http.conn.ssl;

import org.apache.http.annotation.Immutable;

@Immutable
public class AllowAllHostnameVerifier
  extends AbstractVerifier
{
  public AllowAllHostnameVerifier() {}
  
  public final String toString()
  {
    return "ALLOW_ALL";
  }
  
  public final void verify(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2) {}
}
