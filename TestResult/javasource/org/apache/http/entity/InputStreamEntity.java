package org.apache.http.entity;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class InputStreamEntity
  extends AbstractHttpEntity
{
  private final InputStream content;
  private final long length;
  
  public InputStreamEntity(InputStream paramInputStream)
  {
    this(paramInputStream, -1L);
  }
  
  public InputStreamEntity(InputStream paramInputStream, long paramLong)
  {
    this(paramInputStream, paramLong, null);
  }
  
  public InputStreamEntity(InputStream paramInputStream, long paramLong, ContentType paramContentType)
  {
    content = ((InputStream)Args.notNull(paramInputStream, "Source input stream"));
    length = paramLong;
    if (paramContentType != null) {
      setContentType(paramContentType.toString());
    }
  }
  
  public InputStreamEntity(InputStream paramInputStream, ContentType paramContentType)
  {
    this(paramInputStream, -1L, paramContentType);
  }
  
  public InputStream getContent()
    throws IOException
  {
    return content;
  }
  
  public long getContentLength()
  {
    return length;
  }
  
  public boolean isRepeatable()
  {
    return false;
  }
  
  public boolean isStreaming()
  {
    return true;
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    Args.notNull(paramOutputStream, "Output stream");
    InputStream localInputStream = content;
    byte[] arrayOfByte;
    int i;
    try
    {
      arrayOfByte = new byte['က'];
      if (length < 0L) {
        for (;;)
        {
          i = localInputStream.read(arrayOfByte);
          if (i == -1) {
            break;
          }
          paramOutputStream.write(arrayOfByte, 0, i);
        }
      }
      l = length;
    }
    finally
    {
      localInputStream.close();
    }
    for (;;)
    {
      long l;
      if (l > 0L)
      {
        i = localInputStream.read(arrayOfByte, 0, (int)Math.min(4096L, l));
        if (i != -1) {}
      }
      else
      {
        localInputStream.close();
        return;
      }
      paramOutputStream.write(arrayOfByte, 0, i);
      l -= i;
    }
  }
}
