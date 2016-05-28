package org.apache.http.impl.auth;

import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.apache.http.Consts;
import org.apache.http.HeaderElement;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.auth.ChallengeState;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.message.BasicHeaderValueParser;
import org.apache.http.message.HeaderValueParser;
import org.apache.http.message.ParserCursor;
import org.apache.http.params.HttpParams;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public abstract class RFC2617Scheme
  extends AuthSchemeBase
{
  private final Charset credentialsCharset;
  private final Map<String, String> params = new HashMap();
  
  public RFC2617Scheme()
  {
    this(Consts.ASCII);
  }
  
  public RFC2617Scheme(Charset paramCharset)
  {
    if (paramCharset != null) {}
    for (;;)
    {
      credentialsCharset = paramCharset;
      return;
      paramCharset = Consts.ASCII;
    }
  }
  
  @Deprecated
  public RFC2617Scheme(ChallengeState paramChallengeState)
  {
    super(paramChallengeState);
    credentialsCharset = Consts.ASCII;
  }
  
  String getCredentialsCharset(HttpRequest paramHttpRequest)
  {
    String str = (String)paramHttpRequest.getParams().getParameter("http.auth.credential-charset");
    paramHttpRequest = str;
    if (str == null) {
      paramHttpRequest = getCredentialsCharset().name();
    }
    return paramHttpRequest;
  }
  
  public Charset getCredentialsCharset()
  {
    return credentialsCharset;
  }
  
  public String getParameter(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    return (String)params.get(paramString.toLowerCase(Locale.ENGLISH));
  }
  
  protected Map<String, String> getParameters()
  {
    return params;
  }
  
  public String getRealm()
  {
    return getParameter("realm");
  }
  
  protected void parseChallenge(CharArrayBuffer paramCharArrayBuffer, int paramInt1, int paramInt2)
    throws MalformedChallengeException
  {
    paramCharArrayBuffer = BasicHeaderValueParser.INSTANCE.parseElements(paramCharArrayBuffer, new ParserCursor(paramInt1, paramCharArrayBuffer.length()));
    if (paramCharArrayBuffer.length == 0) {
      throw new MalformedChallengeException("Authentication challenge is empty");
    }
    params.clear();
    paramInt2 = paramCharArrayBuffer.length;
    paramInt1 = 0;
    while (paramInt1 < paramInt2)
    {
      Object localObject = paramCharArrayBuffer[paramInt1];
      params.put(localObject.getName(), localObject.getValue());
      paramInt1 += 1;
    }
  }
}
