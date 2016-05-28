package org.apache.http.conn.ssl;

import javax.net.ssl.SSLException;
import org.apache.http.annotation.Immutable;

@Immutable
public class StrictHostnameVerifier
  extends AbstractVerifier
{
  public StrictHostnameVerifier() {}
  
  public final String toString()
  {
    return "STRICT";
  }
  
  public final void verify(String paramString, String[] paramArrayOfString1, String[] paramArrayOfString2)
    throws SSLException
  {
    verify(paramString, paramArrayOfString1, paramArrayOfString2, true);
  }
}
