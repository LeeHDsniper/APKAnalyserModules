package org.apache.http.conn.ssl;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

public class TrustSelfSignedStrategy
  implements TrustStrategy
{
  public TrustSelfSignedStrategy() {}
  
  public boolean isTrusted(X509Certificate[] paramArrayOfX509Certificate, String paramString)
    throws CertificateException
  {
    return paramArrayOfX509Certificate.length == 1;
  }
}
