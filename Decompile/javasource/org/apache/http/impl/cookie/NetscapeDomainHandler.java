package org.apache.http.impl.cookie;

import java.util.Locale;
import java.util.StringTokenizer;
import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.CookieRestrictionViolationException;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.util.Args;

@Immutable
public class NetscapeDomainHandler
  extends BasicDomainHandler
{
  public NetscapeDomainHandler() {}
  
  private static boolean isSpecialDomain(String paramString)
  {
    paramString = paramString.toUpperCase(Locale.ENGLISH);
    return (paramString.endsWith(".COM")) || (paramString.endsWith(".EDU")) || (paramString.endsWith(".NET")) || (paramString.endsWith(".GOV")) || (paramString.endsWith(".MIL")) || (paramString.endsWith(".ORG")) || (paramString.endsWith(".INT"));
  }
  
  public boolean match(Cookie paramCookie, CookieOrigin paramCookieOrigin)
  {
    Args.notNull(paramCookie, "Cookie");
    Args.notNull(paramCookieOrigin, "Cookie origin");
    paramCookieOrigin = paramCookieOrigin.getHost();
    paramCookie = paramCookie.getDomain();
    if (paramCookie == null) {
      return false;
    }
    return paramCookieOrigin.endsWith(paramCookie);
  }
  
  public void validate(Cookie paramCookie, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    super.validate(paramCookie, paramCookieOrigin);
    paramCookieOrigin = paramCookieOrigin.getHost();
    paramCookie = paramCookie.getDomain();
    if (paramCookieOrigin.contains("."))
    {
      int i = new StringTokenizer(paramCookie, ".").countTokens();
      if (isSpecialDomain(paramCookie))
      {
        if (i < 2) {
          throw new CookieRestrictionViolationException("Domain attribute \"" + paramCookie + "\" violates the Netscape cookie specification for " + "special domains");
        }
      }
      else if (i < 3) {
        throw new CookieRestrictionViolationException("Domain attribute \"" + paramCookie + "\" violates the Netscape cookie specification");
      }
    }
  }
}
