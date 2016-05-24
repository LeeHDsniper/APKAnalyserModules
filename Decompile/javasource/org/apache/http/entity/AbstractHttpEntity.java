package org.apache.http.entity;

import java.io.IOException;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.message.BasicHeader;

@NotThreadSafe
public abstract class AbstractHttpEntity
  implements HttpEntity
{
  protected static final int OUTPUT_BUFFER_SIZE = 4096;
  protected boolean chunked;
  protected Header contentEncoding;
  protected Header contentType;
  
  protected AbstractHttpEntity() {}
  
  @Deprecated
  public void consumeContent()
    throws IOException
  {}
  
  public Header getContentEncoding()
  {
    return contentEncoding;
  }
  
  public Header getContentType()
  {
    return contentType;
  }
  
  public boolean isChunked()
  {
    return chunked;
  }
  
  public void setChunked(boolean paramBoolean)
  {
    chunked = paramBoolean;
  }
  
  public void setContentEncoding(String paramString)
  {
    BasicHeader localBasicHeader = null;
    if (paramString != null) {
      localBasicHeader = new BasicHeader("Content-Encoding", paramString);
    }
    setContentEncoding(localBasicHeader);
  }
  
  public void setContentEncoding(Header paramHeader)
  {
    contentEncoding = paramHeader;
  }
  
  public void setContentType(String paramString)
  {
    BasicHeader localBasicHeader = null;
    if (paramString != null) {
      localBasicHeader = new BasicHeader("Content-Type", paramString);
    }
    setContentType(localBasicHeader);
  }
  
  public void setContentType(Header paramHeader)
  {
    contentType = paramHeader;
  }
}
