package oauth.signpost.commonshttp;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import oauth.signpost.http.HttpRequest;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.RequestLine;
import org.apache.http.client.methods.HttpUriRequest;

public class HttpRequestAdapter
  implements HttpRequest
{
  private HttpEntity entity;
  private HttpUriRequest request;
  
  public HttpRequestAdapter(HttpUriRequest paramHttpUriRequest)
  {
    request = paramHttpUriRequest;
    if ((paramHttpUriRequest instanceof HttpEntityEnclosingRequest)) {
      entity = ((HttpEntityEnclosingRequest)paramHttpUriRequest).getEntity();
    }
  }
  
  public String getContentType()
  {
    if (entity == null) {}
    Header localHeader;
    do
    {
      return null;
      localHeader = entity.getContentType();
    } while (localHeader == null);
    return localHeader.getValue();
  }
  
  public String getHeader(String paramString)
  {
    paramString = request.getFirstHeader(paramString);
    if (paramString == null) {
      return null;
    }
    return paramString.getValue();
  }
  
  public InputStream getMessagePayload()
    throws IOException
  {
    if (entity == null) {
      return null;
    }
    return entity.getContent();
  }
  
  public String getMethod()
  {
    return request.getRequestLine().getMethod();
  }
  
  public String getRequestUrl()
  {
    return request.getURI().toString();
  }
  
  public void setHeader(String paramString1, String paramString2)
  {
    request.setHeader(paramString1, paramString2);
  }
  
  public Object unwrap()
  {
    return request;
  }
}
