package org.apache.http.impl.cookie;

import java.util.Collections;
import java.util.List;
import org.apache.http.Header;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.MalformedCookieException;

@NotThreadSafe
public class IgnoreSpec
  extends CookieSpecBase
{
  public IgnoreSpec() {}
  
  public List<Header> formatCookies(List<Cookie> paramList)
  {
    return Collections.emptyList();
  }
  
  public int getVersion()
  {
    return 0;
  }
  
  public Header getVersionHeader()
  {
    return null;
  }
  
  public List<Cookie> parse(Header paramHeader, CookieOrigin paramCookieOrigin)
    throws MalformedCookieException
  {
    return Collections.emptyList();
  }
}
