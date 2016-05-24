package org.apache.http.impl.cookie;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import org.apache.http.client.utils.Punycode;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieAttributeHandler;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SetCookie;

public class PublicSuffixFilter
  implements CookieAttributeHandler
{
  private Set<String> exceptions;
  private Set<String> suffixes;
  private final CookieAttributeHandler wrapped;
  
  public PublicSuffixFilter(CookieAttributeHandler paramCookieAttributeHandler)
  {
    wrapped = paramCookieAttributeHandler;
  }
  
  private boolean isForPublicSuffix(Cookie paramCookie)
  {
    Object localObject = paramCookie.getDomain();
    paramCookie = (Cookie)localObject;
    if (((String)localObject).startsWith(".")) {
      paramCookie = ((String)localObject).substring(1);
    }
    paramCookie = Punycode.toUnicode(paramCookie);
    if ((exceptions != null) && (exceptions.contains(paramCookie))) {}
    while (suffixes == null) {
      return false;
    }
    do
    {
      if (suffixes.contains(paramCookie)) {
        return true;
      }
      localObject = paramCookie;
      if (paramCookie.startsWith("*.")) {
        localObject = paramCookie.substring(2);
      }
      int i = ((String)localObject).indexOf('.');
      if (i == -1) {
        break;
      }
      localObject = "*" + ((String)localObject).substring(i);
      paramCookie = (Cookie)localObject;
    } while (((String)localObject).length() > 0);
    return false;
  }
  
  public boolean match(Cookie paramCookie, CookieOrigin paramCookieOrigin)
  {
    if (isForPublicSuffix(paramCookie)) {
      return false;
    }
    return wrapped.match(paramCookie, paramCookieOrigin);
  }
  
  public void parse(SetCookie paramSetCookie, String paramString)
    throws MalformedCookieException
  {
    wrapped.parse(paramSetCookie, paramString);
  }
  
  public void setExceptions(Collection<String> paramCollection)
  {
    exceptions = new HashSet(paramCollection);
  }
  
  public void setPublicSuffixes(Collection<String> paramCollection)
  {
    suffixes = new HashSet(paramCollection);
  }
  
  public void validate(Cookie paramCookie, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    wrapped.validate(paramCookie, paramCookieOrigin);
  }
}
