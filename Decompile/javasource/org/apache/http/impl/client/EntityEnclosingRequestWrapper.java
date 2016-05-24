package org.apache.http.impl.client;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.ProtocolException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.entity.HttpEntityWrapper;

@Deprecated
@NotThreadSafe
public class EntityEnclosingRequestWrapper
  extends RequestWrapper
  implements HttpEntityEnclosingRequest
{
  private boolean consumed;
  private HttpEntity entity;
  
  public EntityEnclosingRequestWrapper(HttpEntityEnclosingRequest paramHttpEntityEnclosingRequest)
    throws ProtocolException
  {
    super(paramHttpEntityEnclosingRequest);
    setEntity(paramHttpEntityEnclosingRequest.getEntity());
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
  
  public boolean isRepeatable()
  {
    return (entity == null) || (entity.isRepeatable()) || (!consumed);
  }
  
  public void setEntity(HttpEntity paramHttpEntity)
  {
    if (paramHttpEntity != null) {}
    for (paramHttpEntity = new EntityWrapper(paramHttpEntity);; paramHttpEntity = null)
    {
      entity = paramHttpEntity;
      consumed = false;
      return;
    }
  }
  
  class EntityWrapper
    extends HttpEntityWrapper
  {
    EntityWrapper(HttpEntity paramHttpEntity)
    {
      super();
    }
    
    public void consumeContent()
      throws IOException
    {
      EntityEnclosingRequestWrapper.access$002(EntityEnclosingRequestWrapper.this, true);
      super.consumeContent();
    }
    
    public InputStream getContent()
      throws IOException
    {
      EntityEnclosingRequestWrapper.access$002(EntityEnclosingRequestWrapper.this, true);
      return super.getContent();
    }
    
    public void writeTo(OutputStream paramOutputStream)
      throws IOException
    {
      EntityEnclosingRequestWrapper.access$002(EntityEnclosingRequestWrapper.this, true);
      super.writeTo(paramOutputStream);
    }
  }
}
