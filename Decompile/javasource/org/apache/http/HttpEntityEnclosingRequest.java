package org.apache.http;

public abstract interface HttpEntityEnclosingRequest
  extends HttpRequest
{
  public abstract boolean expectContinue();
  
  public abstract HttpEntity getEntity();
  
  public abstract void setEntity(HttpEntity paramHttpEntity);
}
