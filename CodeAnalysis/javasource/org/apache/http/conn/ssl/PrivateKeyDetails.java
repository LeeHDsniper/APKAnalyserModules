package org.apache.http.conn.ssl;

import java.security.cert.X509Certificate;
import java.util.Arrays;
import org.apache.http.util.Args;

public final class PrivateKeyDetails
{
  private final X509Certificate[] certChain;
  private final String type;
  
  public PrivateKeyDetails(String paramString, X509Certificate[] paramArrayOfX509Certificate)
  {
    type = ((String)Args.notNull(paramString, "Private key type"));
    certChain = paramArrayOfX509Certificate;
  }
  
  public X509Certificate[] getCertChain()
  {
    return certChain;
  }
  
  public String getType()
  {
    return type;
  }
  
  public String toString()
  {
    return type + ':' + Arrays.toString(certChain);
  }
}
