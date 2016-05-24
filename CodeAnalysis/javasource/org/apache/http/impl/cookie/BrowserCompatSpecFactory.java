package org.apache.http.impl.cookie;

import java.util.Collection;
import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.CookieSpec;
import org.apache.http.cookie.CookieSpecFactory;
import org.apache.http.cookie.CookieSpecProvider;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;

@Immutable
public class BrowserCompatSpecFactory
  implements CookieSpecFactory, CookieSpecProvider
{
  private final String[] datepatterns;
  private final SecurityLevel securityLevel;
  
  public BrowserCompatSpecFactory()
  {
    this(null, SecurityLevel.SECURITYLEVEL_DEFAULT);
  }
  
  public BrowserCompatSpecFactory(String[] paramArrayOfString)
  {
    this(null, SecurityLevel.SECURITYLEVEL_DEFAULT);
  }
  
  public BrowserCompatSpecFactory(String[] paramArrayOfString, SecurityLevel paramSecurityLevel)
  {
    datepatterns = paramArrayOfString;
    securityLevel = paramSecurityLevel;
  }
  
  public CookieSpec create(HttpContext paramHttpContext)
  {
    return new BrowserCompatSpec(datepatterns);
  }
  
  public CookieSpec newInstance(HttpParams paramHttpParams)
  {
    if (paramHttpParams != null)
    {
      Object localObject = null;
      Collection localCollection = (Collection)paramHttpParams.getParameter("http.protocol.cookie-datepatterns");
      paramHttpParams = localObject;
      if (localCollection != null) {
        paramHttpParams = (String[])localCollection.toArray(new String[localCollection.size()]);
      }
      return new BrowserCompatSpec(paramHttpParams, securityLevel);
    }
    return new BrowserCompatSpec(null, securityLevel);
  }
  
  public static enum SecurityLevel
  {
    SECURITYLEVEL_DEFAULT,  SECURITYLEVEL_IE_MEDIUM;
    
    private SecurityLevel() {}
  }
}
