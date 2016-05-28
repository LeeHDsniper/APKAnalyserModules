package org.apache.http.impl.client;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Locale;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolException;
import org.apache.http.RequestLine;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.CircularRedirectException;
import org.apache.http.client.RedirectStrategy;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;
import org.apache.http.util.TextUtils;

@Immutable
public class DefaultRedirectStrategy
  implements RedirectStrategy
{
  public static final DefaultRedirectStrategy INSTANCE = new DefaultRedirectStrategy();
  @Deprecated
  public static final String REDIRECT_LOCATIONS = "http.protocol.redirect-locations";
  private static final String[] REDIRECT_METHODS = { "GET", "HEAD" };
  private final Log log = LogFactory.getLog(getClass());
  
  public DefaultRedirectStrategy() {}
  
  protected URI createLocationURI(String paramString)
    throws ProtocolException
  {
    try
    {
      Object localObject = new URIBuilder(new URI(paramString).normalize());
      String str = ((URIBuilder)localObject).getHost();
      if (str != null) {
        ((URIBuilder)localObject).setHost(str.toLowerCase(Locale.US));
      }
      if (TextUtils.isEmpty(((URIBuilder)localObject).getPath())) {
        ((URIBuilder)localObject).setPath("/");
      }
      localObject = ((URIBuilder)localObject).build();
      return localObject;
    }
    catch (URISyntaxException localURISyntaxException)
    {
      throw new ProtocolException("Invalid redirect URI: " + paramString, localURISyntaxException);
    }
  }
  
  public URI getLocationURI(HttpRequest paramHttpRequest, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws ProtocolException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    Args.notNull(paramHttpResponse, "HTTP response");
    Args.notNull(paramHttpContext, "HTTP context");
    HttpClientContext localHttpClientContext = HttpClientContext.adapt(paramHttpContext);
    Object localObject = paramHttpResponse.getFirstHeader("location");
    if (localObject == null) {
      throw new ProtocolException("Received redirect response " + paramHttpResponse.getStatusLine() + " but no location header");
    }
    paramHttpResponse = ((Header)localObject).getValue();
    if (log.isDebugEnabled()) {
      log.debug("Redirect requested to location '" + paramHttpResponse + "'");
    }
    RequestConfig localRequestConfig = localHttpClientContext.getRequestConfig();
    localObject = createLocationURI(paramHttpResponse);
    paramHttpResponse = (HttpResponse)localObject;
    try
    {
      if (((URI)localObject).isAbsolute()) {
        break label253;
      }
      if (!localRequestConfig.isRelativeRedirectsAllowed()) {
        throw new ProtocolException("Relative redirect location '" + localObject + "' not allowed");
      }
    }
    catch (URISyntaxException paramHttpRequest)
    {
      throw new ProtocolException(paramHttpRequest.getMessage(), paramHttpRequest);
    }
    paramHttpResponse = localHttpClientContext.getTargetHost();
    Asserts.notNull(paramHttpResponse, "Target host");
    paramHttpResponse = URIUtils.resolve(URIUtils.rewriteURI(new URI(paramHttpRequest.getRequestLine().getUri()), paramHttpResponse, false), (URI)localObject);
    label253:
    localObject = (RedirectLocations)localHttpClientContext.getAttribute("http.protocol.redirect-locations");
    paramHttpRequest = (HttpRequest)localObject;
    if (localObject == null)
    {
      paramHttpRequest = new RedirectLocations();
      paramHttpContext.setAttribute("http.protocol.redirect-locations", paramHttpRequest);
    }
    if ((!localRequestConfig.isCircularRedirectsAllowed()) && (paramHttpRequest.contains(paramHttpResponse))) {
      throw new CircularRedirectException("Circular redirect to '" + paramHttpResponse + "'");
    }
    paramHttpRequest.add(paramHttpResponse);
    return paramHttpResponse;
  }
  
  public HttpUriRequest getRedirect(HttpRequest paramHttpRequest, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws ProtocolException
  {
    paramHttpContext = getLocationURI(paramHttpRequest, paramHttpResponse, paramHttpContext);
    String str = paramHttpRequest.getRequestLine().getMethod();
    if (str.equalsIgnoreCase("HEAD")) {
      return new HttpHead(paramHttpContext);
    }
    if (str.equalsIgnoreCase("GET")) {
      return new HttpGet(paramHttpContext);
    }
    if (paramHttpResponse.getStatusLine().getStatusCode() == 307) {
      return RequestBuilder.copy(paramHttpRequest).setUri(paramHttpContext).build();
    }
    return new HttpGet(paramHttpContext);
  }
  
  protected boolean isRedirectable(String paramString)
  {
    String[] arrayOfString = REDIRECT_METHODS;
    int j = arrayOfString.length;
    int i = 0;
    while (i < j)
    {
      if (arrayOfString[i].equalsIgnoreCase(paramString)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  public boolean isRedirected(HttpRequest paramHttpRequest, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws ProtocolException
  {
    boolean bool2 = true;
    Args.notNull(paramHttpRequest, "HTTP request");
    Args.notNull(paramHttpResponse, "HTTP response");
    int i = paramHttpResponse.getStatusLine().getStatusCode();
    paramHttpRequest = paramHttpRequest.getRequestLine().getMethod();
    paramHttpResponse = paramHttpResponse.getFirstHeader("location");
    boolean bool1 = bool2;
    switch (i)
    {
    case 304: 
    case 305: 
    case 306: 
    default: 
      bool1 = false;
    case 303: 
    case 302: 
      do
      {
        return bool1;
        if (!isRedirectable(paramHttpRequest)) {
          break;
        }
        bool1 = bool2;
      } while (paramHttpResponse != null);
      return false;
    }
    return isRedirectable(paramHttpRequest);
  }
}
