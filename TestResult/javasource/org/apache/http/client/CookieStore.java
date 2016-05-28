package org.apache.http.client;

import java.util.Date;
import java.util.List;
import org.apache.http.cookie.Cookie;

public abstract interface CookieStore
{
  public abstract void addCookie(Cookie paramCookie);
  
  public abstract void clear();
  
  public abstract boolean clearExpired(Date paramDate);
  
  public abstract List<Cookie> getCookies();
}
