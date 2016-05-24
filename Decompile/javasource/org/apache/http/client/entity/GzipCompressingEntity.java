package org.apache.http.client.entity;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.GZIPOutputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.entity.HttpEntityWrapper;
import org.apache.http.message.BasicHeader;
import org.apache.http.util.Args;

public class GzipCompressingEntity
  extends HttpEntityWrapper
{
  private static final String GZIP_CODEC = "gzip";
  
  public GzipCompressingEntity(HttpEntity paramHttpEntity)
  {
    super(paramHttpEntity);
  }
  
  public InputStream getContent()
    throws IOException
  {
    throw new UnsupportedOperationException();
  }
  
  public Header getContentEncoding()
  {
    return new BasicHeader("Content-Encoding", "gzip");
  }
  
  public long getContentLength()
  {
    return -1L;
  }
  
  public boolean isChunked()
  {
    return true;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    Args.notNull(paramOutputStream, "Output stream");
    paramOutputStream = new GZIPOutputStream(paramOutputStream);
    try
    {
      wrappedEntity.writeTo(paramOutputStream);
      return;
    }
    finally
    {
      paramOutputStream.close();
    }
  }
}
