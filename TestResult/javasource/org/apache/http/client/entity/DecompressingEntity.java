package org.apache.http.client.entity;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.HttpEntity;
import org.apache.http.entity.HttpEntityWrapper;
import org.apache.http.util.Args;

abstract class DecompressingEntity
  extends HttpEntityWrapper
{
  private static final int BUFFER_SIZE = 2048;
  private InputStream content;
  
  public DecompressingEntity(HttpEntity paramHttpEntity)
  {
    super(paramHttpEntity);
  }
  
  private InputStream getDecompressingStream()
    throws IOException
  {
    InputStream localInputStream1 = wrappedEntity.getContent();
    try
    {
      InputStream localInputStream2 = decorate(localInputStream1);
      return localInputStream2;
    }
    catch (IOException localIOException)
    {
      localInputStream1.close();
      throw localIOException;
    }
  }
  
  abstract InputStream decorate(InputStream paramInputStream)
    throws IOException;
  
  public InputStream getContent()
    throws IOException
  {
    if (wrappedEntity.isStreaming())
    {
      if (content == null) {
        content = getDecompressingStream();
      }
      return content;
    }
    return getDecompressingStream();
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    Args.notNull(paramOutputStream, "Output stream");
    InputStream localInputStream = getContent();
    try
    {
      byte[] arrayOfByte = new byte['ࠀ'];
      for (;;)
      {
        int i = localInputStream.read(arrayOfByte);
        if (i == -1) {
          break;
        }
        paramOutputStream.write(arrayOfByte, 0, i);
      }
    }
    finally
    {
      localInputStream.close();
    }
  }
}
