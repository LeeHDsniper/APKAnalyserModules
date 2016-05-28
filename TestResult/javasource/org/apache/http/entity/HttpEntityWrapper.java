package org.apache.http.entity;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class HttpEntityWrapper
  implements HttpEntity
{
  protected HttpEntity wrappedEntity;
  
  public HttpEntityWrapper(HttpEntity paramHttpEntity)
  {
    wrappedEntity = ((HttpEntity)Args.notNull(paramHttpEntity, "Wrapped entity"));
  }
  
  @Deprecated
  public void consumeContent()
    throws IOException
  {
    wrappedEntity.consumeContent();
  }
  
  public InputStream getContent()
    throws IOException
  {
    return wrappedEntity.getContent();
  }
  
  public Header getContentEncoding()
  {
    return wrappedEntity.getContentEncoding();
  }
  
  public long getContentLength()
  {
    return wrappedEntity.getContentLength();
  }
  
  public Header getContentType()
  {
    return wrappedEntity.getContentType();
  }
  
  public boolean isChunked()
  {
    return wrappedEntity.isChunked();
  }
  
  public boolean isRepeatable()
  {
    return wrappedEntity.isRepeatable();
  }
  
  public boolean isStreaming()
  {
    return wrappedEntity.isStreaming();
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    wrappedEntity.writeTo(paramOutputStream);
  }
}
