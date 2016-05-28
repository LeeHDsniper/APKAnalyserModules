package org.apache.http.auth.params;

import java.nio.charset.Charset;
import org.apache.http.annotation.Immutable;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;

@Deprecated
@Immutable
public final class AuthParams
{
  private AuthParams() {}
  
  public static String getCredentialCharset(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    String str = (String)paramHttpParams.getParameter("http.auth.credential-charset");
    paramHttpParams = str;
    if (str == null) {
      paramHttpParams = HTTP.DEF_PROTOCOL_CHARSET.name();
    }
    return paramHttpParams;
  }
  
  public static void setCredentialCharset(HttpParams paramHttpParams, String paramString)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setParameter("http.auth.credential-charset", paramString);
  }
}
