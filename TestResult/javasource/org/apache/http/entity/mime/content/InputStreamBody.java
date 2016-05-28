package org.apache.http.entity.mime.content;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.entity.ContentType;
import org.apache.http.util.Args;

public class InputStreamBody
  extends AbstractContentBody
{
  private final String filename;
  private final InputStream in;
  
  public InputStreamBody(InputStream paramInputStream, String paramString)
  {
    this(paramInputStream, ContentType.DEFAULT_BINARY, paramString);
  }
  
  @Deprecated
  public InputStreamBody(InputStream paramInputStream, String paramString1, String paramString2)
  {
    this(paramInputStream, ContentType.create(paramString1), paramString2);
  }
  
  public InputStreamBody(InputStream paramInputStream, ContentType paramContentType)
  {
    this(paramInputStream, paramContentType, null);
  }
  
  public InputStreamBody(InputStream paramInputStream, ContentType paramContentType, String paramString)
  {
    super(paramContentType);
    Args.notNull(paramInputStream, "Input stream");
    in = paramInputStream;
    filename = paramString;
  }
  
  public long getContentLength()
  {
    return -1L;
  }
  
  public String getFilename()
  {
    return filename;
  }
  
  public InputStream getInputStream()
  {
    return in;
  }
  
  public String getTransferEncoding()
  {
    return "binary";
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    Args.notNull(paramOutputStream, "Output stream");
    try
    {
      byte[] arrayOfByte = new byte['က'];
      for (;;)
      {
        int i = in.read(arrayOfByte);
        if (i == -1) {
          break;
        }
        paramOutputStream.write(arrayOfByte, 0, i);
      }
      paramOutputStream.flush();
    }
    finally
    {
      in.close();
    }
    in.close();
  }
}
