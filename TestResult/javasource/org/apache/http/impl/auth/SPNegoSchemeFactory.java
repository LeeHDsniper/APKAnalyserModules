package org.apache.http.impl.auth;

import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthSchemeFactory;
import org.apache.http.auth.AuthSchemeProvider;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;

@Immutable
public class SPNegoSchemeFactory
  implements AuthSchemeFactory, AuthSchemeProvider
{
  private final boolean stripPort;
  
  public SPNegoSchemeFactory()
  {
    this(false);
  }
  
  public SPNegoSchemeFactory(boolean paramBoolean)
  {
    stripPort = paramBoolean;
  }
  
  public AuthScheme create(HttpContext paramHttpContext)
  {
    return new SPNegoScheme(stripPort);
  }
  
  public boolean isStripPort()
  {
    return stripPort;
  }
  
  public AuthScheme newInstance(HttpParams paramHttpParams)
  {
    return new SPNegoScheme(stripPort);
  }
}
