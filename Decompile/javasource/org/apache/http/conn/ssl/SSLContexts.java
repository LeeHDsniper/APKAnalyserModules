package org.apache.http.conn.ssl;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import javax.net.ssl.SSLContext;
import org.apache.http.annotation.Immutable;

@Immutable
public class SSLContexts
{
  public SSLContexts() {}
  
  public static SSLContext createDefault()
    throws SSLInitializationException
  {
    try
    {
      SSLContext localSSLContext = SSLContext.getInstance("TLS");
      localSSLContext.init(null, null, null);
      return localSSLContext;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new SSLInitializationException(localNoSuchAlgorithmException.getMessage(), localNoSuchAlgorithmException);
    }
    catch (KeyManagementException localKeyManagementException)
    {
      throw new SSLInitializationException(localKeyManagementException.getMessage(), localKeyManagementException);
    }
  }
  
  public static SSLContext createSystemDefault()
    throws SSLInitializationException
  {
    try
    {
      SSLContext localSSLContext = SSLContext.getInstance("Default");
      return localSSLContext;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException) {}
    return createDefault();
  }
  
  public static SSLContextBuilder custom()
  {
    return new SSLContextBuilder();
  }
}
