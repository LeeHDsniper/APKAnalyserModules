package com.squareup.okhttp.internal.tls;

import java.security.cert.CertificateParsingException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSession;

public final class OkHostnameVerifier
  implements HostnameVerifier
{
  public static final OkHostnameVerifier INSTANCE = new OkHostnameVerifier();
  private static final Pattern VERIFY_AS_IP_ADDRESS = Pattern.compile("([0-9a-fA-F]*:[0-9a-fA-F:.]*)|([\\d.]+)");
  
  private OkHostnameVerifier() {}
  
  private List<String> getSubjectAltNames(X509Certificate paramX509Certificate, int paramInt)
  {
    ArrayList localArrayList = new ArrayList();
    try
    {
      paramX509Certificate = paramX509Certificate.getSubjectAlternativeNames();
      if (paramX509Certificate == null) {
        return Collections.emptyList();
      }
      Iterator localIterator = paramX509Certificate.iterator();
      for (;;)
      {
        paramX509Certificate = localArrayList;
        if (!localIterator.hasNext()) {
          break;
        }
        paramX509Certificate = (List)localIterator.next();
        if ((paramX509Certificate != null) && (paramX509Certificate.size() >= 2))
        {
          Integer localInteger = (Integer)paramX509Certificate.get(0);
          if ((localInteger != null) && (localInteger.intValue() == paramInt))
          {
            paramX509Certificate = (String)paramX509Certificate.get(1);
            if (paramX509Certificate != null) {
              localArrayList.add(paramX509Certificate);
            }
          }
        }
      }
      return paramX509Certificate;
    }
    catch (CertificateParsingException paramX509Certificate)
    {
      paramX509Certificate = Collections.emptyList();
    }
  }
  
  static boolean verifyAsIpAddress(String paramString)
  {
    return VERIFY_AS_IP_ADDRESS.matcher(paramString).matches();
  }
  
  private boolean verifyHostName(String paramString, X509Certificate paramX509Certificate)
  {
    paramString = paramString.toLowerCase(Locale.US);
    int i = 0;
    Iterator localIterator = getSubjectAltNames(paramX509Certificate, 2).iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      i = 1;
      if (verifyHostName(paramString, str)) {
        return true;
      }
    }
    if (i == 0)
    {
      paramX509Certificate = new DistinguishedNameParser(paramX509Certificate.getSubjectX500Principal()).findMostSpecific("cn");
      if (paramX509Certificate != null) {
        return verifyHostName(paramString, paramX509Certificate);
      }
    }
    return false;
  }
  
  private boolean verifyIpAddress(String paramString, X509Certificate paramX509Certificate)
  {
    paramX509Certificate = getSubjectAltNames(paramX509Certificate, 7).iterator();
    while (paramX509Certificate.hasNext()) {
      if (paramString.equalsIgnoreCase((String)paramX509Certificate.next())) {
        return true;
      }
    }
    return false;
  }
  
  public boolean verify(String paramString, X509Certificate paramX509Certificate)
  {
    if (verifyAsIpAddress(paramString)) {
      return verifyIpAddress(paramString, paramX509Certificate);
    }
    return verifyHostName(paramString, paramX509Certificate);
  }
  
  public boolean verify(String paramString, SSLSession paramSSLSession)
  {
    try
    {
      boolean bool = verify(paramString, (X509Certificate)paramSSLSession.getPeerCertificates()[0]);
      return bool;
    }
    catch (SSLException paramString) {}
    return false;
  }
  
  public boolean verifyHostName(String paramString1, String paramString2)
  {
    boolean bool2 = true;
    boolean bool1;
    if ((paramString1 == null) || (paramString1.length() == 0) || (paramString2 == null) || (paramString2.length() == 0)) {
      bool1 = false;
    }
    int i;
    int j;
    int k;
    do
    {
      do
      {
        return bool1;
        paramString2 = paramString2.toLowerCase(Locale.US);
        if (!paramString2.contains("*")) {
          return paramString1.equals(paramString2);
        }
        if (!paramString2.startsWith("*.")) {
          break;
        }
        bool1 = bool2;
      } while (paramString1.regionMatches(0, paramString2, 2, paramString2.length() - 2));
      i = paramString2.indexOf('*');
      if (i > paramString2.indexOf('.')) {
        return false;
      }
      if (!paramString1.regionMatches(0, paramString2, 0, i)) {
        return false;
      }
      j = paramString2.length() - (i + 1);
      k = paramString1.length() - j;
      if (paramString1.indexOf('.', i) < k) {
        return false;
      }
      bool1 = bool2;
    } while (paramString1.regionMatches(k, paramString2, i + 1, j));
    return false;
  }
}
