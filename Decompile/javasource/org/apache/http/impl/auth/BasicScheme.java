package org.apache.http.impl.auth;

import java.nio.charset.Charset;
import java.security.Principal;
import org.apache.commons.codec.binary.Base64;
import org.apache.http.Consts;
import org.apache.http.Header;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.ChallengeState;
import org.apache.http.auth.Credentials;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.message.BufferedHeader;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;
import org.apache.http.util.EncodingUtils;

@NotThreadSafe
public class BasicScheme
  extends RFC2617Scheme
{
  private final Base64 base64codec = new Base64(0);
  private boolean complete;
  
  public BasicScheme()
  {
    this(Consts.ASCII);
  }
  
  public BasicScheme(Charset paramCharset)
  {
    super(paramCharset);
    complete = false;
  }
  
  @Deprecated
  public BasicScheme(ChallengeState paramChallengeState)
  {
    super(paramChallengeState);
  }
  
  @Deprecated
  public static Header authenticate(Credentials paramCredentials, String paramString, boolean paramBoolean)
  {
    Args.notNull(paramCredentials, "Credentials");
    Args.notNull(paramString, "charset");
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(paramCredentials.getUserPrincipal().getName());
    localStringBuilder.append(":");
    if (paramCredentials.getPassword() == null)
    {
      paramCredentials = "null";
      localStringBuilder.append(paramCredentials);
      paramCredentials = Base64.encodeBase64(EncodingUtils.getBytes(localStringBuilder.toString(), paramString), false);
      paramString = new CharArrayBuffer(32);
      if (!paramBoolean) {
        break label129;
      }
      paramString.append("Proxy-Authorization");
    }
    for (;;)
    {
      paramString.append(": Basic ");
      paramString.append(paramCredentials, 0, paramCredentials.length);
      return new BufferedHeader(paramString);
      paramCredentials = paramCredentials.getPassword();
      break;
      label129:
      paramString.append("Authorization");
    }
  }
  
  @Deprecated
  public Header authenticate(Credentials paramCredentials, HttpRequest paramHttpRequest)
    throws AuthenticationException
  {
    return authenticate(paramCredentials, paramHttpRequest, new BasicHttpContext());
  }
  
  public Header authenticate(Credentials paramCredentials, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws AuthenticationException
  {
    Args.notNull(paramCredentials, "Credentials");
    Args.notNull(paramHttpRequest, "HTTP request");
    paramHttpContext = new StringBuilder();
    paramHttpContext.append(paramCredentials.getUserPrincipal().getName());
    paramHttpContext.append(":");
    if (paramCredentials.getPassword() == null)
    {
      paramCredentials = "null";
      paramHttpContext.append(paramCredentials);
      paramCredentials = base64codec.encode(EncodingUtils.getBytes(paramHttpContext.toString(), getCredentialsCharset(paramHttpRequest)));
      paramHttpRequest = new CharArrayBuffer(32);
      if (!isProxy()) {
        break label139;
      }
      paramHttpRequest.append("Proxy-Authorization");
    }
    for (;;)
    {
      paramHttpRequest.append(": Basic ");
      paramHttpRequest.append(paramCredentials, 0, paramCredentials.length);
      return new BufferedHeader(paramHttpRequest);
      paramCredentials = paramCredentials.getPassword();
      break;
      label139:
      paramHttpRequest.append("Authorization");
    }
  }
  
  public String getSchemeName()
  {
    return "basic";
  }
  
  public boolean isComplete()
  {
    return complete;
  }
  
  public boolean isConnectionBased()
  {
    return false;
  }
  
  public void processChallenge(Header paramHeader)
    throws MalformedChallengeException
  {
    super.processChallenge(paramHeader);
    complete = true;
  }
}
