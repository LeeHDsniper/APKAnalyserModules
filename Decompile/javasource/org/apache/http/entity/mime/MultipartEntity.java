package org.apache.http.entity.mime;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.Random;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.entity.mime.content.ContentBody;

@Deprecated
public class MultipartEntity
  implements HttpEntity
{
  private static final char[] MULTIPART_CHARS = "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
  private final MultipartEntityBuilder builder;
  private volatile MultipartFormEntity entity;
  
  public MultipartEntity()
  {
    this(HttpMultipartMode.STRICT, null, null);
  }
  
  public MultipartEntity(HttpMultipartMode paramHttpMultipartMode)
  {
    this(paramHttpMultipartMode, null, null);
  }
  
  public MultipartEntity(HttpMultipartMode paramHttpMultipartMode, String paramString, Charset paramCharset)
  {
    builder = new MultipartEntityBuilder().setMode(paramHttpMultipartMode).setCharset(paramCharset).setBoundary(paramString);
    entity = null;
  }
  
  private MultipartFormEntity getEntity()
  {
    if (entity == null) {
      entity = builder.buildEntity();
    }
    return entity;
  }
  
  public void addPart(String paramString, ContentBody paramContentBody)
  {
    addPart(new FormBodyPart(paramString, paramContentBody));
  }
  
  public void addPart(FormBodyPart paramFormBodyPart)
  {
    builder.addPart(paramFormBodyPart);
    entity = null;
  }
  
  public void consumeContent()
    throws IOException, UnsupportedOperationException
  {
    if (isStreaming()) {
      throw new UnsupportedOperationException("Streaming entity does not implement #consumeContent()");
    }
  }
  
  protected String generateBoundary()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    Random localRandom = new Random();
    int j = localRandom.nextInt(11);
    int i = 0;
    while (i < j + 30)
    {
      localStringBuilder.append(MULTIPART_CHARS[localRandom.nextInt(MULTIPART_CHARS.length)]);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  protected String generateContentType(String paramString, Charset paramCharset)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("multipart/form-data; boundary=");
    localStringBuilder.append(paramString);
    if (paramCharset != null)
    {
      localStringBuilder.append("; charset=");
      localStringBuilder.append(paramCharset.name());
    }
    return localStringBuilder.toString();
  }
  
  public InputStream getContent()
    throws IOException, UnsupportedOperationException
  {
    throw new UnsupportedOperationException("Multipart form entity does not implement #getContent()");
  }
  
  public Header getContentEncoding()
  {
    return getEntity().getContentEncoding();
  }
  
  public long getContentLength()
  {
    return getEntity().getContentLength();
  }
  
  public Header getContentType()
  {
    return getEntity().getContentType();
  }
  
  public boolean isChunked()
  {
    return getEntity().isChunked();
  }
  
  public boolean isRepeatable()
  {
    return getEntity().isRepeatable();
  }
  
  public boolean isStreaming()
  {
    return getEntity().isStreaming();
  }
  
  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    getEntity().writeTo(paramOutputStream);
  }
}
