package org.apache.http.cookie;

import org.apache.http.protocol.HttpContext;

public abstract interface CookieSpecProvider
{
  public abstract CookieSpec create(HttpContext paramHttpContext);
}
