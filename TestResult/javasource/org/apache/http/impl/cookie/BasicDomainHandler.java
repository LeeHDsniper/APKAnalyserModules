package org.apache.http.impl.cookie;

import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieAttributeHandler;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.CookieRestrictionViolationException;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SetCookie;
import org.apache.http.util.Args;

@Immutable
public class BasicDomainHandler
  implements CookieAttributeHandler
{
  public BasicDomainHandler() {}
  
  public boolean match(Cookie paramCookie, CookieOrigin paramCookieOrigin)
  {
    Args.notNull(paramCookie, "Cookie");
    Args.notNull(paramCookieOrigin, "Cookie origin");
    String str = paramCookieOrigin.getHost();
    paramCookieOrigin = paramCookie.getDomain();
    if (paramCookieOrigin == null) {}
    do
    {
      return false;
      if (str.equals(paramCookieOrigin)) {
        return true;
      }
      paramCookie = paramCookieOrigin;
      if (!paramCookieOrigin.startsWith(".")) {
        paramCookie = '.' + paramCookieOrigin;
      }
    } while ((!str.endsWith(paramCookie)) && (!str.equals(paramCookie.substring(1))));
    return true;
  }
  
  public void parse(SetCookie paramSetCookie, String paramString)
    throws MalformedCookieException
  {
    Args.notNull(paramSetCookie, "Cookie");
    if (paramString == null) {
      throw new MalformedCookieException("Missing value for domain attribute");
    }
    if (paramString.trim().length() == 0) {
      throw new MalformedCookieException("Blank value for domain attribute");
    }
    paramSetCookie.setDomain(paramString);
  }
  
  public void validate(Cookie paramCookie, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    Args.notNull(paramCookie, "Cookie");
    Args.notNull(paramCookieOrigin, "Cookie origin");
    String str = paramCookieOrigin.getHost();
    paramCookieOrigin = paramCookie.getDomain();
    if (paramCookieOrigin == null) {
      throw new CookieRestrictionViolationException("Cookie domain may not be null");
    }
    if (str.contains("."))
    {
      if (!str.endsWith(paramCookieOrigin))
      {
        paramCookie = paramCookieOrigin;
        if (paramCookieOrigin.startsWith(".")) {
          paramCookie = paramCookieOrigin.substring(1, paramCookieOrigin.length());
        }
        if (!str.equals(paramCookie)) {
          throw new CookieRestrictionViolationException("Illegal domain attribute \"" + paramCookie + "\". Domain of origin: \"" + str + "\"");
        }
      }
    }
    else if (!str.equals(paramCookieOrigin)) {
      throw new CookieRestrictionViolationException("Illegal domain attribute \"" + paramCookieOrigin + "\". Domain of origin: \"" + str + "\"");
    }
  }
}
