package org.apache.http.impl.cookie;

import java.util.Collection;
import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.CookieSpec;
import org.apache.http.cookie.CookieSpecFactory;
import org.apache.http.cookie.CookieSpecProvider;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;

@Immutable
public class NetscapeDraftSpecFactory
  implements CookieSpecFactory, CookieSpecProvider
{
  private final String[] datepatterns;
  
  public NetscapeDraftSpecFactory()
  {
    this(null);
  }
  
  public NetscapeDraftSpecFactory(String[] paramArrayOfString)
  {
    datepatterns = paramArrayOfString;
  }
  
  public CookieSpec create(HttpContext paramHttpContext)
  {
    return new NetscapeDraftSpec(datepatterns);
  }
  
  public CookieSpec newInstance(HttpParams paramHttpParams)
  {
    if (paramHttpParams != null)
    {
      Object localObject = null;
      Collection localCollection = (Collection)paramHttpParams.getParameter("http.protocol.cookie-datepatterns");
      paramHttpParams = localObject;
      if (localCollection != null) {
        paramHttpParams = (String[])localCollection.toArray(new String[localCollection.size()]);
      }
      return new NetscapeDraftSpec(paramHttpParams);
    }
    return new NetscapeDraftSpec();
  }
}
