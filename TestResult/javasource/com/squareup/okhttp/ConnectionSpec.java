package com.squareup.okhttp;

import com.squareup.okhttp.internal.Platform;
import com.squareup.okhttp.internal.Util;
import java.util.Arrays;
import java.util.List;
import javax.net.ssl.SSLSocket;

public final class ConnectionSpec
{
  public static final ConnectionSpec CLEARTEXT = new Builder(false, null).build();
  public static final ConnectionSpec COMPATIBLE_TLS;
  public static final ConnectionSpec MODERN_TLS = new Builder(true, null).cipherSuites(new CipherSuite[] { CipherSuite.TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256, CipherSuite.TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256, CipherSuite.TLS_DHE_RSA_WITH_AES_128_GCM_SHA256, CipherSuite.TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA, CipherSuite.TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA, CipherSuite.TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA, CipherSuite.TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA, CipherSuite.TLS_ECDHE_ECDSA_WITH_RC4_128_SHA, CipherSuite.TLS_ECDHE_RSA_WITH_RC4_128_SHA, CipherSuite.TLS_DHE_RSA_WITH_AES_128_CBC_SHA, CipherSuite.TLS_DHE_DSS_WITH_AES_128_CBC_SHA, CipherSuite.TLS_DHE_RSA_WITH_AES_256_CBC_SHA, CipherSuite.TLS_RSA_WITH_AES_128_GCM_SHA256, CipherSuite.TLS_RSA_WITH_AES_128_CBC_SHA, CipherSuite.TLS_RSA_WITH_AES_256_CBC_SHA, CipherSuite.TLS_RSA_WITH_3DES_EDE_CBC_SHA, CipherSuite.TLS_RSA_WITH_RC4_128_SHA, CipherSuite.TLS_RSA_WITH_RC4_128_MD5 }).tlsVersions(new TlsVersion[] { TlsVersion.TLS_1_2, TlsVersion.TLS_1_1, TlsVersion.TLS_1_0, TlsVersion.SSL_3_0 }).supportsTlsExtensions(true).build();
  private final String[] cipherSuites;
  private ConnectionSpec supportedSpec;
  final boolean supportsTlsExtensions;
  final boolean tls;
  private final String[] tlsVersions;
  
  static
  {
    COMPATIBLE_TLS = new Builder(MODERN_TLS).tlsVersions(new TlsVersion[] { TlsVersion.SSL_3_0 }).build();
  }
  
  private ConnectionSpec(Builder paramBuilder)
  {
    tls = tls;
    cipherSuites = cipherSuites;
    tlsVersions = tlsVersions;
    supportsTlsExtensions = supportsTlsExtensions;
  }
  
  private ConnectionSpec supportedSpec(SSLSocket paramSSLSocket)
  {
    List localList = Util.intersect(Arrays.asList(cipherSuites), Arrays.asList(paramSSLSocket.getSupportedCipherSuites()));
    paramSSLSocket = Util.intersect(Arrays.asList(tlsVersions), Arrays.asList(paramSSLSocket.getSupportedProtocols()));
    return new Builder(this).cipherSuites((String[])localList.toArray(new String[localList.size()])).tlsVersions((String[])paramSSLSocket.toArray(new String[paramSSLSocket.size()])).build();
  }
  
  void apply(SSLSocket paramSSLSocket, Route paramRoute)
  {
    Object localObject2 = supportedSpec;
    Object localObject1 = localObject2;
    if (localObject2 == null)
    {
      localObject1 = supportedSpec(paramSSLSocket);
      supportedSpec = ((ConnectionSpec)localObject1);
    }
    paramSSLSocket.setEnabledProtocols(tlsVersions);
    paramSSLSocket.setEnabledCipherSuites(cipherSuites);
    localObject2 = Platform.get();
    if (supportsTlsExtensions) {
      ((Platform)localObject2).configureTlsExtensions(paramSSLSocket, address.uriHost, address.protocols);
    }
  }
  
