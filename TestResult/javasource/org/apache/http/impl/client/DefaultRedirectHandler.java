package org.apache.http.impl.client;

import java.net.URI;
import java.net.URISyntaxException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolException;
import org.apache.http.RequestLine;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.CircularRedirectException;
import org.apache.http.client.RedirectHandler;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
@Immutable
public class DefaultRedirectHandler
  implements RedirectHandler
{
  private static final String REDIRECT_LOCATIONS = "http.protocol.redirect-locations";
  private final Log log = LogFactory.getLog(getClass());
  
  public DefaultRedirectHandler() {}
  
  public URI getLocationURI(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws ProtocolException
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    Object localObject1 = paramHttpResponse.getFirstHeader("location");
    if (localObject1 == null) {
      throw new ProtocolException("Received redirect response " + paramHttpResponse.getStatusLine() + " but no location header");
    }
    Object localObject2 = ((Header)localObject1).getValue();
    if (log.isDebugEnabled()) {
      log.debug("Redirect requested to location '" + (String)localObject2 + "'");
    }
    try
    {
      localObject1 = new URI((String)localObject2);
      localObject2 = paramHttpResponse.getParams();
      paramHttpResponse = (HttpResponse)localObject1;
      if (((URI)localObject1).isAbsolute()) {
        break label272;
      }
      if (((HttpParams)localObject2).isParameterTrue("http.protocol.reject-relative-redirect")) {
        throw new ProtocolException("Relative redirect location '" + localObject1 + "' not allowed");
      }
    }
    catch (URISyntaxException paramHttpResponse)
    {
      throw new ProtocolException("Invalid redirect URI: " + (String)localObject2, paramHttpResponse);
    }
    paramHttpResponse = (HttpHost)paramHttpContext.getAttribute("http.target_host");
    Asserts.notNull(paramHttpResponse, "Target host");
    HttpRequest localHttpRequest = (HttpRequest)paramHttpContext.getAttribute("http.request");
    for (;;)
    {
      try
      {
        paramHttpResponse = URIUtils.resolve(URIUtils.rewriteURI(new URI(localHttpRequest.getRequestLine().getUri()), paramHttpResponse, true), (URI)localObject1);
        label272:
        if (!((HttpParams)localObject2).isParameterFalse("http.protocol.allow-circular-redirects")) {
          return paramHttpResponse;
        }
        localObject2 = (RedirectLocations)paramHttpContext.getAttribute("http.protocol.redirect-locations");
        localObject1 = localObject2;
        if (localObject2 == null)
        {
          localObject1 = new RedirectLocations();
          paramHttpContext.setAttribute("http.protocol.redirect-locations", localObject1);
        }
        if (paramHttpResponse.getFragment() != null) {}
        paramHttpContext = paramHttpResponse;
      }
      catch (URISyntaxException paramHttpResponse)
      {
        try
        {
          paramHttpContext = URIUtils.rewriteURI(paramHttpResponse, new HttpHost(paramHttpResponse.getHost(), paramHttpResponse.getPort(), paramHttpResponse.getScheme()), true);
          if (!((RedirectLocations)localObject1).contains(paramHttpContext)) {
            break;
          }
          throw new CircularRedirectException("Circular redirect to '" + paramHttpContext + "'");
        }
        catch (URISyntaxException paramHttpResponse)
        {
          throw new ProtocolException(paramHttpResponse.getMessage(), paramHttpResponse);
        }
        paramHttpResponse = paramHttpResponse;
        throw new ProtocolException(paramHttpResponse.getMessage(), paramHttpResponse);
      }
    }
    ((RedirectLocations)localObject1).add(paramHttpContext);
    return paramHttpResponse;
  }
  
  public boolean isRedirectRequested(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    switch (paramHttpResponse.getStatusLine().getStatusCode())
    {
    case 304: 
    case 305: 
    case 306: 
    default: 
    case 301: 
    case 302: 
    case 307: 
      do
      {
        return false;
        paramHttpResponse = ((HttpRequest)paramHttpContext.getAttribute("http.request")).getRequestLine().getMethod();
      } while ((!paramHttpResponse.equalsIgnoreCase("GET")) && (!paramHttpResponse.equalsIgnoreCase("HEAD")));
      return true;
    }
    return true;
  }
}
