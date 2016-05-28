package org.apache.http.impl.auth;

import java.util.Locale;
import org.apache.http.FormattedHeader;
import org.apache.http.Header;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.ChallengeState;
import org.apache.http.auth.ContextAwareAuthScheme;
import org.apache.http.auth.Credentials;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.protocol.HTTP;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public abstract class AuthSchemeBase
  implements ContextAwareAuthScheme
{
  private ChallengeState challengeState;
  
  public AuthSchemeBase() {}
  
  @Deprecated
  public AuthSchemeBase(ChallengeState paramChallengeState)
  {
    challengeState = paramChallengeState;
  }
  
  public Header authenticate(Credentials paramCredentials, HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws AuthenticationException
  {
    return authenticate(paramCredentials, paramHttpRequest);
  }
  
  public ChallengeState getChallengeState()
  {
    return challengeState;
  }
  
  public boolean isProxy()
  {
    return (challengeState != null) && (challengeState == ChallengeState.PROXY);
  }
  
  protected abstract void parseChallenge(CharArrayBuffer paramCharArrayBuffer, int paramInt1, int paramInt2)
    throws MalformedChallengeException;
  
  public void processChallenge(Header paramHeader)
    throws MalformedChallengeException
  {
    Args.notNull(paramHeader, "Header");
    Object localObject = paramHeader.getName();
    int i;
    if (((String)localObject).equalsIgnoreCase("WWW-Authenticate"))
    {
      challengeState = ChallengeState.TARGET;
      if (!(paramHeader instanceof FormattedHeader)) {
        break label137;
      }
      localObject = ((FormattedHeader)paramHeader).getBuffer();
      i = ((FormattedHeader)paramHeader).getValuePos();
      paramHeader = (Header)localObject;
    }
    for (;;)
    {
      if ((i >= paramHeader.length()) || (!HTTP.isWhitespace(paramHeader.charAt(i)))) {
        break label184;
      }
      i += 1;
      continue;
      if (((String)localObject).equalsIgnoreCase("Proxy-Authenticate"))
      {
        challengeState = ChallengeState.PROXY;
        break;
      }
      throw new MalformedChallengeException("Unexpected header name: " + (String)localObject);
      label137:
      localObject = paramHeader.getValue();
      if (localObject == null) {
        throw new MalformedChallengeException("Header value is null");
      }
      paramHeader = new CharArrayBuffer(((String)localObject).length());
      paramHeader.append((String)localObject);
      i = 0;
    }
    label184:
    int j = i;
    while ((j < paramHeader.length()) && (!HTTP.isWhitespace(paramHeader.charAt(j)))) {
      j += 1;
    }
    localObject = paramHeader.substring(i, j);
    if (!((String)localObject).equalsIgnoreCase(getSchemeName())) {
      throw new MalformedChallengeException("Invalid scheme identifier: " + (String)localObject);
    }
    parseChallenge(paramHeader, j, paramHeader.length());
  }
  
  public String toString()
  {
    String str = getSchemeName();
    if (str != null) {
      return str.toUpperCase(Locale.US);
    }
    return super.toString();
  }
}
