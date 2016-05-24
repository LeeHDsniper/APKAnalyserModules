package org.apache.http.entity;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.util.Args;

public class EntityTemplate
  extends AbstractHttpEntity
{
  private final ContentProducer contentproducer;
  
  public EntityTemplate(ContentProducer paramContentProducer)
  {
    contentproducer = ((ContentProducer)Args.notNull(paramContentProducer, "Content producer"));
  }
  
  public InputStream getContent()
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    writeTo(localByteArrayOutputStream);
    return new ByteArrayInputStream(localByteArrayOutputStream.toByteArray());
  }
  
  public long getContentLength()
  {
    return -1L;
  }
  
  public boolean isRepeatable()
  {
    return true;
  }
  
  public boolean isStreaming()
  {
    return false;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    Args.notNull(paramOutputStream, "Output stream");
    contentproducer.writeTo(paramOutputStream);
  }
}
