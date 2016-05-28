package org.apache.http.entity.mime.content;

import java.nio.charset.Charset;
import org.apache.http.entity.ContentType;
import org.apache.http.util.Args;

public abstract class AbstractContentBody
  implements ContentBody
{
  private final ContentType contentType;
  
  @Deprecated
  public AbstractContentBody(String paramString)
  {
    this(ContentType.parse(paramString));
  }
  
  public AbstractContentBody(ContentType paramContentType)
  {
    Args.notNull(paramContentType, "Content type");
    contentType = paramContentType;
  }
  
  public String getCharset()
  {
    Charset localCharset = contentType.getCharset();
    if (localCharset != null) {
      return localCharset.name();
    }
    return null;
  }
  
  public ContentType getContentType()
  {
    return contentType;
  }
  
  public String getMediaType()
  {
    String str2 = contentType.getMimeType();
    int i = str2.indexOf('/');
    String str1 = str2;
    if (i != -1) {
      str1 = str2.substring(0, i);
    }
    return str1;
  }
  
  public String getMimeType()
  {
    return contentType.getMimeType();
  }
  
  public String getSubType()
  {
    String str = contentType.getMimeType();
    int i = str.indexOf('/');
    if (i != -1) {
      return str.substring(i + 1);
    }
    return null;
  }
}
