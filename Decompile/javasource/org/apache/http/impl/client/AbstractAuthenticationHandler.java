package org.apache.http.impl.client;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.FormattedHeader;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthSchemeRegistry;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.client.AuthenticationHandler;
import org.apache.http.protocol.HTTP;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Asserts;
import org.apache.http.util.CharArrayBuffer;

@Deprecated
@Immutable
public abstract class AbstractAuthenticationHandler
  implements AuthenticationHandler
{
  private static final List<String> DEFAULT_SCHEME_PRIORITY = Collections.unmodifiableList(Arrays.asList(new String[] { "negotiate", "NTLM", "Digest", "Basic" }));
  private final Log log = LogFactory.getLog(getClass());
  
  public AbstractAuthenticationHandler() {}
  
  protected List<String> getAuthPreferences()
  {
    return DEFAULT_SCHEME_PRIORITY;
  }
  
  protected List<String> getAuthPreferences(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
  {
    return getAuthPreferences();
  }
  
  protected Map<String, Header> parseChallenges(Header[] paramArrayOfHeader)
    throws MalformedChallengeException
  {
    HashMap localHashMap = new HashMap(paramArrayOfHeader.length);
    int m = paramArrayOfHeader.length;
    int k = 0;
    while (k < m)
    {
      Header localHeader = paramArrayOfHeader[k];
      CharArrayBuffer localCharArrayBuffer;
      int i;
      if ((localHeader instanceof FormattedHeader))
      {
        localCharArrayBuffer = ((FormattedHeader)localHeader).getBuffer();
        i = ((FormattedHeader)localHeader).getValuePos();
      }
      while ((i < localCharArrayBuffer.length()) && (HTTP.isWhitespace(localCharArrayBuffer.charAt(i))))
      {
        i += 1;
        continue;
        String str = localHeader.getValue();
        if (str == null) {
          throw new MalformedChallengeException("Header value is null");
        }
        localCharArrayBuffer = new CharArrayBuffer(str.length());
        localCharArrayBuffer.append(str);
        i = 0;
      }
      int j = i;
      while ((j < localCharArrayBuffer.length()) && (!HTTP.isWhitespace(localCharArrayBuffer.charAt(j)))) {
        j += 1;
      }
      localHashMap.put(localCharArrayBuffer.substring(i, j).toLowerCase(Locale.US), localHeader);
      k += 1;
    }
    return localHashMap;
  }
  
  public AuthScheme selectScheme(Map<String, Header> paramMap, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws AuthenticationException
  {
    AuthSchemeRegistry localAuthSchemeRegistry = (AuthSchemeRegistry)paramHttpContext.getAttribute("http.authscheme-registry");
    Asserts.notNull(localAuthSchemeRegistry, "AuthScheme registry");
    List localList = getAuthPreferences(paramHttpResponse, paramHttpContext);
    paramHttpContext = localList;
    if (localList == null) {
      paramHttpContext = DEFAULT_SCHEME_PRIORITY;
    }
    if (log.isDebugEnabled()) {
      log.debug("Authentication schemes in the order of preference: " + paramHttpContext);
    }
    localList = null;
    Iterator localIterator = paramHttpContext.iterator();
    for (;;)
    {
      paramHttpContext = localList;
      String str;
      if (localIterator.hasNext())
      {
        str = (String)localIterator.next();
        if ((Header)paramMap.get(str.toLowerCase(Locale.ENGLISH)) == null) {
          break label272;
        }
        if (log.isDebugEnabled()) {
          log.debug(str + " authentication scheme selected");
        }
      }
      try
      {
        paramHttpContext = localAuthSchemeRegistry.getAuthScheme(str, paramHttpResponse.getParams());
        if (paramHttpContext != null) {
          break;
        }
        throw new AuthenticationException("Unable to respond to any of these challenges: " + paramMap);
      }
      catch (IllegalStateException paramHttpContext) {}
      if (log.isWarnEnabled())
      {
        log.warn("Authentication scheme " + str + " not supported");
        continue;
        label272:
        if (log.isDebugEnabled()) {
          log.debug("Challenge for " + str + " authentication scheme not available");
        }
      }
    }
    return paramHttpContext;
  }
}
