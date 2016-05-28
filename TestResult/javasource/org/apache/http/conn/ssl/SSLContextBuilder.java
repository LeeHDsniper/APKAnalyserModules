package org.apache.http.conn.ssl;

import java.net.Socket;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.security.PrivateKey;
import java.security.SecureRandom;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import javax.net.ssl.KeyManager;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509KeyManager;
import javax.net.ssl.X509TrustManager;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
public class SSLContextBuilder
{
  static final String SSL = "SSL";
  static final String TLS = "TLS";
  private Set<KeyManager> keymanagers = new HashSet();
  private String protocol;
  private SecureRandom secureRandom;
  private Set<TrustManager> trustmanagers = new HashSet();
  
  public SSLContextBuilder() {}
  
  public SSLContext build()
    throws NoSuchAlgorithmException, KeyManagementException
  {
    Object localObject;
    SSLContext localSSLContext;
    if (protocol != null)
    {
      localObject = protocol;
      localSSLContext = SSLContext.getInstance((String)localObject);
      if (keymanagers.isEmpty()) {
        break label109;
      }
      localObject = (KeyManager[])keymanagers.toArray(new KeyManager[keymanagers.size()]);
      label54:
      if (trustmanagers.isEmpty()) {
        break label114;
      }
    }
    label109:
    label114:
    for (TrustManager[] arrayOfTrustManager = (TrustManager[])trustmanagers.toArray(new TrustManager[trustmanagers.size()]);; arrayOfTrustManager = null)
    {
      localSSLContext.init((KeyManager[])localObject, arrayOfTrustManager, secureRandom);
      return localSSLContext;
      localObject = "TLS";
      break;
      localObject = null;
      break label54;
    }
  }
  
  public SSLContextBuilder loadKeyMaterial(KeyStore paramKeyStore, char[] paramArrayOfChar)
    throws NoSuchAlgorithmException, KeyStoreException, UnrecoverableKeyException
  {
    loadKeyMaterial(paramKeyStore, paramArrayOfChar, null);
    return this;
  }
  
  public SSLContextBuilder loadKeyMaterial(KeyStore paramKeyStore, char[] paramArrayOfChar, PrivateKeyStrategy paramPrivateKeyStrategy)
    throws NoSuchAlgorithmException, KeyStoreException, UnrecoverableKeyException
  {
    KeyManagerFactory localKeyManagerFactory = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
    localKeyManagerFactory.init(paramKeyStore, paramArrayOfChar);
    paramKeyStore = localKeyManagerFactory.getKeyManagers();
    if (paramKeyStore != null)
    {
      if (paramPrivateKeyStrategy != null)
      {
        i = 0;
        while (i < paramKeyStore.length)
        {
          paramArrayOfChar = paramKeyStore[i];
          if ((paramArrayOfChar instanceof X509KeyManager)) {
            paramKeyStore[i] = new KeyManagerDelegate((X509KeyManager)paramArrayOfChar, paramPrivateKeyStrategy);
          }
          i += 1;
        }
      }
      int i = 0;
      while (i < paramKeyStore.length)
      {
        keymanagers.add(paramKeyStore[i]);
        i += 1;
      }
    }
    return this;
  }
  
  public SSLContextBuilder loadTrustMaterial(KeyStore paramKeyStore)
    throws NoSuchAlgorithmException, KeyStoreException
  {
    return loadTrustMaterial(paramKeyStore, null);
  }
  
  public SSLContextBuilder loadTrustMaterial(KeyStore paramKeyStore, TrustStrategy paramTrustStrategy)
    throws NoSuchAlgorithmException, KeyStoreException
  {
    TrustManagerFactory localTrustManagerFactory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
    localTrustManagerFactory.init(paramKeyStore);
    paramKeyStore = localTrustManagerFactory.getTrustManagers();
    if (paramKeyStore != null)
    {
      if (paramTrustStrategy != null)
      {
        i = 0;
        while (i < paramKeyStore.length)
        {
          localTrustManagerFactory = paramKeyStore[i];
          if ((localTrustManagerFactory instanceof X509TrustManager)) {
            paramKeyStore[i] = new TrustManagerDelegate((X509TrustManager)localTrustManagerFactory, paramTrustStrategy);
          }
          i += 1;
        }
      }
      int i = 0;
      while (i < paramKeyStore.length)
      {
        trustmanagers.add(paramKeyStore[i]);
        i += 1;
      }
    }
    return this;
  }
  
