package org.apache.http.entity;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;

@NotThreadSafe
public class StringEntity
  extends AbstractHttpEntity
  implements Cloneable
{
  protected final byte[] content;
  
  public StringEntity(String paramString)
    throws UnsupportedEncodingException
  {
    this(paramString, ContentType.DEFAULT_TEXT);
  }
  
  public StringEntity(String paramString1, String paramString2)
    throws UnsupportedEncodingException
  {
    this(paramString1, ContentType.create(ContentType.TEXT_PLAIN.getMimeType(), paramString2));
  }
  
  @Deprecated
  public StringEntity(String paramString1, String paramString2, String paramString3)
    throws UnsupportedEncodingException
  {
    Args.notNull(paramString1, "Source string");
    if (paramString2 != null) {
      if (paramString3 == null) {
        break label62;
      }
    }
    for (;;)
    {
      content = paramString1.getBytes(paramString3);
      setContentType(paramString2 + "; charset=" + paramString3);
      return;
      paramString2 = "text/plain";
      break;
      label62:
      paramString3 = "ISO-8859-1";
    }
  }
  
  public StringEntity(String paramString, Charset paramCharset)
  {
    this(paramString, ContentType.create(ContentType.TEXT_PLAIN.getMimeType(), paramCharset));
  }
  
  public StringEntity(String paramString, ContentType paramContentType)
  {
    Args.notNull(paramString, "Source string");
    if (paramContentType != null) {}
    for (Charset localCharset1 = paramContentType.getCharset();; localCharset1 = null)
    {
      Charset localCharset2 = localCharset1;
      if (localCharset1 == null) {
        localCharset2 = HTTP.DEF_CONTENT_CHARSET;
      }
      try
      {
        content = paramString.getBytes(localCharset2.name());
        if (paramContentType != null) {
          setContentType(paramContentType.toString());
        }
        return;
      }
      catch (UnsupportedEncodingException paramString)
      {
        throw new UnsupportedCharsetException(localCharset2.name());
      }
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
    return new ByteArrayInputStream(content);
  }
  
  public long getContentLength()
  {
    return content.length;
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
    paramOutputStream.write(content);
    paramOutputStream.flush();
  }
}
