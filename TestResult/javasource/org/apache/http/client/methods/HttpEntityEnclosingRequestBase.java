package org.apache.http.client.methods;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.utils.CloneUtils;

@NotThreadSafe
public abstract class HttpEntityEnclosingRequestBase
  extends HttpRequestBase
  implements HttpEntityEnclosingRequest
{
  private HttpEntity entity;
  
  public HttpEntityEnclosingRequestBase() {}
  
  public Object clone()
    throws CloneNotSupportedException
  {
    HttpEntityEnclosingRequestBase localHttpEntityEnclosingRequestBase = (HttpEntityEnclosingRequestBase)super.clone();
    if (entity != null) {
      entity = ((HttpEntity)CloneUtils.cloneObject(entity));
    }
    return localHttpEntityEnclosingRequestBase;
  }
  
  public boolean expectContinue()
  {
    Header localHeader = getFirstHeader("Expect");
    return (localHeader != null) && ("100-continue".equalsIgnoreCase(localHeader.getValue()));
  }
  
  public HttpEntity getEntity()
  {
    return entity;
  }
  
  public void setEntity(HttpEntity paramHttpEntity)
  {
    entity = paramHttpEntity;
  }
}
