package org.apache.http.impl.auth;

import org.apache.http.Header;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.Credentials;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.ietf.jgss.GSSException;
import org.ietf.jgss.Oid;

@NotThreadSafe
public class SPNegoScheme
  extends GGSSchemeBase
{
  private static final String SPNEGO_OID = "1.3.6.1.5.5.2";
  
  public SPNegoScheme()
  {
    super(false);
  }
  
  public SPNegoScheme(boolean paramBoolean)
  {
    super(paramBoolean);
  }
  
  public Header authenticate(Credentials paramCredentials, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws AuthenticationException
  {
    return super.authenticate(paramCredentials, paramHttpRequest, paramHttpContext);
  }
  
  protected byte[] generateToken(byte[] paramArrayOfByte, String paramString)
    throws GSSException
  {
    return generateGSSToken(paramArrayOfByte, new Oid("1.3.6.1.5.5.2"), paramString);
  }
  
  public String getParameter(String paramString)
  {
    Args.notNull(paramString, "Parameter name");
    return null;
  }
  
  public String getRealm()
  {
    return null;
  }
  
  public String getSchemeName()
  {
    return "Negotiate";
  }
  
  public boolean isConnectionBased()
  {
    return true;
  }
}
