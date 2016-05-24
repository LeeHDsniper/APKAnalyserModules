package org.apache.http.impl.cookie;

import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.CookieSpec;
import org.apache.http.cookie.CookieSpecFactory;
import org.apache.http.cookie.CookieSpecProvider;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;

@Immutable
public class IgnoreSpecFactory
  implements CookieSpecFactory, CookieSpecProvider
{
  public IgnoreSpecFactory() {}
  
  public CookieSpec create(HttpContext paramHttpContext)
  {
    return new IgnoreSpec();
  }
  
  public CookieSpec newInstance(HttpParams paramHttpParams)
  {
    return new IgnoreSpec();
  }
}
