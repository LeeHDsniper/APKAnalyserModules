package org.apache.http.entity;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class FileEntity
  extends AbstractHttpEntity
  implements Cloneable
{
  protected final File file;
  
  public FileEntity(File paramFile)
  {
    file = ((File)Args.notNull(paramFile, "File"));
  }
  
  @Deprecated
  public FileEntity(File paramFile, String paramString)
  {
    file = ((File)Args.notNull(paramFile, "File"));
    setContentType(paramString);
  }
  
  public FileEntity(File paramFile, ContentType paramContentType)
  {
    file = ((File)Args.notNull(paramFile, "File"));
    if (paramContentType != null) {
      setContentType(paramContentType.toString());
    }
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    return super.clone();
  }
  
  public InputStream getContent()
    throws IOException
  {
    return new FileInputStream(file);
  }
  
  public long getContentLength()
  {
    return file.length();
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
    FileInputStream localFileInputStream = new FileInputStream(file);
    try
    {
      byte[] arrayOfByte = new byte['က'];
      for (;;)
      {
        int i = localFileInputStream.read(arrayOfByte);
        if (i == -1) {
          break;
        }
        paramOutputStream.write(arrayOfByte, 0, i);
      }
    }
    finally
    {
      localFileInputStream.close();
    }
    localFileInputStream.close();
  }
}
