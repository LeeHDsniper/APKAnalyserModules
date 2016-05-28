package org.apache.http.impl.auth;

import java.io.IOException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpRequest;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.Credentials;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.ietf.jgss.GSSException;
import org.ietf.jgss.Oid;

@Deprecated
public class NegotiateScheme
  extends GGSSchemeBase
{
  private static final String KERBEROS_OID = "1.2.840.113554.1.2.2";
  private static final String SPNEGO_OID = "1.3.6.1.5.5.2";
  private final Log log = LogFactory.getLog(getClass());
  private final SpnegoTokenGenerator spengoGenerator;
  
  public NegotiateScheme()
  {
    this(null, false);
  }
  
  public NegotiateScheme(SpnegoTokenGenerator paramSpnegoTokenGenerator)
  {
    this(paramSpnegoTokenGenerator, false);
  }
  
  public NegotiateScheme(SpnegoTokenGenerator paramSpnegoTokenGenerator, boolean paramBoolean)
  {
    super(paramBoolean);
    spengoGenerator = paramSpnegoTokenGenerator;
  }
  
  public Header authenticate(Credentials paramCredentials, HttpRequest paramHttpRequest)
    throws AuthenticationException
  {
    return authenticate(paramCredentials, paramHttpRequest, null);
  }
  
  public Header authenticate(Credentials paramCredentials, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws AuthenticationException
  {
    return super.authenticate(paramCredentials, paramHttpRequest, paramHttpContext);
  }
  
  protected byte[] generateToken(byte[] paramArrayOfByte, String paramString)
    throws GSSException
  {
    Object localObject = new Oid("1.3.6.1.5.5.2");
    int i = 0;
    try
    {
      localObject = generateGSSToken(paramArrayOfByte, (Oid)localObject, paramString);
      paramArrayOfByte = (byte[])localObject;
      if (i != 0)
      {
        log.debug("Using Kerberos MECH 1.2.840.113554.1.2.2");
        paramString = generateGSSToken((byte[])localObject, new Oid("1.2.840.113554.1.2.2"), paramString);
        paramArrayOfByte = paramString;
        if (paramString != null)
        {
          paramArrayOfByte = paramString;
          if (spengoGenerator == null) {}
        }
      }
    }
    catch (GSSException localGSSException)
    {
      for (;;)
      {
        try
        {
          paramArrayOfByte = spengoGenerator.generateSpnegoDERObject(paramString);
          return paramArrayOfByte;
        }
        catch (IOException paramArrayOfByte)
        {
          byte[] arrayOfByte;
          log.error(paramArrayOfByte.getMessage(), paramArrayOfByte);
        }
        localGSSException = localGSSException;
        if (localGSSException.getMajor() == 2)
        {
          log.debug("GSSException BAD_MECH, retry with Kerberos MECH");
          i = 1;
          arrayOfByte = paramArrayOfByte;
        }
        else
        {
          throw arrayOfByte;
        }
      }
    }
    return paramString;
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
