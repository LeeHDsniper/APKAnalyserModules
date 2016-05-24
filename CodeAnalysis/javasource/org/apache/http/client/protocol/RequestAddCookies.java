package org.apache.http.client.protocol;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.RequestLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.config.Lookup;
import org.apache.http.conn.routing.RouteInfo;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.CookieSpec;
import org.apache.http.cookie.CookieSpecProvider;
import org.apache.http.cookie.SetCookie2;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.TextUtils;

@Immutable
public class RequestAddCookies
  implements HttpRequestInterceptor
{
  private final Log log = LogFactory.getLog(getClass());
  
  public RequestAddCookies() {}
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    Args.notNull(paramHttpContext, "HTTP context");
    if (paramHttpRequest.getRequestLine().getMethod().equalsIgnoreCase("CONNECT")) {
      return;
    }
    Object localObject5 = HttpClientContext.adapt(paramHttpContext);
    Object localObject4 = ((HttpClientContext)localObject5).getCookieStore();
    if (localObject4 == null)
    {
      log.debug("Cookie store not specified in HTTP context");
      return;
    }
    Object localObject6 = ((HttpClientContext)localObject5).getCookieSpecRegistry();
    if (localObject6 == null)
    {
      log.debug("CookieSpec registry not specified in HTTP context");
      return;
    }
    HttpHost localHttpHost = ((HttpClientContext)localObject5).getTargetHost();
    if (localHttpHost == null)
    {
      log.debug("Target host not set in the context");
      return;
    }
    RouteInfo localRouteInfo = ((HttpClientContext)localObject5).getHttpRoute();
    if (localRouteInfo == null)
    {
      log.debug("Connection route not set in the context");
      return;
    }
    Object localObject1 = ((HttpClientContext)localObject5).getRequestConfig().getCookieSpec();
    Object localObject2 = localObject1;
    if (localObject1 == null) {
      localObject2 = "best-match";
    }
    if (log.isDebugEnabled()) {
      log.debug("CookieSpec selected: " + (String)localObject2);
    }
    localObject1 = null;
    if ((paramHttpRequest instanceof HttpUriRequest)) {
      localObject1 = ((HttpUriRequest)paramHttpRequest).getURI();
    }
    for (;;)
    {
      label233:
      int i;
      if (localObject1 != null)
      {
        localObject1 = ((URI)localObject1).getPath();
        localObject3 = localHttpHost.getHostName();
        j = localHttpHost.getPort();
        i = j;
        if (j < 0) {
          i = localRouteInfo.getTargetHost().getPort();
        }
        if (i < 0) {
          break label379;
        }
        label270:
        if (TextUtils.isEmpty((CharSequence)localObject1)) {
          break label384;
        }
      }
      for (;;)
      {
        localObject1 = new CookieOrigin((String)localObject3, i, (String)localObject1, localRouteInfo.isSecure());
        localObject3 = (CookieSpecProvider)((Lookup)localObject6).lookup((String)localObject2);
        if (localObject3 != null) {
          break label391;
        }
        throw new HttpException("Unsupported cookie policy: " + (String)localObject2);
        label379:
        label384:
        try
        {
          localObject3 = new URI(paramHttpRequest.getRequestLine().getUri());
          localObject1 = localObject3;
        }
        catch (URISyntaxException localURISyntaxException) {}
        localObject1 = null;
        break label233;
        i = 0;
        break label270;
        localObject1 = "/";
      }
      label391:
      localObject2 = ((CookieSpecProvider)localObject3).create((HttpContext)localObject5);
      localObject5 = new ArrayList(((CookieStore)localObject4).getCookies());
      Object localObject3 = new ArrayList();
      localObject4 = new Date();
      localObject5 = ((List)localObject5).iterator();
      while (((Iterator)localObject5).hasNext())
      {
        localObject6 = (Cookie)((Iterator)localObject5).next();
        if (!((Cookie)localObject6).isExpired((Date)localObject4))
        {
          if (((CookieSpec)localObject2).match((Cookie)localObject6, (CookieOrigin)localObject1))
          {
            if (log.isDebugEnabled()) {
              log.debug("Cookie " + localObject6 + " match " + localObject1);
            }
            ((List)localObject3).add(localObject6);
          }
        }
        else if (log.isDebugEnabled()) {
          log.debug("Cookie " + localObject6 + " expired");
        }
      }
      if (!((List)localObject3).isEmpty())
      {
        localObject4 = ((CookieSpec)localObject2).formatCookies((List)localObject3).iterator();
        while (((Iterator)localObject4).hasNext()) {
          paramHttpRequest.addHeader((Header)((Iterator)localObject4).next());
        }
      }
      int j = ((CookieSpec)localObject2).getVersion();
      if (j > 0)
      {
        i = 0;
        localObject3 = ((List)localObject3).iterator();
        while (((Iterator)localObject3).hasNext())
        {
          localObject4 = (Cookie)((Iterator)localObject3).next();
          if ((j != ((Cookie)localObject4).getVersion()) || (!(localObject4 instanceof SetCookie2))) {
            i = 1;
          }
        }
        if (i != 0)
        {
          localObject3 = ((CookieSpec)localObject2).getVersionHeader();
          if (localObject3 != null) {
            paramHttpRequest.addHeader((Header)localObject3);
          }
        }
      }
      paramHttpContext.setAttribute("http.cookie-spec", localObject2);
      paramHttpContext.setAttribute("http.cookie-origin", localObject1);
      return;
    }
  }
}
