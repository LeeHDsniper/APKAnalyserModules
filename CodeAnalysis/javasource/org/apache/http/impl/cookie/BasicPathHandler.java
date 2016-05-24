package org.apache.http.impl.cookie;

import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieAttributeHandler;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.CookieRestrictionViolationException;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SetCookie;
import org.apache.http.util.Args;
import org.apache.http.util.TextUtils;

@Immutable
public class BasicPathHandler
  implements CookieAttributeHandler
{
  public BasicPathHandler() {}
  
  public boolean match(Cookie paramCookie, CookieOrigin paramCookieOrigin)
  {
    Args.notNull(paramCookie, "Cookie");
    Args.notNull(paramCookieOrigin, "Cookie origin");
    String str = paramCookieOrigin.getPath();
    paramCookieOrigin = paramCookie.getPath();
    paramCookie = paramCookieOrigin;
    if (paramCookieOrigin == null) {
      paramCookie = "/";
    }
    paramCookieOrigin = paramCookie;
    if (paramCookie.length() > 1)
    {
      paramCookieOrigin = paramCookie;
      if (paramCookie.endsWith("/")) {
        paramCookieOrigin = paramCookie.substring(0, paramCookie.length() - 1);
      }
    }
    boolean bool2 = str.startsWith(paramCookieOrigin);
    boolean bool1 = bool2;
    if (bool2)
    {
      bool1 = bool2;
      if (str.length() != paramCookieOrigin.length())
      {
        bool1 = bool2;
        if (!paramCookieOrigin.endsWith("/"))
        {
          if (str.charAt(paramCookieOrigin.length()) != '/') {
            break label130;
          }
          bool1 = true;
        }
      }
    }
    return bool1;
    label130:
    return false;
  }
  
  public void parse(SetCookie paramSetCookie, String paramString)
    throws MalformedCookieException
  {
    Args.notNull(paramSetCookie, "Cookie");
    if (!TextUtils.isBlank(paramString)) {}
    for (;;)
    {
      paramSetCookie.setPath(paramString);
      return;
      paramString = "/";
    }
  }
  
  public void validate(Cookie paramCookie, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    if (!match(paramCookie, paramCookieOrigin)) {
      throw new CookieRestrictionViolationException("Illegal path attribute \"" + paramCookie.getPath() + "\". Path of origin: \"" + paramCookieOrigin.getPath() + "\"");
    }
  }
}
