package org.apache.http.impl.cookie;

import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieAttributeHandler;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.CookieRestrictionViolationException;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SetCookie;
import org.apache.http.cookie.SetCookie2;
import org.apache.http.util.Args;

@Immutable
public class RFC2965VersionAttributeHandler
  implements CookieAttributeHandler
{
  public RFC2965VersionAttributeHandler() {}
  
  public boolean match(Cookie paramCookie, CookieOrigin paramCookieOrigin)
  {
    return true;
  }
  
  public void parse(SetCookie paramSetCookie, String paramString)
    throws MalformedCookieException
  {
    Args.notNull(paramSetCookie, "Cookie");
    if (paramString == null) {
      throw new MalformedCookieException("Missing value for version attribute");
    }
    try
    {
      i = Integer.parseInt(paramString);
      if (i < 0) {
        throw new MalformedCookieException("Invalid cookie version.");
      }
    }
    catch (NumberFormatException paramString)
    {
      int i;
      for (;;)
      {
        i = -1;
      }
      paramSetCookie.setVersion(i);
    }
  }
  
  public void validate(Cookie paramCookie, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    Args.notNull(paramCookie, "Cookie");
    if (((paramCookie instanceof SetCookie2)) && ((paramCookie instanceof ClientCookie)) && (!((ClientCookie)paramCookie).containsAttribute("version"))) {
      throw new CookieRestrictionViolationException("Violates RFC 2965. Version attribute is required.");
    }
  }
}
