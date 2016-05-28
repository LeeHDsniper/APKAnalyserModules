package org.apache.http.impl.auth;

import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthSchemeFactory;
import org.apache.http.params.HttpParams;

@Deprecated
public class NegotiateSchemeFactory
  implements AuthSchemeFactory
{
  private final SpnegoTokenGenerator spengoGenerator;
  private final boolean stripPort;
  
  public NegotiateSchemeFactory()
  {
    this(null, false);
  }
  
  public NegotiateSchemeFactory(SpnegoTokenGenerator paramSpnegoTokenGenerator)
  {
    this(paramSpnegoTokenGenerator, false);
  }
  
  public NegotiateSchemeFactory(SpnegoTokenGenerator paramSpnegoTokenGenerator, boolean paramBoolean)
  {
    spengoGenerator = paramSpnegoTokenGenerator;
    stripPort = paramBoolean;
  }
  
  public SpnegoTokenGenerator getSpengoGenerator()
  {
    return spengoGenerator;
  }
  
  public boolean isStripPort()
  {
    return stripPort;
  }
  
  public AuthScheme newInstance(HttpParams paramHttpParams)
  {
    return new NegotiateScheme(spengoGenerator, stripPort);
  }
}
