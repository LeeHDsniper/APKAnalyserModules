package org.apache.http.impl.cookie;

import java.util.Date;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.utils.DateUtils;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SetCookie;
import org.apache.http.util.Args;

@Immutable
public class BasicExpiresHandler
  extends AbstractCookieAttributeHandler
{
  private final String[] datepatterns;
  
  public BasicExpiresHandler(String[] paramArrayOfString)
  {
    Args.notNull(paramArrayOfString, "Array of date patterns");
    datepatterns = paramArrayOfString;
  }
  
  public void parse(SetCookie paramSetCookie, String paramString)
    throws MalformedCookieException
  {
    Args.notNull(paramSetCookie, "Cookie");
    if (paramString == null) {
      throw new MalformedCookieException("Missing value for expires attribute");
    }
    Date localDate = DateUtils.parseDate(paramString, datepatterns);
    if (localDate == null) {
      throw new MalformedCookieException("Unable to parse expires attribute: " + paramString);
    }
    paramSetCookie.setExpiryDate(localDate);
  }
}
