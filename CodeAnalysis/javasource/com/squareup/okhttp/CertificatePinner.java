package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.security.Principal;
import java.security.PublicKey;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.net.ssl.SSLPeerUnverifiedException;
import okio.ByteString;

public final class CertificatePinner
{
  public static final CertificatePinner DEFAULT = new Builder().build();
  private final Map<String, List<ByteString>> hostnameToPins;
  
  private CertificatePinner(Builder paramBuilder)
  {
    hostnameToPins = Util.immutableMap(hostnameToPins);
  }
  
  private static ByteString sha1(X509Certificate paramX509Certificate)
  {
    return Util.sha1(ByteString.of(paramX509Certificate.getPublicKey().getEncoded()));
  }
  
  public void check(String paramString, Certificate... paramVarArgs)
    throws SSLPeerUnverifiedException
  {
    List localList = (List)hostnameToPins.get(paramString);
    if (localList == null) {
      return;
    }
    int j = paramVarArgs.length;
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        break label59;
      }
      if (localList.contains(sha1((X509Certificate)paramVarArgs[i]))) {
        break;
      }
      i += 1;
    }
    label59:
    StringBuilder localStringBuilder = new StringBuilder().append("Certificate pinning failure!").append("\n  Peer certificate chain:");
    j = paramVarArgs.length;
    i = 0;
    while (i < j)
    {
      X509Certificate localX509Certificate = (X509Certificate)paramVarArgs[i];
      localStringBuilder.append("\n    sha1/").append(sha1(localX509Certificate).base64()).append(": ").append(localX509Certificate.getSubjectDN().getName());
      i += 1;
    }
    localStringBuilder.append("\n  Pinned certificates for ").append(paramString).append(":");
    paramString = localList.iterator();
    while (paramString.hasNext())
    {
      paramVarArgs = (ByteString)paramString.next();
      localStringBuilder.append("\n    sha1/").append(paramVarArgs.base64());
    }
    throw new SSLPeerUnverifiedException(localStringBuilder.toString());
  }
  
  public static final class Builder
  {
    private final Map<String, List<ByteString>> hostnameToPins = new LinkedHashMap();
    
    public Builder() {}
    
    public CertificatePinner build()
    {
      return new CertificatePinner(this, null);
    }
  }
}
