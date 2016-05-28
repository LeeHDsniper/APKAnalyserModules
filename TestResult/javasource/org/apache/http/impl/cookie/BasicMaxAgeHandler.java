package org.apache.http.impl.cookie;

import java.util.Date;
import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SetCookie;
import org.apache.http.util.Args;

@Immutable
public class BasicMaxAgeHandler
  extends AbstractCookieAttributeHandler
{
  public BasicMaxAgeHandler() {}
  
  public void parse(SetCookie paramSetCookie, String paramString)
    throws MalformedCookieException
  {
    Args.notNull(paramSetCookie, "Cookie");
    if (paramString == null) {
      throw new MalformedCookieException("Missing value for max-age attribute");
    }
    int i;
    try
    {
      i = Integer.parseInt(paramString);
      if (i < 0) {
        throw new MalformedCookieException("Negative max-age attribute: " + paramString);
      }
    }
    catch (NumberFormatException paramSetCookie)
    {
      throw new MalformedCookieException("Invalid max-age attribute: " + paramString);
    }
    paramSetCookie.setExpiryDate(new Date(System.currentTimeMillis() + i * 1000L));
  }
}
