package org.apache.http.client.methods;

import java.net.URI;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.message.BasicRequestLine;
import org.apache.http.params.HttpProtocolParams;

@NotThreadSafe
public abstract class HttpRequestBase
  extends AbstractExecutionAwareRequest
  implements Configurable, HttpUriRequest
{
  private RequestConfig config;
  private URI uri;
  private ProtocolVersion version;
  
  public HttpRequestBase() {}
  
  public RequestConfig getConfig()
  {
    return config;
  }
  
  public abstract String getMethod();
  
  public ProtocolVersion getProtocolVersion()
  {
    if (version != null) {
      return version;
    }
    return HttpProtocolParams.getVersion(getParams());
  }
  
  public RequestLine getRequestLine()
  {
    String str2 = getMethod();
    ProtocolVersion localProtocolVersion = getProtocolVersion();
    Object localObject = getURI();
    String str1 = null;
    if (localObject != null) {
      str1 = ((URI)localObject).toASCIIString();
    }
    if (str1 != null)
    {
      localObject = str1;
      if (str1.length() != 0) {}
    }
    else
    {
      localObject = "/";
    }
    return new BasicRequestLine(str2, (String)localObject, localProtocolVersion);
  }
  
  public URI getURI()
  {
    return uri;
  }
  
  public void releaseConnection()
  {
    reset();
  }
  
  public void setConfig(RequestConfig paramRequestConfig)
  {
    config = paramRequestConfig;
  }
  
  public void setProtocolVersion(ProtocolVersion paramProtocolVersion)
  {
    version = paramProtocolVersion;
  }
  
  public void setURI(URI paramURI)
  {
    uri = paramURI;
  }
  
  public void started() {}
  
  public String toString()
  {
    return getMethod() + " " + getURI() + " " + getProtocolVersion();
  }
}
