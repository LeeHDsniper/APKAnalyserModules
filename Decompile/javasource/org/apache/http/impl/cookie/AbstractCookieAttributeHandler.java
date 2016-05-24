package org.apache.http.impl.cookie;

import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieAttributeHandler;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.MalformedCookieException;

@Immutable
public abstract class AbstractCookieAttributeHandler
  implements CookieAttributeHandler
{
  public AbstractCookieAttributeHandler() {}
  
  public boolean match(Cookie paramCookie, CookieOrigin paramCookieOrigin)
  {
    return true;
  }
  
  public void validate(Cookie paramCookie, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {}
}