  public List<CipherSuite> cipherSuites()
  {
    CipherSuite[] arrayOfCipherSuite = new CipherSuite[cipherSuites.length];
    int i = 0;
    while (i < cipherSuites.length)
    {
      arrayOfCipherSuite[i] = CipherSuite.forJavaName(cipherSuites[i]);
      i += 1;
    }
    return Util.immutableList(arrayOfCipherSuite);
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof ConnectionSpec)) {}
    do
    {
      return false;
      paramObject = (ConnectionSpec)paramObject;
    } while ((tls != tls) || ((tls) && ((!Arrays.equals(cipherSuites, cipherSuites)) || (!Arrays.equals(tlsVersions, tlsVersions)) || (supportsTlsExtensions != supportsTlsExtensions))));
    return true;
  }
  
  public int hashCode()
  {
    int i = 17;
    int j;
    int k;
    if (tls)
    {
      j = Arrays.hashCode(cipherSuites);
      k = Arrays.hashCode(tlsVersions);
      if (!supportsTlsExtensions) {
        break label53;
      }
    }
    label53:
    for (i = 0;; i = 1)
    {
      i = ((j + 527) * 31 + k) * 31 + i;
      return i;
    }
  }
  
  public boolean isTls()
  {
    return tls;
  }
  
  public boolean supportsTlsExtensions()
  {
    return supportsTlsExtensions;
  }
  
  public List<TlsVersion> tlsVersions()
  {
    TlsVersion[] arrayOfTlsVersion = new TlsVersion[tlsVersions.length];
    int i = 0;
    while (i < tlsVersions.length)
    {
      arrayOfTlsVersion[i] = TlsVersion.forJavaName(tlsVersions[i]);
      i += 1;
    }
    return Util.immutableList(arrayOfTlsVersion);
  }
  
  public String toString()
  {
    if (tls) {
      return "ConnectionSpec(cipherSuites=" + cipherSuites() + ", tlsVersions=" + tlsVersions() + ", supportsTlsExtensions=" + supportsTlsExtensions + ")";
    }
    return "ConnectionSpec()";
  }
  
  public static final class Builder
  {
    private String[] cipherSuites;
    private boolean supportsTlsExtensions;
    private boolean tls;
    private String[] tlsVersions;
    
    public Builder(ConnectionSpec paramConnectionSpec)
    {
      tls = tls;
      cipherSuites = cipherSuites;
      tlsVersions = tlsVersions;
      supportsTlsExtensions = supportsTlsExtensions;
    }
    
    private Builder(boolean paramBoolean)
    {
      tls = paramBoolean;
    }
    
    public ConnectionSpec build()
    {
      return new ConnectionSpec(this, null);
    }
    
    public Builder cipherSuites(CipherSuite... paramVarArgs)
    {
      if (!tls) {
        throw new IllegalStateException("no cipher suites for cleartext connections");
      }
      String[] arrayOfString = new String[paramVarArgs.length];
      int i = 0;
      while (i < paramVarArgs.length)
      {
        arrayOfString[i] = javaName;
        i += 1;
      }
      return cipherSuites(arrayOfString);
    }
    
    Builder cipherSuites(String[] paramArrayOfString)
    {
      cipherSuites = paramArrayOfString;
      return this;
    }
    
    public Builder supportsTlsExtensions(boolean paramBoolean)
    {
      if (!tls) {
        throw new IllegalStateException("no TLS extensions for cleartext connections");
      }
      supportsTlsExtensions = paramBoolean;
      return this;
    }
    
    public Builder tlsVersions(TlsVersion... paramVarArgs)
    {
      if (!tls) {
        throw new IllegalStateException("no TLS versions for cleartext connections");
      }
      String[] arrayOfString = new String[paramVarArgs.length];
      int i = 0;
      while (i < paramVarArgs.length)
      {
        arrayOfString[i] = javaName;
        i += 1;
      }
      return tlsVersions(arrayOfString);
    }
    
    Builder tlsVersions(String... paramVarArgs)
    {
      tlsVersions = paramVarArgs;
      return this;
    }
  }
}
