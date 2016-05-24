package org.apache.http.client.protocol;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpException;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.CookieStore;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.CookieSpec;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
public class ResponseProcessCookies
  implements HttpResponseInterceptor
{
  private final Log log = LogFactory.getLog(getClass());
  
  public ResponseProcessCookies() {}
  
  private void processCookies(HeaderIterator paramHeaderIterator, CookieSpec paramCookieSpec, CookieOrigin paramCookieOrigin, CookieStore paramCookieStore)
  {
    while (paramHeaderIterator.hasNext())
    {
      Header localHeader = paramHeaderIterator.nextHeader();
      try
      {
        Iterator localIterator = paramCookieSpec.parse(localHeader, paramCookieOrigin).iterator();
        while (localIterator.hasNext())
        {
          Cookie localCookie = (Cookie)localIterator.next();
          try
          {
            paramCookieSpec.validate(localCookie, paramCookieOrigin);
            paramCookieStore.addCookie(localCookie);
            if (!log.isDebugEnabled()) {
              continue;
            }
            log.debug("Cookie accepted: \"" + localCookie + "\". ");
          }
          catch (MalformedCookieException localMalformedCookieException2) {}
          if (log.isWarnEnabled()) {
            log.warn("Cookie rejected: \"" + localCookie + "\". " + localMalformedCookieException2.getMessage());
          }
        }
        if (!log.isWarnEnabled()) {
          continue;
        }
      }
      catch (MalformedCookieException localMalformedCookieException1) {}
      log.warn("Invalid cookie header: \"" + localHeader + "\". " + localMalformedCookieException1.getMessage());
    }
  }
  
  public void process(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpResponse, "HTTP request");
    Args.notNull(paramHttpContext, "HTTP context");
    Object localObject = HttpClientContext.adapt(paramHttpContext);
    paramHttpContext = ((HttpClientContext)localObject).getCookieSpec();
    if (paramHttpContext == null) {
      log.debug("Cookie spec not specified in HTTP context");
    }
    CookieStore localCookieStore;
    do
    {
      return;
      localCookieStore = ((HttpClientContext)localObject).getCookieStore();
      if (localCookieStore == null)
      {
        log.debug("Cookie store not specified in HTTP context");
        return;
      }
      localObject = ((HttpClientContext)localObject).getCookieOrigin();
      if (localObject == null)
      {
        log.debug("Cookie origin not specified in HTTP context");
        return;
      }
      processCookies(paramHttpResponse.headerIterator("Set-Cookie"), paramHttpContext, (CookieOrigin)localObject, localCookieStore);
    } while (paramHttpContext.getVersion() <= 0);
    processCookies(paramHttpResponse.headerIterator("Set-Cookie2"), paramHttpContext, (CookieOrigin)localObject, localCookieStore);
  }
}
