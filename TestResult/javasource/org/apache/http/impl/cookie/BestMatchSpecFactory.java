package org.apache.http.impl.cookie;

import java.util.Collection;
import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.CookieSpec;
import org.apache.http.cookie.CookieSpecFactory;
import org.apache.http.cookie.CookieSpecProvider;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;

@Immutable
public class BestMatchSpecFactory
  implements CookieSpecFactory, CookieSpecProvider
{
  private final String[] datepatterns;
  private final boolean oneHeader;
  
  public BestMatchSpecFactory()
  {
    this(null, false);
  }
  
  public BestMatchSpecFactory(String[] paramArrayOfString, boolean paramBoolean)
  {
    datepatterns = paramArrayOfString;
    oneHeader = paramBoolean;
  }
  
  public CookieSpec create(HttpContext paramHttpContext)
  {
    return new BestMatchSpec(datepatterns, oneHeader);
  }
  
  public CookieSpec newInstance(HttpParams paramHttpParams)
  {
    if (paramHttpParams != null)
    {
      String[] arrayOfString = null;
      Collection localCollection = (Collection)paramHttpParams.getParameter("http.protocol.cookie-datepatterns");
      if (localCollection != null) {
        arrayOfString = (String[])localCollection.toArray(new String[localCollection.size()]);
      }
      return new BestMatchSpec(arrayOfString, paramHttpParams.getBooleanParameter("http.protocol.single-cookie-header", false));
    }
    return new BestMatchSpec();
  }
}
