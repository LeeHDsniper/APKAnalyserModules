package org.apache.http.client.entity;

import java.io.IOException;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;

public class GzipDecompressingEntity
  extends DecompressingEntity
{
  public GzipDecompressingEntity(HttpEntity paramHttpEntity)
  {
    super(paramHttpEntity);
  }
  
  InputStream decorate(InputStream paramInputStream)
    throws IOException
  {
    return new GZIPInputStream(paramInputStream);
  }
  
  public Header getContentEncoding()
  {
    return null;
  }
  
  public long getContentLength()
  {
    return -1L;
  }
}
