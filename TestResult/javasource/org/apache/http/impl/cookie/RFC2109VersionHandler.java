package org.apache.http.impl.cookie;

import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.CookieRestrictionViolationException;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SetCookie;
import org.apache.http.util.Args;

@Immutable
public class RFC2109VersionHandler
  extends AbstractCookieAttributeHandler
{
  public RFC2109VersionHandler() {}
  
  public void parse(SetCookie paramSetCookie, String paramString)
    throws MalformedCookieException
  {
    Args.notNull(paramSetCookie, "Cookie");
    if (paramString == null) {
      throw new MalformedCookieException("Missing value for version attribute");
    }
    if (paramString.trim().length() == 0) {
      throw new MalformedCookieException("Blank value for version attribute");
    }
    try
    {
      paramSetCookie.setVersion(Integer.parseInt(paramString));
      return;
    }
    catch (NumberFormatException paramSetCookie)
    {
      throw new MalformedCookieException("Invalid version: " + paramSetCookie.getMessage());
    }
  }
  
  public void validate(Cookie paramCookie, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    Args.notNull(paramCookie, "Cookie");
    if (paramCookie.getVersion() < 0) {
      throw new CookieRestrictionViolationException("Cookie version may not be negative");
    }
  }
}