  public SSLContextBuilder setSecureRandom(SecureRandom paramSecureRandom)
  {
    secureRandom = paramSecureRandom;
    return this;
  }
  
  public SSLContextBuilder useProtocol(String paramString)
  {
    protocol = paramString;
    return this;
  }
  
  public SSLContextBuilder useSSL()
  {
    protocol = "SSL";
    return this;
  }
  
  public SSLContextBuilder useTLS()
  {
    protocol = "TLS";
    return this;
  }
  
  static class KeyManagerDelegate
    implements X509KeyManager
  {
    private final PrivateKeyStrategy aliasStrategy;
    private final X509KeyManager keyManager;
    
    KeyManagerDelegate(X509KeyManager paramX509KeyManager, PrivateKeyStrategy paramPrivateKeyStrategy)
    {
      keyManager = paramX509KeyManager;
      aliasStrategy = paramPrivateKeyStrategy;
    }
    
    public String chooseClientAlias(String[] paramArrayOfString, Principal[] paramArrayOfPrincipal, Socket paramSocket)
    {
      HashMap localHashMap = new HashMap();
      int k = paramArrayOfString.length;
      int i = 0;
      while (i < k)
      {
        String str1 = paramArrayOfString[i];
        String[] arrayOfString = keyManager.getClientAliases(str1, paramArrayOfPrincipal);
        if (arrayOfString != null)
        {
          int m = arrayOfString.length;
          int j = 0;
          while (j < m)
          {
            String str2 = arrayOfString[j];
            localHashMap.put(str2, new PrivateKeyDetails(str1, keyManager.getCertificateChain(str2)));
            j += 1;
          }
        }
        i += 1;
      }
      return aliasStrategy.chooseAlias(localHashMap, paramSocket);
    }
    
    public String chooseServerAlias(String paramString, Principal[] paramArrayOfPrincipal, Socket paramSocket)
    {
      HashMap localHashMap = new HashMap();
      paramArrayOfPrincipal = keyManager.getServerAliases(paramString, paramArrayOfPrincipal);
      if (paramArrayOfPrincipal != null)
      {
        int j = paramArrayOfPrincipal.length;
        int i = 0;
        while (i < j)
        {
          Principal localPrincipal = paramArrayOfPrincipal[i];
          localHashMap.put(localPrincipal, new PrivateKeyDetails(paramString, keyManager.getCertificateChain(localPrincipal)));
          i += 1;
        }
      }
      return aliasStrategy.chooseAlias(localHashMap, paramSocket);
    }
    
    public X509Certificate[] getCertificateChain(String paramString)
    {
      return keyManager.getCertificateChain(paramString);
    }
    
    public String[] getClientAliases(String paramString, Principal[] paramArrayOfPrincipal)
    {
      return keyManager.getClientAliases(paramString, paramArrayOfPrincipal);
    }
    
    public PrivateKey getPrivateKey(String paramString)
    {
      return keyManager.getPrivateKey(paramString);
    }
    
    public String[] getServerAliases(String paramString, Principal[] paramArrayOfPrincipal)
    {
      return keyManager.getServerAliases(paramString, paramArrayOfPrincipal);
    }
  }
  
  static class TrustManagerDelegate
    implements X509TrustManager
  {
    private final X509TrustManager trustManager;
    private final TrustStrategy trustStrategy;
    
    TrustManagerDelegate(X509TrustManager paramX509TrustManager, TrustStrategy paramTrustStrategy)
    {
      trustManager = paramX509TrustManager;
      trustStrategy = paramTrustStrategy;
    }
    
    public void checkClientTrusted(X509Certificate[] paramArrayOfX509Certificate, String paramString)
      throws CertificateException
    {
      trustManager.checkClientTrusted(paramArrayOfX509Certificate, paramString);
    }
    
    public void checkServerTrusted(X509Certificate[] paramArrayOfX509Certificate, String paramString)
      throws CertificateException
    {
      if (!trustStrategy.isTrusted(paramArrayOfX509Certificate, paramString)) {
        trustManager.checkServerTrusted(paramArrayOfX509Certificate, paramString);
      }
    }
    
    public X509Certificate[] getAcceptedIssuers()
    {
      return trustManager.getAcceptedIssuers();
    }
  }
}
