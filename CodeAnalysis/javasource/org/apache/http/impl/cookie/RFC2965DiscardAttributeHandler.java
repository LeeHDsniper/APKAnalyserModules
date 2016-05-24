package org.apache.http.impl.cookie;

import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieAttributeHandler;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SetCookie;
import org.apache.http.cookie.SetCookie2;

@Immutable
public class RFC2965DiscardAttributeHandler
  implements CookieAttributeHandler
{
  public RFC2965DiscardAttributeHandler() {}
  
  public boolean match(Cookie paramCookie, CookieOrigin paramCookieOrigin)
  {
    return true;
  }
  
  public void parse(SetCookie paramSetCookie, String paramString)
    throws MalformedCookieException
  {
    if ((paramSetCookie instanceof SetCookie2)) {
      ((SetCookie2)paramSetCookie).setDiscard(true);
    }
  }
  
  public void validate(Cookie paramCookie, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {}
}
