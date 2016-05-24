package org.apache.http.client.methods;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import org.apache.http.Header;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.NameValuePair;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.message.HeaderGroup;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;

@NotThreadSafe
public class RequestBuilder
{
  private RequestConfig config;
  private HttpEntity entity;
  private HeaderGroup headergroup;
  private String method;
  private LinkedList<NameValuePair> parameters;
  private URI uri;
  private ProtocolVersion version;
  
  RequestBuilder()
  {
    this(null);
  }
  
  RequestBuilder(String paramString)
  {
    method = paramString;
  }
  
  public static RequestBuilder copy(HttpRequest paramHttpRequest)
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    return new RequestBuilder().doCopy(paramHttpRequest);
  }
  
  public static RequestBuilder create(String paramString)
  {
    Args.notBlank(paramString, "HTTP method");
    return new RequestBuilder(paramString);
  }
  
  public static RequestBuilder delete()
  {
    return new RequestBuilder("DELETE");
  }
  
  private RequestBuilder doCopy(HttpRequest paramHttpRequest)
  {
    if (paramHttpRequest == null) {
      return this;
    }
    method = paramHttpRequest.getRequestLine().getMethod();
    version = paramHttpRequest.getRequestLine().getProtocolVersion();
    if ((paramHttpRequest instanceof HttpUriRequest))
    {
      uri = ((HttpUriRequest)paramHttpRequest).getURI();
      if (headergroup == null) {
        headergroup = new HeaderGroup();
      }
      headergroup.clear();
      headergroup.setHeaders(paramHttpRequest.getAllHeaders());
      if (!(paramHttpRequest instanceof HttpEntityEnclosingRequest)) {
        break label162;
      }
      entity = ((HttpEntityEnclosingRequest)paramHttpRequest).getEntity();
      label114:
      if (!(paramHttpRequest instanceof Configurable)) {
        break label170;
      }
    }
    label162:
    label170:
    for (config = ((Configurable)paramHttpRequest).getConfig();; config = null)
    {
      parameters = null;
      return this;
      uri = URI.create(paramHttpRequest.getRequestLine().getMethod());
      break;
      entity = null;
      break label114;
    }
  }
  
  public static RequestBuilder get()
  {
    return new RequestBuilder("GET");
  }
  
  public static RequestBuilder head()
  {
    return new RequestBuilder("HEAD");
  }
  
  public static RequestBuilder options()
  {
    return new RequestBuilder("OPTIONS");
  }
  
  public static RequestBuilder post()
  {
    return new RequestBuilder("POST");
  }
  
  public static RequestBuilder put()
  {
    return new RequestBuilder("PUT");
  }
  
  public static RequestBuilder trace()
  {
    return new RequestBuilder("TRACE");
  }
  
  public RequestBuilder addHeader(String paramString1, String paramString2)
  {
    if (headergroup == null) {
      headergroup = new HeaderGroup();
    }
    headergroup.addHeader(new BasicHeader(paramString1, paramString2));
    return this;
  }
  
  public RequestBuilder addHeader(Header paramHeader)
  {
    if (headergroup == null) {
      headergroup = new HeaderGroup();
    }
    headergroup.addHeader(paramHeader);
    return this;
  }
  
  public RequestBuilder addParameter(String paramString1, String paramString2)
  {
    return addParameter(new BasicNameValuePair(paramString1, paramString2));
  }
  
  public RequestBuilder addParameter(NameValuePair paramNameValuePair)
  {
    Args.notNull(paramNameValuePair, "Name value pair");
    if (parameters == null) {
      parameters = new LinkedList();
    }
    parameters.add(paramNameValuePair);
    return this;
  }
  
  public RequestBuilder addParameters(NameValuePair... paramVarArgs)
  {
    int j = paramVarArgs.length;
    int i = 0;
    while (i < j)
    {
      addParameter(paramVarArgs[i]);
      i += 1;
    }
    return this;
  }
  
  public HttpUriRequest build()
  {
    Object localObject1;
    HttpEntity localHttpEntity;
    Object localObject4;
    Object localObject2;
    if (uri != null)
    {
      localObject1 = uri;
      localHttpEntity = entity;
      localObject4 = localHttpEntity;
      localObject2 = localObject1;
      if (parameters != null)
      {
        localObject4 = localHttpEntity;
        localObject2 = localObject1;
        if (!parameters.isEmpty())
        {
          if ((localHttpEntity != null) || ((!"POST".equalsIgnoreCase(method)) && (!"PUT".equalsIgnoreCase(method)))) {
            break label157;
          }
          localObject4 = new UrlEncodedFormEntity(parameters, HTTP.DEF_CONTENT_CHARSET);
          localObject2 = localObject1;
        }
      }
    }
    for (;;)
    {
      if (localObject4 == null) {
        localObject1 = new InternalRequest(method);
      }
      for (;;)
      {
        ((HttpRequestBase)localObject1).setProtocolVersion(version);
        ((HttpRequestBase)localObject1).setURI((URI)localObject2);
        if (headergroup != null) {
          ((HttpRequestBase)localObject1).setHeaders(headergroup.getAllHeaders());
        }
        ((HttpRequestBase)localObject1).setConfig(config);
        return localObject1;
        localObject1 = URI.create("/");
        break;
        try
        {
          label157:
          localObject2 = new URIBuilder((URI)localObject1).addParameters(parameters).build();
          localObject4 = localHttpEntity;
        }
        catch (URISyntaxException localURISyntaxException)
        {
          localObject4 = localHttpEntity;
          Object localObject3 = localObject1;
        }
        localObject1 = new InternalEntityEclosingRequest(method);
        ((InternalEntityEclosingRequest)localObject1).setEntity((HttpEntity)localObject4);
      }
    }
  }
  
  public RequestConfig getConfig()
  {
    return config;
  }
  
  public HttpEntity getEntity()
  {
    return entity;
  }
  
  public Header getFirstHeader(String paramString)
  {
    if (headergroup != null) {
      return headergroup.getFirstHeader(paramString);
    }
    return null;
  }
  
  public Header[] getHeaders(String paramString)
  {
    if (headergroup != null) {
      return headergroup.getHeaders(paramString);
    }
    return null;
  }
  
  public Header getLastHeader(String paramString)
  {
    if (headergroup != null) {
      return headergroup.getLastHeader(paramString);
    }
    return null;
  }
  
  public String getMethod()
  {
    return method;
  }
  
  public List<NameValuePair> getParameters()
  {
    if (parameters != null) {
      return new ArrayList(parameters);
    }
    return new ArrayList();
  }
  
  public URI getUri()
  {
    return uri;
  }
  
  public ProtocolVersion getVersion()
  {
    return version;
  }
  
  public RequestBuilder removeHeader(Header paramHeader)
  {
    if (headergroup == null) {
      headergroup = new HeaderGroup();
    }
    headergroup.removeHeader(paramHeader);
    return this;
  }
  
  public RequestBuilder removeHeaders(String paramString)
  {
    if ((paramString == null) || (headergroup == null)) {}
    for (;;)
    {
      return this;
      HeaderIterator localHeaderIterator = headergroup.iterator();
      while (localHeaderIterator.hasNext()) {
        if (paramString.equalsIgnoreCase(localHeaderIterator.nextHeader().getName())) {
          localHeaderIterator.remove();
        }
      }
    }
  }
  
  public RequestBuilder setConfig(RequestConfig paramRequestConfig)
  {
    config = paramRequestConfig;
    return this;
  }
  
  public RequestBuilder setEntity(HttpEntity paramHttpEntity)
  {
    entity = paramHttpEntity;
    return this;
  }
  
  public RequestBuilder setHeader(String paramString1, String paramString2)
  {
    if (headergroup == null) {
      headergroup = new HeaderGroup();
    }
    headergroup.updateHeader(new BasicHeader(paramString1, paramString2));
    return this;
  }
  
  public RequestBuilder setHeader(Header paramHeader)
  {
    if (headergroup == null) {
      headergroup = new HeaderGroup();
    }
    headergroup.updateHeader(paramHeader);
    return this;
  }
  
  public RequestBuilder setUri(String paramString)
  {
    if (paramString != null) {}
    for (paramString = URI.create(paramString);; paramString = null)
    {
      uri = paramString;
      return this;
    }
  }
  
  public RequestBuilder setUri(URI paramURI)
  {
    uri = paramURI;
    return this;
  }
  
  public RequestBuilder setVersion(ProtocolVersion paramProtocolVersion)
  {
    version = paramProtocolVersion;
    return this;
  }
  
  static class InternalEntityEclosingRequest
    extends HttpEntityEnclosingRequestBase
  {
    private final String method;
    
    InternalEntityEclosingRequest(String paramString)
    {
      method = paramString;
    }
    
    public String getMethod()
    {
      return method;
    }
  }
  
  static class InternalRequest
    extends HttpRequestBase
  {
    private final String method;
    
    InternalRequest(String paramString)
    {
      method = paramString;
    }
    
    public String getMethod()
    {
      return method;
    }
  }
}
